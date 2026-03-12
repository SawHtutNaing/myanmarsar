<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\ExpenseDetail;
use App\Models\IngredientImport;
use Illuminate\Http\Request;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx as XlsxWriter;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;

class ReportController extends Controller
{
    public function salesReport()
    {
        $completedOrders = Order::where('status', 'completed')->with('orderItems.foodItem')->get();
        $totalRevenue    = $completedOrders->sum('total_price');

        return view('admin.reports.sales', compact('completedOrders', 'totalRevenue'));
    }

    public function profitLossReport(Request $request)
    {
        $queryOrders   = Order::where('status', 'completed')->with('orderItems');
        $queryExpenses = \App\Models\ExpenseDetail::query();

        if ($request->filled('start_date')) {
            $queryOrders->whereDate('created_at', '>=', $request->start_date);
            $queryExpenses->whereDate('date', '>=', $request->start_date);
        }

        if ($request->filled('end_date')) {
            $queryOrders->whereDate('created_at', '<=', $request->end_date);
            $queryExpenses->whereDate('date', '<=', $request->end_date);
        }

        $completedOrders = $queryOrders->get();
        $totalExpenses   = $queryExpenses->sum('amount');
        $totalRevenue    = $completedOrders->sum('total_price');
        $totalCost       = $completedOrders->flatMap->orderItems->sum('cost');
        $profit          = $totalRevenue - $totalCost - $totalExpenses;

        return view('admin.reports.profit_loss', compact(
            'completedOrders', 'totalRevenue', 'totalCost', 'totalExpenses', 'profit', 'request'
        ));
    }

    // =========================================================================
    // Ingredient Import Report  (web view)
    // =========================================================================

    public function ingredientImportReport(Request $request)
    {
        $query = \App\Models\IngredientImport::with(['ingredient' => fn($q) => $q->orderBy('sort_no')]);

        if ($request->filled('start_date')) {
            $query->whereDate('date', '>=', $request->start_date);
        }
        if ($request->filled('end_date')) {
            $query->whereDate('date', '<=', $request->end_date);
        }

        // Primary sort: date desc → within same date: ingredient.sort_no asc
        $imports = $query->orderBy('date', 'desc')->get()
            ->sortBy(fn($i) => [-strtotime($i->date), optional($i->ingredient)->sort_no ?? 9999])
            ->values();

        $totalQuantity = $imports->sum('quantity');
        $totalCost     = $imports->sum(fn($i) => $i->quantity * $i->unit_price);

        return view('admin.reports.ingredient_imports', compact('imports', 'totalQuantity', 'totalCost'));
    }

    // =========================================================================
    // Ingredient Import Report  (Excel .xlsx export)
    //
    // Requires:  composer require phpoffice/phpspreadsheet
    // =========================================================================

    public function exportIngredientImports(Request $request)
    {
        // ── 1. Fetch & group data ─────────────────────────────────────────────
        $query = \App\Models\IngredientImport::with(['ingredient' => fn($q) => $q->orderBy('sort_no')]);

        if ($request->filled('start_date')) {
            $query->whereDate('date', '>=', $request->start_date);
        }
        if ($request->filled('end_date')) {
            $query->whereDate('date', '<=', $request->end_date);
        }

        // Sorted desc by date so first() per group = the most-recent import
        $imports = $query->orderBy('date', 'desc')->get();

        $grouped = $imports
            ->groupBy('ingredient_id')
            ->map(function ($rows) {
                $ingredient = $rows->first()->ingredient;
                return [
                    'sort_no'         => optional($ingredient)->sort_no ?? 9999,
                    'name'            => optional($ingredient)->name    ?? '(unknown)',
                    'unit'            => optional($ingredient)->unit    ?? '',
                    'total_quantity'  => $rows->sum('quantity'),
                    'last_unit_price' => $rows->first()->unit_price,  // most-recent price
                    'total_cost'      => $rows->sum(fn($i) => $i->quantity * $i->unit_price),
                ];
            })
            ->sortBy('sort_no')
            ->values();

        // ── 2. Build spreadsheet ──────────────────────────────────────────────
        $spreadsheet = $this->buildIngredientImportSpreadsheet(
            $grouped,
            $request->input('start_date', 'အားလုံး'),
            $request->input('end_date',   'အားလုံး')
        );

        // ── 3. Stream to browser ──────────────────────────────────────────────
        $filename = 'ingredient_imports_' . now()->format('Ymd_His') . '.xlsx';
        $writer   = new XlsxWriter($spreadsheet);

        return response()->streamDownload(function () use ($writer) {
            $writer->save('php://output');
        }, $filename, [
            'Content-Type'        => 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            'Cache-Control'       => 'max-age=0',
            'Content-Disposition' => "attachment; filename=\"{$filename}\"",
        ]);
    }

    // =========================================================================
    // Private helper: build the PhpSpreadsheet workbook
    // =========================================================================

    private function buildIngredientImportSpreadsheet($grouped, string $startDate, string $endDate): Spreadsheet
    {
        $spreadsheet = new Spreadsheet();
        $ws          = $spreadsheet->getActiveSheet();
        $ws->setTitle('Ingredient Imports');

        // Colour constants (hex, no leading #)
        $HEADER_BG  = '1F4E79';
        $SUBHDR_BG  = '2E75B6';
        $TOTAL_BG   = 'D6E4F0';
        $ALT_BG     = 'EBF3FB';
        $WHITE      = 'FFFFFF';
        $BLACK      = '000000';
        $DARK_BLUE  = '1F4E79';
        $BORDER_CLR = 'B8CCE4';

        $MONEY = '#,##0.00';
        $QTY   = '#,##0.##';

        $applyStyle = fn(string $range, array $style) =>
            $ws->getStyle($range)->applyFromArray($style);

        $solidFill = fn(string $rgb) => [
            'fillType'   => Fill::FILL_SOLID,
            'startColor' => ['rgb' => $rgb],
        ];

        $thinBorder  = ['borderStyle' => Border::BORDER_THIN,   'color' => ['rgb' => $BORDER_CLR]];
        $thickBorder = ['borderStyle' => Border::BORDER_MEDIUM, 'color' => ['rgb' => $HEADER_BG]];

        // ── Row 1: Title ──────────────────────────────────────────────────────
        $ws->mergeCells('A1:E1');
        $ws->setCellValue('A1', 'ပါဝင်ပစ္စည်း တင်သွင်းမှု အစီရင်ခံစာ');
        $applyStyle('A1:E1', [
            'font'      => ['name' => 'Arial', 'bold' => true, 'size' => 14, 'color' => ['rgb' => $WHITE]],
            'fill'      => $solidFill($HEADER_BG),
            'alignment' => ['horizontal' => Alignment::HORIZONTAL_CENTER, 'vertical' => Alignment::VERTICAL_CENTER],
        ]);
        $ws->getRowDimension(1)->setRowHeight(30);

        // ── Row 2: Date range ─────────────────────────────────────────────────
        $ws->mergeCells('A2:E2');
        $ws->setCellValue('A2', "ရက်စွဲ: {$startDate} မှ {$endDate} အထိ");
        $applyStyle('A2:E2', [
            'font'      => ['name' => 'Arial', 'size' => 10, 'italic' => true, 'color' => ['rgb' => $WHITE]],
            'fill'      => $solidFill($SUBHDR_BG),
            'alignment' => ['horizontal' => Alignment::HORIZONTAL_CENTER, 'vertical' => Alignment::VERTICAL_CENTER],
        ]);
        $ws->getRowDimension(2)->setRowHeight(22);

        // ── Row 3: Spacer ─────────────────────────────────────────────────────
        $ws->getRowDimension(3)->setRowHeight(8);

        // ── Row 4: Column headers ─────────────────────────────────────────────
        // Columns: A=name  B=unit  C=qty  D=unit price  E=total cost
        $headers = ['A' => 'အမည်', 'B' => 'ယူနစ်', 'C' => 'ပမာဏ', 'D' => 'ယူနစ်စျေးနှုန်း', 'E' => 'စုစုပေါင်းကုန်ကျစရိတ် (ပစ္စည်း)'];
        foreach ($headers as $col => $label) {
            $ws->setCellValue("{$col}4", $label);
        }
        $applyStyle('A4:E4', [
            'font'      => ['name' => 'Arial', 'bold' => true, 'size' => 10, 'color' => ['rgb' => $WHITE]],
            'fill'      => $solidFill($SUBHDR_BG),
            'alignment' => ['horizontal' => Alignment::HORIZONTAL_CENTER, 'vertical' => Alignment::VERTICAL_CENTER, 'wrapText' => true],
            'borders'   => ['allBorders' => $thinBorder, 'top' => $thickBorder, 'bottom' => $thickBorder],
        ]);
        $ws->getRowDimension(4)->setRowHeight(38);

        // ── Rows 5…: Data ─────────────────────────────────────────────────────
        $dataStart = 5;
        foreach ($grouped as $i => $row) {
            $r     = $dataStart + $i;
            $bgClr = ($i % 2 === 1) ? $ALT_BG : $WHITE;

            $ws->setCellValue("A{$r}", $row['name']);
            $ws->setCellValue("B{$r}", $row['unit']);
            $ws->setCellValue("C{$r}", $row['total_quantity']);
            $ws->setCellValue("D{$r}", $row['last_unit_price']);
            $ws->setCellValue("E{$r}", $row['total_cost']);

            $applyStyle("A{$r}:E{$r}", [
                'font'    => ['name' => 'Arial', 'size' => 10, 'color' => ['rgb' => $BLACK]],
                'fill'    => $solidFill($bgClr),
                'borders' => ['allBorders' => $thinBorder],
            ]);

            $ws->getStyle("A{$r}")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_LEFT);
            $ws->getStyle("B{$r}")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
            $ws->getStyle("C{$r}")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_RIGHT);
            $ws->getStyle("D{$r}")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_RIGHT);
            $ws->getStyle("E{$r}")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_RIGHT);
            $ws->getStyle("C{$r}")->getNumberFormat()->setFormatCode($QTY);
            $ws->getStyle("D{$r}")->getNumberFormat()->setFormatCode($MONEY);
            $ws->getStyle("E{$r}")->getNumberFormat()->setFormatCode($MONEY);
            $ws->getRowDimension($r)->setRowHeight(20);
        }

        // ── Totals row ────────────────────────────────────────────────────────
        $totalRow = $dataStart + count($grouped);
        $lastData = $totalRow - 1;

        $ws->setCellValue("A{$totalRow}", 'စုစုပေါင်း');
        $ws->setCellValue("B{$totalRow}", '');
        $ws->setCellValue("C{$totalRow}", "=SUM(C{$dataStart}:C{$lastData})");
        $ws->setCellValue("D{$totalRow}", '');
        $ws->setCellValue("E{$totalRow}", "=SUM(E{$dataStart}:E{$lastData})");

        $applyStyle("A{$totalRow}:E{$totalRow}", [
            'font'      => ['name' => 'Arial', 'bold' => true, 'size' => 10, 'color' => ['rgb' => $DARK_BLUE]],
            'fill'      => $solidFill($TOTAL_BG),
            'alignment' => ['horizontal' => Alignment::HORIZONTAL_CENTER, 'vertical' => Alignment::VERTICAL_CENTER],
            'borders'   => ['allBorders' => $thinBorder, 'top' => $thickBorder, 'bottom' => $thickBorder],
        ]);
        $ws->getStyle("A{$totalRow}")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_RIGHT);
        $ws->getStyle("C{$totalRow}")->getNumberFormat()->setFormatCode($QTY);
        $ws->getStyle("E{$totalRow}")->getNumberFormat()->setFormatCode($MONEY);
        $ws->getRowDimension($totalRow)->setRowHeight(24);

        // ── Column widths ─────────────────────────────────────────────────────
        $ws->getColumnDimension('A')->setWidth(30);  // name
        $ws->getColumnDimension('B')->setWidth(10);  // unit
        $ws->getColumnDimension('C')->setWidth(14);  // qty
        $ws->getColumnDimension('D')->setWidth(18);  // unit price
        $ws->getColumnDimension('E')->setWidth(32);  // total cost

        // ── Freeze pane below headers ─────────────────────────────────────────
        $ws->freezePane('A5');

        $spreadsheet->getDefaultStyle()->getFont()->setName('Arial')->setSize(10);

        return $spreadsheet;
    }

    // =========================================================================
    // Delete import
    // =========================================================================

    public function destroyIngredientImport($id)
    {
        $import     = IngredientImport::findOrFail($id);
        $ingredient = $import->ingredient;
        $ingredient->quantity -= $import->quantity;
        $ingredient->save();
        $import->delete();

        return redirect()->route('admin.reports.ingredient-imports')
            ->with('success', 'Ingredient import deleted successfully.');
    }
}
