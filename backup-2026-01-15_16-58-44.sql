SET FOREIGN_KEY_CHECKS = 0;


-- Table structure for `cache`

DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `cache`

INSERT INTO `cache` VALUES ('myanmarsar-cache-g.a.x.azi.w.e.fu7.7@gmail.com|80.94.92.92', 'i:1;', '1768390375');
INSERT INTO `cache` VALUES ('myanmarsar-cache-g.a.x.azi.w.e.fu7.7@gmail.com|80.94.92.92:timer', 'i:1768390375;', '1768390375');


-- Table structure for `cache_locks`

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



-- Table structure for `expense_details`

DROP TABLE IF EXISTS `expense_details`;
CREATE TABLE `expense_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `expense_group_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expense_details_expense_group_id_foreign` (`expense_group_id`),
  CONSTRAINT `expense_details_expense_group_id_foreign` FOREIGN KEY (`expense_group_id`) REFERENCES `expense_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `expense_details`

INSERT INTO `expense_details` VALUES ('2', '4', 'အလုံး 200', '2026-01-06', '1500.00', '2026-01-06 09:13:07', '2026-01-06 09:13:07');
INSERT INTO `expense_details` VALUES ('3', '2', 'အလုံး၁၀၀၀', '2026-01-06', '8250.00', '2026-01-06 09:14:00', '2026-01-06 09:14:00');
INSERT INTO `expense_details` VALUES ('4', '3', 'အလုံး ၁၀၀၀', '2026-01-06', '12500.00', '2026-01-06 09:14:25', '2026-01-06 09:14:25');
INSERT INTO `expense_details` VALUES ('5', '5', '10ထုပ်', '2026-01-06', '1000.00', '2026-01-06 09:14:51', '2026-01-06 09:14:51');
INSERT INTO `expense_details` VALUES ('6', '7', '10 စီး', '2026-01-06', '4000.00', '2026-01-06 09:15:28', '2026-01-06 09:15:28');
INSERT INTO `expense_details` VALUES ('7', '6', '20လုံး', '2026-01-06', '2000.00', '2026-01-06 09:15:44', '2026-01-06 09:15:44');


-- Table structure for `expense_groups`

DROP TABLE IF EXISTS `expense_groups`;
CREATE TABLE `expense_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'restaurant',
  PRIMARY KEY (`id`),
  UNIQUE KEY `expense_groups_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `expense_groups`

INSERT INTO `expense_groups` VALUES ('1', 'နံနံပင် ဝယ်ခြင်း', '2026-01-04 14:17:04', '2026-01-13 06:52:17', 'kitchen');
INSERT INTO `expense_groups` VALUES ('2', '5*9 ပါဆယ်အိတ်', '2026-01-06 09:08:58', '2026-01-13 06:52:33', 'kitchen');
INSERT INTO `expense_groups` VALUES ('3', '6*11 ပါဆယ်အိတ်', '2026-01-06 09:09:19', '2026-01-13 06:52:52', 'kitchen');
INSERT INTO `expense_groups` VALUES ('4', 'ငရုပ်သီး ပါဆယ်အိတ်', '2026-01-06 09:09:33', '2026-01-13 06:53:12', 'kitchen');
INSERT INTO `expense_groups` VALUES ('5', 'ကောက်ညှင်းမွှေး', '2026-01-06 09:09:45', '2026-01-13 06:53:28', 'kitchen');
INSERT INTO `expense_groups` VALUES ('6', 'သံပုရာသီး', '2026-01-06 09:09:56', '2026-01-13 06:53:43', 'kitchen');
INSERT INTO `expense_groups` VALUES ('7', 'ပဲသီး', '2026-01-06 09:10:21', '2026-01-13 06:54:01', 'kitchen');
INSERT INTO `expense_groups` VALUES ('8', '20L သောက်ရေဘူး', '2026-01-06 09:10:37', '2026-01-13 06:54:31', 'kitchen');
INSERT INTO `expense_groups` VALUES ('9', 'ဆိုက်ကားခ', '2026-01-07 06:03:39', '2026-01-07 06:03:39', 'kitchen');
INSERT INTO `expense_groups` VALUES ('10', 'နံနံပင်ဝယ်ခြင်း', '2026-01-08 13:24:51', '2026-01-08 13:24:51', 'kitchen');
INSERT INTO `expense_groups` VALUES ('11', 'အချိုမှုန့်', '2026-01-09 10:59:11', '2026-01-09 10:59:11', 'kitchen');


-- Table structure for `failed_jobs`

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



-- Table structure for `food_item_ingredient`

DROP TABLE IF EXISTS `food_item_ingredient`;
CREATE TABLE `food_item_ingredient` (
  `food_item_id` bigint unsigned NOT NULL,
  `ingredient_id` bigint unsigned NOT NULL,
  `quantity` double NOT NULL,
  PRIMARY KEY (`food_item_id`,`ingredient_id`),
  KEY `food_item_ingredient_ingredient_id_foreign` (`ingredient_id`),
  CONSTRAINT `food_item_ingredient_food_item_id_foreign` FOREIGN KEY (`food_item_id`) REFERENCES `food_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `food_item_ingredient_ingredient_id_foreign` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `food_item_ingredient`

INSERT INTO `food_item_ingredient` VALUES ('8', '22', '1');
INSERT INTO `food_item_ingredient` VALUES ('8', '25', '0.23');
INSERT INTO `food_item_ingredient` VALUES ('8', '27', '0.5');
INSERT INTO `food_item_ingredient` VALUES ('8', '28', '0.05');
INSERT INTO `food_item_ingredient` VALUES ('8', '30', '0.07');
INSERT INTO `food_item_ingredient` VALUES ('8', '39', '1.7');
INSERT INTO `food_item_ingredient` VALUES ('8', '54', '5');
INSERT INTO `food_item_ingredient` VALUES ('8', '59', '0.17');
INSERT INTO `food_item_ingredient` VALUES ('8', '68', '0.05');
INSERT INTO `food_item_ingredient` VALUES ('10', '19', '0.35');
INSERT INTO `food_item_ingredient` VALUES ('10', '21', '0.58');
INSERT INTO `food_item_ingredient` VALUES ('10', '22', '0.1');
INSERT INTO `food_item_ingredient` VALUES ('10', '24', '0.41');
INSERT INTO `food_item_ingredient` VALUES ('10', '27', '0.58');
INSERT INTO `food_item_ingredient` VALUES ('10', '29', '0.07');
INSERT INTO `food_item_ingredient` VALUES ('10', '30', '0.03');
INSERT INTO `food_item_ingredient` VALUES ('10', '40', '1.76');
INSERT INTO `food_item_ingredient` VALUES ('10', '42', '0.19');
INSERT INTO `food_item_ingredient` VALUES ('10', '53', '5.5');
INSERT INTO `food_item_ingredient` VALUES ('10', '57', '0.2');
INSERT INTO `food_item_ingredient` VALUES ('10', '69', '0.17');
INSERT INTO `food_item_ingredient` VALUES ('11', '19', '0.35');
INSERT INTO `food_item_ingredient` VALUES ('11', '21', '0.58');
INSERT INTO `food_item_ingredient` VALUES ('11', '22', '0.1');
INSERT INTO `food_item_ingredient` VALUES ('11', '24', '0.4');
INSERT INTO `food_item_ingredient` VALUES ('11', '27', '0.58');
INSERT INTO `food_item_ingredient` VALUES ('11', '29', '0.07');
INSERT INTO `food_item_ingredient` VALUES ('11', '30', '0.03');
INSERT INTO `food_item_ingredient` VALUES ('11', '40', '1.76');
INSERT INTO `food_item_ingredient` VALUES ('11', '42', '0.19');
INSERT INTO `food_item_ingredient` VALUES ('11', '52', '5.5');
INSERT INTO `food_item_ingredient` VALUES ('11', '57', '0.2');
INSERT INTO `food_item_ingredient` VALUES ('11', '69', '0.17');
INSERT INTO `food_item_ingredient` VALUES ('12', '48', '1');
INSERT INTO `food_item_ingredient` VALUES ('13', '49', '1');
INSERT INTO `food_item_ingredient` VALUES ('15', '51', '1');
INSERT INTO `food_item_ingredient` VALUES ('16', '38', '1');
INSERT INTO `food_item_ingredient` VALUES ('17', '32', '1');
INSERT INTO `food_item_ingredient` VALUES ('18', '50', '1');
INSERT INTO `food_item_ingredient` VALUES ('19', '47', '1');
INSERT INTO `food_item_ingredient` VALUES ('20', '19', '0.35');
INSERT INTO `food_item_ingredient` VALUES ('20', '21', '0.58');
INSERT INTO `food_item_ingredient` VALUES ('20', '24', '0.41');
INSERT INTO `food_item_ingredient` VALUES ('20', '27', '0.58');
INSERT INTO `food_item_ingredient` VALUES ('20', '29', '0.07');
INSERT INTO `food_item_ingredient` VALUES ('20', '30', '0.03');
INSERT INTO `food_item_ingredient` VALUES ('20', '40', '1.7');
INSERT INTO `food_item_ingredient` VALUES ('20', '42', '0.19');
INSERT INTO `food_item_ingredient` VALUES ('20', '57', '0.2');
INSERT INTO `food_item_ingredient` VALUES ('20', '69', '0.17');
INSERT INTO `food_item_ingredient` VALUES ('21', '22', '1');
INSERT INTO `food_item_ingredient` VALUES ('21', '25', '0.23');
INSERT INTO `food_item_ingredient` VALUES ('21', '27', '0.58');
INSERT INTO `food_item_ingredient` VALUES ('21', '28', '0.05');
INSERT INTO `food_item_ingredient` VALUES ('21', '30', '0.05');
INSERT INTO `food_item_ingredient` VALUES ('21', '39', '1.7');
INSERT INTO `food_item_ingredient` VALUES ('21', '57', '0.2');
INSERT INTO `food_item_ingredient` VALUES ('21', '59', '0.17');
INSERT INTO `food_item_ingredient` VALUES ('21', '68', '0.05');
INSERT INTO `food_item_ingredient` VALUES ('22', '19', '0.17');
INSERT INTO `food_item_ingredient` VALUES ('22', '21', '0.29');
INSERT INTO `food_item_ingredient` VALUES ('22', '24', '0.2');
INSERT INTO `food_item_ingredient` VALUES ('22', '27', '0.29');
INSERT INTO `food_item_ingredient` VALUES ('22', '29', '0.03');
INSERT INTO `food_item_ingredient` VALUES ('22', '30', '0.01');
INSERT INTO `food_item_ingredient` VALUES ('22', '40', '0.85');
INSERT INTO `food_item_ingredient` VALUES ('22', '42', '0.09');
INSERT INTO `food_item_ingredient` VALUES ('22', '57', '0.1');
INSERT INTO `food_item_ingredient` VALUES ('22', '69', '0.85');


-- Table structure for `food_items`

DROP TABLE IF EXISTS `food_items`;
CREATE TABLE `food_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `food_items`

INSERT INTO `food_items` VALUES ('8', 'အုန်းနို့ခေါက်ဆွဲ (အလွတ်)', '2500.00', NULL, '2026-01-04 08:57:20', '2026-01-06 08:41:28');
INSERT INTO `food_items` VALUES ('10', 'ညှပ်ခေါက်ဆွဲ(အလွတ်)', '2500.00', NULL, '2026-01-04 09:10:09', '2026-01-06 08:38:07');
INSERT INTO `food_items` VALUES ('11', 'မုန့်ဟင်းခါး(အလွတ်)', '2500.00', NULL, '2026-01-04 09:10:46', '2026-01-06 08:20:08');
INSERT INTO `food_items` VALUES ('12', 'ဘူးသီးကြော်', '500.00', NULL, '2026-01-04 09:11:50', '2026-01-04 09:11:50');
INSERT INTO `food_items` VALUES ('13', 'ကြက်သွန်ကြော်', '500.00', NULL, '2026-01-04 09:13:25', '2026-01-04 09:13:25');
INSERT INTO `food_items` VALUES ('14', 'ပဲကြော်', '500.00', NULL, '2026-01-04 09:14:07', '2026-01-04 09:14:07');
INSERT INTO `food_items` VALUES ('15', 'အီကြာကွေ့', '500.00', NULL, '2026-01-04 09:15:10', '2026-01-04 09:15:10');
INSERT INTO `food_items` VALUES ('16', 'ငါးဖယ်', '500.00', NULL, '2026-01-04 09:16:08', '2026-01-04 09:16:08');
INSERT INTO `food_items` VALUES ('17', 'အိုးဘဲဥ', '1000.00', NULL, '2026-01-04 09:16:55', '2026-01-04 09:16:55');
INSERT INTO `food_items` VALUES ('18', 'ဘဲသွေး', '1000.00', NULL, '2026-01-04 09:17:35', '2026-01-04 09:17:35');
INSERT INTO `food_items` VALUES ('19', 'ကောက်ညှင်းပဲကြော်', '500.00', NULL, '2026-01-04 09:18:16', '2026-01-04 09:18:16');
INSERT INTO `food_items` VALUES ('20', 'မုန့်ဟင်းခါးဟင်းရည် (အလွတ်)', '1000.00', NULL, '2026-01-07 02:24:49', '2026-01-07 02:24:49');
INSERT INTO `food_items` VALUES ('21', 'အုန်းနို့ဟင်းရည်(အလွတ်)', '1000.00', NULL, '2026-01-07 02:25:42', '2026-01-07 02:25:42');
INSERT INTO `food_items` VALUES ('22', 'မုန့်ဟင်းရည် (လိုက်ပွဲ)', '500.00', NULL, '2026-01-07 06:31:20', '2026-01-07 06:31:20');


-- Table structure for `ingredient_imports`

DROP TABLE IF EXISTS `ingredient_imports`;
CREATE TABLE `ingredient_imports` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ingredient_id` bigint unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `unit_price` decimal(8,2) NOT NULL,
  `date` date NOT NULL DEFAULT '2026-01-03',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ingredient_imports_ingredient_id_foreign` (`ingredient_id`),
  CONSTRAINT `ingredient_imports_ingredient_id_foreign` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `ingredient_imports`

INSERT INTO `ingredient_imports` VALUES ('7', '21', '1111', '61.00', '28.00', '2026-01-05', '2026-01-05 13:03:22', '2026-01-05 13:03:22');
INSERT INTO `ingredient_imports` VALUES ('8', '19', '1112', '48.00', '50.00', '2026-01-05', '2026-01-05 13:10:47', '2026-01-05 13:10:47');
INSERT INTO `ingredient_imports` VALUES ('9', '27', '1113', '159.00', '129.00', '2026-01-05', '2026-01-05 13:18:38', '2026-01-05 13:18:38');
INSERT INTO `ingredient_imports` VALUES ('10', '25', '1114', '69.00', '60.00', '2026-01-05', '2026-01-05 13:20:10', '2026-01-05 13:20:10');
INSERT INTO `ingredient_imports` VALUES ('11', '25', '1114', '69.00', '120.00', '2026-01-05', '2026-01-05 13:21:05', '2026-01-05 13:21:05');
INSERT INTO `ingredient_imports` VALUES ('12', '24', '1115', '292.00', '30.00', '2026-01-05', '2026-01-05 13:24:19', '2026-01-05 13:24:19');
INSERT INTO `ingredient_imports` VALUES ('13', '24', '1115', '292.00', '30.00', '2026-01-05', '2026-01-05 13:25:12', '2026-01-05 13:25:12');
INSERT INTO `ingredient_imports` VALUES ('14', '59', '1116', '9.00', '50.00', '2026-01-06', '2026-01-06 05:22:50', '2026-01-06 05:22:50');
INSERT INTO `ingredient_imports` VALUES ('15', '30', '1117', '35.00', '10.00', '2026-01-06', '2026-01-06 05:23:30', '2026-01-06 05:23:30');
INSERT INTO `ingredient_imports` VALUES ('16', '28', '1118', '28.00', '20.00', '2026-01-06', '2026-01-06 05:30:02', '2026-01-06 05:30:02');
INSERT INTO `ingredient_imports` VALUES ('17', '31', '1119', '12.00', '20.00', '2026-01-06', '2026-01-06 05:31:51', '2026-01-06 05:31:51');
INSERT INTO `ingredient_imports` VALUES ('18', '63', '11110', '18.00', '25.00', '2026-01-06', '2026-01-06 05:32:20', '2026-01-06 05:32:20');
INSERT INTO `ingredient_imports` VALUES ('19', '62', '11111', '3.00', '15.00', '2026-01-06', '2026-01-06 05:37:38', '2026-01-06 05:37:38');
INSERT INTO `ingredient_imports` VALUES ('20', '33', '11112', '20.00', '80.00', '2026-01-06', '2026-01-06 05:48:16', '2026-01-06 05:48:16');
INSERT INTO `ingredient_imports` VALUES ('21', '61', '11113', '20.00', '34.00', '2026-01-06', '2026-01-06 05:48:54', '2026-01-06 05:48:54');
INSERT INTO `ingredient_imports` VALUES ('22', '42', '11115', '23.00', '40.00', '2026-01-06', '2026-01-06 05:51:12', '2026-01-06 05:51:12');
INSERT INTO `ingredient_imports` VALUES ('23', '53', '11116', '1.71', '24.00', '2026-01-06', '2026-01-06 05:51:52', '2026-01-06 05:51:52');
INSERT INTO `ingredient_imports` VALUES ('24', '54', '11117', '48.00', '74.00', '2026-01-06', '2026-01-06 05:52:22', '2026-01-06 05:52:22');
INSERT INTO `ingredient_imports` VALUES ('25', '52', '11118', '69.00', '74.00', '2026-01-06', '2026-01-06 05:53:01', '2026-01-06 05:53:01');
INSERT INTO `ingredient_imports` VALUES ('26', '52', '11118', '69.00', '24.00', '2026-01-06', '2026-01-06 05:55:28', '2026-01-06 05:55:28');
INSERT INTO `ingredient_imports` VALUES ('27', '34', '11119', '20.00', '10.00', '2026-01-06', '2026-01-06 05:55:55', '2026-01-06 05:55:55');
INSERT INTO `ingredient_imports` VALUES ('28', '39', '11120', '117.00', '110.00', '2026-01-06', '2026-01-06 05:56:33', '2026-01-06 05:56:33');
INSERT INTO `ingredient_imports` VALUES ('30', '38', '11122', '32.00', '50.00', '2026-01-06', '2026-01-06 05:57:53', '2026-01-06 05:57:53');
INSERT INTO `ingredient_imports` VALUES ('31', '29', '11123', '14.00', '55.00', '2026-01-06', '2026-01-06 05:58:18', '2026-01-06 05:58:18');
INSERT INTO `ingredient_imports` VALUES ('32', '19', '1112', '48.00', '28.00', '2026-01-06', '2026-01-06 06:43:31', '2026-01-06 06:43:31');
INSERT INTO `ingredient_imports` VALUES ('33', '21', '61/1', '500.00', '28.00', '2026-01-06', '2026-01-06 07:40:02', '2026-01-06 07:40:02');
INSERT INTO `ingredient_imports` VALUES ('34', '19', '61/2', '100.00', '50.00', '2026-01-06', '2026-01-06 07:40:54', '2026-01-06 07:40:54');
INSERT INTO `ingredient_imports` VALUES ('35', '22', '61/3', '300.00', '15.00', '2026-01-06', '2026-01-06 07:41:43', '2026-01-06 07:41:43');
INSERT INTO `ingredient_imports` VALUES ('36', '42', '61/4', '90.00', '200.00', '2026-01-06', '2026-01-06 07:42:46', '2026-01-06 07:42:46');
INSERT INTO `ingredient_imports` VALUES ('37', '59', '61/5', '100.00', '50.00', '2026-01-06', '2026-01-06 07:43:58', '2026-01-06 07:43:58');
INSERT INTO `ingredient_imports` VALUES ('38', '29', '61/7', '30.00', '550.00', '2026-01-06', '2026-01-06 07:44:35', '2026-01-06 07:44:35');
INSERT INTO `ingredient_imports` VALUES ('39', '30', '61/8', '100.00', '20.00', '2026-01-06', '2026-01-06 07:45:11', '2026-01-06 07:45:11');
INSERT INTO `ingredient_imports` VALUES ('40', '58', '61/8', '25.00', '280.00', '2026-01-06', '2026-01-06 07:45:49', '2026-01-06 07:45:49');
INSERT INTO `ingredient_imports` VALUES ('43', '52', '61/11', '200.00', '24.00', '2026-01-06', '2026-01-06 08:44:42', '2026-01-06 08:44:42');
INSERT INTO `ingredient_imports` VALUES ('44', '53', '61/12', '200.00', '24.00', '2026-01-06', '2026-01-06 08:45:05', '2026-01-06 08:45:05');
INSERT INTO `ingredient_imports` VALUES ('45', '53', '61/12', '200.00', '24.00', '2026-01-06', '2026-01-06 08:45:06', '2026-01-06 08:45:06');
INSERT INTO `ingredient_imports` VALUES ('46', '54', '61/13', '50.00', '74.00', '2026-01-06', '2026-01-06 08:46:03', '2026-01-06 08:46:03');
INSERT INTO `ingredient_imports` VALUES ('47', '65', '11111', '100.00', '250.00', '2026-01-06', '2026-01-06 09:01:02', '2026-01-06 09:01:02');
INSERT INTO `ingredient_imports` VALUES ('48', '51', '61/15', '6.00', '300.00', '2026-01-06', '2026-01-06 09:04:51', '2026-01-06 09:04:51');
INSERT INTO `ingredient_imports` VALUES ('49', '51', '61/16', '6.00', '300.00', '2026-01-06', '2026-01-06 09:05:42', '2026-01-06 09:05:42');
INSERT INTO `ingredient_imports` VALUES ('50', '47', '61/17', '8.00', '400.00', '2026-01-06', '2026-01-06 09:06:22', '2026-01-06 09:06:22');
INSERT INTO `ingredient_imports` VALUES ('51', '48', '61/18', '10.00', '400.00', '2026-01-06', '2026-01-06 09:06:47', '2026-01-06 09:06:47');
INSERT INTO `ingredient_imports` VALUES ('52', '49', '61/19', '5.00', '400.00', '2026-01-06', '2026-01-06 09:07:31', '2026-01-06 09:07:31');
INSERT INTO `ingredient_imports` VALUES ('53', '57', '71/1', '40.00', '75.00', '2026-01-07', '2026-01-07 01:53:40', '2026-01-07 01:53:40');
INSERT INTO `ingredient_imports` VALUES ('54', '48', '71/2', '13.00', '434.00', '2026-01-07', '2026-01-07 02:01:06', '2026-01-07 02:01:06');
INSERT INTO `ingredient_imports` VALUES ('55', '49', '71/3', '4.00', '434.00', '2026-01-07', '2026-01-07 02:02:19', '2026-01-07 02:02:19');
INSERT INTO `ingredient_imports` VALUES ('56', '47', '71/4', '5.00', '434.00', '2026-01-07', '2026-01-07 02:03:14', '2026-01-07 02:03:14');
INSERT INTO `ingredient_imports` VALUES ('57', '51', '71/5', '12.00', '300.00', '2026-01-07', '2026-01-07 02:04:23', '2026-01-07 02:04:23');
INSERT INTO `ingredient_imports` VALUES ('58', '53', '71/6', '200.00', '24.00', '2026-01-07', '2026-01-07 02:04:55', '2026-01-07 02:04:55');
INSERT INTO `ingredient_imports` VALUES ('59', '52', '71/7', '100.00', '24.00', '2026-01-07', '2026-01-07 02:05:34', '2026-01-07 02:05:34');
INSERT INTO `ingredient_imports` VALUES ('60', '54', '71/8', '150.00', '72.00', '2026-01-07', '2026-01-07 02:06:33', '2026-01-07 02:06:33');
INSERT INTO `ingredient_imports` VALUES ('61', '40', '71/9', '410.00', '270.00', '2026-01-07', '2026-01-07 02:08:25', '2026-01-07 02:08:25');
INSERT INTO `ingredient_imports` VALUES ('62', '38', '71/10', '60.00', '375.00', '2026-01-07', '2026-01-07 02:12:23', '2026-01-07 02:12:23');
INSERT INTO `ingredient_imports` VALUES ('63', '50', '71/11', '48.00', '375.00', '2026-01-07', '2026-01-07 02:13:16', '2026-01-07 02:13:16');
INSERT INTO `ingredient_imports` VALUES ('64', '37', '71/12', '7.00', '290.00', '2026-01-07', '2026-01-07 02:16:13', '2026-01-07 02:16:13');
INSERT INTO `ingredient_imports` VALUES ('66', '34', '71/14', '30.00', '50.00', '2026-01-07', '2026-01-07 02:20:07', '2026-01-07 02:20:07');
INSERT INTO `ingredient_imports` VALUES ('67', '28', '71/15', '25.00', '200.00', '2026-01-07', '2026-01-07 02:21:31', '2026-01-07 02:21:31');
INSERT INTO `ingredient_imports` VALUES ('68', '32', '71/16', '20.00', '430.00', '2026-01-07', '2026-01-07 03:02:41', '2026-01-07 03:02:41');
INSERT INTO `ingredient_imports` VALUES ('69', '52', '71/17', '100.00', '24.00', '2026-01-07', '2026-01-07 14:35:24', '2026-01-07 14:35:24');
INSERT INTO `ingredient_imports` VALUES ('70', '53', '71/18', '100.00', '24.00', '2026-01-07', '2026-01-07 14:35:47', '2026-01-07 14:35:47');
INSERT INTO `ingredient_imports` VALUES ('71', '54', '71/19', '100.00', '74.00', '2026-01-07', '2026-01-07 14:36:16', '2026-01-07 14:36:16');
INSERT INTO `ingredient_imports` VALUES ('72', '54', '71/19', '100.00', '76.00', '2026-01-07', '2026-01-07 14:39:03', '2026-01-07 14:39:03');
INSERT INTO `ingredient_imports` VALUES ('73', '48', '71/20', '5.00', '400.00', '2026-01-07', '2026-01-07 14:41:57', '2026-01-07 14:41:57');
INSERT INTO `ingredient_imports` VALUES ('74', '57', '71/21', '40.00', '75.00', '2026-01-07', '2026-01-07 14:43:29', '2026-01-07 14:43:29');
INSERT INTO `ingredient_imports` VALUES ('75', '32', '71/22', '60.00', '430.00', '2026-01-07', '2026-01-07 14:43:47', '2026-01-07 14:43:47');
INSERT INTO `ingredient_imports` VALUES ('77', '27', '71/25', '560.00', '112.00', '2026-01-07', '2026-01-07 14:51:42', '2026-01-07 14:51:42');
INSERT INTO `ingredient_imports` VALUES ('78', '39', '71/26', '220.00', '120.00', '2026-01-07', '2026-01-07 14:53:15', '2026-01-07 14:53:15');
INSERT INTO `ingredient_imports` VALUES ('79', '68', '81/1', '2.00', '3500.00', '2026-01-07', '2026-01-07 14:55:06', '2026-01-07 14:55:06');
INSERT INTO `ingredient_imports` VALUES ('80', '31', '81/2', '50.00', '200.00', '2026-01-07', '2026-01-07 14:56:09', '2026-01-07 14:56:09');
INSERT INTO `ingredient_imports` VALUES ('81', '52', '81/3', '200.00', '24.00', '2026-01-07', '2026-01-07 14:57:02', '2026-01-07 14:57:02');
INSERT INTO `ingredient_imports` VALUES ('82', '53', '81/4', '100.00', '24.00', '2026-01-07', '2026-01-07 14:57:22', '2026-01-07 14:57:22');
INSERT INTO `ingredient_imports` VALUES ('83', '48', '81/5', '10.00', '400.00', '2026-01-07', '2026-01-07 14:57:55', '2026-01-07 14:57:55');
INSERT INTO `ingredient_imports` VALUES ('84', '48', '81/6', '5.00', '400.00', '2026-01-07', '2026-01-07 14:59:23', '2026-01-07 14:59:23');
INSERT INTO `ingredient_imports` VALUES ('85', '49', '81/7', '5.00', '400.00', '2026-01-07', '2026-01-07 15:00:48', '2026-01-07 15:00:48');
INSERT INTO `ingredient_imports` VALUES ('86', '47', '81/8', '5.00', '400.00', '2026-01-07', '2026-01-07 15:01:29', '2026-01-07 15:01:29');
INSERT INTO `ingredient_imports` VALUES ('87', '51', '81/9', '12.00', '300.00', '2026-01-07', '2026-01-07 15:02:46', '2026-01-07 15:02:46');
INSERT INTO `ingredient_imports` VALUES ('88', '19', '81/10', '200.00', '70.00', '2026-01-08', '2026-01-08 13:30:42', '2026-01-08 13:30:42');
INSERT INTO `ingredient_imports` VALUES ('89', '22', '81/11', '300.00', '11.00', '2026-01-08', '2026-01-08 13:31:17', '2026-01-08 13:31:17');
INSERT INTO `ingredient_imports` VALUES ('90', '52', '81/12', '100.00', '24.00', '2026-01-08', '2026-01-08 13:31:36', '2026-01-08 13:31:36');
INSERT INTO `ingredient_imports` VALUES ('91', '68', '81/13', '5.00', '1500.00', '2026-01-08', '2026-01-08 13:32:29', '2026-01-08 13:32:29');
INSERT INTO `ingredient_imports` VALUES ('92', '62', '81/14', '25.00', '200.00', '2026-01-08', '2026-01-08 13:33:25', '2026-01-08 13:33:25');
INSERT INTO `ingredient_imports` VALUES ('93', '21', '81/15', '200.00', '37.00', '2026-01-08', '2026-01-08 13:33:47', '2026-01-08 13:33:47');
INSERT INTO `ingredient_imports` VALUES ('94', '54', '81/16', '100.00', '74.00', '2026-01-08', '2026-01-08 13:34:10', '2026-01-08 13:34:10');
INSERT INTO `ingredient_imports` VALUES ('95', '53', '81/17', '100.00', '24.00', '2026-01-08', '2026-01-08 13:34:29', '2026-01-08 13:34:29');
INSERT INTO `ingredient_imports` VALUES ('96', '52', '81/18', '100.00', '24.00', '2026-01-08', '2026-01-08 13:34:47', '2026-01-08 13:34:47');
INSERT INTO `ingredient_imports` VALUES ('97', '57', '81/19', '80.00', '75.00', '2026-01-08', '2026-01-08 13:36:10', '2026-01-08 13:36:10');
INSERT INTO `ingredient_imports` VALUES ('98', '52', '91/1', '100.00', '25.00', '2026-01-09', '2026-01-09 10:48:38', '2026-01-09 10:48:38');
INSERT INTO `ingredient_imports` VALUES ('99', '54', '81/2', '100.00', '75.00', '2026-01-09', '2026-01-09 10:49:25', '2026-01-09 10:49:25');
INSERT INTO `ingredient_imports` VALUES ('100', '51', '91/3', '10.00', '300.00', '2026-01-09', '2026-01-09 10:50:27', '2026-01-09 10:50:27');
INSERT INTO `ingredient_imports` VALUES ('101', '47', '91/4', '6.00', '400.00', '2026-01-09', '2026-01-09 10:51:23', '2026-01-09 10:51:23');
INSERT INTO `ingredient_imports` VALUES ('102', '48', '91/5', '7.00', '400.00', '2026-01-09', '2026-01-09 10:51:49', '2026-01-09 10:51:49');
INSERT INTO `ingredient_imports` VALUES ('103', '38', '91/6', '80.00', '400.00', '2026-01-09', '2026-01-09 10:52:49', '2026-01-09 10:52:49');
INSERT INTO `ingredient_imports` VALUES ('104', '38', '91/7', '20.00', '550.00', '2026-01-09', '2026-01-09 10:54:28', '2026-01-09 10:54:28');
INSERT INTO `ingredient_imports` VALUES ('105', '37', '91/8', '10.00', '350.00', '2026-01-09', '2026-01-09 10:55:16', '2026-01-09 10:55:16');
INSERT INTO `ingredient_imports` VALUES ('106', '34', '91/9', '30.00', '50.00', '2026-01-09', '2026-01-09 10:55:43', '2026-01-09 10:55:43');
INSERT INTO `ingredient_imports` VALUES ('107', '57', '91/10', '20.00', '75.00', '2026-01-09', '2026-01-09 10:57:38', '2026-01-09 10:57:38');
INSERT INTO `ingredient_imports` VALUES ('108', '42', '91/11', '30.00', '200.00', '2026-01-09', '2026-01-09 11:01:03', '2026-01-09 11:01:03');
INSERT INTO `ingredient_imports` VALUES ('109', '49', '91/12', '2.00', '400.00', '2026-01-09', '2026-01-09 12:11:20', '2026-01-09 12:11:20');
INSERT INTO `ingredient_imports` VALUES ('110', '48', '101/1', '9.00', '600.00', '2026-01-10', '2026-01-10 01:36:41', '2026-01-10 01:36:41');
INSERT INTO `ingredient_imports` VALUES ('111', '47', '101/2', '6.00', '400.00', '2026-01-10', '2026-01-10 01:37:01', '2026-01-10 01:37:01');
INSERT INTO `ingredient_imports` VALUES ('112', '49', '101/3', '3.00', '400.00', '2026-01-10', '2026-01-10 01:37:20', '2026-01-10 01:37:20');
INSERT INTO `ingredient_imports` VALUES ('113', '51', '101/4', '6.00', '300.00', '2026-01-10', '2026-01-10 01:37:45', '2026-01-10 01:37:45');
INSERT INTO `ingredient_imports` VALUES ('114', '53', '101/5', '100.00', '24.00', '2026-01-10', '2026-01-10 01:38:17', '2026-01-10 01:38:17');
INSERT INTO `ingredient_imports` VALUES ('115', '52', '101/6', '200.00', '24.00', '2026-01-10', '2026-01-10 01:38:34', '2026-01-10 01:38:34');
INSERT INTO `ingredient_imports` VALUES ('116', '54', '101/7', '100.00', '72.00', '2026-01-10', '2026-01-10 01:39:10', '2026-01-10 01:39:10');
INSERT INTO `ingredient_imports` VALUES ('117', '48', '11.1/1', '7.00', '400.00', '2026-01-11', '2026-01-11 07:32:24', '2026-01-11 07:32:24');
INSERT INTO `ingredient_imports` VALUES ('118', '47', '11.1/2', '3.00', '400.00', '2026-01-11', '2026-01-11 07:32:47', '2026-01-11 07:32:47');
INSERT INTO `ingredient_imports` VALUES ('119', '49', '11.1/3', '3.00', '400.00', '2026-01-11', '2026-01-11 07:33:06', '2026-01-11 07:33:06');
INSERT INTO `ingredient_imports` VALUES ('120', '52', '11.1/4', '200.00', '24.00', '2026-01-11', '2026-01-11 07:37:21', '2026-01-11 07:37:21');
INSERT INTO `ingredient_imports` VALUES ('121', '53', '11.1/5', '200.00', '24.00', '2026-01-11', '2026-01-11 07:37:39', '2026-01-11 07:37:39');
INSERT INTO `ingredient_imports` VALUES ('122', '54', '11.1/6', '150.00', '72.00', '2026-01-11', '2026-01-11 07:38:01', '2026-01-11 07:38:01');
INSERT INTO `ingredient_imports` VALUES ('123', '52', '11.1/7', '50.00', '24.00', '2026-01-11', '2026-01-11 07:39:18', '2026-01-11 07:39:18');
INSERT INTO `ingredient_imports` VALUES ('124', '49', '12.1/1', '3.00', '400.00', '2026-01-12', '2026-01-12 00:25:25', '2026-01-12 00:25:25');
INSERT INTO `ingredient_imports` VALUES ('125', '47', '12.1/2', '3.00', '100.00', '2026-01-12', '2026-01-12 00:25:45', '2026-01-12 00:25:45');
INSERT INTO `ingredient_imports` VALUES ('126', '48', '12.1/3', '5.00', '400.00', '2026-01-12', '2026-01-12 00:26:06', '2026-01-12 00:26:06');
INSERT INTO `ingredient_imports` VALUES ('127', '51', '12.1/4', '6.00', '300.00', '2026-01-12', '2026-01-12 00:26:31', '2026-01-12 00:26:31');
INSERT INTO `ingredient_imports` VALUES ('128', '52', '12.1/5', '200.00', '24.00', '2026-01-12', '2026-01-12 00:26:49', '2026-01-12 00:26:49');
INSERT INTO `ingredient_imports` VALUES ('129', '53', '12.1/6', '200.00', '24.00', '2026-01-12', '2026-01-12 00:27:06', '2026-01-12 00:27:06');
INSERT INTO `ingredient_imports` VALUES ('130', '54', '12.1/7', '100.00', '72.00', '2026-01-12', '2026-01-12 00:27:30', '2026-01-12 00:27:30');
INSERT INTO `ingredient_imports` VALUES ('131', '47', '12.1/2', '3.00', '400.00', '2026-01-12', '2026-01-12 00:28:31', '2026-01-12 00:28:31');
INSERT INTO `ingredient_imports` VALUES ('132', '50', '11.1/8', '48.00', '375.00', '2026-01-12', '2026-01-12 02:10:21', '2026-01-12 02:10:21');
INSERT INTO `ingredient_imports` VALUES ('133', '51', '12.1/8', '12.00', '300.00', '2026-01-12', '2026-01-12 02:25:09', '2026-01-12 02:25:09');
INSERT INTO `ingredient_imports` VALUES ('134', '49', '12.1/9', '3.00', '400.00', '2026-01-12', '2026-01-12 02:25:26', '2026-01-12 02:25:26');
INSERT INTO `ingredient_imports` VALUES ('135', '48', '12.1/10', '7.00', '400.00', '2026-01-12', '2026-01-12 02:26:31', '2026-01-12 02:26:31');
INSERT INTO `ingredient_imports` VALUES ('136', '47', '12.1./11', '3.00', '400.00', '2026-01-12', '2026-01-12 02:27:26', '2026-01-12 02:27:26');
INSERT INTO `ingredient_imports` VALUES ('137', '48', '12.1./12', '6.00', '400.00', '2026-01-12', '2026-01-12 10:34:41', '2026-01-12 10:34:41');
INSERT INTO `ingredient_imports` VALUES ('138', '49', '12.1/13', '2.00', '400.00', '2026-01-12', '2026-01-12 10:35:04', '2026-01-12 10:35:04');
INSERT INTO `ingredient_imports` VALUES ('139', '52', '12.1/14', '150.00', '24.00', '2026-01-12', '2026-01-12 10:35:24', '2026-01-12 10:35:24');
INSERT INTO `ingredient_imports` VALUES ('140', '52', '12.1/14', '150.00', '24.00', '2026-01-12', '2026-01-12 10:35:26', '2026-01-12 10:35:26');
INSERT INTO `ingredient_imports` VALUES ('141', '53', '12.1/15', '150.00', '24.00', '2026-01-12', '2026-01-12 10:35:49', '2026-01-12 10:35:49');
INSERT INTO `ingredient_imports` VALUES ('142', '54', '12.1/16', '150.00', '72.00', '2026-01-12', '2026-01-12 10:36:06', '2026-01-12 10:36:06');
INSERT INTO `ingredient_imports` VALUES ('143', '65', '11.1/8', '100.00', '250.00', '2026-01-12', '2026-01-12 10:57:39', '2026-01-12 10:57:39');
INSERT INTO `ingredient_imports` VALUES ('144', '39', '12.1/17', '315.00', '130.00', '2026-01-12', '2026-01-12 11:02:58', '2026-01-12 11:02:58');
INSERT INTO `ingredient_imports` VALUES ('145', '40', '12.1/18', '300.00', '2700.00', '2026-01-12', '2026-01-12 11:04:39', '2026-01-12 11:04:39');
INSERT INTO `ingredient_imports` VALUES ('146', '38', '12.1/19', '100.00', '380.00', '2026-01-12', '2026-01-12 11:05:16', '2026-01-12 11:05:16');
INSERT INTO `ingredient_imports` VALUES ('147', '34', '12.1/20', '50.00', '50.00', '2026-01-12', '2026-01-12 11:05:55', '2026-01-12 11:05:55');
INSERT INTO `ingredient_imports` VALUES ('148', '35', '12.1/21', '40.00', '140.00', '2026-01-12', '2026-01-12 11:06:57', '2026-01-12 11:06:57');
INSERT INTO `ingredient_imports` VALUES ('149', '49', '12.1/22', '1.00', '400.00', '2026-01-12', '2026-01-12 11:31:19', '2026-01-12 11:31:19');
INSERT INTO `ingredient_imports` VALUES ('150', '49', '12.1/23', '1.00', '400.00', '2026-01-12', '2026-01-12 11:31:56', '2026-01-12 11:31:56');
INSERT INTO `ingredient_imports` VALUES ('151', '32', '12.1/24', '90.00', '450.00', '2026-01-12', '2026-01-12 13:10:44', '2026-01-12 13:10:44');
INSERT INTO `ingredient_imports` VALUES ('152', '52', '13.1/1', '200.00', '24.00', '2026-01-12', '2026-01-12 23:16:44', '2026-01-12 23:16:44');
INSERT INTO `ingredient_imports` VALUES ('153', '53', '13.1/2', '200.00', '24.00', '2026-01-12', '2026-01-12 23:17:01', '2026-01-12 23:17:01');
INSERT INTO `ingredient_imports` VALUES ('154', '54', '13.1/3', '100.00', '72.00', '2026-01-12', '2026-01-12 23:17:20', '2026-01-12 23:17:20');
INSERT INTO `ingredient_imports` VALUES ('155', '48', '13.1/4', '10.00', '400.00', '2026-01-12', '2026-01-12 23:17:53', '2026-01-12 23:17:53');
INSERT INTO `ingredient_imports` VALUES ('156', '47', '13.1/5', '5.00', '400.00', '2026-01-12', '2026-01-12 23:18:18', '2026-01-12 23:18:18');
INSERT INTO `ingredient_imports` VALUES ('157', '49', '13.1/6', '5.00', '400.00', '2026-01-12', '2026-01-12 23:18:55', '2026-01-12 23:18:55');
INSERT INTO `ingredient_imports` VALUES ('158', '51', '13.1/7', '10.00', '300.00', '2026-01-12', '2026-01-12 23:19:17', '2026-01-12 23:19:17');
INSERT INTO `ingredient_imports` VALUES ('159', '52', '13.1/1', '200.00', '24.00', '2026-01-12', '2026-01-12 23:55:42', '2026-01-12 23:55:42');
INSERT INTO `ingredient_imports` VALUES ('160', '52', '13.1/1', '200.00', '24.00', '2026-01-12', '2026-01-12 23:56:03', '2026-01-12 23:56:03');
INSERT INTO `ingredient_imports` VALUES ('161', '52', '13.1/1', '200.00', '24.00', '2026-01-12', '2026-01-12 23:56:05', '2026-01-12 23:56:05');
INSERT INTO `ingredient_imports` VALUES ('170', '52', '13.1/1', '200.00', '24.00', '2026-01-13', '2026-01-13 11:32:44', '2026-01-13 11:32:44');
INSERT INTO `ingredient_imports` VALUES ('171', '53', '13.1/2', '200.00', '24.00', '2026-01-13', '2026-01-13 11:33:41', '2026-01-13 11:33:41');
INSERT INTO `ingredient_imports` VALUES ('172', '54', '13.1/3', '100.00', '72.00', '2026-01-13', '2026-01-13 11:33:58', '2026-01-13 11:33:58');
INSERT INTO `ingredient_imports` VALUES ('173', '48', '13.1/4', '10.00', '400.00', '2026-01-13', '2026-01-13 11:34:26', '2026-01-13 11:34:26');
INSERT INTO `ingredient_imports` VALUES ('174', '47', '13.1/5', '5.00', '400.00', '2026-01-13', '2026-01-13 11:34:49', '2026-01-13 11:34:49');
INSERT INTO `ingredient_imports` VALUES ('175', '49', '13.1/6', '5.00', '400.00', '2026-01-13', '2026-01-13 11:35:12', '2026-01-13 11:35:12');
INSERT INTO `ingredient_imports` VALUES ('176', '51', '13.1/7', '10.00', '300.00', '2026-01-13', '2026-01-13 11:35:27', '2026-01-13 11:35:27');
INSERT INTO `ingredient_imports` VALUES ('177', '57', '13.1/8', '40.00', '75.00', '2026-01-13', '2026-01-13 11:36:22', '2026-01-13 11:36:22');
INSERT INTO `ingredient_imports` VALUES ('178', '68', '13.1/9', '5.00', '1500.00', '2026-01-13', '2026-01-13 11:36:54', '2026-01-13 11:36:54');
INSERT INTO `ingredient_imports` VALUES ('179', '50', '13.1/10', '30.00', '200.00', '2026-01-13', '2026-01-13 11:37:55', '2026-01-13 11:37:55');
INSERT INTO `ingredient_imports` VALUES ('180', '70', '13.1/11', '2000.00', '27.00', '2026-01-13', '2026-01-13 11:52:14', '2026-01-13 11:52:14');
INSERT INTO `ingredient_imports` VALUES ('181', '28', '13.1/12', '50.00', '200.00', '2026-01-13', '2026-01-13 12:16:24', '2026-01-13 12:16:24');
INSERT INTO `ingredient_imports` VALUES ('185', '52', '14.1/1', '100.00', '24.00', '2026-01-14', '2026-01-13 23:39:14', '2026-01-14 01:46:01');
INSERT INTO `ingredient_imports` VALUES ('186', '54', '14.1/2', '100.00', '72.00', '2026-01-14', '2026-01-13 23:39:35', '2026-01-14 01:46:24');
INSERT INTO `ingredient_imports` VALUES ('187', '48', '14.1/3', '10.00', '400.00', '2026-01-14', '2026-01-13 23:40:33', '2026-01-14 01:47:10');
INSERT INTO `ingredient_imports` VALUES ('188', '47', '14.1/4', '5.00', '400.00', '2026-01-14', '2026-01-13 23:40:51', '2026-01-14 01:47:26');
INSERT INTO `ingredient_imports` VALUES ('189', '49', '14.1/5', '5.00', '400.00', '2026-01-14', '2026-01-13 23:41:10', '2026-01-14 01:47:46');
INSERT INTO `ingredient_imports` VALUES ('190', '51', '14.1/6', '6.00', '300.00', '2026-01-14', '2026-01-13 23:41:30', '2026-01-14 01:48:02');
INSERT INTO `ingredient_imports` VALUES ('191', '52', '14.1/7', '150.00', '24.00', '2026-01-14', '2026-01-14 19:03:32', '2026-01-14 19:03:32');
INSERT INTO `ingredient_imports` VALUES ('192', '53', '14.1/8', '150.00', '24.00', '2026-01-14', '2026-01-14 19:03:57', '2026-01-14 19:03:57');
INSERT INTO `ingredient_imports` VALUES ('193', '54', '14.1/9', '50.00', '72.00', '2026-01-14', '2026-01-14 19:04:23', '2026-01-14 19:04:23');
INSERT INTO `ingredient_imports` VALUES ('194', '44', '11.1/8', '4.00', '2500.00', '2026-01-14', '2026-01-14 19:05:53', '2026-01-14 19:05:53');
INSERT INTO `ingredient_imports` VALUES ('195', '48', '14.1/10', '6.00', '166.00', '2026-01-14', '2026-01-14 19:08:05', '2026-01-14 19:08:05');
INSERT INTO `ingredient_imports` VALUES ('196', '69', '12.1/25', '69.00', '36.00', '2026-01-14', '2026-01-14 19:13:49', '2026-01-14 19:13:49');
INSERT INTO `ingredient_imports` VALUES ('197', '65', '14.1/11', '100.00', '250.00', '2026-01-14', '2026-01-14 20:11:05', '2026-01-14 20:11:05');
INSERT INTO `ingredient_imports` VALUES ('198', '31', '14.1/12', '100.00', '130.00', '2026-01-14', '2026-01-14 20:13:23', '2026-01-14 20:13:23');
INSERT INTO `ingredient_imports` VALUES ('199', '34', '14.1/13', '30.00', '133.00', '2026-01-14', '2026-01-14 20:14:07', '2026-01-14 20:14:07');
INSERT INTO `ingredient_imports` VALUES ('200', '35', '14.1/14', '50.00', '100.00', '2026-01-14', '2026-01-14 20:14:36', '2026-01-14 20:14:36');
INSERT INTO `ingredient_imports` VALUES ('201', '60', '14.1/15', '1.00', '5000.00', '2026-01-14', '2026-01-14 20:15:26', '2026-01-14 20:15:26');
INSERT INTO `ingredient_imports` VALUES ('202', '30', '14.1/16', '100.00', '28.00', '2026-01-14', '2026-01-14 20:16:01', '2026-01-14 20:16:01');
INSERT INTO `ingredient_imports` VALUES ('203', '57', '14.1/17', '40.00', '75.00', '2026-01-14', '2026-01-14 20:16:57', '2026-01-14 20:16:57');
INSERT INTO `ingredient_imports` VALUES ('204', '48', '15.1/1', '15.00', '400.00', '2026-01-15', '2026-01-15 06:43:25', '2026-01-15 06:43:25');
INSERT INTO `ingredient_imports` VALUES ('205', '47', '15.1/2', '5.00', '400.00', '2026-01-15', '2026-01-15 06:44:10', '2026-01-15 06:44:10');
INSERT INTO `ingredient_imports` VALUES ('206', '49', '15.1/3', '5.00', '400.00', '2026-01-15', '2026-01-15 06:44:34', '2026-01-15 06:44:34');
INSERT INTO `ingredient_imports` VALUES ('207', '51', '15.1/4', '10.00', '300.00', '2026-01-15', '2026-01-15 06:45:29', '2026-01-15 06:45:29');
INSERT INTO `ingredient_imports` VALUES ('208', '52', '15.1/5', '100.00', '24.00', '2026-01-15', '2026-01-15 06:46:39', '2026-01-15 06:46:39');
INSERT INTO `ingredient_imports` VALUES ('209', '53', '15.1/6', '100.00', '24.00', '2026-01-15', '2026-01-15 06:47:04', '2026-01-15 06:47:04');
INSERT INTO `ingredient_imports` VALUES ('210', '49', '15.1/7', '5.00', '400.00', '2026-01-15', '2026-01-15 08:28:50', '2026-01-15 08:28:50');
INSERT INTO `ingredient_imports` VALUES ('211', '52', '15.1/8', '150.00', '24.00', '2026-01-15', '2026-01-15 15:47:43', '2026-01-15 15:47:43');
INSERT INTO `ingredient_imports` VALUES ('212', '53', '15.1/9', '150.00', '24.00', '2026-01-15', '2026-01-15 15:48:04', '2026-01-15 15:48:04');
INSERT INTO `ingredient_imports` VALUES ('213', '54', '15.1/10', '100.00', '72.00', '2026-01-15', '2026-01-15 15:48:23', '2026-01-15 15:48:23');
INSERT INTO `ingredient_imports` VALUES ('214', '49', '15.1/11', '4.00', '400.00', '2026-01-15', '2026-01-15 15:48:59', '2026-01-15 15:48:59');
INSERT INTO `ingredient_imports` VALUES ('215', '48', '15.1/12', '4.00', '400.00', '2026-01-15', '2026-01-15 15:49:16', '2026-01-15 15:49:16');
INSERT INTO `ingredient_imports` VALUES ('216', '48', '15.1/12', '2.00', '400.00', '2026-01-15', '2026-01-15 15:49:33', '2026-01-15 15:49:33');


-- Table structure for `ingredients`

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE `ingredients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` decimal(8,2) NOT NULL DEFAULT '0.00',
  `unit_price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `low_stock_alert_quantity` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `ingredients`

INSERT INTO `ingredients` VALUES ('19', 'ကြက်သွန်ဖြူ', 'ကျပ်သား', '180.62', '70.00', '2026-01-04 08:16:24', '2026-01-15 16:51:53', '1.00');
INSERT INTO `ingredients` VALUES ('21', 'ကြက်နီ (အကြီး)', 'ကျပ်သား', '484.08', '37.00', '2026-01-04 08:17:49', '2026-01-15 16:51:53', '1.00');
INSERT INTO `ingredients` VALUES ('22', 'ကြက်နီ (အသေး)', 'ကျပ်သား', '462.60', '11.00', '2026-01-04 08:18:14', '2026-01-15 16:51:53', '1.00');
INSERT INTO `ingredients` VALUES ('24', 'ဆန်မှုန့်', 'ကျပ်သား', '98.98', '30.00', '2026-01-04 08:19:12', '2026-01-15 16:51:53', '1.00');
INSERT INTO `ingredients` VALUES ('25', 'ပဲစိမ်းမှုန့်', 'ကျပ်သား', '29.67', '120.00', '2026-01-04 08:21:14', '2026-01-15 16:37:07', '1.00');
INSERT INTO `ingredients` VALUES ('27', 'ဆီ', 'ကျပ်သား', '396.94', '112.00', '2026-01-04 08:22:05', '2026-01-15 16:51:53', '1.00');
INSERT INTO `ingredients` VALUES ('28', 'ငရုတ်သီး(အလျှော်မှုန်)', 'ကျပ်သား', '94.45', '200.00', '2026-01-04 08:23:54', '2026-01-15 16:37:07', '1.00');
INSERT INTO `ingredients` VALUES ('29', 'ငရုတ်ကောင်း', 'ကျပ်သား', '10.74', '550.00', '2026-01-04 08:26:19', '2026-01-15 16:51:53', '1.00');
INSERT INTO `ingredients` VALUES ('30', 'ဆား', 'ကျပ်သား', '215.70', '28.00', '2026-01-04 08:26:56', '2026-01-15 16:51:53', '1.00');
INSERT INTO `ingredients` VALUES ('31', 'ဆီချက်ကြက်သွန်‌ကြော်', 'ကျပ်သား', '162.00', '130.00', '2026-01-04 08:29:28', '2026-01-14 20:13:23', '1.00');
INSERT INTO `ingredients` VALUES ('32', 'ဘဲဥ', 'လုံး', '101.00', '450.00', '2026-01-04 08:34:23', '2026-01-15 15:54:44', '1.00');
INSERT INTO `ingredients` VALUES ('33', 'ကျောက်ချဉ်', 'ကျပ်သား', '20.00', '80.00', '2026-01-04 08:36:14', '2026-01-06 07:11:05', '1.00');
INSERT INTO `ingredients` VALUES ('34', 'နံနံပင်', 'ကျပ်သား', '160.00', '133.00', '2026-01-04 08:37:23', '2026-01-14 20:14:07', '1.00');
INSERT INTO `ingredients` VALUES ('35', 'သံပုရာသီး', 'လုံး', '91.00', '100.00', '2026-01-04 08:37:53', '2026-01-14 20:14:36', '1.00');
INSERT INTO `ingredients` VALUES ('37', 'ပဲသီး', 'စီး', '18.00', '350.00', '2026-01-04 08:39:08', '2026-01-09 10:55:16', '1.00');
INSERT INTO `ingredients` VALUES ('38', 'ငါးခြစ်', 'ကျပ်သား', '177.00', '380.00', '2026-01-04 08:40:16', '2026-01-15 16:31:33', '1.00');
INSERT INTO `ingredients` VALUES ('39', 'ကြက်သား', 'ကျပ်သား', '361.30', '130.00', '2026-01-04 08:41:07', '2026-01-15 16:37:07', '1.00');
INSERT INTO `ingredients` VALUES ('40', 'ငါးခြင်းဖြူ', 'ကျပ်သား', '139.06', '2700.00', '2026-01-04 08:42:38', '2026-01-15 16:51:53', '1.00');
INSERT INTO `ingredients` VALUES ('42', 'အချိုမှုန့် (500g=30ကျပ်သား)', 'ကျပ်သား', '52.26', '200.00', '2026-01-04 08:53:13', '2026-01-15 16:51:53', '1.00');
INSERT INTO `ingredients` VALUES ('44', 'ငံပြာရည်အသေး', 'ဗူး', '5.00', '2500.00', '2026-01-04 08:56:53', '2026-01-14 19:05:53', '1.00');
INSERT INTO `ingredients` VALUES ('47', 'ကောက်ညှင်းပဲကြော်', 'ခု', '22.00', '400.00', '2026-01-04 08:59:02', '2026-01-15 16:23:41', '1.00');
INSERT INTO `ingredients` VALUES ('48', 'ဘူးသီး‌ကြော်', 'ခု', '18.00', '400.00', '2026-01-04 08:59:50', '2026-01-15 16:47:32', '1.00');
INSERT INTO `ingredients` VALUES ('49', 'ကြက်သွန်ကြော်', 'ခု', '13.00', '400.00', '2026-01-04 09:00:24', '2026-01-15 16:51:53', '1.00');
INSERT INTO `ingredients` VALUES ('50', 'ဘဲသွေး', 'ခု', '52.00', '200.00', '2026-01-04 09:01:05', '2026-01-15 16:31:33', '1.00');
INSERT INTO `ingredients` VALUES ('51', 'အိကြာကွေ', 'ခြမ်း', '55.00', '300.00', '2026-01-04 09:01:38', '2026-01-15 08:31:21', '1.00');
INSERT INTO `ingredients` VALUES ('52', 'မုန့်ဟင်းခါး(မုန့်ဖတ်)', 'ကျပ်သား', '1560.00', '24.00', '2026-01-04 09:02:34', '2026-01-15 16:51:53', '1.00');
INSERT INTO `ingredients` VALUES ('53', 'ညှပ်ခေါက်ဆွဲ(မုန့်ဖတ်)', 'ကျပ်သား', '1454.00', '24.00', '2026-01-04 09:05:53', '2026-01-15 16:26:03', '1.00');
INSERT INTO `ingredients` VALUES ('54', 'အုန်းနို့ခေါက်ဆွဲ(မုန့်ဖတ်)', 'ကျပ်သား', '758.00', '72.00', '2026-01-04 09:13:11', '2026-01-15 16:37:07', '1.00');
INSERT INTO `ingredients` VALUES ('57', 'ဟင်းချက်ရေသန့်', 'လီတာ', '164.80', '75.00', '2026-01-04 09:19:45', '2026-01-15 16:51:53', '1.00');
INSERT INTO `ingredients` VALUES ('58', 'လက်ဖက်ခြောက်', 'ကျပ်သား', '26.00', '280.00', '2026-01-04 09:20:31', '2026-01-06 07:45:49', '1.00');
INSERT INTO `ingredients` VALUES ('59', 'သကြား', 'ကျပ်သား', '79.93', '50.00', '2026-01-04 09:56:15', '2026-01-15 16:37:07', '1.00');
INSERT INTO `ingredients` VALUES ('60', 'အကျွတ်‌ကြော်', 'ထုပ်', '2.00', '5000.00', '2026-01-04 09:56:55', '2026-01-14 20:15:26', '1.00');
INSERT INTO `ingredients` VALUES ('61', 'ဆော်တာ', 'ကျပ်သား', '20.00', '30.00', '2026-01-04 09:57:46', '2026-01-06 07:13:00', '1.00');
INSERT INTO `ingredients` VALUES ('62', 'နနွင်းမှုန့်', 'ကျပ်သား', '28.00', '200.00', '2026-01-04 09:58:34', '2026-01-08 13:33:25', '1.00');
INSERT INTO `ingredients` VALUES ('63', 'ငရုတ်သီး(အရောင်တင်မှုန့်)', 'ကျပ်သား', '18.00', '25.00', '2026-01-04 10:01:54', '2026-01-06 07:10:12', '1.00');
INSERT INTO `ingredients` VALUES ('65', 'ပဲ‌ကြော်', 'ခု', '301.00', '250.00', '2026-01-04 10:05:14', '2026-01-14 20:11:05', '1.00');
INSERT INTO `ingredients` VALUES ('66', 'ငှက်ပျောအူ', 'ချောင်း', '1.00', '3000.00', '2026-01-04 10:07:52', '2026-01-04 10:07:52', '1.00');
INSERT INTO `ingredients` VALUES ('68', 'အုန်းသီးအသား(ခြစ်ညှစ်)', 'အလုံး', '4.45', '1500.00', '2026-01-04 10:11:59', '2026-01-15 16:37:07', '1.00');
INSERT INTO `ingredients` VALUES ('69', 'ငံပြာရည် (1Liter=69 ကျပ်သား)', 'ကျပ်သား', '58.26', '36.00', '2026-01-06 07:17:15', '2026-01-15 16:51:53', '1.00');
INSERT INTO `ingredients` VALUES ('70', 'မီးသွေး', 'ကျပ်သား', '3700.00', '27.00', '2026-01-06 08:53:10', '2026-01-13 11:52:14', '1.00');


-- Table structure for `job_batches`

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



-- Table structure for `jobs`

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



-- Table structure for `migrations`

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `migrations`

INSERT INTO `migrations` VALUES ('1', '0001_01_01_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '0001_01_01_000001_create_cache_table', '1');
INSERT INTO `migrations` VALUES ('3', '0001_01_01_000002_create_jobs_table', '1');
INSERT INTO `migrations` VALUES ('4', '2026_01_02_211837_create_ingredients_table', '1');
INSERT INTO `migrations` VALUES ('5', '2026_01_02_211901_create_food_items_table', '1');
INSERT INTO `migrations` VALUES ('6', '2026_01_02_211912_create_food_item_ingredient_table', '1');
INSERT INTO `migrations` VALUES ('7', '2026_01_02_211933_create_orders_table', '1');
INSERT INTO `migrations` VALUES ('8', '2026_01_02_211944_create_order_items_table', '1');
INSERT INTO `migrations` VALUES ('9', '2026_01_02_212004_create_roles_table', '1');
INSERT INTO `migrations` VALUES ('10', '2026_01_02_212017_create_role_user_table', '1');
INSERT INTO `migrations` VALUES ('11', '2026_01_02_221053_add_cost_to_order_items_table', '1');
INSERT INTO `migrations` VALUES ('12', '2026_01_02_223251_add_quantity_to_food_items_table', '1');
INSERT INTO `migrations` VALUES ('13', '2026_01_02_223414_create_ingredient_imports_table', '1');
INSERT INTO `migrations` VALUES ('14', '2026_01_02_224117_create_tables_table', '1');
INSERT INTO `migrations` VALUES ('15', '2026_01_03_002609_remove_quantity_from_food_items', '1');
INSERT INTO `migrations` VALUES ('16', '2026_01_03_121659_add_status_to_order_items_table', '1');
INSERT INTO `migrations` VALUES ('17', '2026_01_03_145109_add_date_to_ingredient_imports_table', '2');
INSERT INTO `migrations` VALUES ('18', '2026_01_04_101104_alter_code_column_in_ingredient_imports_table', '3');
INSERT INTO `migrations` VALUES ('19', '2026_01_04_103428_create_table_bill_out_records_table', '4');
INSERT INTO `migrations` VALUES ('20', '2026_01_04_104245_create_expense_groups_table', '5');
INSERT INTO `migrations` VALUES ('21', '2026_01_04_104307_create_expense_details_table', '5');
INSERT INTO `migrations` VALUES ('22', '2026_01_06_095847_add_type_to_expense_groups_table', '6');
INSERT INTO `migrations` VALUES ('23', '2026_01_07_121936_add_remark_to_orders_table', '7');
INSERT INTO `migrations` VALUES ('24', '2026_01_14_092708_add_low_stock_alert_quantity_to_ingredients_tablea', '8');


-- Table structure for `order_items`

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `food_item_id` bigint unsigned NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cost` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_food_item_id_foreign` (`food_item_id`),
  CONSTRAINT `order_items_food_item_id_foreign` FOREIGN KEY (`food_item_id`) REFERENCES `food_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1074 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `order_items`

INSERT INTO `order_items` VALUES ('35', '20', '10', '1.00', '2500.00', 'served', '852.38', '2026-01-07 02:11:46', '2026-01-07 02:15:29');
INSERT INTO `order_items` VALUES ('36', '20', '15', '1.00', '500.00', 'served', '300.00', '2026-01-07 02:11:46', '2026-01-07 02:15:34');
INSERT INTO `order_items` VALUES ('37', '20', '16', '1.00', '500.00', 'served', '50.00', '2026-01-07 02:11:46', '2026-01-07 02:15:39');
INSERT INTO `order_items` VALUES ('38', '21', '11', '2.00', '5000.00', 'served', '1740.56', '2026-01-07 02:21:04', '2026-01-07 02:21:36');
INSERT INTO `order_items` VALUES ('39', '21', '12', '1.00', '500.00', 'served', '434.00', '2026-01-07 02:21:04', '2026-01-07 02:21:42');
INSERT INTO `order_items` VALUES ('40', '21', '14', '1.00', '500.00', 'served', '0.00', '2026-01-07 02:21:04', '2026-01-07 02:21:46');
INSERT INTO `order_items` VALUES ('41', '22', '8', '1.00', '2500.00', 'served', '867.87', '2026-01-07 02:27:32', '2026-01-07 02:27:54');
INSERT INTO `order_items` VALUES ('42', '22', '11', '2.00', '5000.00', 'served', '1740.56', '2026-01-07 02:27:32', '2026-01-07 02:27:59');
INSERT INTO `order_items` VALUES ('43', '22', '14', '1.00', '500.00', 'served', '0.00', '2026-01-07 02:27:32', '2026-01-07 02:28:03');
INSERT INTO `order_items` VALUES ('44', '22', '20', '1.00', '1000.00', 'served', '15.00', '2026-01-07 02:27:32', '2026-01-07 02:28:07');
INSERT INTO `order_items` VALUES ('45', '23', '8', '2.00', '5000.00', 'served', '1735.74', '2026-01-07 02:32:06', '2026-01-07 02:33:43');
INSERT INTO `order_items` VALUES ('46', '23', '10', '1.00', '2500.00', 'served', '871.65', '2026-01-07 02:32:06', '2026-01-07 02:33:48');
INSERT INTO `order_items` VALUES ('47', '23', '11', '1.00', '2500.00', 'served', '870.28', '2026-01-07 02:32:06', '2026-01-07 02:33:52');
INSERT INTO `order_items` VALUES ('48', '23', '12', '2.00', '1000.00', 'served', '868.00', '2026-01-07 02:32:06', '2026-01-07 02:33:56');
INSERT INTO `order_items` VALUES ('49', '23', '14', '1.00', '500.00', 'served', '0.00', '2026-01-07 02:32:06', '2026-01-07 02:34:00');
INSERT INTO `order_items` VALUES ('50', '23', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-07 02:32:06', '2026-01-07 02:34:04');
INSERT INTO `order_items` VALUES ('51', '23', '21', '1.00', '1000.00', 'served', '15.00', '2026-01-07 02:32:06', '2026-01-07 02:34:08');
INSERT INTO `order_items` VALUES ('52', '24', '10', '2.00', '5000.00', 'cancelled', '1743.30', '2026-01-07 02:35:51', '2026-01-07 02:39:42');
INSERT INTO `order_items` VALUES ('53', '24', '11', '3.00', '7500.00', 'cancelled', '2610.84', '2026-01-07 02:35:51', '2026-01-07 02:39:50');
INSERT INTO `order_items` VALUES ('54', '24', '12', '2.00', '1000.00', 'cancelled', '868.00', '2026-01-07 02:35:51', '2026-01-07 02:39:56');
INSERT INTO `order_items` VALUES ('55', '24', '13', '2.00', '1000.00', 'cancelled', '868.00', '2026-01-07 02:35:51', '2026-01-07 02:40:02');
INSERT INTO `order_items` VALUES ('56', '24', '14', '1.00', '500.00', 'cancelled', '0.00', '2026-01-07 02:35:51', '2026-01-07 02:40:10');
INSERT INTO `order_items` VALUES ('57', '24', '15', '1.00', '500.00', 'cancelled', '300.00', '2026-01-07 02:35:51', '2026-01-07 02:40:16');
INSERT INTO `order_items` VALUES ('58', '26', '8', '1.00', '2500.00', 'served', '867.87', '2026-01-07 02:43:18', '2026-01-07 02:43:35');
INSERT INTO `order_items` VALUES ('59', '26', '10', '1.00', '2500.00', 'served', '871.65', '2026-01-07 02:43:18', '2026-01-07 02:43:39');
INSERT INTO `order_items` VALUES ('60', '26', '11', '2.00', '5000.00', 'served', '1740.56', '2026-01-07 02:43:18', '2026-01-07 02:43:43');
INSERT INTO `order_items` VALUES ('61', '26', '12', '2.00', '1000.00', 'served', '868.00', '2026-01-07 02:43:18', '2026-01-07 02:43:47');
INSERT INTO `order_items` VALUES ('62', '26', '13', '3.00', '1500.00', 'served', '1302.00', '2026-01-07 02:43:18', '2026-01-07 02:43:51');
INSERT INTO `order_items` VALUES ('63', '26', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-07 02:43:18', '2026-01-07 02:43:55');
INSERT INTO `order_items` VALUES ('64', '27', '10', '1.00', '2500.00', 'served', '871.65', '2026-01-07 02:53:01', '2026-01-07 02:53:32');
INSERT INTO `order_items` VALUES ('65', '27', '12', '1.00', '500.00', 'served', '434.00', '2026-01-07 02:53:01', '2026-01-07 02:53:28');
INSERT INTO `order_items` VALUES ('66', '28', '10', '2.00', '5000.00', 'served', '1743.30', '2026-01-07 03:08:37', '2026-01-07 03:08:52');
INSERT INTO `order_items` VALUES ('67', '28', '11', '2.00', '5000.00', 'served', '1740.56', '2026-01-07 03:08:37', '2026-01-07 03:08:56');
INSERT INTO `order_items` VALUES ('68', '28', '13', '1.00', '500.00', 'served', '434.00', '2026-01-07 03:08:37', '2026-01-07 03:09:02');
INSERT INTO `order_items` VALUES ('69', '28', '14', '1.00', '500.00', 'served', '0.00', '2026-01-07 03:08:37', '2026-01-07 03:09:06');
INSERT INTO `order_items` VALUES ('70', '28', '15', '1.00', '500.00', 'served', '300.00', '2026-01-07 03:08:37', '2026-01-07 03:09:10');
INSERT INTO `order_items` VALUES ('71', '28', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-07 03:08:37', '2026-01-07 03:09:13');
INSERT INTO `order_items` VALUES ('72', '29', '10', '1.00', '2500.00', 'served', '871.65', '2026-01-07 03:12:02', '2026-01-07 03:12:28');
INSERT INTO `order_items` VALUES ('73', '30', '8', '3.00', '7500.00', 'served', '2603.61', '2026-01-07 03:15:55', '2026-01-07 03:16:21');
INSERT INTO `order_items` VALUES ('74', '30', '11', '2.00', '5000.00', 'served', '1740.56', '2026-01-07 03:15:55', '2026-01-07 03:16:17');
INSERT INTO `order_items` VALUES ('75', '30', '12', '2.00', '1000.00', 'served', '868.00', '2026-01-07 03:15:56', '2026-01-07 03:16:12');
INSERT INTO `order_items` VALUES ('76', '30', '18', '3.00', '3000.00', 'served', '1125.00', '2026-01-07 03:15:56', '2026-01-07 03:16:09');
INSERT INTO `order_items` VALUES ('77', '31', '11', '1.00', '2500.00', 'served', '870.28', '2026-01-07 03:23:47', '2026-01-07 03:24:25');
INSERT INTO `order_items` VALUES ('78', '31', '19', '1.00', '500.00', 'served', '434.00', '2026-01-07 03:23:47', '2026-01-07 03:24:20');
INSERT INTO `order_items` VALUES ('79', '32', '11', '1.00', '2500.00', 'served', '870.28', '2026-01-07 03:49:18', '2026-01-07 03:50:38');
INSERT INTO `order_items` VALUES ('80', '32', '12', '1.00', '500.00', 'served', '434.00', '2026-01-07 03:49:18', '2026-01-07 03:50:33');
INSERT INTO `order_items` VALUES ('81', '33', '11', '1.00', '2500.00', 'served', '870.28', '2026-01-07 04:17:01', '2026-01-07 04:17:30');
INSERT INTO `order_items` VALUES ('82', '33', '15', '1.00', '500.00', 'served', '300.00', '2026-01-07 04:17:01', '2026-01-07 04:17:26');
INSERT INTO `order_items` VALUES ('83', '33', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-07 04:17:01', '2026-01-07 04:17:22');
INSERT INTO `order_items` VALUES ('84', '34', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-07 04:39:11', '2026-01-07 04:39:29');
INSERT INTO `order_items` VALUES ('85', '35', '8', '2.00', '5000.00', 'served', '1735.74', '2026-01-07 04:52:09', '2026-01-07 04:53:25');
INSERT INTO `order_items` VALUES ('86', '35', '10', '2.00', '5000.00', 'served', '1743.30', '2026-01-07 04:52:09', '2026-01-07 04:53:21');
INSERT INTO `order_items` VALUES ('87', '35', '14', '3.00', '1500.00', 'served', '0.00', '2026-01-07 04:52:09', '2026-01-07 04:53:16');
INSERT INTO `order_items` VALUES ('88', '35', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-07 04:52:09', '2026-01-07 04:53:12');
INSERT INTO `order_items` VALUES ('89', '35', '19', '1.00', '500.00', 'served', '434.00', '2026-01-07 04:52:09', '2026-01-07 04:53:07');
INSERT INTO `order_items` VALUES ('90', '36', '11', '2.00', '5000.00', 'served', '1740.56', '2026-01-07 06:31:09', '2026-01-07 06:31:55');
INSERT INTO `order_items` VALUES ('91', '36', '14', '1.00', '500.00', 'served', '0.00', '2026-01-07 06:31:09', '2026-01-07 06:31:51');
INSERT INTO `order_items` VALUES ('92', '37', '8', '1.00', '2500.00', 'served', '867.87', '2026-01-07 06:49:11', '2026-01-07 06:49:34');
INSERT INTO `order_items` VALUES ('93', '37', '12', '1.00', '500.00', 'served', '434.00', '2026-01-07 06:49:11', '2026-01-07 06:49:45');
INSERT INTO `order_items` VALUES ('94', '38', '8', '1.00', '2500.00', 'served', '867.87', '2026-01-07 07:52:31', '2026-01-07 07:52:46');
INSERT INTO `order_items` VALUES ('95', '39', '8', '1.00', '2500.00', 'cancelled', '867.87', '2026-01-07 08:51:54', '2026-01-07 08:55:06');
INSERT INTO `order_items` VALUES ('96', '39', '10', '1.00', '2500.00', 'cancelled', '871.65', '2026-01-07 08:51:54', '2026-01-07 08:55:06');
INSERT INTO `order_items` VALUES ('97', '39', '11', '1.00', '2500.00', 'cancelled', '870.28', '2026-01-07 08:51:54', '2026-01-07 08:55:06');
INSERT INTO `order_items` VALUES ('98', '41', '8', '1.00', '2500.00', 'served', '867.87', '2026-01-07 09:03:20', '2026-01-07 09:06:04');
INSERT INTO `order_items` VALUES ('99', '41', '10', '1.00', '2500.00', 'served', '871.65', '2026-01-07 09:03:20', '2026-01-07 09:05:58');
INSERT INTO `order_items` VALUES ('100', '41', '11', '1.00', '2500.00', 'served', '870.28', '2026-01-07 09:03:20', '2026-01-07 09:05:53');
INSERT INTO `order_items` VALUES ('101', '41', '14', '1.00', '500.00', 'served', '0.00', '2026-01-07 09:03:20', '2026-01-07 09:05:48');
INSERT INTO `order_items` VALUES ('102', '41', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-07 09:03:20', '2026-01-07 09:05:41');
INSERT INTO `order_items` VALUES ('103', '41', '19', '1.00', '500.00', 'served', '434.00', '2026-01-07 09:03:20', '2026-01-07 09:04:50');
INSERT INTO `order_items` VALUES ('104', '42', '10', '1.00', '2500.00', 'cancelled', '871.65', '2026-01-07 09:10:25', '2026-01-07 09:12:17');
INSERT INTO `order_items` VALUES ('105', '42', '16', '1.00', '500.00', 'cancelled', '375.00', '2026-01-07 09:10:25', '2026-01-07 09:12:17');
INSERT INTO `order_items` VALUES ('106', '44', '10', '1.00', '2500.00', 'served', '871.65', '2026-01-07 09:22:18', '2026-01-07 11:41:25');
INSERT INTO `order_items` VALUES ('107', '44', '13', '1.00', '500.00', 'served', '434.00', '2026-01-07 09:22:18', '2026-01-07 11:41:21');
INSERT INTO `order_items` VALUES ('108', '45', '8', '2.00', '5000.00', 'served', '1735.74', '2026-01-07 09:25:22', '2026-01-07 09:31:58');
INSERT INTO `order_items` VALUES ('109', '45', '10', '2.00', '5000.00', 'served', '1743.30', '2026-01-07 09:25:22', '2026-01-07 09:31:58');
INSERT INTO `order_items` VALUES ('110', '45', '13', '1.00', '500.00', 'served', '434.00', '2026-01-07 09:25:22', '2026-01-07 09:31:58');
INSERT INTO `order_items` VALUES ('111', '45', '15', '1.00', '500.00', 'served', '300.00', '2026-01-07 09:25:22', '2026-01-07 09:31:58');
INSERT INTO `order_items` VALUES ('112', '45', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-07 09:25:22', '2026-01-07 09:31:58');
INSERT INTO `order_items` VALUES ('113', '45', '19', '1.00', '500.00', 'served', '434.00', '2026-01-07 09:25:22', '2026-01-07 09:31:58');
INSERT INTO `order_items` VALUES ('114', '46', '10', '1.00', '2500.00', 'served', '871.65', '2026-01-07 09:31:54', '2026-01-07 11:41:17');
INSERT INTO `order_items` VALUES ('115', '46', '19', '1.00', '500.00', 'served', '434.00', '2026-01-07 09:31:54', '2026-01-07 11:41:13');
INSERT INTO `order_items` VALUES ('116', '47', '8', '1.00', '2500.00', 'served', '867.87', '2026-01-07 09:52:52', '2026-01-08 08:51:04');
INSERT INTO `order_items` VALUES ('117', '47', '12', '2.00', '1000.00', 'served', '868.00', '2026-01-07 09:52:52', '2026-01-08 08:51:04');
INSERT INTO `order_items` VALUES ('118', '47', '14', '1.00', '500.00', 'served', '0.00', '2026-01-07 09:52:52', '2026-01-08 08:51:04');
INSERT INTO `order_items` VALUES ('119', '47', '11', '1.00', '2500.00', 'served', '870.28', '2026-01-07 09:53:08', '2026-01-08 08:51:04');
INSERT INTO `order_items` VALUES ('120', '48', '13', '1.00', '500.00', 'served', '434.00', '2026-01-07 09:56:25', '2026-01-07 10:00:56');
INSERT INTO `order_items` VALUES ('121', '49', '8', '1.00', '2500.00', 'served', '867.87', '2026-01-07 09:58:02', '2026-01-07 09:59:42');
INSERT INTO `order_items` VALUES ('122', '49', '14', '1.00', '500.00', 'served', '0.00', '2026-01-07 09:58:02', '2026-01-07 09:59:38');
INSERT INTO `order_items` VALUES ('123', '50', '11', '2.00', '5000.00', 'served', '1740.56', '2026-01-07 10:07:04', '2026-01-07 11:41:08');
INSERT INTO `order_items` VALUES ('124', '51', '11', '2.00', '5000.00', 'served', '1740.56', '2026-01-07 10:08:02', '2026-01-07 10:23:27');
INSERT INTO `order_items` VALUES ('125', '51', '13', '1.00', '500.00', 'served', '434.00', '2026-01-07 10:08:02', '2026-01-07 10:23:27');
INSERT INTO `order_items` VALUES ('126', '51', '15', '1.00', '500.00', 'served', '300.00', '2026-01-07 10:08:02', '2026-01-07 10:23:27');
INSERT INTO `order_items` VALUES ('127', '52', '14', '1.00', '500.00', 'served', '0.00', '2026-01-07 10:08:48', '2026-01-07 11:41:02');
INSERT INTO `order_items` VALUES ('128', '53', '11', '2.00', '5000.00', 'served', '1740.56', '2026-01-07 10:12:57', '2026-01-07 11:43:00');
INSERT INTO `order_items` VALUES ('129', '53', '14', '2.00', '1000.00', 'served', '0.00', '2026-01-07 10:12:57', '2026-01-07 11:42:55');
INSERT INTO `order_items` VALUES ('130', '54', '8', '1.00', '2500.00', 'served', '867.87', '2026-01-07 10:25:09', '2026-01-07 12:14:53');
INSERT INTO `order_items` VALUES ('131', '54', '14', '1.00', '500.00', 'served', '0.00', '2026-01-07 10:25:09', '2026-01-07 12:14:53');
INSERT INTO `order_items` VALUES ('132', '55', '8', '1.00', '2500.00', 'served', '867.87', '2026-01-07 11:16:50', '2026-01-07 11:40:47');
INSERT INTO `order_items` VALUES ('133', '55', '11', '1.00', '2500.00', 'served', '870.28', '2026-01-07 11:16:50', '2026-01-07 11:40:42');
INSERT INTO `order_items` VALUES ('134', '55', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-07 11:16:50', '2026-01-07 11:40:38');
INSERT INTO `order_items` VALUES ('135', '55', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-07 11:16:50', '2026-01-07 11:40:33');
INSERT INTO `order_items` VALUES ('136', '56', '11', '3.00', '7500.00', 'served', '2610.84', '2026-01-07 11:23:28', '2026-01-07 11:40:14');
INSERT INTO `order_items` VALUES ('137', '56', '12', '2.00', '1000.00', 'served', '868.00', '2026-01-07 11:23:28', '2026-01-07 11:40:16');
INSERT INTO `order_items` VALUES ('138', '56', '14', '1.00', '500.00', 'served', '0.00', '2026-01-07 11:23:28', '2026-01-07 11:40:19');
INSERT INTO `order_items` VALUES ('139', '56', '15', '1.00', '500.00', 'served', '300.00', '2026-01-07 11:23:28', '2026-01-07 11:40:24');
INSERT INTO `order_items` VALUES ('140', '56', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-07 11:23:28', '2026-01-07 11:40:28');
INSERT INTO `order_items` VALUES ('141', '57', '14', '1.00', '500.00', 'served', '0.00', '2026-01-07 11:25:36', '2026-01-07 11:40:10');
INSERT INTO `order_items` VALUES ('142', '58', '11', '1.00', '2500.00', 'served', '870.28', '2026-01-07 11:43:50', '2026-01-07 11:45:05');
INSERT INTO `order_items` VALUES ('143', '58', '13', '1.00', '500.00', 'served', '434.00', '2026-01-07 11:43:50', '2026-01-07 11:45:00');
INSERT INTO `order_items` VALUES ('144', '59', '10', '1.00', '2500.00', 'served', '871.65', '2026-01-07 11:57:25', '2026-01-07 13:16:20');
INSERT INTO `order_items` VALUES ('145', '59', '11', '2.00', '5000.00', 'served', '1740.56', '2026-01-07 11:57:25', '2026-01-07 13:16:25');
INSERT INTO `order_items` VALUES ('146', '59', '12', '1.00', '500.00', 'served', '434.00', '2026-01-07 11:57:25', '2026-01-07 13:16:29');
INSERT INTO `order_items` VALUES ('147', '59', '14', '1.00', '500.00', 'served', '0.00', '2026-01-07 11:57:25', '2026-01-07 13:16:34');
INSERT INTO `order_items` VALUES ('148', '59', '15', '1.00', '500.00', 'served', '300.00', '2026-01-07 11:57:25', '2026-01-07 13:16:39');
INSERT INTO `order_items` VALUES ('149', '59', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-07 11:57:25', '2026-01-07 13:15:44');
INSERT INTO `order_items` VALUES ('150', '60', '11', '4.00', '10000.00', 'served', '3481.12', '2026-01-07 11:57:46', '2026-01-07 12:04:15');
INSERT INTO `order_items` VALUES ('151', '54', '11', '2.00', '5000.00', 'served', '1740.56', '2026-01-07 12:03:01', '2026-01-07 12:14:53');
INSERT INTO `order_items` VALUES ('152', '61', '11', '1.00', '2500.00', 'served', '870.28', '2026-01-07 12:10:21', '2026-01-07 13:16:03');
INSERT INTO `order_items` VALUES ('153', '61', '16', '2.00', '1000.00', 'served', '750.00', '2026-01-07 12:10:21', '2026-01-07 13:16:11');
INSERT INTO `order_items` VALUES ('154', '61', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-07 12:10:21', '2026-01-07 13:16:07');
INSERT INTO `order_items` VALUES ('155', '61', '22', '1.00', '500.00', 'served', '383.73', '2026-01-07 12:10:21', '2026-01-07 13:16:15');
INSERT INTO `order_items` VALUES ('156', '62', '10', '1.00', '2500.00', 'served', '871.65', '2026-01-07 12:19:04', '2026-01-08 10:53:05');
INSERT INTO `order_items` VALUES ('157', '62', '11', '1.00', '2500.00', 'served', '870.28', '2026-01-07 12:19:04', '2026-01-08 10:53:05');
INSERT INTO `order_items` VALUES ('158', '62', '16', '2.00', '1000.00', 'served', '750.00', '2026-01-07 12:19:04', '2026-01-08 10:53:05');
INSERT INTO `order_items` VALUES ('159', '63', '11', '1.00', '2500.00', 'served', '870.28', '2026-01-07 12:40:56', '2026-01-07 13:15:52');
INSERT INTO `order_items` VALUES ('160', '63', '16', '1.00', '500.00', 'served', '375.00', '2026-01-07 12:40:56', '2026-01-07 13:15:56');
INSERT INTO `order_items` VALUES ('161', '64', '8', '1.00', '2500.00', 'served', '867.87', '2026-01-07 13:01:28', '2026-01-08 02:08:00');
INSERT INTO `order_items` VALUES ('162', '65', '10', '1.00', '2500.00', 'served', '871.65', '2026-01-07 13:30:43', '2026-01-07 13:31:16');
INSERT INTO `order_items` VALUES ('163', '65', '11', '1.00', '2500.00', 'served', '870.28', '2026-01-07 13:30:43', '2026-01-07 13:31:16');
INSERT INTO `order_items` VALUES ('164', '65', '16', '3.00', '1500.00', 'served', '1125.00', '2026-01-07 13:30:43', '2026-01-07 13:31:16');
INSERT INTO `order_items` VALUES ('165', '65', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-07 13:30:43', '2026-01-07 13:31:16');
INSERT INTO `order_items` VALUES ('166', '65', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-07 13:30:43', '2026-01-07 13:31:16');
INSERT INTO `order_items` VALUES ('167', '66', '11', '2.00', '5000.00', 'served', '1691.24', '2026-01-08 00:06:33', '2026-01-08 00:19:49');
INSERT INTO `order_items` VALUES ('168', '66', '16', '4.00', '2000.00', 'served', '1500.00', '2026-01-08 00:06:33', '2026-01-08 00:19:45');
INSERT INTO `order_items` VALUES ('169', '66', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 00:18:56', '2026-01-08 00:19:41');
INSERT INTO `order_items` VALUES ('170', '67', '10', '1.00', '2500.00', 'served', '846.62', '2026-01-08 00:25:36', '2026-01-08 00:26:00');
INSERT INTO `order_items` VALUES ('171', '67', '15', '1.00', '500.00', 'served', '300.00', '2026-01-08 00:25:36', '2026-01-08 00:26:00');
INSERT INTO `order_items` VALUES ('172', '68', '10', '1.00', '2500.00', 'served', '846.62', '2026-01-08 00:27:24', '2026-01-08 00:41:01');
INSERT INTO `order_items` VALUES ('173', '68', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 00:27:24', '2026-01-08 00:40:55');
INSERT INTO `order_items` VALUES ('174', '68', '13', '1.00', '500.00', 'served', '400.00', '2026-01-08 00:27:24', '2026-01-08 00:40:34');
INSERT INTO `order_items` VALUES ('175', '68', '15', '1.00', '500.00', 'served', '300.00', '2026-01-08 00:27:24', '2026-01-08 00:40:27');
INSERT INTO `order_items` VALUES ('176', '69', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 00:31:36', '2026-01-08 00:32:43');
INSERT INTO `order_items` VALUES ('177', '70', '10', '1.00', '2500.00', 'served', '846.62', '2026-01-08 00:37:26', '2026-01-08 00:39:21');
INSERT INTO `order_items` VALUES ('178', '70', '16', '1.00', '500.00', 'served', '375.00', '2026-01-08 00:37:26', '2026-01-08 00:39:20');
INSERT INTO `order_items` VALUES ('179', '70', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-08 00:37:26', '2026-01-08 00:39:18');
INSERT INTO `order_items` VALUES ('180', '68', '8', '1.00', '2500.00', 'served', '906.20', '2026-01-08 00:39:50', '2026-01-08 00:40:24');
INSERT INTO `order_items` VALUES ('181', '68', '13', '1.00', '500.00', 'served', '400.00', '2026-01-08 00:39:50', '2026-01-08 00:40:19');
INSERT INTO `order_items` VALUES ('182', '68', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-08 00:39:50', '2026-01-08 00:40:16');
INSERT INTO `order_items` VALUES ('183', '68', '22', '1.00', '500.00', 'served', '371.40', '2026-01-08 00:39:50', '2026-01-08 00:40:11');
INSERT INTO `order_items` VALUES ('184', '71', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 00:52:03', '2026-01-08 01:02:55');
INSERT INTO `order_items` VALUES ('185', '71', '12', '1.00', '500.00', 'served', '400.00', '2026-01-08 00:52:03', '2026-01-08 01:02:57');
INSERT INTO `order_items` VALUES ('186', '72', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 00:57:14', '2026-01-08 01:12:07');
INSERT INTO `order_items` VALUES ('187', '64', '14', '1.00', '500.00', 'served', '0.00', '2026-01-08 01:04:03', '2026-01-08 02:08:00');
INSERT INTO `order_items` VALUES ('188', '73', '8', '2.00', '5000.00', 'served', '1812.40', '2026-01-08 01:13:16', '2026-01-08 01:26:34');
INSERT INTO `order_items` VALUES ('189', '73', '10', '1.00', '2500.00', 'served', '846.62', '2026-01-08 01:13:16', '2026-01-08 01:26:50');
INSERT INTO `order_items` VALUES ('190', '73', '11', '2.00', '5000.00', 'served', '1691.24', '2026-01-08 01:13:16', '2026-01-08 01:26:57');
INSERT INTO `order_items` VALUES ('191', '73', '17', '3.00', '3000.00', 'served', '1290.00', '2026-01-08 01:13:16', '2026-01-08 01:27:01');
INSERT INTO `order_items` VALUES ('192', '74', '8', '1.00', '2500.00', 'served', '906.20', '2026-01-08 01:28:16', '2026-01-08 01:43:36');
INSERT INTO `order_items` VALUES ('193', '74', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 01:28:16', '2026-01-08 01:43:35');
INSERT INTO `order_items` VALUES ('194', '74', '15', '1.00', '500.00', 'served', '300.00', '2026-01-08 01:28:17', '2026-01-08 01:43:33');
INSERT INTO `order_items` VALUES ('195', '74', '16', '1.00', '500.00', 'served', '375.00', '2026-01-08 01:28:17', '2026-01-08 01:43:32');
INSERT INTO `order_items` VALUES ('196', '75', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 01:32:53', '2026-01-08 01:43:48');
INSERT INTO `order_items` VALUES ('197', '75', '13', '1.00', '500.00', 'served', '400.00', '2026-01-08 01:32:53', '2026-01-08 01:43:43');
INSERT INTO `order_items` VALUES ('198', '76', '10', '2.00', '5000.00', 'served', '1693.24', '2026-01-08 01:46:54', '2026-01-08 01:55:35');
INSERT INTO `order_items` VALUES ('199', '77', '10', '1.00', '2500.00', 'served', '846.62', '2026-01-08 02:00:38', '2026-01-08 02:03:19');
INSERT INTO `order_items` VALUES ('200', '77', '14', '1.00', '500.00', 'served', '0.00', '2026-01-08 02:00:38', '2026-01-08 02:03:18');
INSERT INTO `order_items` VALUES ('201', '78', '8', '1.00', '2500.00', 'served', '906.20', '2026-01-08 02:04:02', '2026-01-08 09:07:04');
INSERT INTO `order_items` VALUES ('202', '78', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 02:04:02', '2026-01-08 09:06:50');
INSERT INTO `order_items` VALUES ('203', '78', '12', '1.00', '500.00', 'served', '400.00', '2026-01-08 02:04:02', '2026-01-08 09:07:08');
INSERT INTO `order_items` VALUES ('204', '78', '15', '1.00', '500.00', 'served', '300.00', '2026-01-08 02:04:02', '2026-01-08 09:07:13');
INSERT INTO `order_items` VALUES ('205', '79', '8', '1.00', '2500.00', 'served', '906.20', '2026-01-08 02:12:29', '2026-01-08 02:18:02');
INSERT INTO `order_items` VALUES ('206', '79', '11', '6.00', '15000.00', 'served', '5073.72', '2026-01-08 02:12:29', '2026-01-08 02:18:02');
INSERT INTO `order_items` VALUES ('207', '79', '12', '1.00', '500.00', 'served', '400.00', '2026-01-08 02:12:29', '2026-01-08 02:18:02');
INSERT INTO `order_items` VALUES ('208', '80', '10', '1.00', '2500.00', 'served', '846.62', '2026-01-08 02:16:04', '2026-01-08 02:20:35');
INSERT INTO `order_items` VALUES ('209', '80', '12', '1.00', '500.00', 'served', '400.00', '2026-01-08 02:16:04', '2026-01-08 02:20:35');
INSERT INTO `order_items` VALUES ('210', '78', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 02:17:10', '2026-01-08 09:07:17');
INSERT INTO `order_items` VALUES ('211', '78', '12', '1.00', '500.00', 'served', '400.00', '2026-01-08 02:17:10', '2026-01-08 09:07:34');
INSERT INTO `order_items` VALUES ('212', '81', '10', '1.00', '2500.00', 'served', '846.62', '2026-01-08 02:19:52', '2026-01-08 02:26:56');
INSERT INTO `order_items` VALUES ('213', '81', '15', '1.00', '500.00', 'served', '300.00', '2026-01-08 02:19:52', '2026-01-08 02:26:55');
INSERT INTO `order_items` VALUES ('214', '81', '16', '1.00', '500.00', 'served', '375.00', '2026-01-08 02:19:52', '2026-01-08 02:26:54');
INSERT INTO `order_items` VALUES ('215', '82', '10', '1.00', '2500.00', 'served', '846.62', '2026-01-08 02:26:41', '2026-01-08 03:05:30');
INSERT INTO `order_items` VALUES ('216', '82', '15', '1.00', '500.00', 'served', '300.00', '2026-01-08 02:26:41', '2026-01-08 03:05:34');
INSERT INTO `order_items` VALUES ('217', '83', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 02:50:19', '2026-01-08 03:04:54');
INSERT INTO `order_items` VALUES ('218', '83', '14', '1.00', '500.00', 'served', '0.00', '2026-01-08 02:50:19', '2026-01-08 03:04:53');
INSERT INTO `order_items` VALUES ('219', '84', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 02:51:33', '2026-01-08 03:05:00');
INSERT INTO `order_items` VALUES ('220', '84', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-08 02:51:33', '2026-01-08 03:04:58');
INSERT INTO `order_items` VALUES ('221', '85', '10', '1.00', '2500.00', 'served', '846.62', '2026-01-08 03:08:20', '2026-01-08 03:56:59');
INSERT INTO `order_items` VALUES ('222', '86', '16', '1.00', '500.00', 'served', '375.00', '2026-01-08 03:12:07', '2026-01-08 03:15:36');
INSERT INTO `order_items` VALUES ('223', '86', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-08 03:12:07', '2026-01-08 03:15:32');
INSERT INTO `order_items` VALUES ('224', '86', '22', '1.00', '500.00', 'served', '371.40', '2026-01-08 03:12:07', '2026-01-08 03:15:27');
INSERT INTO `order_items` VALUES ('225', '87', '10', '1.00', '2500.00', 'served', '846.62', '2026-01-08 03:17:08', '2026-01-08 03:30:26');
INSERT INTO `order_items` VALUES ('226', '87', '12', '1.00', '500.00', 'served', '400.00', '2026-01-08 03:17:08', '2026-01-08 03:30:21');
INSERT INTO `order_items` VALUES ('227', '88', '10', '1.00', '2500.00', 'served', '846.62', '2026-01-08 03:56:34', '2026-01-08 03:56:54');
INSERT INTO `order_items` VALUES ('228', '88', '12', '1.00', '500.00', 'served', '400.00', '2026-01-08 03:56:34', '2026-01-08 03:56:54');
INSERT INTO `order_items` VALUES ('229', '89', '10', '1.00', '2500.00', 'served', '846.62', '2026-01-08 04:59:23', '2026-01-08 09:06:40');
INSERT INTO `order_items` VALUES ('230', '89', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 04:59:23', '2026-01-08 09:06:44');
INSERT INTO `order_items` VALUES ('231', '89', '15', '1.00', '500.00', 'served', '300.00', '2026-01-08 04:59:23', '2026-01-08 09:06:54');
INSERT INTO `order_items` VALUES ('232', '89', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-08 04:59:23', '2026-01-08 09:06:59');
INSERT INTO `order_items` VALUES ('233', '90', '8', '1.00', '2500.00', 'served', '906.20', '2026-01-08 05:49:30', '2026-01-08 05:51:31');
INSERT INTO `order_items` VALUES ('234', '90', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-08 05:49:30', '2026-01-08 05:51:31');
INSERT INTO `order_items` VALUES ('235', '91', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 06:26:05', '2026-01-08 06:27:14');
INSERT INTO `order_items` VALUES ('236', '91', '12', '1.00', '500.00', 'served', '400.00', '2026-01-08 06:26:05', '2026-01-08 06:27:07');
INSERT INTO `order_items` VALUES ('237', '92', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 06:29:13', '2026-01-08 06:37:20');
INSERT INTO `order_items` VALUES ('238', '92', '12', '1.00', '500.00', 'served', '400.00', '2026-01-08 06:29:13', '2026-01-08 06:37:15');
INSERT INTO `order_items` VALUES ('239', '93', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 06:42:00', '2026-01-08 06:45:36');
INSERT INTO `order_items` VALUES ('240', '94', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 07:21:16', '2026-01-08 12:04:50');
INSERT INTO `order_items` VALUES ('241', '94', '10', '1.00', '2500.00', 'served', '846.62', '2026-01-08 07:21:35', '2026-01-08 12:04:50');
INSERT INTO `order_items` VALUES ('242', '94', '14', '1.00', '500.00', 'served', '0.00', '2026-01-08 07:21:35', '2026-01-08 12:04:50');
INSERT INTO `order_items` VALUES ('243', '95', '10', '2.00', '5000.00', 'served', '1693.24', '2026-01-08 07:38:28', '2026-01-08 08:51:37');
INSERT INTO `order_items` VALUES ('244', '95', '13', '1.00', '500.00', 'served', '400.00', '2026-01-08 07:38:28', '2026-01-08 08:51:36');
INSERT INTO `order_items` VALUES ('245', '95', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-08 07:38:28', '2026-01-08 08:51:34');
INSERT INTO `order_items` VALUES ('246', '95', '22', '1.00', '500.00', 'served', '371.40', '2026-01-08 07:38:28', '2026-01-08 08:51:33');
INSERT INTO `order_items` VALUES ('247', '96', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 08:37:42', '2026-01-08 08:50:56');
INSERT INTO `order_items` VALUES ('248', '96', '12', '1.00', '500.00', 'served', '400.00', '2026-01-08 08:37:42', '2026-01-08 08:50:56');
INSERT INTO `order_items` VALUES ('249', '62', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 08:42:26', '2026-01-08 10:53:05');
INSERT INTO `order_items` VALUES ('250', '62', '12', '1.00', '500.00', 'served', '400.00', '2026-01-08 08:42:26', '2026-01-08 10:53:05');
INSERT INTO `order_items` VALUES ('251', '62', '8', '1.00', '2500.00', 'served', '906.20', '2026-01-08 08:49:06', '2026-01-08 10:53:05');
INSERT INTO `order_items` VALUES ('252', '62', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-08 08:49:06', '2026-01-08 10:53:05');
INSERT INTO `order_items` VALUES ('253', '94', '8', '0.00', '0.00', 'served', '0.00', '2026-01-08 08:54:08', '2026-01-08 12:04:50');
INSERT INTO `order_items` VALUES ('254', '97', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 09:02:35', '2026-01-08 09:08:49');
INSERT INTO `order_items` VALUES ('255', '97', '12', '1.00', '500.00', 'served', '400.00', '2026-01-08 09:02:35', '2026-01-08 09:08:41');
INSERT INTO `order_items` VALUES ('256', '98', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 09:03:01', '2026-01-08 09:08:57');
INSERT INTO `order_items` VALUES ('257', '98', '14', '1.00', '500.00', 'served', '0.00', '2026-01-08 09:03:01', '2026-01-08 09:08:53');
INSERT INTO `order_items` VALUES ('258', '99', '8', '2.00', '5000.00', 'served', '1812.40', '2026-01-08 09:07:04', '2026-01-08 09:08:45');
INSERT INTO `order_items` VALUES ('259', '100', '10', '1.00', '2500.00', 'served', '846.62', '2026-01-08 09:16:03', '2026-01-08 09:18:33');
INSERT INTO `order_items` VALUES ('260', '100', '16', '1.00', '500.00', 'served', '375.00', '2026-01-08 09:16:03', '2026-01-08 09:18:33');
INSERT INTO `order_items` VALUES ('261', '100', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-08 09:16:03', '2026-01-08 09:18:33');
INSERT INTO `order_items` VALUES ('262', '101', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 09:17:52', '2026-01-08 09:18:37');
INSERT INTO `order_items` VALUES ('263', '101', '19', '1.00', '500.00', 'served', '400.00', '2026-01-08 09:17:52', '2026-01-08 09:18:37');
INSERT INTO `order_items` VALUES ('264', '102', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 09:21:17', '2026-01-08 09:25:25');
INSERT INTO `order_items` VALUES ('265', '102', '13', '1.00', '500.00', 'served', '400.00', '2026-01-08 09:22:09', '2026-01-08 09:25:21');
INSERT INTO `order_items` VALUES ('266', '103', '10', '1.00', '2500.00', 'served', '846.62', '2026-01-08 09:29:57', '2026-01-08 09:30:41');
INSERT INTO `order_items` VALUES ('267', '103', '14', '1.00', '500.00', 'served', '0.00', '2026-01-08 09:29:57', '2026-01-08 09:30:41');
INSERT INTO `order_items` VALUES ('268', '104', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 09:36:02', '2026-01-08 09:36:25');
INSERT INTO `order_items` VALUES ('269', '105', '8', '1.00', '2500.00', 'served', '906.20', '2026-01-08 10:01:10', '2026-01-08 10:05:47');
INSERT INTO `order_items` VALUES ('270', '105', '10', '1.00', '2500.00', 'served', '846.62', '2026-01-08 10:01:10', '2026-01-08 10:05:47');
INSERT INTO `order_items` VALUES ('271', '105', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 10:01:10', '2026-01-08 10:05:47');
INSERT INTO `order_items` VALUES ('272', '105', '14', '1.00', '500.00', 'served', '0.00', '2026-01-08 10:01:10', '2026-01-08 10:05:47');
INSERT INTO `order_items` VALUES ('273', '105', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-08 10:01:10', '2026-01-08 10:05:47');
INSERT INTO `order_items` VALUES ('274', '106', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 10:05:32', '2026-01-08 10:57:50');
INSERT INTO `order_items` VALUES ('275', '106', '14', '1.00', '500.00', 'served', '0.00', '2026-01-08 10:05:32', '2026-01-08 10:57:50');
INSERT INTO `order_items` VALUES ('276', '106', '16', '1.00', '500.00', 'served', '375.00', '2026-01-08 10:05:33', '2026-01-08 10:57:50');
INSERT INTO `order_items` VALUES ('277', '106', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-08 10:05:33', '2026-01-08 10:57:50');
INSERT INTO `order_items` VALUES ('278', '106', '21', '1.00', '1000.00', 'served', '549.06', '2026-01-08 10:05:33', '2026-01-08 10:57:50');
INSERT INTO `order_items` VALUES ('279', '107', '8', '1.00', '2500.00', 'served', '906.20', '2026-01-08 10:06:25', '2026-01-08 11:00:01');
INSERT INTO `order_items` VALUES ('280', '107', '14', '1.00', '500.00', 'served', '0.00', '2026-01-08 10:06:25', '2026-01-08 10:59:40');
INSERT INTO `order_items` VALUES ('281', '107', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-08 10:06:25', '2026-01-08 10:59:33');
INSERT INTO `order_items` VALUES ('282', '108', '8', '1.00', '2500.00', 'served', '906.20', '2026-01-08 10:08:12', '2026-01-08 11:00:15');
INSERT INTO `order_items` VALUES ('283', '108', '11', '2.00', '5000.00', 'served', '1691.24', '2026-01-08 10:08:12', '2026-01-08 11:00:10');
INSERT INTO `order_items` VALUES ('284', '108', '12', '2.00', '1000.00', 'served', '800.00', '2026-01-08 10:08:12', '2026-01-08 10:59:51');
INSERT INTO `order_items` VALUES ('285', '110', '10', '1.00', '2500.00', 'served', '846.62', '2026-01-08 10:11:54', '2026-01-08 10:15:46');
INSERT INTO `order_items` VALUES ('286', '110', '19', '1.00', '500.00', 'served', '400.00', '2026-01-08 10:11:54', '2026-01-08 10:15:46');
INSERT INTO `order_items` VALUES ('287', '111', '12', '1.00', '500.00', 'served', '400.00', '2026-01-08 10:15:09', '2026-01-08 10:59:46');
INSERT INTO `order_items` VALUES ('288', '106', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 10:17:38', '2026-01-08 10:57:50');
INSERT INTO `order_items` VALUES ('289', '106', '16', '1.00', '500.00', 'served', '375.00', '2026-01-08 10:17:38', '2026-01-08 10:57:50');
INSERT INTO `order_items` VALUES ('290', '112', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 10:21:29', '2026-01-08 11:00:06');
INSERT INTO `order_items` VALUES ('291', '112', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-08 10:21:29', '2026-01-08 10:59:55');
INSERT INTO `order_items` VALUES ('292', '113', '8', '1.00', '2500.00', 'served', '906.20', '2026-01-08 10:23:16', '2026-01-08 10:23:27');
INSERT INTO `order_items` VALUES ('293', '113', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 10:23:16', '2026-01-08 10:23:27');
INSERT INTO `order_items` VALUES ('294', '114', '10', '1.00', '2500.00', 'served', '846.62', '2026-01-08 10:33:15', '2026-01-08 11:00:31');
INSERT INTO `order_items` VALUES ('295', '115', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 10:37:22', '2026-01-08 10:37:43');
INSERT INTO `order_items` VALUES ('296', '115', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-08 10:37:22', '2026-01-08 10:37:43');
INSERT INTO `order_items` VALUES ('297', '114', '15', '1.00', '500.00', 'served', '300.00', '2026-01-08 10:46:38', '2026-01-08 11:00:27');
INSERT INTO `order_items` VALUES ('298', '116', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 10:49:35', '2026-01-08 10:53:36');
INSERT INTO `order_items` VALUES ('299', '117', '10', '1.00', '2500.00', 'served', '846.62', '2026-01-08 10:52:48', '2026-01-08 10:56:49');
INSERT INTO `order_items` VALUES ('300', '117', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 10:52:48', '2026-01-08 10:56:49');
INSERT INTO `order_items` VALUES ('301', '118', '8', '2.00', '5000.00', 'served', '1812.40', '2026-01-08 11:09:04', '2026-01-08 11:13:01');
INSERT INTO `order_items` VALUES ('302', '118', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-08 11:09:04', '2026-01-08 11:13:01');
INSERT INTO `order_items` VALUES ('303', '118', '15', '1.00', '500.00', 'served', '300.00', '2026-01-08 11:10:18', '2026-01-08 11:13:01');
INSERT INTO `order_items` VALUES ('304', '119', '10', '1.00', '2500.00', 'served', '846.62', '2026-01-08 11:15:30', '2026-01-08 11:15:54');
INSERT INTO `order_items` VALUES ('305', '119', '13', '1.00', '500.00', 'served', '400.00', '2026-01-08 11:15:30', '2026-01-08 11:15:54');
INSERT INTO `order_items` VALUES ('306', '120', '8', '1.00', '2500.00', 'served', '906.20', '2026-01-08 11:16:10', '2026-01-08 11:25:57');
INSERT INTO `order_items` VALUES ('307', '120', '10', '1.00', '2500.00', 'served', '846.62', '2026-01-08 11:16:10', '2026-01-08 11:25:57');
INSERT INTO `order_items` VALUES ('308', '120', '12', '2.00', '1000.00', 'served', '800.00', '2026-01-08 11:16:10', '2026-01-08 11:25:57');
INSERT INTO `order_items` VALUES ('309', '121', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 11:25:24', '2026-01-08 11:25:44');
INSERT INTO `order_items` VALUES ('310', '121', '14', '1.00', '500.00', 'served', '0.00', '2026-01-08 11:25:24', '2026-01-08 11:25:44');
INSERT INTO `order_items` VALUES ('311', '122', '10', '4.00', '10000.00', 'served', '3386.48', '2026-01-08 11:51:43', '2026-01-08 12:25:43');
INSERT INTO `order_items` VALUES ('312', '122', '16', '5.00', '2500.00', 'served', '1875.00', '2026-01-08 11:51:43', '2026-01-08 12:25:43');
INSERT INTO `order_items` VALUES ('313', '122', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-08 11:51:43', '2026-01-08 12:25:43');
INSERT INTO `order_items` VALUES ('314', '122', '19', '2.00', '1000.00', 'served', '800.00', '2026-01-08 11:51:43', '2026-01-08 12:25:43');
INSERT INTO `order_items` VALUES ('315', '122', '14', '1.00', '500.00', 'served', '0.00', '2026-01-08 11:57:16', '2026-01-08 12:25:43');
INSERT INTO `order_items` VALUES ('316', '122', '11', '1.00', '2500.00', 'served', '845.62', '2026-01-08 11:58:11', '2026-01-08 12:25:43');
INSERT INTO `order_items` VALUES ('317', '123', '10', '1.00', '2500.00', 'served', '846.62', '2026-01-08 12:04:45', '2026-01-08 12:05:19');
INSERT INTO `order_items` VALUES ('318', '123', '19', '1.00', '500.00', 'served', '400.00', '2026-01-08 12:04:45', '2026-01-08 12:05:19');
INSERT INTO `order_items` VALUES ('319', '122', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-08 12:06:18', '2026-01-08 12:25:43');
INSERT INTO `order_items` VALUES ('320', '122', '22', '1.00', '500.00', 'served', '371.40', '2026-01-08 12:06:18', '2026-01-08 12:25:43');
INSERT INTO `order_items` VALUES ('321', '124', '14', '1.00', '500.00', 'served', '0.00', '2026-01-08 12:23:45', '2026-01-08 12:24:58');
INSERT INTO `order_items` VALUES ('322', '124', '16', '1.00', '500.00', 'served', '375.00', '2026-01-08 12:23:45', '2026-01-08 12:24:58');
INSERT INTO `order_items` VALUES ('323', '124', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-08 12:23:45', '2026-01-08 12:24:58');
INSERT INTO `order_items` VALUES ('324', '124', '20', '1.00', '1000.00', 'served', '696.92', '2026-01-08 12:23:45', '2026-01-08 12:24:58');
INSERT INTO `order_items` VALUES ('325', '124', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-08 12:24:03', '2026-01-08 12:24:58');
INSERT INTO `order_items` VALUES ('326', '125', '11', '4.00', '10000.00', 'served', '3429.76', '2026-01-09 00:34:31', '2026-01-09 00:40:48');
INSERT INTO `order_items` VALUES ('327', '125', '12', '1.00', '500.00', 'served', '400.00', '2026-01-09 00:34:31', '2026-01-09 00:40:48');
INSERT INTO `order_items` VALUES ('328', '125', '14', '2.00', '1000.00', 'served', '0.00', '2026-01-09 00:34:31', '2026-01-09 00:40:48');
INSERT INTO `order_items` VALUES ('329', '125', '19', '1.00', '500.00', 'served', '400.00', '2026-01-09 00:34:31', '2026-01-09 00:40:48');
INSERT INTO `order_items` VALUES ('330', '126', '11', '2.00', '5000.00', 'served', '1714.88', '2026-01-09 00:35:53', '2026-01-09 00:45:21');
INSERT INTO `order_items` VALUES ('331', '126', '16', '2.00', '1000.00', 'served', '750.00', '2026-01-09 00:35:53', '2026-01-09 00:45:21');
INSERT INTO `order_items` VALUES ('332', '127', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-09 00:46:30', '2026-01-09 00:50:26');
INSERT INTO `order_items` VALUES ('333', '127', '12', '1.00', '500.00', 'served', '400.00', '2026-01-09 00:46:30', '2026-01-09 00:50:26');
INSERT INTO `order_items` VALUES ('334', '128', '8', '3.00', '7500.00', 'served', '2376.60', '2026-01-09 00:51:20', '2026-01-09 00:51:56');
INSERT INTO `order_items` VALUES ('335', '129', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-09 00:55:02', '2026-01-09 00:57:58');
INSERT INTO `order_items` VALUES ('336', '129', '12', '1.00', '500.00', 'served', '400.00', '2026-01-09 00:55:02', '2026-01-09 00:57:58');
INSERT INTO `order_items` VALUES ('337', '130', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-09 00:59:28', '2026-01-09 01:00:02');
INSERT INTO `order_items` VALUES ('338', '131', '8', '1.00', '2500.00', 'served', '792.20', '2026-01-09 01:05:13', '2026-01-09 01:05:27');
INSERT INTO `order_items` VALUES ('339', '132', '8', '1.00', '2500.00', 'served', '792.20', '2026-01-09 01:07:32', '2026-01-09 01:08:20');
INSERT INTO `order_items` VALUES ('340', '133', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-09 01:34:45', '2026-01-09 01:50:00');
INSERT INTO `order_items` VALUES ('341', '133', '15', '1.00', '500.00', 'served', '300.00', '2026-01-09 01:34:45', '2026-01-09 01:50:01');
INSERT INTO `order_items` VALUES ('342', '134', '8', '1.00', '2500.00', 'served', '792.20', '2026-01-09 01:52:34', '2026-01-09 01:54:38');
INSERT INTO `order_items` VALUES ('343', '134', '11', '2.00', '5000.00', 'served', '1714.88', '2026-01-09 01:52:34', '2026-01-09 01:54:38');
INSERT INTO `order_items` VALUES ('344', '134', '12', '2.00', '1000.00', 'served', '800.00', '2026-01-09 01:52:34', '2026-01-09 01:54:38');
INSERT INTO `order_items` VALUES ('345', '134', '14', '1.00', '500.00', 'served', '0.00', '2026-01-09 01:52:34', '2026-01-09 01:54:38');
INSERT INTO `order_items` VALUES ('346', '135', '8', '2.00', '5000.00', 'served', '1584.40', '2026-01-09 02:05:39', '2026-01-09 02:19:59');
INSERT INTO `order_items` VALUES ('347', '135', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-09 02:05:39', '2026-01-09 02:19:59');
INSERT INTO `order_items` VALUES ('348', '135', '12', '1.00', '500.00', 'served', '400.00', '2026-01-09 02:05:39', '2026-01-09 02:19:59');
INSERT INTO `order_items` VALUES ('349', '135', '15', '1.00', '500.00', 'served', '300.00', '2026-01-09 02:05:39', '2026-01-09 02:19:59');
INSERT INTO `order_items` VALUES ('350', '135', '16', '1.00', '500.00', 'served', '375.00', '2026-01-09 02:05:39', '2026-01-09 02:19:59');
INSERT INTO `order_items` VALUES ('351', '135', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-09 02:05:39', '2026-01-09 02:19:59');
INSERT INTO `order_items` VALUES ('352', '135', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-09 02:05:39', '2026-01-09 02:19:59');
INSERT INTO `order_items` VALUES ('353', '135', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-09 02:13:25', '2026-01-09 02:19:59');
INSERT INTO `order_items` VALUES ('354', '136', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-09 02:14:26', '2026-01-09 02:16:11');
INSERT INTO `order_items` VALUES ('355', '136', '14', '1.00', '500.00', 'served', '0.00', '2026-01-09 02:14:26', '2026-01-09 02:16:11');
INSERT INTO `order_items` VALUES ('356', '137', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-09 02:17:09', '2026-01-09 02:20:45');
INSERT INTO `order_items` VALUES ('357', '135', '8', '1.00', '2500.00', 'served', '792.20', '2026-01-09 02:17:35', '2026-01-09 02:19:59');
INSERT INTO `order_items` VALUES ('358', '135', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-09 02:17:35', '2026-01-09 02:19:59');
INSERT INTO `order_items` VALUES ('359', '137', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-09 02:19:53', '2026-01-09 02:20:45');
INSERT INTO `order_items` VALUES ('360', '138', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-09 02:25:18', '2026-01-09 02:27:44');
INSERT INTO `order_items` VALUES ('361', '138', '12', '1.00', '500.00', 'served', '400.00', '2026-01-09 02:25:18', '2026-01-09 02:27:44');
INSERT INTO `order_items` VALUES ('362', '139', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-09 02:27:54', '2026-01-09 02:29:15');
INSERT INTO `order_items` VALUES ('363', '140', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-09 02:48:08', '2026-01-09 02:48:23');
INSERT INTO `order_items` VALUES ('364', '140', '15', '1.00', '500.00', 'served', '300.00', '2026-01-09 02:48:08', '2026-01-09 02:48:23');
INSERT INTO `order_items` VALUES ('365', '141', '8', '1.00', '2500.00', 'served', '792.20', '2026-01-09 03:00:12', '2026-01-09 03:00:22');
INSERT INTO `order_items` VALUES ('366', '141', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-09 03:00:12', '2026-01-09 03:00:22');
INSERT INTO `order_items` VALUES ('367', '142', '14', '1.00', '500.00', 'served', '0.00', '2026-01-09 03:03:31', '2026-01-09 03:04:25');
INSERT INTO `order_items` VALUES ('368', '143', '8', '1.00', '2500.00', 'served', '792.20', '2026-01-09 03:19:45', '2026-01-09 03:20:58');
INSERT INTO `order_items` VALUES ('369', '143', '14', '1.00', '500.00', 'served', '0.00', '2026-01-09 03:19:45', '2026-01-09 03:20:58');
INSERT INTO `order_items` VALUES ('370', '144', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-09 03:46:17', '2026-01-09 03:46:32');
INSERT INTO `order_items` VALUES ('371', '144', '14', '1.00', '500.00', 'served', '0.00', '2026-01-09 03:46:17', '2026-01-09 03:46:32');
INSERT INTO `order_items` VALUES ('372', '145', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-09 03:53:46', '2026-01-09 03:56:08');
INSERT INTO `order_items` VALUES ('373', '145', '12', '1.00', '500.00', 'served', '400.00', '2026-01-09 03:53:46', '2026-01-09 03:56:08');
INSERT INTO `order_items` VALUES ('374', '146', '8', '1.00', '2500.00', 'served', '792.20', '2026-01-09 04:13:38', '2026-01-09 04:14:00');
INSERT INTO `order_items` VALUES ('375', '146', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-09 04:13:39', '2026-01-09 04:14:00');
INSERT INTO `order_items` VALUES ('376', '146', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-09 04:13:39', '2026-01-09 04:14:00');
INSERT INTO `order_items` VALUES ('377', '147', '8', '1.00', '2500.00', 'served', '792.20', '2026-01-09 06:04:48', '2026-01-09 06:14:21');
INSERT INTO `order_items` VALUES ('378', '147', '14', '1.00', '500.00', 'served', '0.00', '2026-01-09 06:04:49', '2026-01-09 06:14:21');
INSERT INTO `order_items` VALUES ('379', '148', '11', '4.00', '10000.00', 'served', '3429.76', '2026-01-09 07:40:16', '2026-01-09 07:40:46');
INSERT INTO `order_items` VALUES ('380', '149', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-09 08:59:19', '2026-01-09 09:00:06');
INSERT INTO `order_items` VALUES ('381', '149', '14', '1.00', '500.00', 'served', '0.00', '2026-01-09 08:59:19', '2026-01-09 09:00:06');
INSERT INTO `order_items` VALUES ('382', '150', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-09 09:08:07', '2026-01-09 09:08:21');
INSERT INTO `order_items` VALUES ('383', '150', '15', '1.00', '500.00', 'served', '300.00', '2026-01-09 09:08:07', '2026-01-09 09:08:21');
INSERT INTO `order_items` VALUES ('384', '151', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-09 09:19:35', '2026-01-09 09:29:25');
INSERT INTO `order_items` VALUES ('385', '151', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-09 09:19:35', '2026-01-09 09:29:25');
INSERT INTO `order_items` VALUES ('386', '151', '15', '1.00', '500.00', 'served', '300.00', '2026-01-09 09:19:35', '2026-01-09 09:29:25');
INSERT INTO `order_items` VALUES ('387', '151', '16', '1.00', '500.00', 'served', '375.00', '2026-01-09 09:19:35', '2026-01-09 09:29:25');
INSERT INTO `order_items` VALUES ('388', '151', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-09 09:19:35', '2026-01-09 09:29:25');
INSERT INTO `order_items` VALUES ('389', '152', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-09 09:38:14', '2026-01-09 09:39:24');
INSERT INTO `order_items` VALUES ('390', '152', '11', '4.00', '10000.00', 'served', '3429.76', '2026-01-09 09:38:14', '2026-01-09 09:39:24');
INSERT INTO `order_items` VALUES ('391', '152', '16', '5.00', '2500.00', 'served', '1875.00', '2026-01-09 09:38:14', '2026-01-09 09:39:24');
INSERT INTO `order_items` VALUES ('392', '152', '17', '2.00', '2000.00', 'served', '860.00', '2026-01-09 09:38:14', '2026-01-09 09:39:24');
INSERT INTO `order_items` VALUES ('393', '152', '19', '2.00', '1000.00', 'served', '800.00', '2026-01-09 09:38:14', '2026-01-09 09:39:24');
INSERT INTO `order_items` VALUES ('394', '153', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-09 09:46:47', '2026-01-09 09:46:56');
INSERT INTO `order_items` VALUES ('395', '154', '8', '1.00', '2500.00', 'served', '792.20', '2026-01-09 09:52:18', '2026-01-09 10:27:42');
INSERT INTO `order_items` VALUES ('396', '155', '8', '1.00', '2500.00', 'served', '792.20', '2026-01-09 10:26:39', '2026-01-09 10:28:39');
INSERT INTO `order_items` VALUES ('397', '155', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-09 10:26:39', '2026-01-09 10:28:39');
INSERT INTO `order_items` VALUES ('398', '155', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-09 10:26:39', '2026-01-09 10:28:39');
INSERT INTO `order_items` VALUES ('399', '156', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-09 10:46:03', '2026-01-09 10:46:17');
INSERT INTO `order_items` VALUES ('400', '156', '14', '1.00', '500.00', 'served', '0.00', '2026-01-09 10:46:03', '2026-01-09 10:46:17');
INSERT INTO `order_items` VALUES ('401', '157', '8', '1.00', '2500.00', 'served', '792.20', '2026-01-09 10:46:30', '2026-01-09 10:47:41');
INSERT INTO `order_items` VALUES ('402', '158', '8', '1.00', '2500.00', 'served', '797.20', '2026-01-09 11:49:54', '2026-01-09 11:53:16');
INSERT INTO `order_items` VALUES ('403', '158', '11', '1.00', '2500.00', 'served', '862.94', '2026-01-09 11:49:54', '2026-01-09 11:53:16');
INSERT INTO `order_items` VALUES ('404', '158', '14', '1.00', '500.00', 'served', '0.00', '2026-01-09 11:49:54', '2026-01-09 11:53:16');
INSERT INTO `order_items` VALUES ('405', '158', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-09 11:49:54', '2026-01-09 11:53:16');
INSERT INTO `order_items` VALUES ('406', '159', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-09 12:01:41', '2026-01-09 12:02:05');
INSERT INTO `order_items` VALUES ('407', '159', '19', '1.00', '500.00', 'served', '400.00', '2026-01-09 12:01:41', '2026-01-09 12:02:05');
INSERT INTO `order_items` VALUES ('408', '160', '11', '1.00', '2500.00', 'served', '862.94', '2026-01-09 12:11:07', '2026-01-09 12:11:17');
INSERT INTO `order_items` VALUES ('409', '160', '14', '1.00', '500.00', 'served', '0.00', '2026-01-09 12:11:07', '2026-01-09 12:11:17');
INSERT INTO `order_items` VALUES ('410', '161', '8', '2.00', '5000.00', 'served', '1594.40', '2026-01-09 12:14:36', '2026-01-09 12:19:55');
INSERT INTO `order_items` VALUES ('411', '161', '11', '1.00', '2500.00', 'served', '862.94', '2026-01-09 12:19:41', '2026-01-09 12:19:55');
INSERT INTO `order_items` VALUES ('412', '161', '16', '1.00', '500.00', 'served', '550.00', '2026-01-09 12:19:41', '2026-01-09 12:19:55');
INSERT INTO `order_items` VALUES ('413', '162', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-09 12:28:55', '2026-01-09 12:29:51');
INSERT INTO `order_items` VALUES ('414', '162', '16', '2.00', '1000.00', 'served', '1100.00', '2026-01-09 12:28:55', '2026-01-09 12:29:51');
INSERT INTO `order_items` VALUES ('415', '163', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-09 12:35:59', '2026-01-09 12:37:57');
INSERT INTO `order_items` VALUES ('416', '163', '19', '1.00', '500.00', 'served', '400.00', '2026-01-09 12:35:59', '2026-01-09 12:37:57');
INSERT INTO `order_items` VALUES ('417', '164', '11', '1.00', '2500.00', 'served', '862.94', '2026-01-09 13:00:16', '2026-01-09 13:00:41');
INSERT INTO `order_items` VALUES ('418', '164', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-09 13:00:16', '2026-01-09 13:00:41');
INSERT INTO `order_items` VALUES ('419', '165', '8', '1.00', '2500.00', 'served', '797.20', '2026-01-09 13:49:37', '2026-01-09 13:49:52');
INSERT INTO `order_items` VALUES ('420', '165', '10', '2.00', '5000.00', 'served', '1716.88', '2026-01-09 13:49:37', '2026-01-09 13:49:52');
INSERT INTO `order_items` VALUES ('421', '165', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-09 13:49:37', '2026-01-09 13:49:52');
INSERT INTO `order_items` VALUES ('422', '165', '19', '1.00', '500.00', 'served', '400.00', '2026-01-09 13:49:37', '2026-01-09 13:49:52');
INSERT INTO `order_items` VALUES ('423', '166', '11', '1.00', '2500.00', 'served', '862.94', '2026-01-10 00:07:04', '2026-01-10 00:07:33');
INSERT INTO `order_items` VALUES ('424', '167', '11', '1.00', '2500.00', 'served', '862.94', '2026-01-10 00:43:40', '2026-01-10 00:45:31');
INSERT INTO `order_items` VALUES ('425', '167', '12', '1.00', '500.00', 'served', '400.00', '2026-01-10 00:43:40', '2026-01-10 00:45:31');
INSERT INTO `order_items` VALUES ('426', '167', '16', '1.00', '500.00', 'served', '550.00', '2026-01-10 00:43:40', '2026-01-10 00:45:31');
INSERT INTO `order_items` VALUES ('427', '168', '11', '2.00', '5000.00', 'served', '1725.88', '2026-01-10 01:12:00', '2026-01-10 01:13:25');
INSERT INTO `order_items` VALUES ('428', '168', '13', '2.00', '1000.00', 'served', '800.00', '2026-01-10 01:12:00', '2026-01-10 01:13:25');
INSERT INTO `order_items` VALUES ('429', '169', '8', '1.00', '2500.00', 'served', '797.20', '2026-01-10 01:13:58', '2026-01-10 01:14:37');
INSERT INTO `order_items` VALUES ('430', '169', '11', '1.00', '2500.00', 'served', '862.94', '2026-01-10 01:13:58', '2026-01-10 01:14:37');
INSERT INTO `order_items` VALUES ('431', '170', '8', '1.00', '2500.00', 'served', '797.20', '2026-01-10 01:15:17', '2026-01-10 01:23:03');
INSERT INTO `order_items` VALUES ('432', '170', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-10 01:15:17', '2026-01-10 01:23:00');
INSERT INTO `order_items` VALUES ('433', '170', '12', '1.00', '500.00', 'served', '400.00', '2026-01-10 01:15:17', '2026-01-10 01:22:57');
INSERT INTO `order_items` VALUES ('434', '170', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-10 01:15:17', '2026-01-10 01:22:51');
INSERT INTO `order_items` VALUES ('435', '170', '16', '1.00', '500.00', 'served', '550.00', '2026-01-10 01:18:16', '2026-01-10 01:22:50');
INSERT INTO `order_items` VALUES ('436', '171', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-10 01:27:41', '2026-01-10 01:35:46');
INSERT INTO `order_items` VALUES ('437', '172', '11', '2.00', '5000.00', 'served', '1725.88', '2026-01-10 01:30:25', '2026-01-10 01:35:54');
INSERT INTO `order_items` VALUES ('438', '172', '14', '1.00', '500.00', 'served', '0.00', '2026-01-10 01:30:25', '2026-01-10 01:35:54');
INSERT INTO `order_items` VALUES ('439', '174', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-10 01:44:28', '2026-01-10 01:45:41');
INSERT INTO `order_items` VALUES ('440', '174', '12', '1.00', '500.00', 'served', '600.00', '2026-01-10 01:44:28', '2026-01-10 01:45:41');
INSERT INTO `order_items` VALUES ('441', '175', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-10 01:44:36', '2026-01-10 01:50:05');
INSERT INTO `order_items` VALUES ('442', '175', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-10 01:44:36', '2026-01-10 01:50:05');
INSERT INTO `order_items` VALUES ('443', '175', '12', '1.00', '500.00', 'served', '600.00', '2026-01-10 01:44:36', '2026-01-10 01:50:05');
INSERT INTO `order_items` VALUES ('444', '175', '14', '1.00', '500.00', 'served', '0.00', '2026-01-10 01:44:36', '2026-01-10 01:50:05');
INSERT INTO `order_items` VALUES ('445', '175', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-10 01:44:36', '2026-01-10 01:50:05');
INSERT INTO `order_items` VALUES ('446', '176', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-10 01:48:22', '2026-01-10 01:49:36');
INSERT INTO `order_items` VALUES ('447', '176', '16', '1.00', '500.00', 'served', '550.00', '2026-01-10 01:49:10', '2026-01-10 01:49:36');
INSERT INTO `order_items` VALUES ('448', '177', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-10 02:08:42', '2026-01-10 02:08:54');
INSERT INTO `order_items` VALUES ('449', '178', '14', '3.00', '1500.00', 'served', '0.00', '2026-01-10 02:22:15', '2026-01-10 02:27:11');
INSERT INTO `order_items` VALUES ('450', '179', '16', '2.00', '1000.00', 'served', '1100.00', '2026-01-10 02:35:47', '2026-01-10 02:41:55');
INSERT INTO `order_items` VALUES ('451', '179', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-10 02:35:47', '2026-01-10 02:41:55');
INSERT INTO `order_items` VALUES ('452', '179', '21', '2.00', '2000.00', 'served', '890.12', '2026-01-10 02:35:47', '2026-01-10 02:41:55');
INSERT INTO `order_items` VALUES ('453', '179', '15', '1.00', '500.00', 'served', '300.00', '2026-01-10 02:41:34', '2026-01-10 02:41:55');
INSERT INTO `order_items` VALUES ('454', '180', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-10 03:02:34', '2026-01-10 03:56:43');
INSERT INTO `order_items` VALUES ('455', '180', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-10 03:02:35', '2026-01-10 03:56:43');
INSERT INTO `order_items` VALUES ('456', '180', '12', '1.00', '500.00', 'served', '600.00', '2026-01-10 03:02:35', '2026-01-10 03:56:43');
INSERT INTO `order_items` VALUES ('457', '180', '14', '1.00', '500.00', 'served', '0.00', '2026-01-10 03:02:35', '2026-01-10 03:56:43');
INSERT INTO `order_items` VALUES ('458', '180', '16', '1.00', '500.00', 'served', '550.00', '2026-01-10 03:02:35', '2026-01-10 03:56:43');
INSERT INTO `order_items` VALUES ('459', '180', '19', '1.00', '500.00', 'served', '400.00', '2026-01-10 03:02:35', '2026-01-10 03:56:43');
INSERT INTO `order_items` VALUES ('460', '180', '21', '1.00', '1000.00', 'served', '445.06', '2026-01-10 03:02:35', '2026-01-10 03:56:43');
INSERT INTO `order_items` VALUES ('461', '181', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-10 03:07:18', '2026-01-10 03:21:52');
INSERT INTO `order_items` VALUES ('462', '181', '12', '1.00', '500.00', 'served', '600.00', '2026-01-10 03:07:18', '2026-01-10 03:21:52');
INSERT INTO `order_items` VALUES ('463', '181', '16', '1.00', '500.00', 'served', '550.00', '2026-01-10 03:07:18', '2026-01-10 03:21:52');
INSERT INTO `order_items` VALUES ('464', '181', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-10 03:10:00', '2026-01-10 03:21:52');
INSERT INTO `order_items` VALUES ('465', '181', '14', '1.00', '500.00', 'served', '0.00', '2026-01-10 03:10:00', '2026-01-10 03:21:52');
INSERT INTO `order_items` VALUES ('466', '181', '16', '1.00', '500.00', 'served', '550.00', '2026-01-10 03:10:00', '2026-01-10 03:21:52');
INSERT INTO `order_items` VALUES ('467', '182', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-10 03:12:31', '2026-01-10 03:13:48');
INSERT INTO `order_items` VALUES ('468', '182', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-10 03:12:31', '2026-01-10 03:13:48');
INSERT INTO `order_items` VALUES ('469', '182', '14', '2.00', '1000.00', 'served', '0.00', '2026-01-10 03:12:31', '2026-01-10 03:13:48');
INSERT INTO `order_items` VALUES ('470', '181', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-10 03:13:32', '2026-01-10 03:21:52');
INSERT INTO `order_items` VALUES ('471', '181', '14', '1.00', '500.00', 'served', '0.00', '2026-01-10 03:13:32', '2026-01-10 03:21:52');
INSERT INTO `order_items` VALUES ('472', '181', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-10 03:16:53', '2026-01-10 03:21:52');
INSERT INTO `order_items` VALUES ('473', '181', '12', '1.00', '500.00', 'served', '600.00', '2026-01-10 03:16:53', '2026-01-10 03:21:52');
INSERT INTO `order_items` VALUES ('474', '181', '16', '1.00', '500.00', 'served', '550.00', '2026-01-10 03:16:53', '2026-01-10 03:21:52');
INSERT INTO `order_items` VALUES ('475', '183', '14', '1.00', '500.00', 'served', '0.00', '2026-01-10 03:19:31', '2026-01-10 03:24:49');
INSERT INTO `order_items` VALUES ('476', '184', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-10 03:22:26', '2026-01-10 03:24:54');
INSERT INTO `order_items` VALUES ('477', '183', '14', '1.00', '500.00', 'served', '0.00', '2026-01-10 03:23:27', '2026-01-10 03:24:49');
INSERT INTO `order_items` VALUES ('478', '183', '22', '1.00', '500.00', 'served', '377.41', '2026-01-10 03:23:27', '2026-01-10 03:24:49');
INSERT INTO `order_items` VALUES ('479', '185', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-10 03:37:00', '2026-01-10 03:48:53');
INSERT INTO `order_items` VALUES ('480', '185', '14', '1.00', '500.00', 'served', '0.00', '2026-01-10 03:37:00', '2026-01-10 03:48:53');
INSERT INTO `order_items` VALUES ('481', '185', '19', '1.00', '500.00', 'served', '400.00', '2026-01-10 03:37:00', '2026-01-10 03:48:53');
INSERT INTO `order_items` VALUES ('482', '186', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-10 03:45:56', '2026-01-10 03:46:11');
INSERT INTO `order_items` VALUES ('483', '186', '14', '1.00', '500.00', 'served', '0.00', '2026-01-10 03:45:56', '2026-01-10 03:46:11');
INSERT INTO `order_items` VALUES ('484', '185', '19', '1.00', '500.00', 'served', '400.00', '2026-01-10 03:47:30', '2026-01-10 03:48:53');
INSERT INTO `order_items` VALUES ('485', '185', '22', '1.00', '500.00', 'served', '377.41', '2026-01-10 03:47:30', '2026-01-10 03:48:53');
INSERT INTO `order_items` VALUES ('486', '185', '14', '1.00', '500.00', 'served', '0.00', '2026-01-10 03:48:08', '2026-01-10 03:48:53');
INSERT INTO `order_items` VALUES ('487', '185', '16', '1.00', '500.00', 'served', '550.00', '2026-01-10 03:48:08', '2026-01-10 03:48:53');
INSERT INTO `order_items` VALUES ('488', '185', '22', '1.00', '500.00', 'served', '377.41', '2026-01-10 03:48:08', '2026-01-10 03:48:53');
INSERT INTO `order_items` VALUES ('489', '180', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-10 03:55:47', '2026-01-10 03:56:43');
INSERT INTO `order_items` VALUES ('490', '180', '14', '1.00', '500.00', 'served', '0.00', '2026-01-10 03:55:47', '2026-01-10 03:56:43');
INSERT INTO `order_items` VALUES ('491', '180', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-10 03:55:47', '2026-01-10 03:56:43');
INSERT INTO `order_items` VALUES ('492', '187', '11', '2.00', '5000.00', 'served', '1714.88', '2026-01-10 03:57:18', '2026-01-10 04:02:35');
INSERT INTO `order_items` VALUES ('493', '187', '12', '1.00', '500.00', 'served', '600.00', '2026-01-10 03:57:18', '2026-01-10 04:02:35');
INSERT INTO `order_items` VALUES ('494', '187', '19', '1.00', '500.00', 'served', '400.00', '2026-01-10 03:57:18', '2026-01-10 04:02:35');
INSERT INTO `order_items` VALUES ('495', '188', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-10 04:06:28', '2026-01-10 04:08:37');
INSERT INTO `order_items` VALUES ('496', '188', '16', '1.00', '500.00', 'served', '550.00', '2026-01-10 04:06:28', '2026-01-10 04:08:37');
INSERT INTO `order_items` VALUES ('497', '188', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-10 04:06:28', '2026-01-10 04:08:37');
INSERT INTO `order_items` VALUES ('498', '189', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-10 04:12:35', '2026-01-10 04:15:09');
INSERT INTO `order_items` VALUES ('499', '189', '12', '1.00', '500.00', 'served', '600.00', '2026-01-10 04:12:35', '2026-01-10 04:15:09');
INSERT INTO `order_items` VALUES ('500', '189', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-10 04:12:35', '2026-01-10 04:15:09');
INSERT INTO `order_items` VALUES ('501', '190', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-10 04:44:30', '2026-01-10 04:44:44');
INSERT INTO `order_items` VALUES ('502', '190', '13', '1.00', '500.00', 'served', '400.00', '2026-01-10 04:44:30', '2026-01-10 04:44:44');
INSERT INTO `order_items` VALUES ('503', '191', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-10 05:37:33', '2026-01-10 05:37:58');
INSERT INTO `order_items` VALUES ('504', '191', '15', '1.00', '500.00', 'served', '300.00', '2026-01-10 05:37:34', '2026-01-10 05:37:58');
INSERT INTO `order_items` VALUES ('505', '192', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-10 05:58:35', '2026-01-10 05:59:35');
INSERT INTO `order_items` VALUES ('506', '192', '18', '2.00', '2000.00', 'served', '750.00', '2026-01-10 05:58:36', '2026-01-10 05:59:35');
INSERT INTO `order_items` VALUES ('507', '192', '21', '1.00', '1000.00', 'served', '445.06', '2026-01-10 05:58:36', '2026-01-10 05:59:35');
INSERT INTO `order_items` VALUES ('508', '193', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-10 06:04:13', '2026-01-10 06:07:11');
INSERT INTO `order_items` VALUES ('509', '193', '14', '1.00', '500.00', 'served', '0.00', '2026-01-10 06:04:13', '2026-01-10 06:07:11');
INSERT INTO `order_items` VALUES ('510', '194', '14', '1.00', '500.00', 'served', '0.00', '2026-01-10 06:33:41', '2026-01-10 06:34:10');
INSERT INTO `order_items` VALUES ('511', '195', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-10 07:59:02', '2026-01-10 07:59:31');
INSERT INTO `order_items` VALUES ('512', '196', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-10 08:50:03', '2026-01-10 08:50:27');
INSERT INTO `order_items` VALUES ('513', '196', '15', '1.00', '500.00', 'served', '300.00', '2026-01-10 08:50:03', '2026-01-10 08:50:27');
INSERT INTO `order_items` VALUES ('514', '197', '11', '3.00', '7500.00', 'served', '2572.32', '2026-01-10 09:48:16', '2026-01-10 09:58:00');
INSERT INTO `order_items` VALUES ('515', '197', '12', '2.00', '1000.00', 'served', '1200.00', '2026-01-10 09:48:16', '2026-01-10 09:58:00');
INSERT INTO `order_items` VALUES ('516', '197', '14', '1.00', '500.00', 'served', '0.00', '2026-01-10 09:49:32', '2026-01-10 09:58:00');
INSERT INTO `order_items` VALUES ('517', '197', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-10 09:57:47', '2026-01-10 09:58:00');
INSERT INTO `order_items` VALUES ('518', '198', '11', '2.00', '5000.00', 'served', '1714.88', '2026-01-10 09:59:51', '2026-01-10 10:04:08');
INSERT INTO `order_items` VALUES ('519', '198', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-10 10:02:01', '2026-01-10 10:04:08');
INSERT INTO `order_items` VALUES ('520', '198', '14', '1.00', '500.00', 'served', '0.00', '2026-01-10 10:03:24', '2026-01-10 10:04:08');
INSERT INTO `order_items` VALUES ('521', '199', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-10 10:18:59', '2026-01-10 10:20:43');
INSERT INTO `order_items` VALUES ('522', '199', '11', '2.00', '5000.00', 'served', '1714.88', '2026-01-10 10:18:59', '2026-01-10 10:20:43');
INSERT INTO `order_items` VALUES ('523', '199', '14', '3.00', '1500.00', 'served', '0.00', '2026-01-10 10:18:59', '2026-01-10 10:20:43');
INSERT INTO `order_items` VALUES ('524', '200', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-10 10:40:19', '2026-01-10 11:00:09');
INSERT INTO `order_items` VALUES ('525', '200', '15', '1.00', '500.00', 'served', '300.00', '2026-01-10 10:40:19', '2026-01-10 11:00:09');
INSERT INTO `order_items` VALUES ('526', '200', '16', '1.00', '500.00', 'served', '550.00', '2026-01-10 10:40:19', '2026-01-10 11:00:09');
INSERT INTO `order_items` VALUES ('527', '200', '16', '6.00', '3000.00', 'served', '3300.00', '2026-01-10 10:59:51', '2026-01-10 11:00:09');
INSERT INTO `order_items` VALUES ('528', '201', '16', '1.00', '500.00', 'served', '550.00', '2026-01-10 11:01:12', '2026-01-10 11:01:26');
INSERT INTO `order_items` VALUES ('529', '202', '15', '1.00', '500.00', 'served', '300.00', '2026-01-10 11:03:20', '2026-01-10 11:03:29');
INSERT INTO `order_items` VALUES ('530', '202', '16', '1.00', '500.00', 'served', '550.00', '2026-01-10 11:03:20', '2026-01-10 11:03:29');
INSERT INTO `order_items` VALUES ('531', '202', '22', '1.00', '500.00', 'served', '377.41', '2026-01-10 11:03:20', '2026-01-10 11:03:29');
INSERT INTO `order_items` VALUES ('532', '203', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-10 11:03:58', '2026-01-10 11:04:07');
INSERT INTO `order_items` VALUES ('533', '203', '19', '1.00', '500.00', 'served', '400.00', '2026-01-10 11:03:58', '2026-01-10 11:04:07');
INSERT INTO `order_items` VALUES ('534', '204', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-10 11:07:04', '2026-01-10 11:12:10');
INSERT INTO `order_items` VALUES ('535', '204', '14', '1.00', '500.00', 'served', '0.00', '2026-01-10 11:07:04', '2026-01-10 11:12:10');
INSERT INTO `order_items` VALUES ('536', '204', '16', '1.00', '500.00', 'served', '550.00', '2026-01-10 11:07:04', '2026-01-10 11:12:10');
INSERT INTO `order_items` VALUES ('537', '205', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-10 11:09:38', '2026-01-10 11:12:07');
INSERT INTO `order_items` VALUES ('538', '205', '14', '1.00', '500.00', 'served', '0.00', '2026-01-10 11:09:38', '2026-01-10 11:12:07');
INSERT INTO `order_items` VALUES ('539', '205', '16', '1.00', '500.00', 'served', '550.00', '2026-01-10 11:09:38', '2026-01-10 11:12:07');
INSERT INTO `order_items` VALUES ('540', '206', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-10 11:25:15', '2026-01-10 11:29:09');
INSERT INTO `order_items` VALUES ('541', '206', '12', '1.00', '500.00', 'served', '600.00', '2026-01-10 11:25:15', '2026-01-10 11:29:09');
INSERT INTO `order_items` VALUES ('542', '207', '11', '5.00', '12500.00', 'served', '4287.20', '2026-01-10 11:28:56', '2026-01-10 11:29:13');
INSERT INTO `order_items` VALUES ('543', '208', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-10 11:46:23', '2026-01-10 11:46:54');
INSERT INTO `order_items` VALUES ('544', '208', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-10 11:46:23', '2026-01-10 11:46:54');
INSERT INTO `order_items` VALUES ('545', '209', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-10 11:54:23', '2026-01-10 11:56:03');
INSERT INTO `order_items` VALUES ('546', '209', '16', '1.00', '500.00', 'served', '550.00', '2026-01-10 11:54:23', '2026-01-10 11:56:03');
INSERT INTO `order_items` VALUES ('547', '210', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-10 11:57:59', '2026-01-10 12:05:41');
INSERT INTO `order_items` VALUES ('548', '210', '15', '1.00', '500.00', 'served', '300.00', '2026-01-10 11:57:59', '2026-01-10 12:05:41');
INSERT INTO `order_items` VALUES ('549', '210', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-10 12:05:27', '2026-01-10 12:05:41');
INSERT INTO `order_items` VALUES ('550', '210', '22', '1.00', '500.00', 'served', '377.41', '2026-01-10 12:05:27', '2026-01-10 12:05:41');
INSERT INTO `order_items` VALUES ('551', '211', '10', '2.00', '5000.00', 'served', '1716.88', '2026-01-10 12:35:16', '2026-01-10 12:38:35');
INSERT INTO `order_items` VALUES ('552', '211', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-10 12:35:16', '2026-01-10 12:38:35');
INSERT INTO `order_items` VALUES ('553', '212', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-10 12:49:42', '2026-01-10 12:55:19');
INSERT INTO `order_items` VALUES ('554', '212', '13', '1.00', '500.00', 'served', '400.00', '2026-01-10 12:49:42', '2026-01-10 12:55:19');
INSERT INTO `order_items` VALUES ('555', '212', '16', '1.00', '500.00', 'served', '550.00', '2026-01-10 12:49:42', '2026-01-10 12:55:19');
INSERT INTO `order_items` VALUES ('556', '213', '11', '2.00', '5000.00', 'served', '1714.88', '2026-01-10 23:54:35', '2026-01-10 23:57:33');
INSERT INTO `order_items` VALUES ('557', '214', '10', '2.00', '5000.00', 'served', '1716.88', '2026-01-10 23:57:29', '2026-01-10 23:57:46');
INSERT INTO `order_items` VALUES ('558', '214', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-10 23:57:29', '2026-01-10 23:57:46');
INSERT INTO `order_items` VALUES ('559', '215', '14', '2.00', '1000.00', 'served', '0.00', '2026-01-11 00:05:09', '2026-01-11 00:05:18');
INSERT INTO `order_items` VALUES ('560', '216', '10', '3.00', '7500.00', 'served', '2575.32', '2026-01-11 00:07:25', '2026-01-11 00:07:34');
INSERT INTO `order_items` VALUES ('561', '216', '11', '2.00', '5000.00', 'served', '1714.88', '2026-01-11 00:07:25', '2026-01-11 00:07:34');
INSERT INTO `order_items` VALUES ('562', '217', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-11 00:31:48', '2026-01-11 00:40:12');
INSERT INTO `order_items` VALUES ('563', '217', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-11 00:39:40', '2026-01-11 00:40:12');
INSERT INTO `order_items` VALUES ('564', '218', '8', '2.00', '5000.00', 'served', '1564.40', '2026-01-11 00:46:57', '2026-01-11 00:51:19');
INSERT INTO `order_items` VALUES ('565', '219', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-11 00:56:58', '2026-01-11 00:58:52');
INSERT INTO `order_items` VALUES ('566', '219', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-11 00:56:58', '2026-01-11 00:58:52');
INSERT INTO `order_items` VALUES ('567', '219', '16', '2.00', '1000.00', 'served', '1100.00', '2026-01-11 00:56:58', '2026-01-11 00:58:52');
INSERT INTO `order_items` VALUES ('568', '220', '8', '2.00', '5000.00', 'served', '1564.40', '2026-01-11 01:11:26', '2026-01-11 01:28:13');
INSERT INTO `order_items` VALUES ('569', '220', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-11 01:11:26', '2026-01-11 01:28:13');
INSERT INTO `order_items` VALUES ('570', '220', '16', '2.00', '1000.00', 'served', '1100.00', '2026-01-11 01:11:26', '2026-01-11 01:28:13');
INSERT INTO `order_items` VALUES ('571', '220', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-11 01:11:26', '2026-01-11 01:28:13');
INSERT INTO `order_items` VALUES ('572', '220', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-11 01:16:04', '2026-01-11 01:28:13');
INSERT INTO `order_items` VALUES ('573', '221', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-11 01:17:45', '2026-01-11 01:18:17');
INSERT INTO `order_items` VALUES ('574', '220', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-11 01:21:01', '2026-01-11 01:28:13');
INSERT INTO `order_items` VALUES ('575', '220', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-11 01:21:01', '2026-01-11 01:28:13');
INSERT INTO `order_items` VALUES ('576', '222', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-11 01:21:40', '2026-01-11 01:23:10');
INSERT INTO `order_items` VALUES ('577', '222', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-11 01:21:40', '2026-01-11 01:23:10');
INSERT INTO `order_items` VALUES ('578', '220', '14', '1.00', '500.00', 'served', '0.00', '2026-01-11 01:23:04', '2026-01-11 01:28:13');
INSERT INTO `order_items` VALUES ('579', '220', '22', '2.00', '1000.00', 'served', '754.82', '2026-01-11 01:23:04', '2026-01-11 01:28:13');
INSERT INTO `order_items` VALUES ('580', '223', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-11 01:27:41', '2026-01-11 01:28:05');
INSERT INTO `order_items` VALUES ('581', '223', '14', '1.00', '500.00', 'served', '0.00', '2026-01-11 01:27:41', '2026-01-11 01:28:05');
INSERT INTO `order_items` VALUES ('582', '224', '10', '6.00', '15000.00', 'served', '5150.64', '2026-01-11 01:55:04', '2026-01-11 01:55:23');
INSERT INTO `order_items` VALUES ('583', '225', '8', '2.00', '5000.00', 'served', '1564.40', '2026-01-11 02:00:52', '2026-01-11 02:18:54');
INSERT INTO `order_items` VALUES ('584', '225', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-11 02:00:52', '2026-01-11 02:18:54');
INSERT INTO `order_items` VALUES ('585', '226', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-11 02:04:14', '2026-01-11 02:04:54');
INSERT INTO `order_items` VALUES ('586', '226', '11', '2.00', '5000.00', 'served', '1714.88', '2026-01-11 02:04:14', '2026-01-11 02:04:54');
INSERT INTO `order_items` VALUES ('587', '226', '12', '3.00', '1500.00', 'served', '1800.00', '2026-01-11 02:04:14', '2026-01-11 02:04:54');
INSERT INTO `order_items` VALUES ('588', '226', '17', '3.00', '3000.00', 'served', '1290.00', '2026-01-11 02:04:14', '2026-01-11 02:04:54');
INSERT INTO `order_items` VALUES ('589', '227', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-11 02:05:12', '2026-01-11 02:09:51');
INSERT INTO `order_items` VALUES ('590', '227', '14', '1.00', '500.00', 'served', '0.00', '2026-01-11 02:05:12', '2026-01-11 02:09:51');
INSERT INTO `order_items` VALUES ('591', '228', '10', '4.00', '10000.00', 'served', '3433.76', '2026-01-11 02:12:39', '2026-01-11 02:14:12');
INSERT INTO `order_items` VALUES ('592', '225', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-11 02:15:43', '2026-01-11 02:18:54');
INSERT INTO `order_items` VALUES ('593', '225', '19', '1.00', '500.00', 'served', '400.00', '2026-01-11 02:15:43', '2026-01-11 02:18:54');
INSERT INTO `order_items` VALUES ('594', '229', '10', '2.00', '5000.00', 'served', '1716.88', '2026-01-11 02:17:09', '2026-01-11 02:20:25');
INSERT INTO `order_items` VALUES ('595', '229', '11', '3.00', '7500.00', 'served', '2572.32', '2026-01-11 02:17:09', '2026-01-11 02:20:25');
INSERT INTO `order_items` VALUES ('596', '230', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-11 02:19:15', '2026-01-11 02:20:29');
INSERT INTO `order_items` VALUES ('597', '230', '12', '1.00', '500.00', 'served', '600.00', '2026-01-11 02:19:15', '2026-01-11 02:20:29');
INSERT INTO `order_items` VALUES ('598', '231', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-11 02:31:30', '2026-01-11 02:56:26');
INSERT INTO `order_items` VALUES ('599', '232', '8', '2.00', '5000.00', 'served', '1564.40', '2026-01-11 02:40:15', '2026-01-11 02:49:26');
INSERT INTO `order_items` VALUES ('600', '232', '18', '2.00', '2000.00', 'served', '750.00', '2026-01-11 02:40:15', '2026-01-11 02:49:26');
INSERT INTO `order_items` VALUES ('601', '232', '19', '1.00', '500.00', 'served', '400.00', '2026-01-11 02:49:10', '2026-01-11 02:49:26');
INSERT INTO `order_items` VALUES ('602', '233', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-11 02:53:47', '2026-01-11 02:59:25');
INSERT INTO `order_items` VALUES ('603', '233', '12', '1.00', '500.00', 'served', '600.00', '2026-01-11 02:53:47', '2026-01-11 02:59:25');
INSERT INTO `order_items` VALUES ('604', '234', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-11 02:55:29', '2026-01-11 02:59:24');
INSERT INTO `order_items` VALUES ('605', '234', '14', '1.00', '500.00', 'served', '0.00', '2026-01-11 02:55:29', '2026-01-11 02:59:25');
INSERT INTO `order_items` VALUES ('606', '235', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-11 03:29:49', '2026-01-11 03:30:39');
INSERT INTO `order_items` VALUES ('607', '235', '15', '1.00', '500.00', 'served', '300.00', '2026-01-11 03:29:49', '2026-01-11 03:30:39');
INSERT INTO `order_items` VALUES ('608', '235', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-11 03:29:49', '2026-01-11 03:30:39');
INSERT INTO `order_items` VALUES ('609', '235', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-11 03:29:49', '2026-01-11 03:30:39');
INSERT INTO `order_items` VALUES ('610', '236', '8', '3.00', '7500.00', 'served', '2346.60', '2026-01-11 03:45:36', '2026-01-11 03:54:22');
INSERT INTO `order_items` VALUES ('611', '236', '12', '1.00', '500.00', 'served', '600.00', '2026-01-11 03:45:36', '2026-01-11 03:54:22');
INSERT INTO `order_items` VALUES ('612', '236', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-11 03:45:36', '2026-01-11 03:54:22');
INSERT INTO `order_items` VALUES ('613', '236', '19', '1.00', '500.00', 'served', '400.00', '2026-01-11 03:45:36', '2026-01-11 03:54:22');
INSERT INTO `order_items` VALUES ('614', '237', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-11 04:03:05', '2026-01-11 04:10:57');
INSERT INTO `order_items` VALUES ('615', '238', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-11 04:10:37', '2026-01-11 04:11:01');
INSERT INTO `order_items` VALUES ('616', '238', '13', '1.00', '500.00', 'served', '400.00', '2026-01-11 04:10:37', '2026-01-11 04:11:01');
INSERT INTO `order_items` VALUES ('617', '239', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-11 06:25:43', '2026-01-11 06:26:56');
INSERT INTO `order_items` VALUES ('618', '239', '12', '1.00', '500.00', 'served', '600.00', '2026-01-11 06:25:43', '2026-01-11 06:26:56');
INSERT INTO `order_items` VALUES ('619', '240', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-11 06:27:40', '2026-01-11 06:28:29');
INSERT INTO `order_items` VALUES ('620', '240', '14', '1.00', '500.00', 'served', '0.00', '2026-01-11 06:27:40', '2026-01-11 06:28:29');
INSERT INTO `order_items` VALUES ('621', '241', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-11 06:44:38', '2026-01-11 06:53:15');
INSERT INTO `order_items` VALUES ('622', '241', '14', '1.00', '500.00', 'served', '0.00', '2026-01-11 06:44:38', '2026-01-11 06:53:15');
INSERT INTO `order_items` VALUES ('623', '241', '15', '1.00', '500.00', 'served', '300.00', '2026-01-11 06:44:38', '2026-01-11 06:53:15');
INSERT INTO `order_items` VALUES ('624', '241', '16', '1.00', '500.00', 'served', '550.00', '2026-01-11 06:44:38', '2026-01-11 06:53:15');
INSERT INTO `order_items` VALUES ('625', '241', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-11 06:44:38', '2026-01-11 06:53:15');
INSERT INTO `order_items` VALUES ('626', '241', '14', '1.00', '500.00', 'served', '0.00', '2026-01-11 06:51:08', '2026-01-11 06:53:15');
INSERT INTO `order_items` VALUES ('627', '242', '11', '2.00', '5000.00', 'served', '1714.88', '2026-01-11 07:28:16', '2026-01-11 07:33:54');
INSERT INTO `order_items` VALUES ('628', '242', '12', '1.00', '500.00', 'served', '600.00', '2026-01-11 07:28:16', '2026-01-11 07:33:54');
INSERT INTO `order_items` VALUES ('629', '242', '16', '1.00', '500.00', 'served', '550.00', '2026-01-11 07:28:16', '2026-01-11 07:33:54');
INSERT INTO `order_items` VALUES ('630', '242', '12', '1.00', '500.00', 'served', '400.00', '2026-01-11 07:33:35', '2026-01-11 07:33:54');
INSERT INTO `order_items` VALUES ('631', '242', '16', '1.00', '500.00', 'served', '550.00', '2026-01-11 07:33:35', '2026-01-11 07:33:54');
INSERT INTO `order_items` VALUES ('632', '243', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-11 08:03:53', '2026-01-11 08:21:29');
INSERT INTO `order_items` VALUES ('633', '243', '16', '1.00', '500.00', 'served', '550.00', '2026-01-11 08:03:53', '2026-01-11 08:21:29');
INSERT INTO `order_items` VALUES ('634', '244', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-11 08:31:59', '2026-01-11 08:33:45');
INSERT INTO `order_items` VALUES ('635', '244', '12', '1.00', '500.00', 'served', '400.00', '2026-01-11 08:31:59', '2026-01-11 08:33:45');
INSERT INTO `order_items` VALUES ('636', '245', '11', '2.00', '5000.00', 'served', '1714.88', '2026-01-11 08:34:27', '2026-01-11 08:36:57');
INSERT INTO `order_items` VALUES ('637', '246', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-11 08:47:39', '2026-01-11 08:49:40');
INSERT INTO `order_items` VALUES ('638', '246', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-11 08:47:39', '2026-01-11 08:49:40');
INSERT INTO `order_items` VALUES ('639', '246', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-11 08:47:39', '2026-01-11 08:49:40');
INSERT INTO `order_items` VALUES ('640', '247', '10', '2.00', '5000.00', 'served', '1716.88', '2026-01-11 08:58:40', '2026-01-11 08:59:11');
INSERT INTO `order_items` VALUES ('641', '247', '15', '1.00', '500.00', 'served', '300.00', '2026-01-11 08:58:40', '2026-01-11 08:59:11');
INSERT INTO `order_items` VALUES ('642', '247', '16', '1.00', '500.00', 'served', '550.00', '2026-01-11 08:58:40', '2026-01-11 08:59:11');
INSERT INTO `order_items` VALUES ('643', '248', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-11 10:21:42', '2026-01-11 10:22:39');
INSERT INTO `order_items` VALUES ('644', '248', '13', '1.00', '500.00', 'served', '400.00', '2026-01-11 10:21:42', '2026-01-11 10:22:39');
INSERT INTO `order_items` VALUES ('645', '249', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-11 10:22:33', '2026-01-11 10:23:26');
INSERT INTO `order_items` VALUES ('646', '249', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-11 10:22:33', '2026-01-11 10:23:26');
INSERT INTO `order_items` VALUES ('647', '250', '10', '2.00', '5000.00', 'served', '1716.88', '2026-01-11 10:23:55', '2026-01-11 10:28:12');
INSERT INTO `order_items` VALUES ('648', '250', '13', '2.00', '1000.00', 'served', '800.00', '2026-01-11 10:23:55', '2026-01-11 10:28:12');
INSERT INTO `order_items` VALUES ('649', '251', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-11 10:26:01', '2026-01-11 10:26:54');
INSERT INTO `order_items` VALUES ('650', '251', '12', '1.00', '500.00', 'served', '400.00', '2026-01-11 10:26:01', '2026-01-11 10:26:54');
INSERT INTO `order_items` VALUES ('651', '252', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-11 10:31:41', '2026-01-11 10:33:52');
INSERT INTO `order_items` VALUES ('652', '253', '11', '4.00', '10000.00', 'served', '3429.76', '2026-01-11 10:32:20', '2026-01-11 10:40:35');
INSERT INTO `order_items` VALUES ('653', '253', '14', '4.00', '2000.00', 'served', '0.00', '2026-01-11 10:32:20', '2026-01-11 10:40:35');
INSERT INTO `order_items` VALUES ('654', '254', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-11 10:37:09', '2026-01-11 10:40:05');
INSERT INTO `order_items` VALUES ('655', '254', '16', '1.00', '500.00', 'served', '550.00', '2026-01-11 10:37:09', '2026-01-11 10:40:05');
INSERT INTO `order_items` VALUES ('656', '255', '11', '3.00', '7500.00', 'served', '2572.32', '2026-01-11 10:55:17', '2026-01-11 11:08:03');
INSERT INTO `order_items` VALUES ('657', '255', '14', '2.00', '1000.00', 'served', '0.00', '2026-01-11 10:55:17', '2026-01-11 11:08:03');
INSERT INTO `order_items` VALUES ('658', '255', '16', '2.00', '1000.00', 'served', '1100.00', '2026-01-11 10:55:17', '2026-01-11 11:08:03');
INSERT INTO `order_items` VALUES ('659', '255', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-11 10:55:17', '2026-01-11 11:08:03');
INSERT INTO `order_items` VALUES ('660', '256', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-11 11:01:17', '2026-01-11 11:01:51');
INSERT INTO `order_items` VALUES ('661', '256', '16', '1.00', '500.00', 'served', '550.00', '2026-01-11 11:01:17', '2026-01-11 11:01:51');
INSERT INTO `order_items` VALUES ('662', '257', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-11 11:06:13', '2026-01-11 11:06:37');
INSERT INTO `order_items` VALUES ('663', '257', '14', '1.00', '500.00', 'served', '0.00', '2026-01-11 11:06:13', '2026-01-11 11:06:37');
INSERT INTO `order_items` VALUES ('664', '255', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-11 11:07:53', '2026-01-11 11:08:03');
INSERT INTO `order_items` VALUES ('665', '255', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-11 11:07:53', '2026-01-11 11:08:03');
INSERT INTO `order_items` VALUES ('666', '258', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-11 11:24:44', '2026-01-11 11:27:19');
INSERT INTO `order_items` VALUES ('667', '258', '14', '1.00', '500.00', 'served', '0.00', '2026-01-11 11:26:14', '2026-01-11 11:27:19');
INSERT INTO `order_items` VALUES ('668', '259', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-11 11:26:47', '2026-01-11 11:29:31');
INSERT INTO `order_items` VALUES ('669', '259', '16', '1.00', '500.00', 'served', '550.00', '2026-01-11 11:26:47', '2026-01-11 11:29:31');
INSERT INTO `order_items` VALUES ('670', '259', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-11 11:26:47', '2026-01-11 11:29:31');
INSERT INTO `order_items` VALUES ('671', '259', '22', '2.00', '1000.00', 'served', '754.82', '2026-01-11 11:27:43', '2026-01-11 11:29:31');
INSERT INTO `order_items` VALUES ('672', '260', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-11 11:43:27', '2026-01-11 11:43:56');
INSERT INTO `order_items` VALUES ('673', '260', '14', '1.00', '500.00', 'served', '0.00', '2026-01-11 11:43:27', '2026-01-11 11:43:56');
INSERT INTO `order_items` VALUES ('674', '260', '16', '1.00', '500.00', 'served', '550.00', '2026-01-11 11:43:27', '2026-01-11 11:43:56');
INSERT INTO `order_items` VALUES ('675', '261', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-11 11:45:38', '2026-01-11 11:46:59');
INSERT INTO `order_items` VALUES ('676', '261', '15', '1.00', '500.00', 'served', '300.00', '2026-01-11 11:45:38', '2026-01-11 11:46:59');
INSERT INTO `order_items` VALUES ('677', '262', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-11 11:51:01', '2026-01-11 11:51:20');
INSERT INTO `order_items` VALUES ('678', '262', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-11 11:51:01', '2026-01-11 11:51:20');
INSERT INTO `order_items` VALUES ('679', '262', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-11 11:51:01', '2026-01-11 11:51:20');
INSERT INTO `order_items` VALUES ('680', '263', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-11 11:55:23', '2026-01-11 12:12:35');
INSERT INTO `order_items` VALUES ('681', '263', '11', '2.00', '5000.00', 'served', '1714.88', '2026-01-11 11:55:23', '2026-01-11 12:12:35');
INSERT INTO `order_items` VALUES ('682', '263', '16', '2.00', '1000.00', 'served', '1100.00', '2026-01-11 11:55:23', '2026-01-11 12:12:35');
INSERT INTO `order_items` VALUES ('683', '263', '17', '2.00', '2000.00', 'served', '860.00', '2026-01-11 11:55:23', '2026-01-11 12:12:35');
INSERT INTO `order_items` VALUES ('684', '263', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-11 12:03:13', '2026-01-11 12:12:35');
INSERT INTO `order_items` VALUES ('685', '264', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-11 12:32:40', '2026-01-11 12:34:22');
INSERT INTO `order_items` VALUES ('686', '264', '14', '1.00', '500.00', 'served', '0.00', '2026-01-11 12:32:40', '2026-01-11 12:34:22');
INSERT INTO `order_items` VALUES ('687', '265', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-11 12:41:49', '2026-01-11 12:43:38');
INSERT INTO `order_items` VALUES ('688', '266', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-11 13:30:46', '2026-01-11 13:40:08');
INSERT INTO `order_items` VALUES ('689', '267', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-11 13:31:34', '2026-01-11 13:48:51');
INSERT INTO `order_items` VALUES ('690', '267', '16', '1.00', '500.00', 'served', '550.00', '2026-01-11 13:31:34', '2026-01-11 13:48:51');
INSERT INTO `order_items` VALUES ('691', '267', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-11 13:35:38', '2026-01-11 13:48:51');
INSERT INTO `order_items` VALUES ('692', '267', '14', '1.00', '500.00', 'served', '0.00', '2026-01-11 13:35:38', '2026-01-11 13:48:51');
INSERT INTO `order_items` VALUES ('693', '267', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-11 13:38:16', '2026-01-11 13:48:51');
INSERT INTO `order_items` VALUES ('694', '267', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-11 13:39:37', '2026-01-11 13:48:51');
INSERT INTO `order_items` VALUES ('695', '267', '14', '1.00', '500.00', 'served', '0.00', '2026-01-11 13:39:37', '2026-01-11 13:48:51');
INSERT INTO `order_items` VALUES ('696', '267', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-11 13:39:37', '2026-01-11 13:48:51');
INSERT INTO `order_items` VALUES ('697', '268', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-11 13:44:52', '2026-01-11 13:45:11');
INSERT INTO `order_items` VALUES ('698', '268', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-11 13:44:52', '2026-01-11 13:45:11');
INSERT INTO `order_items` VALUES ('699', '268', '22', '2.00', '1000.00', 'served', '754.82', '2026-01-11 13:44:52', '2026-01-11 13:45:11');
INSERT INTO `order_items` VALUES ('700', '267', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-11 13:46:18', '2026-01-11 13:48:51');
INSERT INTO `order_items` VALUES ('701', '267', '22', '1.00', '500.00', 'served', '377.41', '2026-01-11 13:46:18', '2026-01-11 13:48:51');
INSERT INTO `order_items` VALUES ('702', '269', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-11 13:52:58', '2026-01-11 14:00:39');
INSERT INTO `order_items` VALUES ('703', '269', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-11 13:52:58', '2026-01-11 14:00:39');
INSERT INTO `order_items` VALUES ('704', '269', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-11 14:00:29', '2026-01-11 14:00:39');
INSERT INTO `order_items` VALUES ('705', '270', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-11 14:08:58', '2026-01-11 14:09:18');
INSERT INTO `order_items` VALUES ('706', '270', '14', '1.00', '500.00', 'served', '0.00', '2026-01-11 14:08:58', '2026-01-11 14:09:18');
INSERT INTO `order_items` VALUES ('707', '270', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-11 14:08:58', '2026-01-11 14:09:18');
INSERT INTO `order_items` VALUES ('708', '271', '11', '2.00', '5000.00', 'served', '1714.88', '2026-01-12 00:09:56', '2026-01-12 00:12:01');
INSERT INTO `order_items` VALUES ('709', '272', '11', '2.00', '5000.00', 'served', '1714.88', '2026-01-12 00:31:38', '2026-01-12 00:32:03');
INSERT INTO `order_items` VALUES ('710', '272', '13', '2.00', '1000.00', 'served', '800.00', '2026-01-12 00:31:38', '2026-01-12 00:32:03');
INSERT INTO `order_items` VALUES ('711', '273', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-12 00:32:34', '2026-01-12 00:32:43');
INSERT INTO `order_items` VALUES ('712', '273', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-12 00:32:34', '2026-01-12 00:32:43');
INSERT INTO `order_items` VALUES ('713', '273', '12', '1.00', '500.00', 'served', '400.00', '2026-01-12 00:32:35', '2026-01-12 00:32:43');
INSERT INTO `order_items` VALUES ('714', '273', '13', '1.00', '500.00', 'served', '400.00', '2026-01-12 00:32:35', '2026-01-12 00:32:43');
INSERT INTO `order_items` VALUES ('715', '274', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-12 00:45:49', '2026-01-12 00:46:03');
INSERT INTO `order_items` VALUES ('716', '274', '15', '1.00', '500.00', 'served', '300.00', '2026-01-12 00:45:49', '2026-01-12 00:46:03');
INSERT INTO `order_items` VALUES ('717', '275', '8', '2.00', '5000.00', 'served', '1564.40', '2026-01-12 00:49:52', '2026-01-12 00:51:37');
INSERT INTO `order_items` VALUES ('718', '276', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-12 00:52:10', '2026-01-12 00:52:44');
INSERT INTO `order_items` VALUES ('719', '276', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-12 00:52:10', '2026-01-12 00:52:44');
INSERT INTO `order_items` VALUES ('720', '276', '12', '2.00', '1000.00', 'served', '800.00', '2026-01-12 00:52:10', '2026-01-12 00:52:44');
INSERT INTO `order_items` VALUES ('721', '277', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-12 00:55:39', '2026-01-12 01:08:03');
INSERT INTO `order_items` VALUES ('722', '277', '12', '1.00', '500.00', 'served', '400.00', '2026-01-12 00:55:39', '2026-01-12 01:08:03');
INSERT INTO `order_items` VALUES ('723', '277', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-12 00:55:39', '2026-01-12 01:08:03');
INSERT INTO `order_items` VALUES ('724', '278', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-12 01:07:31', '2026-01-12 01:07:41');
INSERT INTO `order_items` VALUES ('725', '278', '19', '1.00', '500.00', 'served', '400.00', '2026-01-12 01:07:31', '2026-01-12 01:07:41');
INSERT INTO `order_items` VALUES ('726', '277', '15', '1.00', '500.00', 'served', '300.00', '2026-01-12 01:07:51', '2026-01-12 01:08:03');
INSERT INTO `order_items` VALUES ('727', '277', '22', '2.00', '1000.00', 'served', '754.82', '2026-01-12 01:07:51', '2026-01-12 01:08:03');
INSERT INTO `order_items` VALUES ('728', '279', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-12 01:10:30', '2026-01-12 01:10:45');
INSERT INTO `order_items` VALUES ('729', '279', '12', '1.00', '500.00', 'served', '400.00', '2026-01-12 01:10:30', '2026-01-12 01:10:45');
INSERT INTO `order_items` VALUES ('730', '280', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-12 01:11:59', '2026-01-12 01:12:14');
INSERT INTO `order_items` VALUES ('731', '280', '19', '1.00', '500.00', 'served', '400.00', '2026-01-12 01:11:59', '2026-01-12 01:12:14');
INSERT INTO `order_items` VALUES ('732', '281', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-12 01:18:46', '2026-01-12 01:35:13');
INSERT INTO `order_items` VALUES ('733', '282', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-12 01:25:52', '2026-01-12 01:28:53');
INSERT INTO `order_items` VALUES ('734', '282', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-12 01:25:52', '2026-01-12 01:28:53');
INSERT INTO `order_items` VALUES ('735', '281', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-12 01:29:16', '2026-01-12 01:35:13');
INSERT INTO `order_items` VALUES ('736', '283', '8', '2.00', '5000.00', 'served', '1564.40', '2026-01-12 01:41:35', '2026-01-12 01:42:05');
INSERT INTO `order_items` VALUES ('737', '283', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-12 01:41:35', '2026-01-12 01:42:05');
INSERT INTO `order_items` VALUES ('738', '283', '12', '1.00', '500.00', 'served', '400.00', '2026-01-12 01:41:35', '2026-01-12 01:42:05');
INSERT INTO `order_items` VALUES ('739', '283', '18', '3.00', '3000.00', 'served', '1125.00', '2026-01-12 01:41:35', '2026-01-12 01:42:05');
INSERT INTO `order_items` VALUES ('740', '284', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-12 01:42:28', '2026-01-12 01:42:40');
INSERT INTO `order_items` VALUES ('741', '285', '10', '2.00', '5000.00', 'served', '1716.88', '2026-01-12 01:42:33', '2026-01-12 01:42:53');
INSERT INTO `order_items` VALUES ('742', '286', '8', '2.00', '5000.00', 'served', '1564.40', '2026-01-12 01:54:51', '2026-01-12 01:56:50');
INSERT INTO `order_items` VALUES ('743', '287', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-12 02:04:15', '2026-01-12 02:06:42');
INSERT INTO `order_items` VALUES ('744', '287', '15', '1.00', '500.00', 'served', '300.00', '2026-01-12 02:04:15', '2026-01-12 02:06:42');
INSERT INTO `order_items` VALUES ('745', '288', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-12 02:06:28', '2026-01-12 02:13:13');
INSERT INTO `order_items` VALUES ('746', '289', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-12 02:10:42', '2026-01-12 02:11:21');
INSERT INTO `order_items` VALUES ('747', '289', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-12 02:10:42', '2026-01-12 02:11:21');
INSERT INTO `order_items` VALUES ('748', '289', '12', '1.00', '500.00', 'served', '400.00', '2026-01-12 02:10:42', '2026-01-12 02:11:21');
INSERT INTO `order_items` VALUES ('749', '289', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-12 02:10:42', '2026-01-12 02:11:21');
INSERT INTO `order_items` VALUES ('750', '288', '14', '1.00', '500.00', 'served', '0.00', '2026-01-12 02:12:17', '2026-01-12 02:13:13');
INSERT INTO `order_items` VALUES ('751', '290', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-12 02:15:27', '2026-01-12 02:15:48');
INSERT INTO `order_items` VALUES ('752', '290', '15', '1.00', '500.00', 'served', '300.00', '2026-01-12 02:15:27', '2026-01-12 02:15:48');
INSERT INTO `order_items` VALUES ('753', '291', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-12 02:29:28', '2026-01-12 02:30:31');
INSERT INTO `order_items` VALUES ('754', '291', '12', '1.00', '500.00', 'served', '400.00', '2026-01-12 02:29:28', '2026-01-12 02:30:31');
INSERT INTO `order_items` VALUES ('755', '291', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-12 02:29:28', '2026-01-12 02:30:31');
INSERT INTO `order_items` VALUES ('756', '292', '11', '7.00', '17500.00', 'served', '6002.08', '2026-01-12 02:31:18', '2026-01-12 02:33:39');
INSERT INTO `order_items` VALUES ('757', '292', '12', '2.00', '1000.00', 'served', '800.00', '2026-01-12 02:31:18', '2026-01-12 02:33:39');
INSERT INTO `order_items` VALUES ('758', '292', '13', '1.00', '500.00', 'served', '400.00', '2026-01-12 02:31:18', '2026-01-12 02:33:39');
INSERT INTO `order_items` VALUES ('759', '292', '15', '2.00', '1000.00', 'served', '600.00', '2026-01-12 02:31:18', '2026-01-12 02:33:39');
INSERT INTO `order_items` VALUES ('760', '292', '19', '2.00', '1000.00', 'served', '800.00', '2026-01-12 02:31:18', '2026-01-12 02:33:39');
INSERT INTO `order_items` VALUES ('761', '292', '8', '3.00', '7500.00', 'served', '2346.60', '2026-01-12 02:32:38', '2026-01-12 02:33:39');
INSERT INTO `order_items` VALUES ('762', '292', '13', '1.00', '500.00', 'served', '400.00', '2026-01-12 02:32:38', '2026-01-12 02:33:39');
INSERT INTO `order_items` VALUES ('763', '292', '14', '1.00', '500.00', 'served', '0.00', '2026-01-12 02:32:38', '2026-01-12 02:33:39');
INSERT INTO `order_items` VALUES ('764', '292', '15', '1.00', '500.00', 'served', '300.00', '2026-01-12 02:32:38', '2026-01-12 02:33:39');
INSERT INTO `order_items` VALUES ('765', '292', '10', '5.00', '12500.00', 'served', '4292.20', '2026-01-12 02:33:26', '2026-01-12 02:33:39');
INSERT INTO `order_items` VALUES ('766', '292', '12', '1.00', '500.00', 'served', '400.00', '2026-01-12 02:33:26', '2026-01-12 02:33:39');
INSERT INTO `order_items` VALUES ('767', '292', '13', '1.00', '500.00', 'served', '400.00', '2026-01-12 02:33:26', '2026-01-12 02:33:39');
INSERT INTO `order_items` VALUES ('768', '292', '14', '2.00', '1000.00', 'served', '0.00', '2026-01-12 02:33:26', '2026-01-12 02:33:39');
INSERT INTO `order_items` VALUES ('769', '292', '15', '1.00', '500.00', 'served', '300.00', '2026-01-12 02:33:26', '2026-01-12 02:33:39');
INSERT INTO `order_items` VALUES ('770', '292', '19', '1.00', '500.00', 'served', '400.00', '2026-01-12 02:33:26', '2026-01-12 02:33:40');
INSERT INTO `order_items` VALUES ('771', '293', '11', '2.00', '5000.00', 'served', '1714.88', '2026-01-12 02:34:18', '2026-01-12 02:37:46');
INSERT INTO `order_items` VALUES ('772', '293', '12', '1.00', '500.00', 'served', '400.00', '2026-01-12 02:34:18', '2026-01-12 02:37:46');
INSERT INTO `order_items` VALUES ('773', '293', '14', '2.00', '1000.00', 'served', '0.00', '2026-01-12 02:34:18', '2026-01-12 02:37:46');
INSERT INTO `order_items` VALUES ('774', '293', '16', '2.00', '1000.00', 'served', '1100.00', '2026-01-12 02:34:18', '2026-01-12 02:37:46');
INSERT INTO `order_items` VALUES ('775', '294', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-12 02:39:51', '2026-01-12 02:44:58');
INSERT INTO `order_items` VALUES ('776', '294', '12', '1.00', '500.00', 'served', '400.00', '2026-01-12 02:39:51', '2026-01-12 02:44:58');
INSERT INTO `order_items` VALUES ('777', '295', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-12 02:40:46', '2026-01-12 02:44:52');
INSERT INTO `order_items` VALUES ('778', '295', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-12 02:40:46', '2026-01-12 02:44:52');
INSERT INTO `order_items` VALUES ('779', '295', '12', '2.00', '1000.00', 'served', '800.00', '2026-01-12 02:40:46', '2026-01-12 02:44:52');
INSERT INTO `order_items` VALUES ('780', '296', '11', '2.00', '5000.00', 'served', '1714.88', '2026-01-12 02:52:15', '2026-01-12 03:37:22');
INSERT INTO `order_items` VALUES ('781', '296', '14', '1.00', '500.00', 'served', '0.00', '2026-01-12 02:52:15', '2026-01-12 03:37:25');
INSERT INTO `order_items` VALUES ('782', '296', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-12 02:52:15', '2026-01-12 03:37:18');
INSERT INTO `order_items` VALUES ('783', '297', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-12 03:09:07', '2026-01-12 03:09:56');
INSERT INTO `order_items` VALUES ('784', '297', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-12 03:09:07', '2026-01-12 03:09:56');
INSERT INTO `order_items` VALUES ('785', '298', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-12 03:22:07', '2026-01-12 03:27:55');
INSERT INTO `order_items` VALUES ('786', '298', '22', '2.00', '1000.00', 'served', '754.82', '2026-01-12 03:22:07', '2026-01-12 03:27:55');
INSERT INTO `order_items` VALUES ('787', '299', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-12 03:40:40', '2026-01-12 03:41:04');
INSERT INTO `order_items` VALUES ('788', '299', '14', '1.00', '500.00', 'served', '0.00', '2026-01-12 03:40:40', '2026-01-12 03:41:04');
INSERT INTO `order_items` VALUES ('789', '300', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-12 03:53:55', '2026-01-12 03:55:58');
INSERT INTO `order_items` VALUES ('790', '300', '12', '1.00', '500.00', 'served', '400.00', '2026-01-12 03:53:55', '2026-01-12 03:55:58');
INSERT INTO `order_items` VALUES ('791', '301', '11', '3.00', '7500.00', 'served', '2572.32', '2026-01-12 05:14:07', '2026-01-12 05:32:00');
INSERT INTO `order_items` VALUES ('792', '301', '17', '2.00', '2000.00', 'served', '860.00', '2026-01-12 05:14:07', '2026-01-12 05:32:00');
INSERT INTO `order_items` VALUES ('793', '301', '22', '2.00', '1000.00', 'served', '754.82', '2026-01-12 05:14:37', '2026-01-12 05:32:00');
INSERT INTO `order_items` VALUES ('794', '301', '22', '2.00', '1000.00', 'served', '754.82', '2026-01-12 05:19:08', '2026-01-12 05:32:00');
INSERT INTO `order_items` VALUES ('795', '301', '18', '2.00', '2000.00', 'served', '750.00', '2026-01-12 05:28:06', '2026-01-12 05:32:00');
INSERT INTO `order_items` VALUES ('796', '301', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-12 05:30:14', '2026-01-12 05:32:00');
INSERT INTO `order_items` VALUES ('797', '302', '8', '1.00', '2500.00', 'served', '782.20', '2026-01-12 10:37:08', '2026-01-12 10:46:49');
INSERT INTO `order_items` VALUES ('798', '302', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-12 10:37:08', '2026-01-12 10:46:49');
INSERT INTO `order_items` VALUES ('799', '302', '11', '1.00', '2500.00', 'served', '857.44', '2026-01-12 10:37:08', '2026-01-12 10:46:49');
INSERT INTO `order_items` VALUES ('800', '302', '13', '2.00', '1000.00', 'served', '800.00', '2026-01-12 10:37:08', '2026-01-12 10:46:49');
INSERT INTO `order_items` VALUES ('801', '302', '17', '2.00', '2000.00', 'served', '860.00', '2026-01-12 10:37:08', '2026-01-12 10:46:49');
INSERT INTO `order_items` VALUES ('802', '302', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-12 10:37:08', '2026-01-12 10:46:49');
INSERT INTO `order_items` VALUES ('803', '303', '11', '3.00', '7500.00', 'served', '2572.32', '2026-01-12 10:49:23', '2026-01-12 10:50:05');
INSERT INTO `order_items` VALUES ('804', '303', '12', '1.00', '500.00', 'served', '400.00', '2026-01-12 10:49:23', '2026-01-12 10:50:05');
INSERT INTO `order_items` VALUES ('805', '303', '14', '1.00', '500.00', 'served', '0.00', '2026-01-12 10:49:23', '2026-01-12 10:50:05');
INSERT INTO `order_items` VALUES ('806', '304', '10', '1.00', '2500.00', 'served', '858.44', '2026-01-12 10:56:33', '2026-01-12 10:59:14');
INSERT INTO `order_items` VALUES ('807', '304', '14', '1.00', '500.00', 'served', '0.00', '2026-01-12 10:56:33', '2026-01-12 10:59:14');
INSERT INTO `order_items` VALUES ('808', '304', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-12 10:56:33', '2026-01-12 10:59:14');
INSERT INTO `order_items` VALUES ('809', '304', '22', '1.00', '500.00', 'served', '377.41', '2026-01-12 10:56:33', '2026-01-12 10:59:14');
INSERT INTO `order_items` VALUES ('810', '305', '10', '2.00', '5000.00', 'served', '10270.48', '2026-01-12 11:05:57', '2026-01-12 11:07:23');
INSERT INTO `order_items` VALUES ('811', '305', '15', '1.00', '500.00', 'served', '300.00', '2026-01-12 11:05:57', '2026-01-12 11:07:23');
INSERT INTO `order_items` VALUES ('812', '306', '11', '2.00', '5000.00', 'served', '10268.48', '2026-01-12 11:32:18', '2026-01-12 11:32:56');
INSERT INTO `order_items` VALUES ('813', '306', '13', '2.00', '1000.00', 'served', '800.00', '2026-01-12 11:32:19', '2026-01-12 11:32:56');
INSERT INTO `order_items` VALUES ('814', '306', '17', '2.00', '2000.00', 'served', '860.00', '2026-01-12 11:32:19', '2026-01-12 11:32:56');
INSERT INTO `order_items` VALUES ('815', '307', '8', '1.00', '2500.00', 'served', '799.20', '2026-01-12 11:35:26', '2026-01-12 11:36:04');
INSERT INTO `order_items` VALUES ('816', '307', '14', '1.00', '500.00', 'served', '0.00', '2026-01-12 11:35:26', '2026-01-12 11:36:04');
INSERT INTO `order_items` VALUES ('817', '307', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-12 11:35:26', '2026-01-12 11:36:04');
INSERT INTO `order_items` VALUES ('818', '308', '20', '1.00', '1000.00', 'served', '4840.14', '2026-01-12 11:35:58', '2026-01-12 11:36:07');
INSERT INTO `order_items` VALUES ('819', '309', '22', '2.00', '1000.00', 'served', '4885.82', '2026-01-12 11:37:23', '2026-01-12 11:37:48');
INSERT INTO `order_items` VALUES ('820', '310', '8', '1.00', '2500.00', 'served', '799.20', '2026-01-12 11:43:00', '2026-01-12 12:00:37');
INSERT INTO `order_items` VALUES ('821', '311', '11', '1.00', '2500.00', 'served', '5134.24', '2026-01-12 11:52:28', '2026-01-12 11:52:42');
INSERT INTO `order_items` VALUES ('822', '311', '17', '1.00', '1000.00', 'served', '430.00', '2026-01-12 11:52:28', '2026-01-12 11:52:42');
INSERT INTO `order_items` VALUES ('823', '312', '11', '1.00', '2500.00', 'served', '5134.24', '2026-01-12 11:54:34', '2026-01-12 11:57:20');
INSERT INTO `order_items` VALUES ('824', '312', '14', '1.00', '500.00', 'served', '0.00', '2026-01-12 11:54:34', '2026-01-12 11:57:20');
INSERT INTO `order_items` VALUES ('825', '312', '8', '1.00', '2500.00', 'served', '799.20', '2026-01-12 11:56:54', '2026-01-12 11:57:20');
INSERT INTO `order_items` VALUES ('826', '312', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-12 11:56:54', '2026-01-12 11:57:20');
INSERT INTO `order_items` VALUES ('827', '313', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-12 11:58:35', '2026-01-12 11:58:54');
INSERT INTO `order_items` VALUES ('828', '314', '10', '2.00', '5000.00', 'served', '10270.48', '2026-01-12 12:12:30', '2026-01-12 12:30:39');
INSERT INTO `order_items` VALUES ('829', '314', '14', '1.00', '500.00', 'served', '0.00', '2026-01-12 12:12:30', '2026-01-12 12:30:39');
INSERT INTO `order_items` VALUES ('830', '314', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-12 12:12:30', '2026-01-12 12:30:39');
INSERT INTO `order_items` VALUES ('831', '314', '19', '1.00', '500.00', 'served', '400.00', '2026-01-12 12:12:30', '2026-01-12 12:30:39');
INSERT INTO `order_items` VALUES ('832', '314', '10', '1.00', '2500.00', 'served', '5135.24', '2026-01-12 12:13:27', '2026-01-12 12:30:39');
INSERT INTO `order_items` VALUES ('833', '314', '12', '1.00', '500.00', 'served', '400.00', '2026-01-12 12:13:27', '2026-01-12 12:30:39');
INSERT INTO `order_items` VALUES ('834', '314', '10', '1.00', '2500.00', 'served', '5135.24', '2026-01-12 12:30:19', '2026-01-12 12:30:39');
INSERT INTO `order_items` VALUES ('835', '315', '18', '1.00', '1000.00', 'served', '375.00', '2026-01-12 13:09:14', '2026-01-13 12:04:22');
INSERT INTO `order_items` VALUES ('836', '316', '11', '2.00', '5000.00', 'served', '10268.48', '2026-01-13 00:19:12', '2026-01-13 12:04:13');
INSERT INTO `order_items` VALUES ('837', '317', '8', '19.00', '47500.00', 'served', '15473.03', '2026-01-13 12:11:18', '2026-01-13 12:11:27');
INSERT INTO `order_items` VALUES ('838', '317', '10', '18.00', '45000.00', 'served', '92707.38', '2026-01-13 12:11:18', '2026-01-13 12:11:27');
INSERT INTO `order_items` VALUES ('839', '317', '11', '25.00', '62500.00', 'served', '128726.00', '2026-01-13 12:11:18', '2026-01-13 12:11:27');
INSERT INTO `order_items` VALUES ('840', '317', '12', '11.00', '5500.00', 'served', '4400.00', '2026-01-13 12:11:18', '2026-01-13 12:11:27');
INSERT INTO `order_items` VALUES ('841', '317', '13', '5.00', '2500.00', 'served', '2000.00', '2026-01-13 12:11:18', '2026-01-13 12:11:27');
INSERT INTO `order_items` VALUES ('842', '317', '14', '22.00', '11000.00', 'served', '0.00', '2026-01-13 12:11:18', '2026-01-13 12:11:27');
INSERT INTO `order_items` VALUES ('843', '317', '15', '1.00', '500.00', 'served', '300.00', '2026-01-13 12:11:18', '2026-01-13 12:11:27');
INSERT INTO `order_items` VALUES ('844', '317', '16', '3.00', '1500.00', 'served', '1140.00', '2026-01-13 12:11:18', '2026-01-13 12:11:27');
INSERT INTO `order_items` VALUES ('845', '317', '17', '5.00', '5000.00', 'served', '2250.00', '2026-01-13 12:11:18', '2026-01-13 12:11:27');
INSERT INTO `order_items` VALUES ('846', '317', '18', '5.00', '5000.00', 'served', '1000.00', '2026-01-13 12:11:18', '2026-01-13 12:11:27');
INSERT INTO `order_items` VALUES ('847', '317', '19', '1.00', '500.00', 'served', '400.00', '2026-01-13 12:11:18', '2026-01-13 12:11:27');
INSERT INTO `order_items` VALUES ('848', '317', '22', '6.00', '3000.00', 'served', '14701.86', '2026-01-13 12:11:18', '2026-01-13 12:11:27');
INSERT INTO `order_items` VALUES ('849', '318', '8', '1.00', '2500.00', 'served', '814.37', '2026-01-13 12:24:06', '2026-01-13 12:24:38');
INSERT INTO `order_items` VALUES ('850', '318', '18', '1.00', '1000.00', 'served', '200.00', '2026-01-13 12:24:06', '2026-01-13 12:24:38');
INSERT INTO `order_items` VALUES ('851', '319', '11', '2.00', '5000.00', 'served', '10298.08', '2026-01-13 12:37:56', '2026-01-13 12:38:13');
INSERT INTO `order_items` VALUES ('852', '320', '14', '1.00', '500.00', 'served', '0.00', '2026-01-13 12:42:11', '2026-01-14 00:29:47');
INSERT INTO `order_items` VALUES ('853', '320', '22', '2.00', '1000.00', 'served', '4900.62', '2026-01-13 12:42:11', '2026-01-14 00:29:47');
INSERT INTO `order_items` VALUES ('854', '321', '10', '1.00', '2500.00', 'served', '5150.41', '2026-01-13 13:27:29', '2026-01-13 13:29:41');
INSERT INTO `order_items` VALUES ('855', '321', '18', '1.00', '1000.00', 'served', '200.00', '2026-01-13 13:27:29', '2026-01-13 13:29:41');
INSERT INTO `order_items` VALUES ('856', '322', '16', '10.00', '5000.00', 'served', '3800.00', '2026-01-13 13:34:58', '2026-01-13 13:35:13');
INSERT INTO `order_items` VALUES ('857', '323', '15', '1.00', '500.00', 'served', '300.00', '2026-01-14 00:16:25', '2026-01-14 00:31:19');
INSERT INTO `order_items` VALUES ('858', '323', '22', '2.00', '1000.00', 'served', '4857.82', '2026-01-14 00:16:25', '2026-01-14 00:31:19');
INSERT INTO `order_items` VALUES ('859', '324', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 00:23:48', '2026-01-14 00:25:04');
INSERT INTO `order_items` VALUES ('860', '324', '15', '1.00', '500.00', 'served', '300.00', '2026-01-14 00:23:48', '2026-01-14 00:25:04');
INSERT INTO `order_items` VALUES ('861', '325', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 00:25:54', '2026-01-14 00:31:22');
INSERT INTO `order_items` VALUES ('862', '323', '13', '1.00', '500.00', 'served', '400.00', '2026-01-14 00:29:43', '2026-01-14 00:31:19');
INSERT INTO `order_items` VALUES ('863', '325', '11', '2.00', '5000.00', 'served', '10212.48', '2026-01-14 00:30:01', '2026-01-14 00:31:22');
INSERT INTO `order_items` VALUES ('864', '326', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 00:51:39', '2026-01-14 00:53:05');
INSERT INTO `order_items` VALUES ('865', '326', '15', '1.00', '500.00', 'served', '300.00', '2026-01-14 00:51:39', '2026-01-14 00:53:05');
INSERT INTO `order_items` VALUES ('866', '327', '8', '1.00', '2500.00', 'served', '770.50', '2026-01-14 00:53:12', '2026-01-14 00:55:05');
INSERT INTO `order_items` VALUES ('867', '328', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 01:00:38', '2026-01-14 01:05:40');
INSERT INTO `order_items` VALUES ('868', '329', '8', '1.00', '2500.00', 'served', '770.50', '2026-01-14 01:11:23', '2026-01-14 01:23:13');
INSERT INTO `order_items` VALUES ('869', '329', '10', '1.00', '2500.00', 'served', '5106.54', '2026-01-14 01:11:23', '2026-01-14 01:23:13');
INSERT INTO `order_items` VALUES ('870', '329', '12', '2.00', '1000.00', 'served', '800.00', '2026-01-14 01:11:23', '2026-01-14 01:23:13');
INSERT INTO `order_items` VALUES ('871', '329', '17', '1.00', '1000.00', 'served', '450.00', '2026-01-14 01:11:23', '2026-01-14 01:23:13');
INSERT INTO `order_items` VALUES ('872', '330', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 01:15:21', '2026-01-14 01:18:20');
INSERT INTO `order_items` VALUES ('873', '331', '10', '4.00', '10000.00', 'served', '20426.16', '2026-01-14 01:19:54', '2026-01-14 01:20:12');
INSERT INTO `order_items` VALUES ('874', '331', '14', '4.00', '2000.00', 'served', '0.00', '2026-01-14 01:19:54', '2026-01-14 01:20:12');
INSERT INTO `order_items` VALUES ('875', '332', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 01:22:26', '2026-01-14 01:22:37');
INSERT INTO `order_items` VALUES ('876', '329', '13', '1.00', '500.00', 'served', '400.00', '2026-01-14 01:23:03', '2026-01-14 01:23:13');
INSERT INTO `order_items` VALUES ('877', '329', '22', '1.00', '500.00', 'served', '2428.91', '2026-01-14 01:23:03', '2026-01-14 01:23:13');
INSERT INTO `order_items` VALUES ('878', '333', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 01:49:59', '2026-01-14 01:50:24');
INSERT INTO `order_items` VALUES ('879', '333', '14', '1.00', '500.00', 'served', '0.00', '2026-01-14 01:49:59', '2026-01-14 01:50:24');
INSERT INTO `order_items` VALUES ('880', '334', '22', '2.00', '1000.00', 'served', '4857.82', '2026-01-14 01:54:51', '2026-01-14 01:55:07');
INSERT INTO `order_items` VALUES ('881', '335', '10', '1.00', '2500.00', 'served', '5106.54', '2026-01-14 02:05:46', '2026-01-14 02:20:15');
INSERT INTO `order_items` VALUES ('882', '335', '14', '1.00', '500.00', 'served', '0.00', '2026-01-14 02:05:46', '2026-01-14 02:20:15');
INSERT INTO `order_items` VALUES ('883', '336', '10', '1.00', '2500.00', 'served', '5106.54', '2026-01-14 02:30:52', '2026-01-14 02:38:09');
INSERT INTO `order_items` VALUES ('884', '336', '12', '1.00', '500.00', 'served', '400.00', '2026-01-14 02:30:52', '2026-01-14 02:38:09');
INSERT INTO `order_items` VALUES ('885', '337', '10', '2.00', '5000.00', 'served', '10213.08', '2026-01-14 09:20:25', '2026-01-14 09:24:42');
INSERT INTO `order_items` VALUES ('886', '337', '12', '1.00', '500.00', 'served', '400.00', '2026-01-14 09:20:25', '2026-01-14 09:24:42');
INSERT INTO `order_items` VALUES ('887', '337', '15', '1.00', '500.00', 'served', '300.00', '2026-01-14 09:20:25', '2026-01-14 09:24:42');
INSERT INTO `order_items` VALUES ('888', '338', '10', '1.00', '2500.00', 'served', '5106.54', '2026-01-14 09:30:24', '2026-01-14 09:32:53');
INSERT INTO `order_items` VALUES ('889', '338', '14', '1.00', '500.00', 'served', '0.00', '2026-01-14 09:30:24', '2026-01-14 09:32:53');
INSERT INTO `order_items` VALUES ('890', '339', '8', '1.00', '2500.00', 'served', '770.50', '2026-01-14 09:31:54', '2026-01-14 09:32:57');
INSERT INTO `order_items` VALUES ('891', '339', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 09:31:54', '2026-01-14 09:32:57');
INSERT INTO `order_items` VALUES ('892', '340', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 09:32:43', '2026-01-14 09:33:10');
INSERT INTO `order_items` VALUES ('893', '341', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 09:33:47', '2026-01-14 09:34:03');
INSERT INTO `order_items` VALUES ('894', '342', '10', '1.00', '2500.00', 'served', '5106.54', '2026-01-14 09:36:00', '2026-01-14 09:36:17');
INSERT INTO `order_items` VALUES ('895', '342', '14', '1.00', '500.00', 'served', '0.00', '2026-01-14 09:36:00', '2026-01-14 09:36:17');
INSERT INTO `order_items` VALUES ('896', '343', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 09:37:46', '2026-01-14 09:49:10');
INSERT INTO `order_items` VALUES ('897', '343', '12', '1.00', '500.00', 'served', '400.00', '2026-01-14 09:37:46', '2026-01-14 09:49:10');
INSERT INTO `order_items` VALUES ('898', '344', '11', '2.00', '5000.00', 'served', '10212.48', '2026-01-14 09:48:25', '2026-01-14 10:01:25');
INSERT INTO `order_items` VALUES ('899', '344', '12', '1.00', '500.00', 'served', '400.00', '2026-01-14 09:48:25', '2026-01-14 10:01:25');
INSERT INTO `order_items` VALUES ('900', '344', '16', '1.00', '500.00', 'served', '380.00', '2026-01-14 09:48:25', '2026-01-14 10:01:25');
INSERT INTO `order_items` VALUES ('901', '345', '14', '3.00', '1500.00', 'served', '0.00', '2026-01-14 10:04:34', '2026-01-14 10:04:58');
INSERT INTO `order_items` VALUES ('902', '345', '18', '1.00', '1000.00', 'served', '200.00', '2026-01-14 10:04:34', '2026-01-14 10:04:58');
INSERT INTO `order_items` VALUES ('903', '345', '22', '8.00', '4000.00', 'served', '19431.28', '2026-01-14 10:04:34', '2026-01-14 10:04:58');
INSERT INTO `order_items` VALUES ('904', '346', '8', '1.00', '2500.00', 'served', '770.50', '2026-01-14 10:12:30', '2026-01-14 10:26:48');
INSERT INTO `order_items` VALUES ('905', '346', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 10:12:30', '2026-01-14 10:26:48');
INSERT INTO `order_items` VALUES ('906', '346', '13', '1.00', '500.00', 'served', '400.00', '2026-01-14 10:12:30', '2026-01-14 10:26:48');
INSERT INTO `order_items` VALUES ('907', '346', '15', '1.00', '500.00', 'served', '300.00', '2026-01-14 10:12:30', '2026-01-14 10:26:48');
INSERT INTO `order_items` VALUES ('908', '346', '16', '1.00', '500.00', 'served', '380.00', '2026-01-14 10:12:30', '2026-01-14 10:26:48');
INSERT INTO `order_items` VALUES ('909', '346', '17', '1.00', '1000.00', 'served', '450.00', '2026-01-14 10:12:30', '2026-01-14 10:26:48');
INSERT INTO `order_items` VALUES ('910', '347', '8', '1.00', '2500.00', 'served', '770.50', '2026-01-14 10:21:55', '2026-01-14 10:26:48');
INSERT INTO `order_items` VALUES ('911', '347', '16', '1.00', '500.00', 'served', '380.00', '2026-01-14 10:21:55', '2026-01-14 10:26:48');
INSERT INTO `order_items` VALUES ('912', '347', '17', '1.00', '1000.00', 'served', '450.00', '2026-01-14 10:21:55', '2026-01-14 10:26:48');
INSERT INTO `order_items` VALUES ('913', '348', '10', '1.00', '2500.00', 'served', '5106.54', '2026-01-14 10:32:12', '2026-01-14 10:41:39');
INSERT INTO `order_items` VALUES ('914', '348', '11', '3.00', '7500.00', 'served', '15318.72', '2026-01-14 10:32:12', '2026-01-14 10:41:39');
INSERT INTO `order_items` VALUES ('915', '348', '15', '2.00', '1000.00', 'served', '600.00', '2026-01-14 10:32:12', '2026-01-14 10:41:39');
INSERT INTO `order_items` VALUES ('916', '348', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 10:41:31', '2026-01-14 10:41:39');
INSERT INTO `order_items` VALUES ('917', '349', '8', '1.00', '2500.00', 'served', '770.50', '2026-01-14 10:58:31', '2026-01-14 10:58:50');
INSERT INTO `order_items` VALUES ('918', '349', '18', '1.00', '1000.00', 'served', '200.00', '2026-01-14 10:58:32', '2026-01-14 10:58:50');
INSERT INTO `order_items` VALUES ('919', '350', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 11:03:57', '2026-01-14 11:04:08');
INSERT INTO `order_items` VALUES ('920', '350', '14', '1.00', '500.00', 'served', '0.00', '2026-01-14 11:03:57', '2026-01-14 11:04:08');
INSERT INTO `order_items` VALUES ('921', '351', '10', '1.00', '2500.00', 'served', '5106.54', '2026-01-14 11:14:01', '2026-01-14 11:15:10');
INSERT INTO `order_items` VALUES ('922', '351', '16', '2.00', '1000.00', 'served', '760.00', '2026-01-14 11:14:01', '2026-01-14 11:15:10');
INSERT INTO `order_items` VALUES ('923', '352', '8', '1.00', '2500.00', 'served', '770.50', '2026-01-14 11:29:59', '2026-01-14 11:34:02');
INSERT INTO `order_items` VALUES ('924', '353', '8', '1.00', '2500.00', 'served', '770.50', '2026-01-14 11:33:59', '2026-01-14 11:40:26');
INSERT INTO `order_items` VALUES ('925', '354', '8', '1.00', '2500.00', 'served', '770.50', '2026-01-14 11:35:15', '2026-01-14 11:35:29');
INSERT INTO `order_items` VALUES ('926', '355', '10', '1.00', '2500.00', 'served', '5106.54', '2026-01-14 11:38:05', '2026-01-14 11:39:36');
INSERT INTO `order_items` VALUES ('927', '355', '15', '1.00', '500.00', 'served', '300.00', '2026-01-14 11:38:05', '2026-01-14 11:39:36');
INSERT INTO `order_items` VALUES ('928', '353', '14', '1.00', '500.00', 'served', '0.00', '2026-01-14 11:39:32', '2026-01-14 11:40:26');
INSERT INTO `order_items` VALUES ('929', '356', '10', '1.00', '2500.00', 'served', '5106.54', '2026-01-14 11:45:20', '2026-01-14 11:58:41');
INSERT INTO `order_items` VALUES ('930', '356', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 11:45:20', '2026-01-14 11:58:41');
INSERT INTO `order_items` VALUES ('931', '356', '14', '2.00', '1000.00', 'served', '0.00', '2026-01-14 11:45:20', '2026-01-14 11:58:41');
INSERT INTO `order_items` VALUES ('932', '357', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 11:46:48', '2026-01-14 11:49:01');
INSERT INTO `order_items` VALUES ('933', '357', '12', '1.00', '500.00', 'served', '400.00', '2026-01-14 11:46:48', '2026-01-14 11:49:01');
INSERT INTO `order_items` VALUES ('934', '356', '17', '1.00', '1000.00', 'served', '450.00', '2026-01-14 11:57:25', '2026-01-14 11:58:41');
INSERT INTO `order_items` VALUES ('935', '356', '22', '1.00', '500.00', 'served', '2428.91', '2026-01-14 11:57:25', '2026-01-14 11:58:41');
INSERT INTO `order_items` VALUES ('936', '358', '19', '1.00', '500.00', 'served', '400.00', '2026-01-14 13:44:37', '2026-01-14 13:47:40');
INSERT INTO `order_items` VALUES ('937', '358', '20', '1.00', '1000.00', 'served', '4811.44', '2026-01-14 13:44:37', '2026-01-14 13:47:40');
INSERT INTO `order_items` VALUES ('938', '359', '10', '2.00', '5000.00', 'served', '10213.08', '2026-01-14 15:45:44', '2026-01-14 15:50:09');
INSERT INTO `order_items` VALUES ('939', '359', '16', '2.00', '1000.00', 'served', '760.00', '2026-01-14 15:45:44', '2026-01-14 15:50:09');
INSERT INTO `order_items` VALUES ('940', '359', '19', '2.00', '1000.00', 'served', '800.00', '2026-01-14 15:45:44', '2026-01-14 15:50:09');
INSERT INTO `order_items` VALUES ('941', '360', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 15:51:32', '2026-01-14 15:59:13');
INSERT INTO `order_items` VALUES ('942', '360', '19', '1.00', '500.00', 'served', '400.00', '2026-01-14 15:51:32', '2026-01-14 15:59:13');
INSERT INTO `order_items` VALUES ('943', '361', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 15:59:29', '2026-01-14 16:08:42');
INSERT INTO `order_items` VALUES ('944', '362', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 17:01:52', '2026-01-14 17:08:03');
INSERT INTO `order_items` VALUES ('945', '363', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 17:08:35', '2026-01-14 17:08:46');
INSERT INTO `order_items` VALUES ('946', '363', '22', '2.00', '1000.00', 'served', '4857.82', '2026-01-14 17:08:35', '2026-01-14 17:08:46');
INSERT INTO `order_items` VALUES ('947', '364', '8', '1.00', '2500.00', 'served', '770.50', '2026-01-14 17:18:26', '2026-01-14 17:20:15');
INSERT INTO `order_items` VALUES ('948', '364', '12', '1.00', '500.00', 'served', '400.00', '2026-01-14 17:18:26', '2026-01-14 17:20:15');
INSERT INTO `order_items` VALUES ('949', '365', '12', '1.00', '500.00', 'served', '400.00', '2026-01-14 17:35:57', '2026-01-14 17:38:46');
INSERT INTO `order_items` VALUES ('950', '365', '20', '1.00', '1000.00', 'served', '4811.44', '2026-01-14 17:35:57', '2026-01-14 17:38:46');
INSERT INTO `order_items` VALUES ('951', '366', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 17:58:40', '2026-01-14 17:58:54');
INSERT INTO `order_items` VALUES ('952', '367', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 18:01:44', '2026-01-14 18:03:12');
INSERT INTO `order_items` VALUES ('953', '368', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 18:04:16', '2026-01-14 18:08:25');
INSERT INTO `order_items` VALUES ('954', '369', '10', '1.00', '2500.00', 'served', '5106.54', '2026-01-14 18:26:13', '2026-01-14 18:26:39');
INSERT INTO `order_items` VALUES ('955', '370', '8', '1.00', '2500.00', 'served', '770.50', '2026-01-14 18:38:09', '2026-01-14 18:45:22');
INSERT INTO `order_items` VALUES ('956', '370', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 18:38:09', '2026-01-14 18:45:22');
INSERT INTO `order_items` VALUES ('957', '370', '12', '1.00', '500.00', 'served', '400.00', '2026-01-14 18:38:09', '2026-01-14 18:45:22');
INSERT INTO `order_items` VALUES ('958', '371', '10', '1.00', '2500.00', 'served', '5106.54', '2026-01-14 18:43:45', '2026-01-14 18:49:08');
INSERT INTO `order_items` VALUES ('959', '371', '12', '2.00', '1000.00', 'served', '800.00', '2026-01-14 18:43:45', '2026-01-14 18:49:08');
INSERT INTO `order_items` VALUES ('960', '372', '10', '1.00', '2500.00', 'served', '5106.54', '2026-01-14 18:45:29', '2026-01-14 18:49:20');
INSERT INTO `order_items` VALUES ('961', '372', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 18:46:32', '2026-01-14 18:49:20');
INSERT INTO `order_items` VALUES ('962', '372', '14', '2.00', '1000.00', 'served', '0.00', '2026-01-14 18:46:32', '2026-01-14 18:49:20');
INSERT INTO `order_items` VALUES ('963', '373', '11', '1.00', '2500.00', 'served', '5106.24', '2026-01-14 18:50:52', '2026-01-14 18:52:36');
INSERT INTO `order_items` VALUES ('964', '373', '16', '1.00', '500.00', 'served', '380.00', '2026-01-14 18:50:52', '2026-01-14 18:52:36');
INSERT INTO `order_items` VALUES ('965', '373', '17', '1.00', '1000.00', 'served', '450.00', '2026-01-14 18:50:52', '2026-01-14 18:52:36');
INSERT INTO `order_items` VALUES ('966', '374', '8', '2.00', '5000.00', 'served', '1541.00', '2026-01-14 19:14:08', '2026-01-14 19:14:50');
INSERT INTO `order_items` VALUES ('967', '374', '11', '2.00', '5000.00', 'served', '10212.48', '2026-01-14 19:14:08', '2026-01-14 19:14:50');
INSERT INTO `order_items` VALUES ('968', '374', '14', '2.00', '1000.00', 'served', '0.00', '2026-01-14 19:14:08', '2026-01-14 19:14:50');
INSERT INTO `order_items` VALUES ('969', '375', '8', '1.00', '2500.00', 'served', '770.50', '2026-01-14 19:45:37', '2026-01-14 19:47:34');
INSERT INTO `order_items` VALUES ('970', '375', '10', '1.00', '2500.00', 'served', '5106.54', '2026-01-14 19:45:37', '2026-01-14 19:47:34');
INSERT INTO `order_items` VALUES ('971', '376', '8', '1.00', '2500.00', 'served', '771.06', '2026-01-15 06:11:06', '2026-01-15 06:44:52');
INSERT INTO `order_items` VALUES ('972', '377', '8', '2.00', '5000.00', 'served', '1542.12', '2026-01-15 06:46:38', '2026-01-15 06:47:15');
INSERT INTO `order_items` VALUES ('973', '378', '10', '1.00', '2500.00', 'served', '5106.78', '2026-01-15 06:49:26', '2026-01-15 06:51:51');
INSERT INTO `order_items` VALUES ('974', '378', '14', '1.00', '500.00', 'served', '0.00', '2026-01-15 06:49:26', '2026-01-15 06:51:51');
INSERT INTO `order_items` VALUES ('975', '378', '19', '1.00', '500.00', 'served', '400.00', '2026-01-15 06:49:26', '2026-01-15 06:51:51');
INSERT INTO `order_items` VALUES ('976', '379', '11', '1.00', '2500.00', 'served', '5106.48', '2026-01-15 06:55:34', '2026-01-15 07:00:22');
INSERT INTO `order_items` VALUES ('977', '379', '15', '1.00', '500.00', 'served', '300.00', '2026-01-15 06:55:34', '2026-01-15 07:00:22');
INSERT INTO `order_items` VALUES ('978', '379', '10', '1.00', '2500.00', 'served', '5106.78', '2026-01-15 06:58:22', '2026-01-15 07:00:22');
INSERT INTO `order_items` VALUES ('979', '379', '13', '1.00', '500.00', 'served', '400.00', '2026-01-15 06:58:22', '2026-01-15 07:00:22');
INSERT INTO `order_items` VALUES ('980', '380', '8', '1.00', '2500.00', 'served', '771.06', '2026-01-15 07:07:33', '2026-01-15 07:07:42');
INSERT INTO `order_items` VALUES ('981', '380', '12', '1.00', '500.00', 'served', '400.00', '2026-01-15 07:07:33', '2026-01-15 07:07:42');
INSERT INTO `order_items` VALUES ('982', '380', '18', '1.00', '1000.00', 'served', '200.00', '2026-01-15 07:07:33', '2026-01-15 07:07:42');
INSERT INTO `order_items` VALUES ('983', '381', '12', '1.00', '500.00', 'served', '400.00', '2026-01-15 07:11:33', '2026-01-15 07:11:42');
INSERT INTO `order_items` VALUES ('984', '381', '20', '1.00', '1000.00', 'served', '4811.68', '2026-01-15 07:11:33', '2026-01-15 07:11:42');
INSERT INTO `order_items` VALUES ('985', '382', '11', '1.00', '2500.00', 'served', '5106.48', '2026-01-15 07:15:38', '2026-01-15 07:17:14');
INSERT INTO `order_items` VALUES ('986', '382', '19', '1.00', '500.00', 'served', '400.00', '2026-01-15 07:15:38', '2026-01-15 07:17:14');
INSERT INTO `order_items` VALUES ('987', '383', '10', '5.00', '12500.00', 'served', '25533.90', '2026-01-15 07:31:02', '2026-01-15 07:32:30');
INSERT INTO `order_items` VALUES ('988', '383', '13', '2.00', '1000.00', 'served', '800.00', '2026-01-15 07:31:02', '2026-01-15 07:32:30');
INSERT INTO `order_items` VALUES ('989', '384', '8', '1.00', '2500.00', 'served', '771.06', '2026-01-15 07:40:48', '2026-01-15 07:45:37');
INSERT INTO `order_items` VALUES ('990', '384', '16', '1.00', '500.00', 'served', '380.00', '2026-01-15 07:40:48', '2026-01-15 07:45:37');
INSERT INTO `order_items` VALUES ('991', '385', '10', '1.00', '2500.00', 'served', '5106.78', '2026-01-15 07:41:30', '2026-01-15 07:42:17');
INSERT INTO `order_items` VALUES ('992', '385', '14', '1.00', '500.00', 'served', '0.00', '2026-01-15 07:41:30', '2026-01-15 07:42:17');
INSERT INTO `order_items` VALUES ('993', '386', '11', '2.00', '5000.00', 'served', '10212.96', '2026-01-15 07:45:27', '2026-01-15 07:46:08');
INSERT INTO `order_items` VALUES ('994', '386', '12', '1.00', '500.00', 'served', '400.00', '2026-01-15 07:45:27', '2026-01-15 07:46:08');
INSERT INTO `order_items` VALUES ('995', '386', '14', '1.00', '500.00', 'served', '0.00', '2026-01-15 07:45:27', '2026-01-15 07:46:08');
INSERT INTO `order_items` VALUES ('996', '387', '11', '1.00', '2500.00', 'served', '5106.48', '2026-01-15 07:46:15', '2026-01-15 09:24:41');
INSERT INTO `order_items` VALUES ('997', '388', '11', '1.00', '2500.00', 'served', '5106.48', '2026-01-15 08:05:33', '2026-01-15 08:06:41');
INSERT INTO `order_items` VALUES ('998', '389', '8', '5.00', '12500.00', 'cancelled', '3855.30', '2026-01-15 08:19:33', '2026-01-15 08:25:20');
INSERT INTO `order_items` VALUES ('999', '389', '11', '4.00', '10000.00', 'cancelled', '20425.92', '2026-01-15 08:19:33', '2026-01-15 08:25:20');
INSERT INTO `order_items` VALUES ('1000', '389', '13', '5.00', '2500.00', 'cancelled', '2000.00', '2026-01-15 08:19:33', '2026-01-15 08:25:20');
INSERT INTO `order_items` VALUES ('1001', '389', '14', '9.00', '4500.00', 'cancelled', '0.00', '2026-01-15 08:19:33', '2026-01-15 08:25:20');
INSERT INTO `order_items` VALUES ('1002', '389', '15', '9.00', '4500.00', 'cancelled', '2700.00', '2026-01-15 08:19:33', '2026-01-15 08:22:55');
INSERT INTO `order_items` VALUES ('1003', '389', '16', '1.00', '500.00', 'cancelled', '380.00', '2026-01-15 08:19:33', '2026-01-15 08:25:20');
INSERT INTO `order_items` VALUES ('1004', '390', '8', '1.00', '2500.00', 'served', '771.06', '2026-01-15 08:21:00', '2026-01-15 08:35:55');
INSERT INTO `order_items` VALUES ('1005', '390', '11', '1.00', '2500.00', 'served', '5106.48', '2026-01-15 08:21:01', '2026-01-15 08:35:55');
INSERT INTO `order_items` VALUES ('1006', '390', '14', '1.00', '500.00', 'served', '0.00', '2026-01-15 08:21:01', '2026-01-15 08:35:55');
INSERT INTO `order_items` VALUES ('1007', '390', '18', '1.00', '1000.00', 'served', '200.00', '2026-01-15 08:21:01', '2026-01-15 08:35:55');
INSERT INTO `order_items` VALUES ('1008', '390', '19', '1.00', '500.00', 'served', '400.00', '2026-01-15 08:21:01', '2026-01-15 08:35:55');
INSERT INTO `order_items` VALUES ('1009', '391', '11', '2.00', '5000.00', 'served', '10212.96', '2026-01-15 08:31:21', '2026-01-15 08:34:25');
INSERT INTO `order_items` VALUES ('1010', '391', '15', '2.00', '1000.00', 'served', '600.00', '2026-01-15 08:31:21', '2026-01-15 08:34:25');
INSERT INTO `order_items` VALUES ('1011', '390', '8', '1.00', '2500.00', 'served', '771.06', '2026-01-15 08:34:53', '2026-01-15 08:35:55');
INSERT INTO `order_items` VALUES ('1012', '390', '18', '1.00', '1000.00', 'served', '200.00', '2026-01-15 08:34:53', '2026-01-15 08:35:55');
INSERT INTO `order_items` VALUES ('1013', '392', '8', '5.00', '12500.00', 'served', '3855.30', '2026-01-15 08:35:50', '2026-01-15 08:37:29');
INSERT INTO `order_items` VALUES ('1014', '392', '11', '4.00', '10000.00', 'served', '20425.92', '2026-01-15 08:35:50', '2026-01-15 08:37:26');
INSERT INTO `order_items` VALUES ('1015', '392', '12', '2.00', '1000.00', 'served', '800.00', '2026-01-15 08:35:50', '2026-01-15 08:37:22');
INSERT INTO `order_items` VALUES ('1016', '392', '13', '3.00', '1500.00', 'served', '1200.00', '2026-01-15 08:35:50', '2026-01-15 08:37:18');
INSERT INTO `order_items` VALUES ('1017', '392', '14', '9.00', '4500.00', 'served', '0.00', '2026-01-15 08:35:50', '2026-01-15 08:37:14');
INSERT INTO `order_items` VALUES ('1018', '392', '16', '9.00', '4500.00', 'served', '3420.00', '2026-01-15 08:35:50', '2026-01-15 08:37:13');
INSERT INTO `order_items` VALUES ('1019', '393', '11', '2.00', '5000.00', 'served', '10212.96', '2026-01-15 08:54:44', '2026-01-15 08:55:09');
INSERT INTO `order_items` VALUES ('1020', '393', '12', '2.00', '1000.00', 'served', '800.00', '2026-01-15 08:54:44', '2026-01-15 08:55:09');
INSERT INTO `order_items` VALUES ('1021', '394', '11', '1.00', '2500.00', 'served', '5106.48', '2026-01-15 09:09:18', '2026-01-15 09:10:43');
INSERT INTO `order_items` VALUES ('1022', '395', '11', '1.00', '2500.00', 'served', '5106.48', '2026-01-15 09:09:46', '2026-01-15 09:10:43');
INSERT INTO `order_items` VALUES ('1023', '395', '16', '1.00', '500.00', 'served', '380.00', '2026-01-15 09:09:46', '2026-01-15 09:10:43');
INSERT INTO `order_items` VALUES ('1024', '396', '11', '2.00', '5000.00', 'served', '10212.96', '2026-01-15 09:15:46', '2026-01-15 09:24:09');
INSERT INTO `order_items` VALUES ('1025', '396', '12', '1.00', '500.00', 'served', '400.00', '2026-01-15 09:15:46', '2026-01-15 09:24:09');
INSERT INTO `order_items` VALUES ('1026', '397', '10', '1.00', '2500.00', 'served', '5106.78', '2026-01-15 09:23:02', '2026-01-15 09:24:11');
INSERT INTO `order_items` VALUES ('1027', '397', '12', '1.00', '500.00', 'served', '400.00', '2026-01-15 09:23:02', '2026-01-15 09:24:11');
INSERT INTO `order_items` VALUES ('1028', '398', '11', '2.00', '5000.00', 'served', '10212.96', '2026-01-15 09:23:35', '2026-01-15 09:24:26');
INSERT INTO `order_items` VALUES ('1029', '398', '12', '2.00', '1000.00', 'served', '800.00', '2026-01-15 09:23:35', '2026-01-15 09:24:26');
INSERT INTO `order_items` VALUES ('1030', '387', '8', '1.00', '2500.00', 'served', '771.06', '2026-01-15 09:24:21', '2026-01-15 09:24:41');
INSERT INTO `order_items` VALUES ('1031', '387', '18', '1.00', '1000.00', 'served', '200.00', '2026-01-15 09:24:21', '2026-01-15 09:24:41');
INSERT INTO `order_items` VALUES ('1032', '399', '8', '1.00', '2500.00', 'served', '771.06', '2026-01-15 09:34:13', '2026-01-15 09:39:07');
INSERT INTO `order_items` VALUES ('1033', '399', '12', '1.00', '500.00', 'served', '400.00', '2026-01-15 09:34:13', '2026-01-15 09:39:07');
INSERT INTO `order_items` VALUES ('1034', '400', '11', '1.00', '2500.00', 'served', '5106.48', '2026-01-15 09:44:17', '2026-01-15 09:44:33');
INSERT INTO `order_items` VALUES ('1035', '400', '12', '1.00', '500.00', 'served', '400.00', '2026-01-15 09:44:17', '2026-01-15 09:44:33');
INSERT INTO `order_items` VALUES ('1036', '401', '11', '1.00', '2500.00', 'served', '5106.48', '2026-01-15 09:55:57', '2026-01-15 09:56:19');
INSERT INTO `order_items` VALUES ('1037', '401', '14', '1.00', '500.00', 'served', '0.00', '2026-01-15 09:55:57', '2026-01-15 09:56:19');
INSERT INTO `order_items` VALUES ('1038', '402', '10', '1.00', '2500.00', 'served', '5106.78', '2026-01-15 10:11:06', '2026-01-15 10:11:19');
INSERT INTO `order_items` VALUES ('1039', '402', '12', '1.00', '500.00', 'served', '400.00', '2026-01-15 10:11:06', '2026-01-15 10:11:19');
INSERT INTO `order_items` VALUES ('1040', '403', '14', '2.00', '1000.00', 'served', '0.00', '2026-01-15 15:08:11', '2026-01-15 15:10:06');
INSERT INTO `order_items` VALUES ('1041', '403', '20', '3.00', '3000.00', 'served', '14435.04', '2026-01-15 15:08:11', '2026-01-15 15:10:06');
INSERT INTO `order_items` VALUES ('1042', '404', '18', '1.00', '1000.00', 'served', '200.00', '2026-01-15 15:29:58', '2026-01-15 15:40:17');
INSERT INTO `order_items` VALUES ('1043', '404', '22', '2.00', '1000.00', 'served', '4857.98', '2026-01-15 15:29:58', '2026-01-15 15:40:14');
INSERT INTO `order_items` VALUES ('1044', '405', '10', '1.00', '2500.00', 'served', '5106.78', '2026-01-15 15:37:11', '2026-01-15 15:38:35');
INSERT INTO `order_items` VALUES ('1045', '406', '10', '2.00', '5000.00', 'served', '10213.56', '2026-01-15 15:39:22', '2026-01-15 15:40:47');
INSERT INTO `order_items` VALUES ('1046', '406', '12', '2.00', '1000.00', 'served', '800.00', '2026-01-15 15:39:22', '2026-01-15 15:40:47');
INSERT INTO `order_items` VALUES ('1047', '407', '8', '1.00', '2500.00', 'served', '771.06', '2026-01-15 15:54:43', '2026-01-15 15:56:06');
INSERT INTO `order_items` VALUES ('1048', '407', '11', '3.00', '7500.00', 'served', '15319.44', '2026-01-15 15:54:43', '2026-01-15 15:56:06');
INSERT INTO `order_items` VALUES ('1049', '407', '14', '1.00', '500.00', 'served', '0.00', '2026-01-15 15:54:44', '2026-01-15 15:56:06');
INSERT INTO `order_items` VALUES ('1050', '407', '17', '1.00', '1000.00', 'served', '450.00', '2026-01-15 15:54:44', '2026-01-15 15:56:06');
INSERT INTO `order_items` VALUES ('1051', '408', '8', '1.00', '2500.00', 'served', '771.06', '2026-01-15 15:56:55', '2026-01-15 15:57:42');
INSERT INTO `order_items` VALUES ('1052', '408', '11', '1.00', '2500.00', 'served', '5106.48', '2026-01-15 15:56:55', '2026-01-15 15:57:42');
INSERT INTO `order_items` VALUES ('1053', '408', '14', '1.00', '500.00', 'served', '0.00', '2026-01-15 15:56:55', '2026-01-15 15:57:42');
INSERT INTO `order_items` VALUES ('1054', '409', '10', '1.00', '2500.00', 'served', '5106.78', '2026-01-15 16:05:23', '2026-01-15 16:05:44');
INSERT INTO `order_items` VALUES ('1055', '410', '10', '1.00', '2500.00', 'served', '5106.78', '2026-01-15 16:08:08', '2026-01-15 16:08:47');
INSERT INTO `order_items` VALUES ('1056', '410', '11', '1.00', '2500.00', 'served', '5106.48', '2026-01-15 16:08:08', '2026-01-15 16:08:47');
INSERT INTO `order_items` VALUES ('1057', '410', '12', '2.00', '1000.00', 'served', '800.00', '2026-01-15 16:08:08', '2026-01-15 16:08:47');
INSERT INTO `order_items` VALUES ('1058', '411', '11', '2.00', '5000.00', 'served', '10212.96', '2026-01-15 16:23:41', '2026-01-15 16:25:25');
INSERT INTO `order_items` VALUES ('1059', '411', '19', '2.00', '1000.00', 'served', '800.00', '2026-01-15 16:23:41', '2026-01-15 16:25:25');
INSERT INTO `order_items` VALUES ('1060', '412', '10', '1.00', '2500.00', 'served', '5106.78', '2026-01-15 16:26:03', '2026-01-15 16:37:55');
INSERT INTO `order_items` VALUES ('1061', '412', '11', '1.00', '2500.00', 'served', '5106.48', '2026-01-15 16:26:03', '2026-01-15 16:37:55');
INSERT INTO `order_items` VALUES ('1062', '412', '12', '1.00', '500.00', 'served', '400.00', '2026-01-15 16:26:03', '2026-01-15 16:37:55');
INSERT INTO `order_items` VALUES ('1063', '412', '13', '1.00', '500.00', 'served', '400.00', '2026-01-15 16:26:03', '2026-01-15 16:37:55');
INSERT INTO `order_items` VALUES ('1064', '413', '8', '1.00', '2500.00', 'served', '771.06', '2026-01-15 16:31:33', '2026-01-15 16:31:45');
INSERT INTO `order_items` VALUES ('1065', '413', '14', '1.00', '500.00', 'served', '0.00', '2026-01-15 16:31:33', '2026-01-15 16:31:45');
INSERT INTO `order_items` VALUES ('1066', '413', '16', '1.00', '500.00', 'served', '380.00', '2026-01-15 16:31:33', '2026-01-15 16:31:45');
INSERT INTO `order_items` VALUES ('1067', '413', '18', '1.00', '1000.00', 'served', '200.00', '2026-01-15 16:31:33', '2026-01-15 16:31:45');
INSERT INTO `order_items` VALUES ('1068', '412', '8', '1.00', '2500.00', 'served', '771.06', '2026-01-15 16:37:07', '2026-01-15 16:37:55');
INSERT INTO `order_items` VALUES ('1069', '414', '11', '1.00', '2500.00', 'served', '5106.48', '2026-01-15 16:47:32', '2026-01-15 16:52:36');
INSERT INTO `order_items` VALUES ('1070', '414', '12', '1.00', '500.00', 'served', '400.00', '2026-01-15 16:47:32', '2026-01-15 16:52:36');
INSERT INTO `order_items` VALUES ('1071', '414', '11', '2.00', '5000.00', 'served', '10212.96', '2026-01-15 16:51:53', '2026-01-15 16:52:36');
INSERT INTO `order_items` VALUES ('1072', '414', '13', '1.00', '500.00', 'served', '400.00', '2026-01-15 16:51:53', '2026-01-15 16:52:36');
INSERT INTO `order_items` VALUES ('1073', '414', '14', '1.00', '500.00', 'served', '0.00', '2026-01-15 16:51:53', '2026-01-15 16:52:36');


-- Table structure for `orders`

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `total_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `table_number` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `orders`

INSERT INTO `orders` VALUES ('20', '3', 'completed', '3500.00', '1', '2026-01-07 02:11:46', '2026-01-07 02:19:54', NULL);
INSERT INTO `orders` VALUES ('21', '3', 'completed', '6000.00', '1', '2026-01-07 02:21:04', '2026-01-07 02:22:38', NULL);
INSERT INTO `orders` VALUES ('22', '3', 'completed', '9000.00', '1', '2026-01-07 02:27:32', '2026-01-07 02:28:31', NULL);
INSERT INTO `orders` VALUES ('23', '3', 'completed', '13500.00', '1', '2026-01-07 02:32:06', '2026-01-07 02:34:21', NULL);
INSERT INTO `orders` VALUES ('24', '3', 'cancelled', '0.00', '1', '2026-01-07 02:35:51', '2026-01-07 02:40:16', NULL);
INSERT INTO `orders` VALUES ('25', '3', 'completed', '0.00', '1', '2026-01-07 02:40:36', '2026-01-07 02:41:46', NULL);
INSERT INTO `orders` VALUES ('26', '3', 'completed', '13500.00', '1', '2026-01-07 02:43:18', '2026-01-07 02:44:11', NULL);
INSERT INTO `orders` VALUES ('27', '3', 'completed', '3000.00', '1', '2026-01-07 02:53:01', '2026-01-07 02:53:49', NULL);
INSERT INTO `orders` VALUES ('28', '3', 'completed', '12500.00', '1', '2026-01-07 03:08:37', '2026-01-07 03:09:23', NULL);
INSERT INTO `orders` VALUES ('29', '3', 'completed', '2500.00', '1', '2026-01-07 03:12:02', '2026-01-07 03:14:14', NULL);
INSERT INTO `orders` VALUES ('30', '3', 'completed', '16500.00', '1', '2026-01-07 03:15:55', '2026-01-07 03:16:37', NULL);
INSERT INTO `orders` VALUES ('31', '3', 'completed', '3000.00', '1', '2026-01-07 03:23:47', '2026-01-07 03:24:49', NULL);
INSERT INTO `orders` VALUES ('32', '3', 'completed', '3000.00', '1', '2026-01-07 03:49:18', '2026-01-07 03:59:36', NULL);
INSERT INTO `orders` VALUES ('33', '3', 'completed', '4000.00', '1', '2026-01-07 04:17:01', '2026-01-07 04:38:52', NULL);
INSERT INTO `orders` VALUES ('34', '3', 'completed', '1000.00', '1', '2026-01-07 04:39:11', '2026-01-07 04:39:39', NULL);
INSERT INTO `orders` VALUES ('35', '3', 'completed', '13000.00', '1', '2026-01-07 04:52:09', '2026-01-07 05:02:36', NULL);
INSERT INTO `orders` VALUES ('36', '3', 'completed', '5500.00', '1', '2026-01-07 06:31:09', '2026-01-07 06:32:07', NULL);
INSERT INTO `orders` VALUES ('37', '3', 'completed', '3000.00', '1', '2026-01-07 06:49:11', '2026-01-07 06:49:59', NULL);
INSERT INTO `orders` VALUES ('38', '3', 'completed', '2500.00', '1', '2026-01-07 07:52:31', '2026-01-07 07:52:56', NULL);
INSERT INTO `orders` VALUES ('39', '3', 'cancelled', '0.00', '1', '2026-01-07 08:51:54', '2026-01-07 08:55:06', NULL);
INSERT INTO `orders` VALUES ('40', '6', 'cancelled', '0.00', '1', '2026-01-07 08:58:17', '2026-01-07 08:59:39', NULL);
INSERT INTO `orders` VALUES ('41', '6', 'completed', '9500.00', '1', '2026-01-07 09:03:20', '2026-01-07 09:06:45', NULL);
INSERT INTO `orders` VALUES ('42', '6', 'cancelled', '0.00', '2', '2026-01-07 09:10:25', '2026-01-07 09:12:17', NULL);
INSERT INTO `orders` VALUES ('43', '6', 'completed', '0.00', '2', '2026-01-07 09:12:51', '2026-01-07 09:21:13', NULL);
INSERT INTO `orders` VALUES ('44', '3', 'completed', '3000.00', '1', '2026-01-07 09:22:18', '2026-01-07 13:17:59', NULL);
INSERT INTO `orders` VALUES ('45', '3', 'completed', '12500.00', '1', '2026-01-07 09:25:22', '2026-01-07 11:15:49', NULL);
INSERT INTO `orders` VALUES ('46', '3', 'completed', '3000.00', '2', '2026-01-07 09:31:54', '2026-01-08 09:05:19', NULL);
INSERT INTO `orders` VALUES ('47', '6', 'completed', '6500.00', '3', '2026-01-07 09:52:52', '2026-01-08 10:53:18', NULL);
INSERT INTO `orders` VALUES ('48', '3', 'completed', '500.00', '3', '2026-01-07 09:56:05', '2026-01-07 10:12:15', NULL);
INSERT INTO `orders` VALUES ('49', '3', 'completed', '3000.00', '2', '2026-01-07 09:58:02', '2026-01-07 10:01:42', NULL);
INSERT INTO `orders` VALUES ('50', '3', 'completed', '5000.00', '2', '2026-01-07 10:07:04', '2026-01-08 09:05:16', NULL);
INSERT INTO `orders` VALUES ('51', '3', 'completed', '6000.00', '4', '2026-01-07 10:08:02', '2026-01-07 10:25:34', NULL);
INSERT INTO `orders` VALUES ('52', '3', 'completed', '500.00', '2', '2026-01-07 10:08:40', '2026-01-07 13:02:18', NULL);
INSERT INTO `orders` VALUES ('53', '3', 'completed', '6000.00', '3', '2026-01-07 10:12:57', '2026-01-07 12:29:35', NULL);
INSERT INTO `orders` VALUES ('54', '3', 'completed', '8000.00', '3', '2026-01-07 10:25:09', '2026-01-07 12:29:32', NULL);
INSERT INTO `orders` VALUES ('55', '3', 'completed', '7000.00', '1', '2026-01-07 11:16:50', '2026-01-07 13:17:59', NULL);
INSERT INTO `orders` VALUES ('56', '3', 'completed', '10500.00', '2', '2026-01-07 11:23:28', '2026-01-07 12:21:47', NULL);
INSERT INTO `orders` VALUES ('57', '3', 'completed', '500.00', '1', '2026-01-07 11:25:29', '2026-01-07 11:44:05', NULL);
INSERT INTO `orders` VALUES ('58', '3', 'completed', '3000.00', '1', '2026-01-07 11:43:50', '2026-01-07 12:31:20', NULL);
INSERT INTO `orders` VALUES ('59', '3', 'completed', '10000.00', '1', '2026-01-07 11:57:25', '2026-01-07 13:17:57', NULL);
INSERT INTO `orders` VALUES ('60', '6', 'completed', '10000.00', '3', '2026-01-07 11:57:46', '2026-01-07 12:15:01', NULL);
INSERT INTO `orders` VALUES ('61', '3', 'completed', '5000.00', '2', '2026-01-07 12:10:21', '2026-01-08 08:43:10', NULL);
INSERT INTO `orders` VALUES ('62', '6', 'completed', '12500.00', '3', '2026-01-07 12:19:04', '2026-01-08 10:53:13', NULL);
INSERT INTO `orders` VALUES ('63', '3', 'completed', '3000.00', '1', '2026-01-07 12:40:56', '2026-01-07 13:17:37', NULL);
INSERT INTO `orders` VALUES ('64', '3', 'completed', '3000.00', '2', '2026-01-07 13:01:28', '2026-01-08 05:23:44', NULL);
INSERT INTO `orders` VALUES ('65', '3', 'completed', '8500.00', '1', '2026-01-07 13:30:43', '2026-01-07 13:31:24', NULL);
INSERT INTO `orders` VALUES ('66', '6', 'completed', '9500.00', '1', '2026-01-08 00:06:33', '2026-01-08 00:22:25', NULL);
INSERT INTO `orders` VALUES ('67', '6', 'completed', '3000.00', '1', '2026-01-08 00:25:36', '2026-01-08 00:26:08', NULL);
INSERT INTO `orders` VALUES ('68', '3', 'completed', '10500.00', '1', '2026-01-08 00:27:24', '2026-01-08 00:50:25', NULL);
INSERT INTO `orders` VALUES ('69', '3', 'completed', '2500.00', '2', '2026-01-08 00:31:36', '2026-01-08 00:49:03', NULL);
INSERT INTO `orders` VALUES ('70', '6', 'completed', '4000.00', '3', '2026-01-08 00:37:26', '2026-01-08 00:39:46', NULL);
INSERT INTO `orders` VALUES ('71', '6', 'completed', '3000.00', '1', '2026-01-08 00:52:03', '2026-01-08 01:03:21', NULL);
INSERT INTO `orders` VALUES ('72', '6', 'completed', '2500.00', '2', '2026-01-08 00:57:14', '2026-01-08 01:12:15', NULL);
INSERT INTO `orders` VALUES ('73', '6', 'completed', '15500.00', '1', '2026-01-08 01:13:16', '2026-01-08 01:27:10', NULL);
INSERT INTO `orders` VALUES ('74', '6', 'completed', '6000.00', '1', '2026-01-08 01:28:16', '2026-01-08 01:43:58', NULL);
INSERT INTO `orders` VALUES ('75', '6', 'completed', '3000.00', '2', '2026-01-08 01:32:53', '2026-01-08 01:44:11', NULL);
INSERT INTO `orders` VALUES ('76', '6', 'completed', '5000.00', '1', '2026-01-08 01:46:54', '2026-01-08 01:55:46', NULL);
INSERT INTO `orders` VALUES ('77', '6', 'completed', '3000.00', '1', '2026-01-08 02:00:38', '2026-01-08 02:03:57', NULL);
INSERT INTO `orders` VALUES ('78', '3', 'completed', '9000.00', '2', '2026-01-08 02:04:02', '2026-01-08 11:03:54', NULL);
INSERT INTO `orders` VALUES ('79', '3', 'completed', '18000.00', '1', '2026-01-08 02:12:29', '2026-01-08 02:21:31', NULL);
INSERT INTO `orders` VALUES ('80', '3', 'completed', '3000.00', '3', '2026-01-08 02:16:04', '2026-01-08 02:27:48', NULL);
INSERT INTO `orders` VALUES ('81', '6', 'completed', '3500.00', '4', '2026-01-08 02:19:52', '2026-01-08 02:27:28', NULL);
INSERT INTO `orders` VALUES ('82', '6', 'completed', '3000.00', '1', '2026-01-08 02:26:41', '2026-01-08 03:16:39', NULL);
INSERT INTO `orders` VALUES ('83', '6', 'completed', '3000.00', '1', '2026-01-08 02:50:19', '2026-01-08 03:05:45', NULL);
INSERT INTO `orders` VALUES ('84', '6', 'completed', '3500.00', '2', '2026-01-08 02:51:33', '2026-01-08 03:05:14', NULL);
INSERT INTO `orders` VALUES ('85', '3', 'completed', '2500.00', '1', '2026-01-08 03:08:20', '2026-01-08 04:13:15', NULL);
INSERT INTO `orders` VALUES ('86', '6', 'completed', '2000.00', '2', '2026-01-08 03:12:07', '2026-01-08 03:15:51', NULL);
INSERT INTO `orders` VALUES ('87', '6', 'completed', '3000.00', '1', '2026-01-08 03:17:08', '2026-01-08 03:30:41', NULL);
INSERT INTO `orders` VALUES ('88', '3', 'completed', '3000.00', '1', '2026-01-08 03:56:34', '2026-01-08 04:13:08', NULL);
INSERT INTO `orders` VALUES ('89', '3', 'completed', '6500.00', '1', '2026-01-08 04:59:23', '2026-01-08 11:39:50', NULL);
INSERT INTO `orders` VALUES ('90', '3', 'completed', '3500.00', '1', '2026-01-08 05:49:30', '2026-01-08 06:28:24', NULL);
INSERT INTO `orders` VALUES ('91', '6', 'completed', '3000.00', '2', '2026-01-08 06:26:05', '2026-01-08 06:27:32', NULL);
INSERT INTO `orders` VALUES ('92', '6', 'completed', '3000.00', '1', '2026-01-08 06:29:13', '2026-01-08 06:37:37', NULL);
INSERT INTO `orders` VALUES ('93', '6', 'completed', '2500.00', '1', '2026-01-08 06:42:00', '2026-01-08 07:19:38', NULL);
INSERT INTO `orders` VALUES ('94', '6', 'completed', '0.00', '1', '2026-01-08 07:21:16', '2026-01-09 00:50:21', NULL);
INSERT INTO `orders` VALUES ('95', '6', 'completed', '7000.00', '2', '2026-01-08 07:38:28', '2026-01-08 09:05:15', NULL);
INSERT INTO `orders` VALUES ('96', '6', 'completed', '3000.00', '3', '2026-01-08 08:37:42', '2026-01-08 08:52:51', NULL);
INSERT INTO `orders` VALUES ('97', '6', 'completed', '3000.00', '1', '2026-01-08 09:02:35', '2026-01-08 09:11:39', NULL);
INSERT INTO `orders` VALUES ('98', '6', 'completed', '3000.00', '2', '2026-01-08 09:03:01', '2026-01-08 09:14:06', NULL);
INSERT INTO `orders` VALUES ('99', '6', 'completed', '5000.00', '3', '2026-01-08 09:07:04', '2026-01-08 09:22:09', NULL);
INSERT INTO `orders` VALUES ('100', '6', 'completed', '4000.00', '1', '2026-01-08 09:16:03', '2026-01-08 09:29:11', NULL);
INSERT INTO `orders` VALUES ('101', '3', 'completed', '3000.00', '2', '2026-01-08 09:17:52', '2026-01-08 09:36:34', NULL);
INSERT INTO `orders` VALUES ('102', '6', 'completed', '3000.00', '4', '2026-01-08 09:21:17', '2026-01-08 09:33:03', NULL);
INSERT INTO `orders` VALUES ('103', '6', 'completed', '3000.00', '1', '2026-01-08 09:29:57', '2026-01-08 09:32:18', NULL);
INSERT INTO `orders` VALUES ('104', '3', 'completed', '2500.00', '1', '2026-01-08 09:36:02', '2026-01-08 09:42:51', NULL);
INSERT INTO `orders` VALUES ('105', '6', 'completed', '9000.00', '1', '2026-01-08 10:01:10', '2026-01-08 10:14:03', NULL);
INSERT INTO `orders` VALUES ('106', '6', 'completed', '8500.00', '2', '2026-01-08 10:05:32', '2026-01-08 11:03:30', NULL);
INSERT INTO `orders` VALUES ('107', '3', 'completed', '4000.00', '4', '2026-01-08 10:06:25', '2026-01-09 00:52:44', NULL);
INSERT INTO `orders` VALUES ('108', '3', 'completed', '8500.00', '5', '2026-01-08 10:08:12', '2026-01-08 11:27:41', NULL);
INSERT INTO `orders` VALUES ('109', '3', 'completed', '0.00', '4', '2026-01-08 10:11:53', '2026-01-08 10:18:16', NULL);
INSERT INTO `orders` VALUES ('110', '6', 'completed', '3000.00', '3', '2026-01-08 10:11:54', '2026-01-08 10:24:12', NULL);
INSERT INTO `orders` VALUES ('111', '3', 'completed', '500.00', '5', '2026-01-08 10:15:03', '2026-01-08 11:07:48', NULL);
INSERT INTO `orders` VALUES ('112', '3', 'completed', '3500.00', '5', '2026-01-08 10:20:51', '2026-01-08 11:07:22', NULL);
INSERT INTO `orders` VALUES ('113', '3', 'completed', '5000.00', '6', '2026-01-08 10:23:16', '2026-01-08 10:23:35', NULL);
INSERT INTO `orders` VALUES ('114', '3', 'completed', '3000.00', '1', '2026-01-08 10:33:15', '2026-01-08 11:39:49', NULL);
INSERT INTO `orders` VALUES ('115', '3', 'completed', '3500.00', '3', '2026-01-08 10:37:22', '2026-01-08 10:52:30', NULL);
INSERT INTO `orders` VALUES ('116', '3', 'completed', '2500.00', '4', '2026-01-08 10:49:35', '2026-01-08 10:53:51', NULL);
INSERT INTO `orders` VALUES ('117', '3', 'completed', '5000.00', '5', '2026-01-08 10:52:48', '2026-01-08 11:07:16', NULL);
INSERT INTO `orders` VALUES ('118', '3', 'completed', '5500.00', '1', '2026-01-08 11:09:04', '2026-01-08 11:39:48', NULL);
INSERT INTO `orders` VALUES ('119', '3', 'completed', '3000.00', '2', '2026-01-08 11:15:30', '2026-01-08 11:18:11', NULL);
INSERT INTO `orders` VALUES ('120', '6', 'completed', '6000.00', '3', '2026-01-08 11:16:10', '2026-01-08 11:39:36', NULL);
INSERT INTO `orders` VALUES ('121', '6', 'completed', '3000.00', '2', '2026-01-08 11:25:24', '2026-01-08 11:35:52', NULL);
INSERT INTO `orders` VALUES ('122', '6', 'completed', '19000.00', '1', '2026-01-08 11:51:43', '2026-01-08 12:25:53', NULL);
INSERT INTO `orders` VALUES ('123', '3', 'completed', '3000.00', '2', '2026-01-08 12:04:45', '2026-01-08 12:26:02', NULL);
INSERT INTO `orders` VALUES ('124', '6', 'completed', '4000.00', '3', '2026-01-08 12:23:45', '2026-01-08 12:25:45', NULL);
INSERT INTO `orders` VALUES ('125', '6', 'completed', '12000.00', '1', '2026-01-09 00:34:31', '2026-01-09 00:50:16', NULL);
INSERT INTO `orders` VALUES ('126', '6', 'completed', '6000.00', '2', '2026-01-09 00:35:53', '2026-01-09 00:54:13', NULL);
INSERT INTO `orders` VALUES ('127', '6', 'completed', '3000.00', '3', '2026-01-09 00:46:30', '2026-01-09 00:56:31', NULL);
INSERT INTO `orders` VALUES ('128', '6', 'completed', '7500.00', '4', '2026-01-09 00:51:20', '2026-01-09 00:52:38', NULL);
INSERT INTO `orders` VALUES ('129', '3', 'completed', '3000.00', '1', '2026-01-09 00:55:02', '2026-01-09 01:10:34', NULL);
INSERT INTO `orders` VALUES ('130', '6', 'completed', '2500.00', '2', '2026-01-09 00:59:28', '2026-01-09 01:00:10', NULL);
INSERT INTO `orders` VALUES ('131', '3', 'completed', '2500.00', '2', '2026-01-09 01:05:13', '2026-01-09 01:06:48', NULL);
INSERT INTO `orders` VALUES ('132', '3', 'completed', '2500.00', '2', '2026-01-09 01:07:32', '2026-01-09 01:10:22', NULL);
INSERT INTO `orders` VALUES ('133', '6', 'completed', '3000.00', '1', '2026-01-09 01:34:45', '2026-01-09 01:50:44', NULL);
INSERT INTO `orders` VALUES ('134', '6', 'completed', '9000.00', '2', '2026-01-09 01:52:34', '2026-01-09 02:11:30', NULL);
INSERT INTO `orders` VALUES ('135', '6', 'completed', '15500.00', '1', '2026-01-09 02:05:39', '2026-01-09 02:33:32', NULL);
INSERT INTO `orders` VALUES ('136', '3', 'completed', '3000.00', '2', '2026-01-09 02:14:26', '2026-01-09 02:22:45', NULL);
INSERT INTO `orders` VALUES ('137', '6', 'completed', '5000.00', '3', '2026-01-09 02:17:09', '2026-01-09 02:21:00', NULL);
INSERT INTO `orders` VALUES ('138', '6', 'completed', '3000.00', '2', '2026-01-09 02:25:18', '2026-01-09 02:35:58', NULL);
INSERT INTO `orders` VALUES ('139', '3', 'completed', '2500.00', '3', '2026-01-09 02:27:54', '2026-01-09 02:32:54', NULL);
INSERT INTO `orders` VALUES ('140', '3', 'completed', '3000.00', '1', '2026-01-09 02:48:08', '2026-01-09 02:48:49', NULL);
INSERT INTO `orders` VALUES ('141', '6', 'completed', '3500.00', '1', '2026-01-09 03:00:12', '2026-01-09 03:00:29', NULL);
INSERT INTO `orders` VALUES ('142', '6', 'completed', '500.00', '1', '2026-01-09 03:03:31', '2026-01-09 03:04:32', NULL);
INSERT INTO `orders` VALUES ('143', '3', 'completed', '3000.00', '1', '2026-01-09 03:19:45', '2026-01-09 03:21:05', NULL);
INSERT INTO `orders` VALUES ('144', '6', 'completed', '3000.00', '1', '2026-01-09 03:46:17', '2026-01-09 03:46:42', NULL);
INSERT INTO `orders` VALUES ('145', '6', 'completed', '3000.00', '1', '2026-01-09 03:53:46', '2026-01-09 04:23:54', NULL);
INSERT INTO `orders` VALUES ('146', '6', 'completed', '4500.00', '2', '2026-01-09 04:13:38', '2026-01-09 04:23:40', NULL);
INSERT INTO `orders` VALUES ('147', '6', 'completed', '3000.00', '1', '2026-01-09 06:04:48', '2026-01-09 06:14:47', NULL);
INSERT INTO `orders` VALUES ('148', '6', 'completed', '10000.00', '1', '2026-01-09 07:40:16', '2026-01-09 07:41:05', NULL);
INSERT INTO `orders` VALUES ('149', '3', 'completed', '3000.00', '1', '2026-01-09 08:59:19', '2026-01-09 09:38:27', NULL);
INSERT INTO `orders` VALUES ('150', '3', 'completed', '3000.00', '2', '2026-01-09 09:08:07', '2026-01-09 09:08:40', NULL);
INSERT INTO `orders` VALUES ('151', '3', 'completed', '7000.00', '2', '2026-01-09 09:19:35', '2026-01-09 09:37:41', NULL);
INSERT INTO `orders` VALUES ('152', '6', 'completed', '18000.00', '3', '2026-01-09 09:38:14', '2026-01-09 09:49:21', NULL);
INSERT INTO `orders` VALUES ('153', '3', 'completed', '2500.00', '1', '2026-01-09 09:46:47', '2026-01-09 10:27:58', NULL);
INSERT INTO `orders` VALUES ('154', '3', 'completed', '2500.00', '2', '2026-01-09 09:52:18', '2026-01-09 10:27:50', NULL);
INSERT INTO `orders` VALUES ('155', '3', 'completed', '6000.00', '3', '2026-01-09 10:26:39', '2026-01-09 10:37:19', NULL);
INSERT INTO `orders` VALUES ('156', '6', 'completed', '3000.00', '1', '2026-01-09 10:46:03', '2026-01-09 10:55:39', NULL);
INSERT INTO `orders` VALUES ('157', '3', 'completed', '2500.00', '2', '2026-01-09 10:46:30', '2026-01-09 10:55:48', NULL);
INSERT INTO `orders` VALUES ('158', '6', 'completed', '6500.00', '3', '2026-01-09 11:49:54', '2026-01-09 13:48:03', NULL);
INSERT INTO `orders` VALUES ('159', '3', 'completed', '3000.00', '2', '2026-01-09 12:01:41', '2026-01-09 12:11:28', NULL);
INSERT INTO `orders` VALUES ('160', '3', 'completed', '3000.00', '1', '2026-01-09 12:11:07', '2026-01-09 12:18:21', NULL);
INSERT INTO `orders` VALUES ('161', '6', 'completed', '8000.00', '2', '2026-01-09 12:14:36', '2026-01-09 12:33:04', NULL);
INSERT INTO `orders` VALUES ('162', '6', 'completed', '3500.00', '1', '2026-01-09 12:28:55', '2026-01-09 12:31:08', NULL);
INSERT INTO `orders` VALUES ('163', '6', 'completed', '3000.00', '1', '2026-01-09 12:35:59', '2026-01-09 12:54:27', NULL);
INSERT INTO `orders` VALUES ('164', '6', 'completed', '3500.00', '1', '2026-01-09 13:00:16', '2026-01-09 13:04:50', NULL);
INSERT INTO `orders` VALUES ('165', '6', 'completed', '9000.00', '1', '2026-01-09 13:49:37', '2026-01-09 13:50:04', NULL);
INSERT INTO `orders` VALUES ('166', '6', 'completed', '2500.00', '1', '2026-01-10 00:07:04', '2026-01-10 00:14:16', NULL);
INSERT INTO `orders` VALUES ('167', '6', 'completed', '3500.00', '1', '2026-01-10 00:43:40', '2026-01-10 01:10:39', NULL);
INSERT INTO `orders` VALUES ('168', '3', 'completed', '6000.00', '1', '2026-01-10 01:12:00', '2026-01-10 01:19:55', NULL);
INSERT INTO `orders` VALUES ('169', '3', 'completed', '5000.00', '2', '2026-01-10 01:13:58', '2026-01-10 01:20:52', NULL);
INSERT INTO `orders` VALUES ('170', '3', 'completed', '7000.00', '3', '2026-01-10 01:15:17', '2026-01-10 03:25:51', NULL);
INSERT INTO `orders` VALUES ('171', '3', 'completed', '2500.00', '1', '2026-01-10 01:27:41', '2026-01-10 01:53:50', NULL);
INSERT INTO `orders` VALUES ('172', '6', 'completed', '5500.00', '2', '2026-01-10 01:30:25', '2026-01-10 01:36:10', NULL);
INSERT INTO `orders` VALUES ('173', '3', 'completed', '0.00', '1', '2026-01-10 01:35:44', '2026-01-10 01:36:04', NULL);
INSERT INTO `orders` VALUES ('174', '6', 'completed', '3000.00', '2', '2026-01-10 01:44:28', '2026-01-10 01:55:24', NULL);
INSERT INTO `orders` VALUES ('175', '3', 'completed', '7000.00', '1', '2026-01-10 01:44:36', '2026-01-10 01:53:42', NULL);
INSERT INTO `orders` VALUES ('176', '6', 'completed', '3000.00', '3', '2026-01-10 01:48:22', '2026-01-10 01:51:04', NULL);
INSERT INTO `orders` VALUES ('177', '6', 'completed', '2500.00', '1', '2026-01-10 02:08:42', '2026-01-10 02:24:15', NULL);
INSERT INTO `orders` VALUES ('178', '3', 'completed', '1500.00', '2', '2026-01-10 02:22:15', '2026-01-10 02:27:19', NULL);
INSERT INTO `orders` VALUES ('179', '6', 'completed', '4500.00', '1', '2026-01-10 02:35:47', '2026-01-10 02:51:49', NULL);
INSERT INTO `orders` VALUES ('180', '6', 'completed', '12000.00', '1', '2026-01-10 03:02:34', '2026-01-10 04:54:17', NULL);
INSERT INTO `orders` VALUES ('181', '6', 'completed', '13500.00', '2', '2026-01-10 03:07:18', '2026-01-10 03:37:55', NULL);
INSERT INTO `orders` VALUES ('182', '6', 'completed', '6000.00', '3', '2026-01-10 03:12:31', '2026-01-10 03:25:48', NULL);
INSERT INTO `orders` VALUES ('183', '3', 'completed', '1500.00', '2', '2026-01-10 03:19:22', '2026-01-10 03:30:41', NULL);
INSERT INTO `orders` VALUES ('184', '3', 'completed', '2500.00', '4', '2026-01-10 03:22:26', '2026-01-10 03:39:56', NULL);
INSERT INTO `orders` VALUES ('185', '6', 'completed', '6000.00', '3', '2026-01-10 03:37:00', '2026-01-10 04:54:25', NULL);
INSERT INTO `orders` VALUES ('186', '3', 'completed', '3000.00', '2', '2026-01-10 03:45:56', '2026-01-10 03:46:20', NULL);
INSERT INTO `orders` VALUES ('187', '3', 'completed', '6000.00', '2', '2026-01-10 03:57:18', '2026-01-10 04:16:05', NULL);
INSERT INTO `orders` VALUES ('188', '6', 'completed', '4000.00', '4', '2026-01-10 04:06:28', '2026-01-10 04:21:19', NULL);
INSERT INTO `orders` VALUES ('189', '6', 'completed', '4000.00', '5', '2026-01-10 04:12:35', '2026-01-10 04:28:21', NULL);
INSERT INTO `orders` VALUES ('190', '3', 'completed', '3000.00', '2', '2026-01-10 04:44:30', '2026-01-10 04:59:49', NULL);
INSERT INTO `orders` VALUES ('191', '6', 'completed', '3000.00', '1', '2026-01-10 05:37:33', '2026-01-10 05:50:15', NULL);
INSERT INTO `orders` VALUES ('192', '6', 'completed', '5500.00', '1', '2026-01-10 05:58:35', '2026-01-10 06:30:29', NULL);
INSERT INTO `orders` VALUES ('193', '6', 'completed', '3000.00', '2', '2026-01-10 06:04:13', '2026-01-10 06:19:36', NULL);
INSERT INTO `orders` VALUES ('194', '6', 'completed', '500.00', '1', '2026-01-10 06:33:41', '2026-01-10 06:34:16', NULL);
INSERT INTO `orders` VALUES ('195', '3', 'completed', '2500.00', '1', '2026-01-10 07:59:02', '2026-01-10 08:01:35', NULL);
INSERT INTO `orders` VALUES ('196', '6', 'completed', '3000.00', '1', '2026-01-10 08:50:03', '2026-01-10 08:50:35', NULL);
INSERT INTO `orders` VALUES ('197', '6', 'completed', '11500.00', '1', '2026-01-10 09:48:16', '2026-01-10 10:07:15', NULL);
INSERT INTO `orders` VALUES ('198', '6', 'completed', '8000.00', '2', '2026-01-10 09:59:51', '2026-01-10 10:16:12', NULL);
INSERT INTO `orders` VALUES ('199', '6', 'completed', '9000.00', '1', '2026-01-10 10:18:59', '2026-01-10 10:22:49', NULL);
INSERT INTO `orders` VALUES ('200', '6', 'completed', '6500.00', '1', '2026-01-10 10:40:19', '2026-01-10 11:00:18', NULL);
INSERT INTO `orders` VALUES ('201', '6', 'completed', '500.00', '1', '2026-01-10 11:01:12', '2026-01-10 11:01:31', NULL);
INSERT INTO `orders` VALUES ('202', '6', 'completed', '1500.00', '1', '2026-01-10 11:03:20', '2026-01-10 11:03:38', NULL);
INSERT INTO `orders` VALUES ('203', '6', 'completed', '3000.00', '1', '2026-01-10 11:03:58', '2026-01-10 11:04:18', NULL);
INSERT INTO `orders` VALUES ('204', '6', 'completed', '3500.00', '1', '2026-01-10 11:07:04', '2026-01-10 11:12:20', NULL);
INSERT INTO `orders` VALUES ('205', '6', 'completed', '3500.00', '1', '2026-01-10 11:09:24', '2026-01-10 11:12:16', NULL);
INSERT INTO `orders` VALUES ('206', '6', 'completed', '3000.00', '1', '2026-01-10 11:25:15', '2026-01-10 11:31:03', NULL);
INSERT INTO `orders` VALUES ('207', '3', 'completed', '12500.00', '2', '2026-01-10 11:28:56', '2026-01-10 11:48:54', NULL);
INSERT INTO `orders` VALUES ('208', '6', 'completed', '3500.00', '1', '2026-01-10 11:46:23', '2026-01-10 12:50:17', NULL);
INSERT INTO `orders` VALUES ('209', '3', 'completed', '3000.00', '2', '2026-01-10 11:54:23', '2026-01-10 12:18:27', NULL);
INSERT INTO `orders` VALUES ('210', '3', 'completed', '4500.00', '10', '2026-01-10 11:57:59', '2026-01-10 12:19:24', NULL);
INSERT INTO `orders` VALUES ('211', '3', 'completed', '6000.00', '2', '2026-01-10 12:35:16', '2026-01-10 12:38:42', NULL);
INSERT INTO `orders` VALUES ('212', '3', 'completed', '3500.00', '2', '2026-01-10 12:49:42', '2026-01-10 12:55:40', NULL);
INSERT INTO `orders` VALUES ('213', '3', 'completed', '5000.00', '1', '2026-01-10 23:54:35', '2026-01-10 23:57:44', NULL);
INSERT INTO `orders` VALUES ('214', '3', 'completed', '7500.00', '2', '2026-01-10 23:57:29', '2026-01-10 23:57:52', NULL);
INSERT INTO `orders` VALUES ('215', '3', 'completed', '1000.00', '1', '2026-01-11 00:05:09', '2026-01-11 00:05:27', NULL);
INSERT INTO `orders` VALUES ('216', '3', 'completed', '12500.00', '1', '2026-01-11 00:07:25', '2026-01-11 00:07:41', NULL);
INSERT INTO `orders` VALUES ('217', '6', 'completed', '5000.00', '1', '2026-01-11 00:31:48', '2026-01-11 00:46:38', NULL);
INSERT INTO `orders` VALUES ('218', '6', 'completed', '5000.00', '1', '2026-01-11 00:46:57', '2026-01-11 00:51:27', NULL);
INSERT INTO `orders` VALUES ('219', '3', 'completed', '6000.00', '1', '2026-01-11 00:56:58', '2026-01-11 01:00:50', NULL);
INSERT INTO `orders` VALUES ('220', '3', 'completed', '15500.00', '2', '2026-01-11 01:11:26', '2026-01-11 01:29:26', NULL);
INSERT INTO `orders` VALUES ('221', '3', 'completed', '2500.00', '1', '2026-01-11 01:17:45', '2026-01-11 01:21:09', NULL);
INSERT INTO `orders` VALUES ('222', '6', 'completed', '5000.00', '1', '2026-01-11 01:21:40', '2026-01-11 01:27:01', NULL);
INSERT INTO `orders` VALUES ('223', '6', 'completed', '3000.00', '1', '2026-01-11 01:27:41', '2026-01-11 01:38:35', NULL);
INSERT INTO `orders` VALUES ('224', '3', 'completed', '15000.00', '2', '2026-01-11 01:55:04', '2026-01-11 01:57:26', NULL);
INSERT INTO `orders` VALUES ('225', '3', 'completed', '9000.00', '2', '2026-01-11 02:00:52', '2026-01-11 02:20:03', NULL);
INSERT INTO `orders` VALUES ('226', '6', 'completed', '12000.00', '1', '2026-01-11 02:04:14', '2026-01-11 02:09:24', NULL);
INSERT INTO `orders` VALUES ('227', '3', 'completed', '3000.00', '4', '2026-01-11 02:05:12', '2026-01-11 02:13:15', NULL);
INSERT INTO `orders` VALUES ('228', '6', 'completed', '10000.00', '1', '2026-01-11 02:12:39', '2026-01-11 02:14:21', NULL);
INSERT INTO `orders` VALUES ('229', '3', 'completed', '12500.00', '4', '2026-01-11 02:17:09', '2026-01-11 02:26:07', NULL);
INSERT INTO `orders` VALUES ('230', '6', 'completed', '3000.00', '1', '2026-01-11 02:19:15', '2026-01-11 02:21:06', NULL);
INSERT INTO `orders` VALUES ('231', '3', 'completed', '2500.00', '2', '2026-01-11 02:31:30', '2026-01-11 02:57:15', NULL);
INSERT INTO `orders` VALUES ('232', '6', 'completed', '7500.00', '1', '2026-01-11 02:40:15', '2026-01-11 03:12:42', NULL);
INSERT INTO `orders` VALUES ('233', '6', 'completed', '3000.00', '3', '2026-01-11 02:53:47', '2026-01-11 03:12:12', NULL);
INSERT INTO `orders` VALUES ('234', '6', 'completed', '3000.00', '4', '2026-01-11 02:55:29', '2026-01-11 02:59:37', NULL);
INSERT INTO `orders` VALUES ('235', '6', 'completed', '5000.00', '1', '2026-01-11 03:29:49', '2026-01-11 03:55:16', NULL);
INSERT INTO `orders` VALUES ('236', '3', 'completed', '9500.00', '2', '2026-01-11 03:45:36', '2026-01-11 04:13:34', NULL);
INSERT INTO `orders` VALUES ('237', '3', 'completed', '2500.00', '4', '2026-01-11 04:03:05', '2026-01-11 04:13:26', NULL);
INSERT INTO `orders` VALUES ('238', '3', 'completed', '3000.00', '1', '2026-01-11 04:10:37', '2026-01-11 04:26:28', NULL);
INSERT INTO `orders` VALUES ('239', '3', 'completed', '3000.00', '2', '2026-01-11 06:25:43', '2026-01-11 06:28:35', NULL);
INSERT INTO `orders` VALUES ('240', '3', 'completed', '3000.00', '1', '2026-01-11 06:27:40', '2026-01-11 07:29:06', NULL);
INSERT INTO `orders` VALUES ('241', '3', 'completed', '5500.00', '2', '2026-01-11 06:44:38', '2026-01-11 07:28:30', NULL);
INSERT INTO `orders` VALUES ('242', '3', 'completed', '7000.00', '4', '2026-01-11 07:28:16', '2026-01-11 08:21:25', NULL);
INSERT INTO `orders` VALUES ('243', '3', 'completed', '3000.00', '2', '2026-01-11 08:03:53', '2026-01-11 08:21:34', NULL);
INSERT INTO `orders` VALUES ('244', '3', 'completed', '3000.00', '2', '2026-01-11 08:31:59', '2026-01-11 08:51:34', NULL);
INSERT INTO `orders` VALUES ('245', '3', 'completed', '5000.00', '1', '2026-01-11 08:34:27', '2026-01-11 08:56:56', NULL);
INSERT INTO `orders` VALUES ('246', '3', 'completed', '4500.00', '3', '2026-01-11 08:47:39', '2026-01-11 09:06:57', NULL);
INSERT INTO `orders` VALUES ('247', '3', 'completed', '6000.00', '1', '2026-01-11 08:58:40', '2026-01-11 09:12:50', NULL);
INSERT INTO `orders` VALUES ('248', '3', 'completed', '3000.00', '1', '2026-01-11 10:21:42', '2026-01-11 10:41:40', NULL);
INSERT INTO `orders` VALUES ('249', '6', 'completed', '5000.00', '2', '2026-01-11 10:22:33', '2026-01-11 10:36:16', NULL);
INSERT INTO `orders` VALUES ('250', '3', 'completed', '6000.00', '3', '2026-01-11 10:23:55', '2026-01-11 10:29:18', NULL);
INSERT INTO `orders` VALUES ('251', '6', 'completed', '3000.00', '4', '2026-01-11 10:26:01', '2026-01-11 10:51:31', NULL);
INSERT INTO `orders` VALUES ('252', '3', 'completed', '2500.00', '3', '2026-01-11 10:31:41', '2026-01-11 10:41:11', NULL);
INSERT INTO `orders` VALUES ('253', '3', 'completed', '12000.00', '5', '2026-01-11 10:32:20', '2026-01-11 10:40:42', NULL);
INSERT INTO `orders` VALUES ('254', '3', 'completed', '3000.00', '2', '2026-01-11 10:37:09', '2026-01-11 10:43:18', NULL);
INSERT INTO `orders` VALUES ('255', '3', 'completed', '14000.00', '1', '2026-01-11 10:55:17', '2026-01-11 11:26:21', NULL);
INSERT INTO `orders` VALUES ('256', '6', 'completed', '3000.00', '2', '2026-01-11 11:01:17', '2026-01-11 11:13:01', NULL);
INSERT INTO `orders` VALUES ('257', '6', 'completed', '3000.00', '3', '2026-01-11 11:06:13', '2026-01-11 11:21:08', NULL);
INSERT INTO `orders` VALUES ('258', '6', 'completed', '3000.00', '2', '2026-01-11 11:24:44', '2026-01-11 11:27:25', NULL);
INSERT INTO `orders` VALUES ('259', '3', 'completed', '5000.00', '4', '2026-01-11 11:26:47', '2026-01-11 11:33:12', NULL);
INSERT INTO `orders` VALUES ('260', '6', 'completed', '3500.00', '1', '2026-01-11 11:43:27', '2026-01-11 11:51:56', NULL);
INSERT INTO `orders` VALUES ('261', '3', 'completed', '3000.00', '2', '2026-01-11 11:45:38', '2026-01-11 11:47:04', NULL);
INSERT INTO `orders` VALUES ('262', '3', 'completed', '6000.00', '2', '2026-01-11 11:51:01', '2026-01-11 11:59:43', NULL);
INSERT INTO `orders` VALUES ('263', '3', 'completed', '13000.00', '1', '2026-01-11 11:55:23', '2026-01-11 12:15:49', NULL);
INSERT INTO `orders` VALUES ('264', '3', 'completed', '3000.00', '2', '2026-01-11 12:32:40', '2026-01-11 12:34:34', NULL);
INSERT INTO `orders` VALUES ('265', '6', 'completed', '2500.00', '1', '2026-01-11 12:41:49', '2026-01-11 12:44:24', NULL);
INSERT INTO `orders` VALUES ('266', '3', 'completed', '2500.00', '1', '2026-01-11 13:30:46', '2026-01-12 00:33:09', NULL);
INSERT INTO `orders` VALUES ('267', '3', 'completed', '12500.00', '2', '2026-01-11 13:31:34', '2026-01-11 14:09:36', NULL);
INSERT INTO `orders` VALUES ('268', '6', 'completed', '4500.00', '1', '2026-01-11 13:44:52', '2026-01-11 14:07:21', NULL);
INSERT INTO `orders` VALUES ('269', '3', 'completed', '4500.00', '4', '2026-01-11 13:52:58', '2026-01-11 14:09:46', NULL);
INSERT INTO `orders` VALUES ('270', '6', 'completed', '4000.00', '3', '2026-01-11 14:08:58', '2026-01-11 14:09:29', NULL);
INSERT INTO `orders` VALUES ('271', '6', 'completed', '5000.00', '1', '2026-01-12 00:09:56', '2026-01-12 00:13:14', NULL);
INSERT INTO `orders` VALUES ('272', '6', 'completed', '6000.00', '2', '2026-01-12 00:31:38', '2026-01-12 00:33:20', NULL);
INSERT INTO `orders` VALUES ('273', '3', 'completed', '6000.00', '1', '2026-01-12 00:32:34', '2026-01-12 00:32:55', NULL);
INSERT INTO `orders` VALUES ('274', '3', 'completed', '3000.00', '1', '2026-01-12 00:45:49', '2026-01-12 01:15:12', NULL);
INSERT INTO `orders` VALUES ('275', '3', 'completed', '5000.00', '2', '2026-01-12 00:49:52', '2026-01-12 01:02:45', NULL);
INSERT INTO `orders` VALUES ('276', '3', 'completed', '6000.00', '3', '2026-01-12 00:52:10', '2026-01-12 01:07:23', NULL);
INSERT INTO `orders` VALUES ('277', '3', 'completed', '5500.00', '4', '2026-01-12 00:55:39', '2026-01-12 01:09:22', NULL);
INSERT INTO `orders` VALUES ('278', '6', 'completed', '3000.00', '5', '2026-01-12 01:07:31', '2026-01-12 01:07:53', NULL);
INSERT INTO `orders` VALUES ('279', '6', 'completed', '3000.00', '2', '2026-01-12 01:10:30', '2026-01-12 01:22:28', NULL);
INSERT INTO `orders` VALUES ('280', '6', 'completed', '3000.00', '3', '2026-01-12 01:11:59', '2026-01-12 01:22:38', NULL);
INSERT INTO `orders` VALUES ('281', '3', 'completed', '5000.00', '1', '2026-01-12 01:18:46', '2026-01-12 01:35:25', NULL);
INSERT INTO `orders` VALUES ('282', '3', 'completed', '5000.00', '2', '2026-01-12 01:25:52', '2026-01-12 01:28:59', NULL);
INSERT INTO `orders` VALUES ('283', '3', 'completed', '11000.00', '2', '2026-01-12 01:41:35', '2026-01-12 02:09:11', NULL);
INSERT INTO `orders` VALUES ('284', '6', 'completed', '2500.00', '1', '2026-01-12 01:42:28', '2026-01-12 01:46:19', NULL);
INSERT INTO `orders` VALUES ('285', '3', 'completed', '5000.00', '4', '2026-01-12 01:42:33', '2026-01-12 01:47:31', NULL);
INSERT INTO `orders` VALUES ('286', '6', 'completed', '5000.00', '1', '2026-01-12 01:54:51', '2026-01-12 02:04:04', NULL);
INSERT INTO `orders` VALUES ('287', '6', 'completed', '3000.00', '1', '2026-01-12 02:04:15', '2026-01-12 02:29:48', NULL);
INSERT INTO `orders` VALUES ('288', '6', 'completed', '3000.00', '4', '2026-01-12 02:06:28', '2026-01-12 02:13:21', NULL);
INSERT INTO `orders` VALUES ('289', '6', 'completed', '6500.00', '3', '2026-01-12 02:10:42', '2026-01-12 02:13:34', NULL);
INSERT INTO `orders` VALUES ('290', '6', 'completed', '3000.00', '2', '2026-01-12 02:15:27', '2026-01-12 02:29:57', NULL);
INSERT INTO `orders` VALUES ('291', '6', 'completed', '4000.00', '3', '2026-01-12 02:29:28', '2026-01-12 02:38:09', NULL);
INSERT INTO `orders` VALUES ('292', '3', 'completed', '45500.00', '2', '2026-01-12 02:31:18', '2026-01-12 03:09:45', NULL);
INSERT INTO `orders` VALUES ('293', '6', 'completed', '7500.00', '1', '2026-01-12 02:34:18', '2026-01-12 03:00:43', NULL);
INSERT INTO `orders` VALUES ('294', '3', 'completed', '3000.00', '4', '2026-01-12 02:39:51', '2026-01-12 03:01:04', NULL);
INSERT INTO `orders` VALUES ('295', '6', 'completed', '6000.00', '3', '2026-01-12 02:40:46', '2026-01-12 03:00:24', NULL);
INSERT INTO `orders` VALUES ('296', '3', 'completed', '6500.00', '5', '2026-01-12 02:52:15', '2026-01-12 04:34:26', NULL);
INSERT INTO `orders` VALUES ('297', '6', 'completed', '3500.00', '1', '2026-01-12 03:09:07', '2026-01-12 03:10:30', NULL);
INSERT INTO `orders` VALUES ('298', '3', 'completed', '2000.00', '1', '2026-01-12 03:22:07', '2026-01-12 03:37:03', NULL);
INSERT INTO `orders` VALUES ('299', '6', 'completed', '3000.00', '1', '2026-01-12 03:40:40', '2026-01-12 03:55:12', NULL);
INSERT INTO `orders` VALUES ('300', '6', 'completed', '3000.00', '2', '2026-01-12 03:53:55', '2026-01-12 04:10:37', NULL);
INSERT INTO `orders` VALUES ('301', '3', 'completed', '16000.00', '1', '2026-01-12 05:14:07', '2026-01-12 06:03:17', NULL);
INSERT INTO `orders` VALUES ('302', '3', 'completed', '11500.00', '1', '2026-01-12 10:37:08', '2026-01-12 10:46:58', NULL);
INSERT INTO `orders` VALUES ('303', '3', 'completed', '8500.00', '1', '2026-01-12 10:49:23', '2026-01-12 10:52:14', NULL);
INSERT INTO `orders` VALUES ('304', '3', 'completed', '4500.00', '1', '2026-01-12 10:56:33', '2026-01-12 11:32:51', NULL);
INSERT INTO `orders` VALUES ('305', '6', 'completed', '5500.00', '2', '2026-01-12 11:05:57', '2026-01-12 11:16:54', NULL);
INSERT INTO `orders` VALUES ('306', '3', 'completed', '8000.00', '2', '2026-01-12 11:32:18', '2026-01-12 11:33:02', NULL);
INSERT INTO `orders` VALUES ('307', '6', 'completed', '4000.00', '3', '2026-01-12 11:35:26', '2026-01-12 11:39:09', NULL);
INSERT INTO `orders` VALUES ('308', '6', 'completed', '1000.00', '1', '2026-01-12 11:35:58', '2026-01-12 11:36:19', NULL);
INSERT INTO `orders` VALUES ('309', '3', 'completed', '1000.00', '1', '2026-01-12 11:37:23', '2026-01-12 11:40:34', NULL);
INSERT INTO `orders` VALUES ('310', '3', 'completed', '2500.00', '1', '2026-01-12 11:43:00', '2026-01-12 12:01:40', NULL);
INSERT INTO `orders` VALUES ('311', '6', 'completed', '3500.00', '2', '2026-01-12 11:52:28', '2026-01-12 11:54:56', NULL);
INSERT INTO `orders` VALUES ('312', '6', 'completed', '6500.00', '3', '2026-01-12 11:54:34', '2026-01-12 12:19:12', NULL);
INSERT INTO `orders` VALUES ('313', '6', 'completed', '1000.00', '2', '2026-01-12 11:58:35', '2026-01-12 12:01:17', NULL);
INSERT INTO `orders` VALUES ('314', '3', 'completed', '12500.00', '1', '2026-01-12 12:12:30', '2026-01-12 13:08:52', NULL);
INSERT INTO `orders` VALUES ('315', '3', 'completed', '1000.00', '1', '2026-01-12 13:09:14', '2026-01-13 12:04:30', NULL);
INSERT INTO `orders` VALUES ('316', '6', 'completed', '5000.00', '1', '2026-01-13 00:19:12', '2026-01-13 12:04:28', NULL);
INSERT INTO `orders` VALUES ('317', '3', 'completed', '189500.00', '1', '2026-01-13 12:11:18', '2026-01-13 12:11:37', NULL);
INSERT INTO `orders` VALUES ('318', '3', 'completed', '3500.00', '1', '2026-01-13 12:24:06', '2026-01-13 12:56:10', NULL);
INSERT INTO `orders` VALUES ('319', '6', 'completed', '5000.00', '2', '2026-01-13 12:37:56', '2026-01-13 12:38:23', NULL);
INSERT INTO `orders` VALUES ('320', '3', 'completed', '1500.00', '2', '2026-01-13 12:42:11', '2026-01-14 00:34:14', NULL);
INSERT INTO `orders` VALUES ('321', '6', 'completed', '3500.00', '1', '2026-01-13 13:27:29', '2026-01-13 13:32:23', NULL);
INSERT INTO `orders` VALUES ('322', '3', 'completed', '5000.00', '1', '2026-01-13 13:34:58', '2026-01-13 13:35:19', NULL);
INSERT INTO `orders` VALUES ('323', '6', 'completed', '2000.00', '1', '2026-01-14 00:16:25', '2026-01-14 00:32:36', NULL);
INSERT INTO `orders` VALUES ('324', '3', 'completed', '3000.00', '2', '2026-01-14 00:23:48', '2026-01-14 00:34:04', NULL);
INSERT INTO `orders` VALUES ('325', '3', 'completed', '7500.00', '3', '2026-01-14 00:25:54', '2026-01-14 00:51:29', NULL);
INSERT INTO `orders` VALUES ('326', '3', 'completed', '3000.00', '2', '2026-01-14 00:51:39', '2026-01-14 01:05:35', NULL);
INSERT INTO `orders` VALUES ('327', '3', 'completed', '2500.00', '1', '2026-01-14 00:53:12', '2026-01-14 01:05:50', NULL);
INSERT INTO `orders` VALUES ('328', '3', 'completed', '2500.00', '3', '2026-01-14 01:00:38', '2026-01-14 01:06:00', NULL);
INSERT INTO `orders` VALUES ('329', '3', 'completed', '8000.00', '1', '2026-01-14 01:11:23', '2026-01-14 01:42:35', NULL);
INSERT INTO `orders` VALUES ('330', '3', 'completed', '2500.00', '2', '2026-01-14 01:15:21', '2026-01-14 01:28:18', NULL);
INSERT INTO `orders` VALUES ('331', '3', 'completed', '12000.00', '10', '2026-01-14 01:19:54', '2026-01-14 02:08:26', NULL);
INSERT INTO `orders` VALUES ('332', '3', 'completed', '2500.00', '3', '2026-01-14 01:22:26', '2026-01-14 01:22:47', NULL);
INSERT INTO `orders` VALUES ('333', '3', 'completed', '3000.00', '1', '2026-01-14 01:49:59', '2026-01-14 01:51:40', NULL);
INSERT INTO `orders` VALUES ('334', '3', 'completed', '1000.00', '1', '2026-01-14 01:54:51', '2026-01-14 02:11:10', NULL);
INSERT INTO `orders` VALUES ('335', '6', 'completed', '3000.00', '2', '2026-01-14 02:05:46', '2026-01-14 02:21:24', NULL);
INSERT INTO `orders` VALUES ('336', '6', 'completed', '3000.00', '1', '2026-01-14 02:30:52', '2026-01-14 02:39:46', NULL);
INSERT INTO `orders` VALUES ('337', '3', 'completed', '6000.00', '1', '2026-01-14 09:20:25', '2026-01-14 09:35:26', NULL);
INSERT INTO `orders` VALUES ('338', '6', 'completed', '3000.00', '2', '2026-01-14 09:30:24', '2026-01-14 09:36:58', NULL);
INSERT INTO `orders` VALUES ('339', '6', 'completed', '5000.00', '3', '2026-01-14 09:31:54', '2026-01-14 09:35:58', NULL);
INSERT INTO `orders` VALUES ('340', '6', 'completed', '2500.00', '4', '2026-01-14 09:32:43', '2026-01-14 09:45:19', NULL);
INSERT INTO `orders` VALUES ('341', '6', 'completed', '2500.00', '5', '2026-01-14 09:33:47', '2026-01-14 09:34:11', NULL);
INSERT INTO `orders` VALUES ('342', '3', 'completed', '3000.00', '1', '2026-01-14 09:36:00', '2026-01-14 09:45:12', NULL);
INSERT INTO `orders` VALUES ('343', '6', 'completed', '3000.00', '2', '2026-01-14 09:37:46', '2026-01-14 09:49:52', NULL);
INSERT INTO `orders` VALUES ('344', '3', 'completed', '6000.00', '1', '2026-01-14 09:48:25', '2026-01-14 10:03:43', NULL);
INSERT INTO `orders` VALUES ('345', '3', 'completed', '6500.00', '1', '2026-01-14 10:04:34', '2026-01-14 10:05:41', NULL);
INSERT INTO `orders` VALUES ('346', '6', 'completed', '7500.00', '1', '2026-01-14 10:12:30', '2026-01-14 11:03:22', NULL);
INSERT INTO `orders` VALUES ('347', '6', 'completed', '4000.00', '2', '2026-01-14 10:21:55', '2026-01-14 10:27:19', NULL);
INSERT INTO `orders` VALUES ('348', '3', 'completed', '13500.00', '2', '2026-01-14 10:32:12', '2026-01-14 10:44:13', NULL);
INSERT INTO `orders` VALUES ('349', '6', 'completed', '3500.00', '2', '2026-01-14 10:58:31', '2026-01-14 11:21:51', NULL);
INSERT INTO `orders` VALUES ('350', '6', 'completed', '3000.00', '1', '2026-01-14 11:03:57', '2026-01-14 11:05:48', NULL);
INSERT INTO `orders` VALUES ('351', '6', 'completed', '3500.00', '1', '2026-01-14 11:14:01', '2026-01-14 11:19:43', NULL);
INSERT INTO `orders` VALUES ('352', '6', 'completed', '2500.00', '1', '2026-01-14 11:29:59', '2026-01-14 11:41:51', NULL);
INSERT INTO `orders` VALUES ('353', '6', 'completed', '3000.00', '2', '2026-01-14 11:33:59', '2026-01-14 11:42:14', NULL);
INSERT INTO `orders` VALUES ('354', '6', 'completed', '2500.00', '3', '2026-01-14 11:35:15', '2026-01-14 12:08:24', NULL);
INSERT INTO `orders` VALUES ('355', '6', 'completed', '3000.00', '4', '2026-01-14 11:38:05', '2026-01-14 11:48:55', NULL);
INSERT INTO `orders` VALUES ('356', '6', 'completed', '7500.00', '1', '2026-01-14 11:45:20', '2026-01-14 12:01:37', NULL);
INSERT INTO `orders` VALUES ('357', '3', 'completed', '3000.00', '2', '2026-01-14 11:46:48', '2026-01-14 11:53:05', NULL);
INSERT INTO `orders` VALUES ('358', '6', 'completed', '1500.00', '1', '2026-01-14 13:44:37', '2026-01-14 13:50:41', NULL);
INSERT INTO `orders` VALUES ('359', '3', 'completed', '7000.00', '1', '2026-01-14 15:45:44', '2026-01-14 16:02:06', NULL);
INSERT INTO `orders` VALUES ('360', '3', 'completed', '3000.00', '2', '2026-01-14 15:51:32', '2026-01-14 16:02:46', NULL);
INSERT INTO `orders` VALUES ('361', '3', 'completed', '2500.00', '3', '2026-01-14 15:59:29', '2026-01-14 16:32:13', NULL);
INSERT INTO `orders` VALUES ('362', '3', 'completed', '2500.00', '1', '2026-01-14 17:01:52', '2026-01-14 17:12:06', NULL);
INSERT INTO `orders` VALUES ('363', '6', 'completed', '3500.00', '2', '2026-01-14 17:08:35', '2026-01-14 17:11:31', NULL);
INSERT INTO `orders` VALUES ('364', '6', 'completed', '3000.00', '2', '2026-01-14 17:18:26', '2026-01-14 17:28:53', NULL);
INSERT INTO `orders` VALUES ('365', '6', 'completed', '1500.00', '2', '2026-01-14 17:35:57', '2026-01-14 17:59:52', NULL);
INSERT INTO `orders` VALUES ('366', '6', 'completed', '2500.00', '1', '2026-01-14 17:58:40', '2026-01-14 18:00:50', NULL);
INSERT INTO `orders` VALUES ('367', '3', 'completed', '2500.00', '1', '2026-01-14 18:01:44', '2026-01-14 18:03:19', NULL);
INSERT INTO `orders` VALUES ('368', '3', 'completed', '2500.00', '1', '2026-01-14 18:04:16', '2026-01-14 18:08:30', NULL);
INSERT INTO `orders` VALUES ('369', '3', 'completed', '2500.00', '1', '2026-01-14 18:26:13', '2026-01-14 18:26:45', NULL);
INSERT INTO `orders` VALUES ('370', '6', 'completed', '5500.00', '1', '2026-01-14 18:38:09', '2026-01-14 18:51:30', NULL);
INSERT INTO `orders` VALUES ('371', '3', 'completed', '3500.00', '2', '2026-01-14 18:43:45', '2026-01-14 19:39:05', NULL);
INSERT INTO `orders` VALUES ('372', '6', 'completed', '6000.00', '3', '2026-01-14 18:45:29', '2026-01-14 19:06:55', NULL);
INSERT INTO `orders` VALUES ('373', '3', 'completed', '4000.00', '4', '2026-01-14 18:50:52', '2026-01-14 18:53:15', NULL);
INSERT INTO `orders` VALUES ('374', '3', 'completed', '11000.00', '1', '2026-01-14 19:14:08', '2026-01-14 19:14:56', NULL);
INSERT INTO `orders` VALUES ('375', '3', 'completed', '5000.00', '1', '2026-01-14 19:45:37', '2026-01-14 19:57:50', NULL);
INSERT INTO `orders` VALUES ('376', '6', 'completed', '2500.00', '1', '2026-01-15 06:11:06', '2026-01-15 06:44:59', NULL);
INSERT INTO `orders` VALUES ('377', '6', 'completed', '5000.00', '1', '2026-01-15 06:46:38', '2026-01-15 06:51:30', NULL);
INSERT INTO `orders` VALUES ('378', '6', 'completed', '3500.00', '2', '2026-01-15 06:49:26', '2026-01-15 07:12:42', NULL);
INSERT INTO `orders` VALUES ('379', '6', 'completed', '6000.00', '1', '2026-01-15 06:55:34', '2026-01-15 07:30:02', NULL);
INSERT INTO `orders` VALUES ('380', '6', 'completed', '4000.00', '3', '2026-01-15 07:07:33', '2026-01-15 07:29:52', NULL);
INSERT INTO `orders` VALUES ('381', '6', 'completed', '1500.00', '4', '2026-01-15 07:11:33', '2026-01-15 07:23:46', NULL);
INSERT INTO `orders` VALUES ('382', '3', 'completed', '3000.00', '2', '2026-01-15 07:15:38', '2026-01-15 07:40:56', NULL);
INSERT INTO `orders` VALUES ('383', '6', 'completed', '13500.00', '1', '2026-01-15 07:31:02', '2026-01-15 07:35:20', NULL);
INSERT INTO `orders` VALUES ('384', '3', 'completed', '3000.00', '1', '2026-01-15 07:40:48', '2026-01-15 07:53:23', NULL);
INSERT INTO `orders` VALUES ('385', '6', 'completed', '3000.00', '2', '2026-01-15 07:41:30', '2026-01-15 07:44:52', NULL);
INSERT INTO `orders` VALUES ('386', '3', 'completed', '6000.00', '2', '2026-01-15 07:45:27', '2026-01-15 08:01:49', NULL);
INSERT INTO `orders` VALUES ('387', '3', 'completed', '6000.00', '3', '2026-01-15 07:46:15', '2026-01-15 09:30:13', NULL);
INSERT INTO `orders` VALUES ('388', '6', 'completed', '2500.00', '1', '2026-01-15 08:05:33', '2026-01-15 08:07:15', NULL);
INSERT INTO `orders` VALUES ('389', '3', 'cancelled', '0.00', '1', '2026-01-15 08:19:33', '2026-01-15 08:25:20', NULL);
INSERT INTO `orders` VALUES ('390', '6', 'completed', '10500.00', '2', '2026-01-15 08:21:00', '2026-01-15 08:36:49', NULL);
INSERT INTO `orders` VALUES ('391', '3', 'completed', '6000.00', '3', '2026-01-15 08:31:21', '2026-01-15 08:39:06', NULL);
INSERT INTO `orders` VALUES ('392', '3', 'completed', '34000.00', '1', '2026-01-15 08:35:50', '2026-01-15 08:39:27', NULL);
INSERT INTO `orders` VALUES ('393', '6', 'completed', '6000.00', '1', '2026-01-15 08:54:44', '2026-01-15 08:56:05', NULL);
INSERT INTO `orders` VALUES ('394', '6', 'completed', '2500.00', '1', '2026-01-15 09:09:18', '2026-01-15 09:12:36', NULL);
INSERT INTO `orders` VALUES ('395', '6', 'completed', '3000.00', '2', '2026-01-15 09:09:46', '2026-01-15 09:12:47', NULL);
INSERT INTO `orders` VALUES ('396', '3', 'completed', '5500.00', '1', '2026-01-15 09:15:46', '2026-01-15 09:34:26', NULL);
INSERT INTO `orders` VALUES ('397', '3', 'completed', '3000.00', '2', '2026-01-15 09:23:02', '2026-01-15 09:32:43', NULL);
INSERT INTO `orders` VALUES ('398', '6', 'completed', '6000.00', '3', '2026-01-15 09:23:35', '2026-01-15 09:30:06', NULL);
INSERT INTO `orders` VALUES ('399', '3', 'completed', '3000.00', '2', '2026-01-15 09:34:13', '2026-01-15 09:49:58', NULL);
INSERT INTO `orders` VALUES ('400', '3', 'completed', '3000.00', '1', '2026-01-15 09:44:17', '2026-01-15 09:51:07', NULL);
INSERT INTO `orders` VALUES ('401', '6', 'completed', '3000.00', '1', '2026-01-15 09:55:57', '2026-01-15 10:10:37', NULL);
INSERT INTO `orders` VALUES ('402', '3', 'completed', '3000.00', '1', '2026-01-15 10:11:06', '2026-01-15 10:13:16', NULL);
INSERT INTO `orders` VALUES ('403', '6', 'completed', '4000.00', '1', '2026-01-15 15:08:11', '2026-01-15 15:10:12', NULL);
INSERT INTO `orders` VALUES ('404', '3', 'completed', '2000.00', '1', '2026-01-15 15:29:58', '2026-01-15 16:01:59', NULL);
INSERT INTO `orders` VALUES ('405', '6', 'completed', '2500.00', '2', '2026-01-15 15:37:11', '2026-01-15 15:48:57', NULL);
INSERT INTO `orders` VALUES ('406', '6', 'completed', '6000.00', '3', '2026-01-15 15:39:22', '2026-01-15 15:41:46', NULL);
INSERT INTO `orders` VALUES ('407', '6', 'completed', '11500.00', '1', '2026-01-15 15:54:43', '2026-01-15 15:58:05', NULL);
INSERT INTO `orders` VALUES ('408', '3', 'completed', '5500.00', '2', '2026-01-15 15:56:55', '2026-01-15 16:13:47', NULL);
INSERT INTO `orders` VALUES ('409', '3', 'completed', '2500.00', '1', '2026-01-15 16:05:23', '2026-01-15 16:20:58', NULL);
INSERT INTO `orders` VALUES ('410', '6', 'completed', '6000.00', '3', '2026-01-15 16:08:08', '2026-01-15 16:25:00', NULL);
INSERT INTO `orders` VALUES ('411', '3', 'completed', '6000.00', '1', '2026-01-15 16:23:41', '2026-01-15 16:43:25', NULL);
INSERT INTO `orders` VALUES ('412', '3', 'completed', '8500.00', '2', '2026-01-15 16:26:03', '2026-01-15 16:44:54', NULL);
INSERT INTO `orders` VALUES ('413', '6', 'completed', '4500.00', '3', '2026-01-15 16:31:33', '2026-01-15 16:39:40', NULL);
INSERT INTO `orders` VALUES ('414', '6', 'completed', '9000.00', '5', '2026-01-15 16:47:32', '2026-01-15 16:54:16', NULL);


-- Table structure for `password_reset_tokens`

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



-- Table structure for `role_user`

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `role_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `role_user_user_id_foreign` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `role_user`

INSERT INTO `role_user` VALUES ('1', '1');
INSERT INTO `role_user` VALUES ('1', '2');
INSERT INTO `role_user` VALUES ('2', '3');
INSERT INTO `role_user` VALUES ('3', '4');
INSERT INTO `role_user` VALUES ('4', '5');
INSERT INTO `role_user` VALUES ('2', '6');


-- Table structure for `roles`

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `roles`

INSERT INTO `roles` VALUES ('1', 'admin', NULL, NULL);
INSERT INTO `roles` VALUES ('2', 'waiter', NULL, NULL);
INSERT INTO `roles` VALUES ('3', 'kitchen', NULL, NULL);
INSERT INTO `roles` VALUES ('4', 'supplier', NULL, NULL);


-- Table structure for `sessions`

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `sessions`

INSERT INTO `sessions` VALUES ('1jllg09drOi0fCLvFvuhkPbpenBXqqO85rI0OO5c', '4', '45.125.4.131', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRlA2cGlsc2RYMVFtSnlCMkQ1eFozRjNHSlA5WnlmN2UwTFFhRW5mNyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjM1OiJodHRwczovL3Bvcy5tb2VzdGFydHJhdmVsLmNvbS9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjQ7fQ==', '1768466395');
INSERT INTO `sessions` VALUES ('1w82Itj5CMUblJyMqbZUKzcEbkxpugUtWyeH5nqI', NULL, '93.123.109.219', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVW91dnhpZHJ5UnlLNGwzUDA4cW5BZW9lVkk1QkVabWVUUk5OQUxSSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vZWNvbW1lcmVuY2VhcGkuc2F3aHR1dG5haW5nLmNvbSI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1768469315');
INSERT INTO `sessions` VALUES ('3OJYPdXWYRVp6veRM4UVqUILWHgwJlTyCBgkb2ue', '3', '45.125.4.131', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidTU1SzdUMmhSOWh3Mmt4Q0NJWlhleDJiTElVTGZxMzUyTkFKS1RsTCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vcG9zLm1vZXN0YXJ0cmF2ZWwuY29tL2xvZ2luIjtzOjU6InJvdXRlIjtzOjU6ImxvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mzt9', '1768467538');
INSERT INTO `sessions` VALUES ('8jV9GPebHK9wtKH4iYJiGDe1MDSTRq46jKMAcwwl', NULL, '5.181.86.69', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlZzdXhUbHQ0WjBIb1laaGM1ajRLUWlCQURNOGlDV1p2bDVvWkRiSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vMTUwLjk1LjgxLjEwMyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1768469888');
INSERT INTO `sessions` VALUES ('8t1b7XfuAa4bZQz6UjvI1GcUQaTq4gRGsPS847WW', '4', '45.125.4.131', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZjBpTUZQVTI2bmlhem4wVFB2bmxHd1dMblBlTHlqUzhrYWhPbmwyMyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjUwOiJodHRwczovL3Bvcy5tb2VzdGFydHJhdmVsLmNvbS9raXRjaGVuL29yZGVycy9mZXRjaCI7czo1OiJyb3V0ZSI7czoyMDoia2l0Y2hlbi5vcmRlcnMuZmV0Y2giO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo0O30=', '1768472818');
INSERT INTO `sessions` VALUES ('dJfGhrN2TnOdGUflWpLIrSazltfGwAzIwEIfh0ix', '3', '45.125.4.131', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWE5jNHVaR0xmcFR0RkRxYktQTkNUTDc3SXNQRmo5T3dySXNRVjBKQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vcG9zLm1vZXN0YXJ0cmF2ZWwuY29tL3dhaXRlci9mZXRjaC1zdGF0dXNlcyI7czo1OiJyb3V0ZSI7czoyODoid2FpdGVyLnRhYmxlcy5mZXRjaC1zdGF0dXNlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7fQ==', '1768472539');
INSERT INTO `sessions` VALUES ('FGivxAoRRMZQV6Zx9pQcaK0yKROIZ0fzuyaOr2XF', NULL, '93.123.109.219', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGZVTzdLOGhVVk5QdHlDNXliVW9tVHpzdUJkcklIeHB4dWNMWmZpMyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vMTUwLjk1LjgxLjEwMyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1768469337');
INSERT INTO `sessions` VALUES ('fkiyIXqlcoj64hBvtytsVFMGkJ0zBiA46J16zGI2', NULL, '184.105.247.194', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 YaBrowser/24.1.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0dVT2xTbG1UOTJzRHkwdEhlT0thZTV0bGtPZXRob09UN0FGWDQxcyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vMTUwLjk1LjgxLjEwMyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1768468306');
INSERT INTO `sessions` VALUES ('fwkaaOSriWN0yMa9ehcaDUnAyOe3r18qbhfbRURt', NULL, '184.105.247.194', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 YaBrowser/24.1.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHAyRURCWFdlSGhqVVNSQ2xObVdrWkJlaFRya2tlaG9nNnZkQTJBdCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vMTUwLjk1LjgxLjEwMyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1768469013');
INSERT INTO `sessions` VALUES ('jcw52gD26AMQhkp4EwtJfeuF3rSlMHxiiNVpPAxn', '5', '45.125.4.131', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZGRsODRTVXhRTkpUTEZxMHNMU0JHd1Y0SGg5YnN4bUdPWHhyUVlKUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vcG9zLm1vZXN0YXJ0cmF2ZWwuY29tL3N1cHBsaWVyIjtzOjU6InJvdXRlIjtzOjM0OiJzdXBwbGllci5pbmdyZWRpZW50cy5pbXBvcnQuY3JlYXRlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NTt9', '1768468792');
INSERT INTO `sessions` VALUES ('JMJB79ZWinXdbEKpa5wURE2Vi7eUqqf6uA5RMhFH', NULL, '92.222.104.207', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjF0OXBRMUpQWlhFTWtBeWdta2hEMzRRSWRwZzNQSGZudnhQeDFRQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vd3d3LnNhd2h0dXRuYWluZy5jb20iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', '1768469848');
INSERT INTO `sessions` VALUES ('nXmVYz0qeWYRTByLvYYRjtkmZwMsV97Gkxklbzh9', NULL, '93.123.109.219', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicTVmVXhycG9hOUJjTXRYbUdmbTYxYnc5d3BBWnBwZVh5VjVXVlc0aCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vY291cnNlLXRyYWluaW5nLnNhd2h0dXRuYWluZy5jb20iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', '1768469319');
INSERT INTO `sessions` VALUES ('qbvuC1bgWAR0RZiK7xJG4USFUgag0xVkpUWRcJMR', '1', '157.245.155.115', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.2 Mobile/15E148 Safari/604.1', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSk80QU1FbVRhR1UzT1BJQ2pkOW5YcFRZVkRkN0FhNTR4NTRQdFFoZiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjQyOiJodHRwczovL3Bvcy5tb2VzdGFydHJhdmVsLmNvbS9hZG1pbi9vcmRlcnMiO3M6NToicm91dGUiO3M6MTg6ImFkbWluLm9yZGVycy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', '1768472070');
INSERT INTO `sessions` VALUES ('S72bvdOEiovFwBL7DOYaNnU9HKoD79dD3MRrfXtK', NULL, '5.181.86.69', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ01DTnozem5mVFhYV3hQWElId0hRNTVDWnd0elZ4cGhTeTgwQkdkTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vMTUwLjk1LjgxLjEwMyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1768469891');
INSERT INTO `sessions` VALUES ('vR4QCJELNqr0yDUkUEMqHSuMD4Yb7UzgVrZqy5u7', '1', '202.165.86.88', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibnFTUEx3V3lrakduTk5lSmlWOFJFTmwybEh5SEh1blNKTGpXdEpRRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vcG9zLm1vZXN0YXJ0cmF2ZWwuY29tL2FkbWluIjtzOjU6InJvdXRlIjtzOjE1OiJhZG1pbi5kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', '1768472922');
INSERT INTO `sessions` VALUES ('ZHGDy9ckexEk2F2RtN9f7ZnUzAj32zHl7nnApDx3', '5', '45.125.4.131', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaTEwRVJjWWdrYnNoRHoxdjZldzJ1VmVMZWhVNU51UW1XZmU4SDhJYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vcG9zLm1vZXN0YXJ0cmF2ZWwuY29tL2xvZ2luIjtzOjU6InJvdXRlIjtzOjU6ImxvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NTt9', '1768468633');
INSERT INTO `sessions` VALUES ('ZNjOesROywCXKXfT1XzzM7IcjeEyVqVNX2cvwppw', '6', '45.125.4.131', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWDhyNndoSE96UkJmd2JEeUVTQmF2bFNzNVozQWYwVXBFWlhwWUozeCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NjtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czo1ODoiaHR0cHM6Ly9wb3MubW9lc3RhcnRyYXZlbC5jb20vd2FpdGVyL3RhYmxlcy81L2ZldGNoLW9yZGVycyI7czo1OiJyb3V0ZSI7czoyNToid2FpdGVyLnRhYmxlcy5mZXRjaE9yZGVycyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', '1768472773');


-- Table structure for `table_bill_out_records`

DROP TABLE IF EXISTS `table_bill_out_records`;
CREATE TABLE `table_bill_out_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `table_id` bigint unsigned NOT NULL,
  `order_id` bigint unsigned NOT NULL,
  `total_money` decimal(8,2) NOT NULL,
  `billed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `table_bill_out_records_user_id_foreign` (`user_id`),
  KEY `table_bill_out_records_table_id_foreign` (`table_id`),
  KEY `table_bill_out_records_order_id_foreign` (`order_id`),
  CONSTRAINT `table_bill_out_records_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `table_bill_out_records_table_id_foreign` FOREIGN KEY (`table_id`) REFERENCES `tables` (`id`),
  CONSTRAINT `table_bill_out_records_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `table_bill_out_records`

INSERT INTO `table_bill_out_records` VALUES ('8', '3', '1', '20', '3500.00', '2026-01-07 02:19:54', '2026-01-07 02:19:54', '2026-01-07 02:19:54');
INSERT INTO `table_bill_out_records` VALUES ('9', '3', '1', '21', '6000.00', '2026-01-07 02:22:38', '2026-01-07 02:22:38', '2026-01-07 02:22:38');
INSERT INTO `table_bill_out_records` VALUES ('10', '3', '1', '22', '9000.00', '2026-01-07 02:28:31', '2026-01-07 02:28:31', '2026-01-07 02:28:31');
INSERT INTO `table_bill_out_records` VALUES ('11', '3', '1', '23', '13500.00', '2026-01-07 02:34:21', '2026-01-07 02:34:21', '2026-01-07 02:34:21');
INSERT INTO `table_bill_out_records` VALUES ('12', '3', '1', '25', '0.00', '2026-01-07 02:41:46', '2026-01-07 02:41:46', '2026-01-07 02:41:46');
INSERT INTO `table_bill_out_records` VALUES ('13', '3', '1', '26', '13500.00', '2026-01-07 02:44:11', '2026-01-07 02:44:11', '2026-01-07 02:44:11');
INSERT INTO `table_bill_out_records` VALUES ('14', '3', '1', '27', '3000.00', '2026-01-07 02:53:49', '2026-01-07 02:53:49', '2026-01-07 02:53:49');
INSERT INTO `table_bill_out_records` VALUES ('15', '3', '1', '28', '12500.00', '2026-01-07 03:09:23', '2026-01-07 03:09:23', '2026-01-07 03:09:23');
INSERT INTO `table_bill_out_records` VALUES ('16', '3', '1', '29', '2500.00', '2026-01-07 03:14:14', '2026-01-07 03:14:14', '2026-01-07 03:14:14');
INSERT INTO `table_bill_out_records` VALUES ('17', '3', '1', '30', '16500.00', '2026-01-07 03:16:37', '2026-01-07 03:16:37', '2026-01-07 03:16:37');
INSERT INTO `table_bill_out_records` VALUES ('18', '3', '1', '31', '3000.00', '2026-01-07 03:24:49', '2026-01-07 03:24:49', '2026-01-07 03:24:49');
INSERT INTO `table_bill_out_records` VALUES ('19', '3', '1', '32', '3000.00', '2026-01-07 03:59:36', '2026-01-07 03:59:36', '2026-01-07 03:59:36');
INSERT INTO `table_bill_out_records` VALUES ('20', '3', '1', '33', '4000.00', '2026-01-07 04:38:52', '2026-01-07 04:38:52', '2026-01-07 04:38:52');
INSERT INTO `table_bill_out_records` VALUES ('21', '3', '1', '34', '1000.00', '2026-01-07 04:39:39', '2026-01-07 04:39:39', '2026-01-07 04:39:39');
INSERT INTO `table_bill_out_records` VALUES ('22', '3', '1', '35', '13000.00', '2026-01-07 05:02:36', '2026-01-07 05:02:36', '2026-01-07 05:02:36');
INSERT INTO `table_bill_out_records` VALUES ('23', '3', '1', '36', '5500.00', '2026-01-07 06:32:07', '2026-01-07 06:32:07', '2026-01-07 06:32:07');
INSERT INTO `table_bill_out_records` VALUES ('24', '3', '1', '37', '3000.00', '2026-01-07 06:49:59', '2026-01-07 06:49:59', '2026-01-07 06:49:59');
INSERT INTO `table_bill_out_records` VALUES ('25', '3', '1', '38', '2500.00', '2026-01-07 07:52:56', '2026-01-07 07:52:56', '2026-01-07 07:52:56');
INSERT INTO `table_bill_out_records` VALUES ('26', '6', '1', '41', '9500.00', '2026-01-07 09:06:45', '2026-01-07 09:06:45', '2026-01-07 09:06:45');
INSERT INTO `table_bill_out_records` VALUES ('27', '3', '2', '43', '0.00', '2026-01-07 09:21:13', '2026-01-07 09:21:13', '2026-01-07 09:21:13');
INSERT INTO `table_bill_out_records` VALUES ('28', '3', '2', '49', '3000.00', '2026-01-07 10:01:42', '2026-01-07 10:01:42', '2026-01-07 10:01:42');
INSERT INTO `table_bill_out_records` VALUES ('29', '3', '3', '48', '500.00', '2026-01-07 10:12:15', '2026-01-07 10:12:15', '2026-01-07 10:12:15');
INSERT INTO `table_bill_out_records` VALUES ('30', '6', '3', '53', '6000.00', '2026-01-07 10:14:04', '2026-01-07 10:14:04', '2026-01-07 10:14:04');
INSERT INTO `table_bill_out_records` VALUES ('31', '3', '4', '51', '6000.00', '2026-01-07 10:25:34', '2026-01-07 10:25:34', '2026-01-07 10:25:34');
INSERT INTO `table_bill_out_records` VALUES ('32', '3', '1', '45', '12500.00', '2026-01-07 11:15:49', '2026-01-07 11:15:49', '2026-01-07 11:15:49');
INSERT INTO `table_bill_out_records` VALUES ('33', '3', '1', '57', '500.00', '2026-01-07 11:44:05', '2026-01-07 11:44:05', '2026-01-07 11:44:05');
INSERT INTO `table_bill_out_records` VALUES ('34', '6', '3', '60', '10000.00', '2026-01-07 12:15:01', '2026-01-07 12:15:01', '2026-01-07 12:15:01');
INSERT INTO `table_bill_out_records` VALUES ('35', '3', '2', '56', '10500.00', '2026-01-07 12:21:47', '2026-01-07 12:21:47', '2026-01-07 12:21:47');
INSERT INTO `table_bill_out_records` VALUES ('36', '6', '3', '54', '8000.00', '2026-01-07 12:29:32', '2026-01-07 12:29:32', '2026-01-07 12:29:32');
INSERT INTO `table_bill_out_records` VALUES ('37', '6', '3', '53', '6000.00', '2026-01-07 12:29:35', '2026-01-07 12:29:35', '2026-01-07 12:29:35');
INSERT INTO `table_bill_out_records` VALUES ('38', '3', '1', '58', '3000.00', '2026-01-07 12:31:20', '2026-01-07 12:31:20', '2026-01-07 12:31:20');
INSERT INTO `table_bill_out_records` VALUES ('39', '3', '2', '52', '500.00', '2026-01-07 13:02:18', '2026-01-07 13:02:18', '2026-01-07 13:02:18');
INSERT INTO `table_bill_out_records` VALUES ('40', '3', '1', '63', '3000.00', '2026-01-07 13:17:37', '2026-01-07 13:17:37', '2026-01-07 13:17:37');
INSERT INTO `table_bill_out_records` VALUES ('41', '3', '1', '59', '10000.00', '2026-01-07 13:17:57', '2026-01-07 13:17:57', '2026-01-07 13:17:57');
INSERT INTO `table_bill_out_records` VALUES ('42', '3', '1', '55', '7000.00', '2026-01-07 13:17:59', '2026-01-07 13:17:59', '2026-01-07 13:17:59');
INSERT INTO `table_bill_out_records` VALUES ('43', '3', '1', '44', '3000.00', '2026-01-07 13:17:59', '2026-01-07 13:17:59', '2026-01-07 13:17:59');
INSERT INTO `table_bill_out_records` VALUES ('44', '3', '1', '65', '8500.00', '2026-01-07 13:31:24', '2026-01-07 13:31:24', '2026-01-07 13:31:24');
INSERT INTO `table_bill_out_records` VALUES ('45', '6', '1', '66', '9500.00', '2026-01-08 00:22:25', '2026-01-08 00:22:25', '2026-01-08 00:22:25');
INSERT INTO `table_bill_out_records` VALUES ('46', '6', '1', '67', '3000.00', '2026-01-08 00:26:08', '2026-01-08 00:26:08', '2026-01-08 00:26:08');
INSERT INTO `table_bill_out_records` VALUES ('47', '6', '3', '70', '4000.00', '2026-01-08 00:39:46', '2026-01-08 00:39:46', '2026-01-08 00:39:46');
INSERT INTO `table_bill_out_records` VALUES ('48', '3', '2', '69', '2500.00', '2026-01-08 00:49:03', '2026-01-08 00:49:03', '2026-01-08 00:49:03');
INSERT INTO `table_bill_out_records` VALUES ('49', '6', '1', '68', '10500.00', '2026-01-08 00:50:25', '2026-01-08 00:50:25', '2026-01-08 00:50:25');
INSERT INTO `table_bill_out_records` VALUES ('50', '6', '1', '71', '3000.00', '2026-01-08 01:03:21', '2026-01-08 01:03:21', '2026-01-08 01:03:21');
INSERT INTO `table_bill_out_records` VALUES ('51', '6', '2', '72', '2500.00', '2026-01-08 01:12:15', '2026-01-08 01:12:15', '2026-01-08 01:12:15');
INSERT INTO `table_bill_out_records` VALUES ('52', '6', '1', '73', '15500.00', '2026-01-08 01:27:10', '2026-01-08 01:27:10', '2026-01-08 01:27:10');
INSERT INTO `table_bill_out_records` VALUES ('53', '6', '1', '74', '6000.00', '2026-01-08 01:43:58', '2026-01-08 01:43:58', '2026-01-08 01:43:58');
INSERT INTO `table_bill_out_records` VALUES ('54', '6', '2', '75', '3000.00', '2026-01-08 01:44:11', '2026-01-08 01:44:11', '2026-01-08 01:44:11');
INSERT INTO `table_bill_out_records` VALUES ('55', '6', '1', '76', '5000.00', '2026-01-08 01:55:46', '2026-01-08 01:55:46', '2026-01-08 01:55:46');
INSERT INTO `table_bill_out_records` VALUES ('56', '6', '1', '77', '3000.00', '2026-01-08 02:03:57', '2026-01-08 02:03:57', '2026-01-08 02:03:57');
INSERT INTO `table_bill_out_records` VALUES ('57', '6', '1', '79', '18000.00', '2026-01-08 02:21:31', '2026-01-08 02:21:31', '2026-01-08 02:21:31');
INSERT INTO `table_bill_out_records` VALUES ('58', '6', '2', '78', '9000.00', '2026-01-08 02:27:14', '2026-01-08 02:27:14', '2026-01-08 02:27:14');
INSERT INTO `table_bill_out_records` VALUES ('59', '6', '4', '81', '3500.00', '2026-01-08 02:27:28', '2026-01-08 02:27:28', '2026-01-08 02:27:28');
INSERT INTO `table_bill_out_records` VALUES ('60', '3', '1', '82', '3000.00', '2026-01-08 02:27:46', '2026-01-08 02:27:46', '2026-01-08 02:27:46');
INSERT INTO `table_bill_out_records` VALUES ('61', '6', '3', '80', '3000.00', '2026-01-08 02:27:48', '2026-01-08 02:27:48', '2026-01-08 02:27:48');
INSERT INTO `table_bill_out_records` VALUES ('62', '6', '2', '84', '3500.00', '2026-01-08 03:05:14', '2026-01-08 03:05:14', '2026-01-08 03:05:14');
INSERT INTO `table_bill_out_records` VALUES ('63', '6', '1', '83', '3000.00', '2026-01-08 03:05:45', '2026-01-08 03:05:45', '2026-01-08 03:05:45');
INSERT INTO `table_bill_out_records` VALUES ('64', '6', '2', '86', '2000.00', '2026-01-08 03:15:51', '2026-01-08 03:15:51', '2026-01-08 03:15:51');
INSERT INTO `table_bill_out_records` VALUES ('65', '6', '1', '82', '3000.00', '2026-01-08 03:16:39', '2026-01-08 03:16:39', '2026-01-08 03:16:39');
INSERT INTO `table_bill_out_records` VALUES ('66', '6', '1', '87', '3000.00', '2026-01-08 03:30:41', '2026-01-08 03:30:41', '2026-01-08 03:30:41');
INSERT INTO `table_bill_out_records` VALUES ('67', '3', '1', '88', '3000.00', '2026-01-08 04:13:08', '2026-01-08 04:13:08', '2026-01-08 04:13:08');
INSERT INTO `table_bill_out_records` VALUES ('68', '3', '1', '85', '2500.00', '2026-01-08 04:13:15', '2026-01-08 04:13:15', '2026-01-08 04:13:15');
INSERT INTO `table_bill_out_records` VALUES ('69', '3', '1', '89', '6500.00', '2026-01-08 05:22:08', '2026-01-08 05:22:08', '2026-01-08 05:22:08');
INSERT INTO `table_bill_out_records` VALUES ('70', '3', '2', '64', '3000.00', '2026-01-08 05:23:44', '2026-01-08 05:23:44', '2026-01-08 05:23:44');
INSERT INTO `table_bill_out_records` VALUES ('71', '6', '2', '91', '3000.00', '2026-01-08 06:27:32', '2026-01-08 06:27:32', '2026-01-08 06:27:32');
INSERT INTO `table_bill_out_records` VALUES ('72', '6', '1', '90', '3500.00', '2026-01-08 06:28:24', '2026-01-08 06:28:24', '2026-01-08 06:28:24');
INSERT INTO `table_bill_out_records` VALUES ('73', '6', '1', '92', '3000.00', '2026-01-08 06:37:37', '2026-01-08 06:37:37', '2026-01-08 06:37:37');
INSERT INTO `table_bill_out_records` VALUES ('74', '6', '1', '93', '2500.00', '2026-01-08 07:19:38', '2026-01-08 07:19:38', '2026-01-08 07:19:38');
INSERT INTO `table_bill_out_records` VALUES ('75', '6', '2', '61', '5000.00', '2026-01-08 08:43:10', '2026-01-08 08:43:10', '2026-01-08 08:43:10');
INSERT INTO `table_bill_out_records` VALUES ('76', '6', '3', '96', '3000.00', '2026-01-08 08:52:51', '2026-01-08 08:52:51', '2026-01-08 08:52:51');
INSERT INTO `table_bill_out_records` VALUES ('77', '3', '2', '95', '7000.00', '2026-01-08 09:05:15', '2026-01-08 09:05:15', '2026-01-08 09:05:15');
INSERT INTO `table_bill_out_records` VALUES ('78', '3', '2', '50', '5000.00', '2026-01-08 09:05:16', '2026-01-08 09:05:16', '2026-01-08 09:05:16');
INSERT INTO `table_bill_out_records` VALUES ('79', '3', '2', '46', '3000.00', '2026-01-08 09:05:19', '2026-01-08 09:05:19', '2026-01-08 09:05:19');
INSERT INTO `table_bill_out_records` VALUES ('80', '6', '1', '97', '3000.00', '2026-01-08 09:11:39', '2026-01-08 09:11:39', '2026-01-08 09:11:39');
INSERT INTO `table_bill_out_records` VALUES ('81', '3', '2', '98', '3000.00', '2026-01-08 09:14:06', '2026-01-08 09:14:06', '2026-01-08 09:14:06');
INSERT INTO `table_bill_out_records` VALUES ('82', '3', '3', '99', '5000.00', '2026-01-08 09:22:09', '2026-01-08 09:22:09', '2026-01-08 09:22:09');
INSERT INTO `table_bill_out_records` VALUES ('83', '3', '1', '100', '4000.00', '2026-01-08 09:29:11', '2026-01-08 09:29:11', '2026-01-08 09:29:11');
INSERT INTO `table_bill_out_records` VALUES ('84', '6', '1', '103', '3000.00', '2026-01-08 09:32:18', '2026-01-08 09:32:18', '2026-01-08 09:32:18');
INSERT INTO `table_bill_out_records` VALUES ('85', '3', '4', '102', '3000.00', '2026-01-08 09:33:03', '2026-01-08 09:33:03', '2026-01-08 09:33:03');
INSERT INTO `table_bill_out_records` VALUES ('86', '3', '2', '101', '3000.00', '2026-01-08 09:36:34', '2026-01-08 09:36:34', '2026-01-08 09:36:34');
INSERT INTO `table_bill_out_records` VALUES ('87', '3', '1', '104', '2500.00', '2026-01-08 09:42:51', '2026-01-08 09:42:51', '2026-01-08 09:42:51');
INSERT INTO `table_bill_out_records` VALUES ('88', '3', '1', '105', '9000.00', '2026-01-08 10:14:03', '2026-01-08 10:14:03', '2026-01-08 10:14:03');
INSERT INTO `table_bill_out_records` VALUES ('89', '3', '4', '109', '0.00', '2026-01-08 10:18:16', '2026-01-08 10:18:16', '2026-01-08 10:18:16');
INSERT INTO `table_bill_out_records` VALUES ('90', '3', '6', '113', '5000.00', '2026-01-08 10:23:35', '2026-01-08 10:23:35', '2026-01-08 10:23:35');
INSERT INTO `table_bill_out_records` VALUES ('91', '3', '3', '110', '3000.00', '2026-01-08 10:24:12', '2026-01-08 10:24:12', '2026-01-08 10:24:12');
INSERT INTO `table_bill_out_records` VALUES ('92', '3', '3', '115', '3500.00', '2026-01-08 10:52:30', '2026-01-08 10:52:30', '2026-01-08 10:52:30');
INSERT INTO `table_bill_out_records` VALUES ('93', '3', '3', '62', '12500.00', '2026-01-08 10:53:13', '2026-01-08 10:53:13', '2026-01-08 10:53:13');
INSERT INTO `table_bill_out_records` VALUES ('94', '3', '3', '47', '6500.00', '2026-01-08 10:53:18', '2026-01-08 10:53:18', '2026-01-08 10:53:18');
INSERT INTO `table_bill_out_records` VALUES ('95', '3', '4', '116', '2500.00', '2026-01-08 10:53:51', '2026-01-08 10:53:51', '2026-01-08 10:53:51');
INSERT INTO `table_bill_out_records` VALUES ('96', '3', '1', '114', '3000.00', '2026-01-08 10:55:59', '2026-01-08 10:55:59', '2026-01-08 10:55:59');
INSERT INTO `table_bill_out_records` VALUES ('97', '3', '2', '106', '8500.00', '2026-01-08 11:03:30', '2026-01-08 11:03:30', '2026-01-08 11:03:30');
INSERT INTO `table_bill_out_records` VALUES ('98', '3', '2', '78', '9000.00', '2026-01-08 11:03:54', '2026-01-08 11:03:54', '2026-01-08 11:03:54');
INSERT INTO `table_bill_out_records` VALUES ('99', '3', '5', '117', '5000.00', '2026-01-08 11:07:16', '2026-01-08 11:07:16', '2026-01-08 11:07:16');
INSERT INTO `table_bill_out_records` VALUES ('100', '3', '5', '112', '3500.00', '2026-01-08 11:07:22', '2026-01-08 11:07:22', '2026-01-08 11:07:22');
INSERT INTO `table_bill_out_records` VALUES ('101', '3', '5', '111', '500.00', '2026-01-08 11:07:48', '2026-01-08 11:07:48', '2026-01-08 11:07:48');
INSERT INTO `table_bill_out_records` VALUES ('102', '3', '2', '119', '3000.00', '2026-01-08 11:18:11', '2026-01-08 11:18:11', '2026-01-08 11:18:11');
INSERT INTO `table_bill_out_records` VALUES ('103', '3', '5', '108', '8500.00', '2026-01-08 11:27:41', '2026-01-08 11:27:41', '2026-01-08 11:27:41');
INSERT INTO `table_bill_out_records` VALUES ('104', '3', '2', '121', '3000.00', '2026-01-08 11:35:52', '2026-01-08 11:35:52', '2026-01-08 11:35:52');
INSERT INTO `table_bill_out_records` VALUES ('105', '3', '3', '120', '6000.00', '2026-01-08 11:39:36', '2026-01-08 11:39:36', '2026-01-08 11:39:36');
INSERT INTO `table_bill_out_records` VALUES ('106', '3', '1', '118', '5500.00', '2026-01-08 11:39:48', '2026-01-08 11:39:48', '2026-01-08 11:39:48');
INSERT INTO `table_bill_out_records` VALUES ('107', '3', '1', '114', '3000.00', '2026-01-08 11:39:49', '2026-01-08 11:39:49', '2026-01-08 11:39:49');
INSERT INTO `table_bill_out_records` VALUES ('108', '3', '1', '89', '6500.00', '2026-01-08 11:39:50', '2026-01-08 11:39:50', '2026-01-08 11:39:50');
INSERT INTO `table_bill_out_records` VALUES ('109', '6', '3', '124', '4000.00', '2026-01-08 12:25:45', '2026-01-08 12:25:45', '2026-01-08 12:25:45');
INSERT INTO `table_bill_out_records` VALUES ('110', '6', '1', '122', '19000.00', '2026-01-08 12:25:53', '2026-01-08 12:25:53', '2026-01-08 12:25:53');
INSERT INTO `table_bill_out_records` VALUES ('111', '6', '2', '123', '3000.00', '2026-01-08 12:26:02', '2026-01-08 12:26:02', '2026-01-08 12:26:02');
INSERT INTO `table_bill_out_records` VALUES ('112', '3', '1', '125', '12000.00', '2026-01-09 00:50:16', '2026-01-09 00:50:16', '2026-01-09 00:50:16');
INSERT INTO `table_bill_out_records` VALUES ('113', '3', '1', '94', '0.00', '2026-01-09 00:50:21', '2026-01-09 00:50:21', '2026-01-09 00:50:21');
INSERT INTO `table_bill_out_records` VALUES ('114', '3', '4', '128', '7500.00', '2026-01-09 00:52:38', '2026-01-09 00:52:38', '2026-01-09 00:52:38');
INSERT INTO `table_bill_out_records` VALUES ('115', '3', '4', '107', '4000.00', '2026-01-09 00:52:44', '2026-01-09 00:52:44', '2026-01-09 00:52:44');
INSERT INTO `table_bill_out_records` VALUES ('116', '6', '2', '126', '6000.00', '2026-01-09 00:54:13', '2026-01-09 00:54:13', '2026-01-09 00:54:13');
INSERT INTO `table_bill_out_records` VALUES ('117', '6', '3', '127', '3000.00', '2026-01-09 00:56:31', '2026-01-09 00:56:31', '2026-01-09 00:56:31');
INSERT INTO `table_bill_out_records` VALUES ('118', '6', '2', '130', '2500.00', '2026-01-09 01:00:10', '2026-01-09 01:00:10', '2026-01-09 01:00:10');
INSERT INTO `table_bill_out_records` VALUES ('119', '3', '2', '131', '2500.00', '2026-01-09 01:06:48', '2026-01-09 01:06:48', '2026-01-09 01:06:48');
INSERT INTO `table_bill_out_records` VALUES ('120', '3', '2', '132', '2500.00', '2026-01-09 01:10:22', '2026-01-09 01:10:22', '2026-01-09 01:10:22');
INSERT INTO `table_bill_out_records` VALUES ('121', '3', '1', '129', '3000.00', '2026-01-09 01:10:34', '2026-01-09 01:10:34', '2026-01-09 01:10:34');
INSERT INTO `table_bill_out_records` VALUES ('122', '3', '1', '133', '3000.00', '2026-01-09 01:50:44', '2026-01-09 01:50:44', '2026-01-09 01:50:44');
INSERT INTO `table_bill_out_records` VALUES ('123', '6', '2', '134', '9000.00', '2026-01-09 02:11:30', '2026-01-09 02:11:30', '2026-01-09 02:11:30');
INSERT INTO `table_bill_out_records` VALUES ('124', '6', '3', '137', '5000.00', '2026-01-09 02:21:00', '2026-01-09 02:21:00', '2026-01-09 02:21:00');
INSERT INTO `table_bill_out_records` VALUES ('125', '3', '2', '136', '3000.00', '2026-01-09 02:22:45', '2026-01-09 02:22:45', '2026-01-09 02:22:45');
INSERT INTO `table_bill_out_records` VALUES ('126', '3', '3', '139', '2500.00', '2026-01-09 02:32:54', '2026-01-09 02:32:54', '2026-01-09 02:32:54');
INSERT INTO `table_bill_out_records` VALUES ('127', '3', '1', '135', '15500.00', '2026-01-09 02:33:32', '2026-01-09 02:33:32', '2026-01-09 02:33:32');
INSERT INTO `table_bill_out_records` VALUES ('128', '6', '2', '138', '3000.00', '2026-01-09 02:35:58', '2026-01-09 02:35:58', '2026-01-09 02:35:58');
INSERT INTO `table_bill_out_records` VALUES ('129', '3', '1', '140', '3000.00', '2026-01-09 02:48:49', '2026-01-09 02:48:49', '2026-01-09 02:48:49');
INSERT INTO `table_bill_out_records` VALUES ('130', '6', '1', '141', '3500.00', '2026-01-09 03:00:29', '2026-01-09 03:00:29', '2026-01-09 03:00:29');
INSERT INTO `table_bill_out_records` VALUES ('131', '6', '1', '142', '500.00', '2026-01-09 03:04:32', '2026-01-09 03:04:32', '2026-01-09 03:04:32');
INSERT INTO `table_bill_out_records` VALUES ('132', '6', '1', '143', '3000.00', '2026-01-09 03:21:05', '2026-01-09 03:21:05', '2026-01-09 03:21:05');
INSERT INTO `table_bill_out_records` VALUES ('133', '6', '1', '144', '3000.00', '2026-01-09 03:46:42', '2026-01-09 03:46:42', '2026-01-09 03:46:42');
INSERT INTO `table_bill_out_records` VALUES ('134', '6', '2', '146', '4500.00', '2026-01-09 04:23:40', '2026-01-09 04:23:40', '2026-01-09 04:23:40');
INSERT INTO `table_bill_out_records` VALUES ('135', '6', '1', '145', '3000.00', '2026-01-09 04:23:54', '2026-01-09 04:23:54', '2026-01-09 04:23:54');
INSERT INTO `table_bill_out_records` VALUES ('136', '6', '1', '147', '3000.00', '2026-01-09 06:14:47', '2026-01-09 06:14:47', '2026-01-09 06:14:47');
INSERT INTO `table_bill_out_records` VALUES ('137', '6', '1', '148', '10000.00', '2026-01-09 07:41:05', '2026-01-09 07:41:05', '2026-01-09 07:41:05');
INSERT INTO `table_bill_out_records` VALUES ('138', '3', '2', '150', '3000.00', '2026-01-09 09:08:40', '2026-01-09 09:08:40', '2026-01-09 09:08:40');
INSERT INTO `table_bill_out_records` VALUES ('139', '3', '2', '151', '7000.00', '2026-01-09 09:37:41', '2026-01-09 09:37:41', '2026-01-09 09:37:41');
INSERT INTO `table_bill_out_records` VALUES ('140', '6', '1', '149', '3000.00', '2026-01-09 09:38:27', '2026-01-09 09:38:27', '2026-01-09 09:38:27');
INSERT INTO `table_bill_out_records` VALUES ('141', '3', '3', '152', '18000.00', '2026-01-09 09:49:21', '2026-01-09 09:49:21', '2026-01-09 09:49:21');
INSERT INTO `table_bill_out_records` VALUES ('142', '3', '2', '154', '2500.00', '2026-01-09 10:27:50', '2026-01-09 10:27:50', '2026-01-09 10:27:50');
INSERT INTO `table_bill_out_records` VALUES ('143', '3', '1', '153', '2500.00', '2026-01-09 10:27:58', '2026-01-09 10:27:58', '2026-01-09 10:27:58');
INSERT INTO `table_bill_out_records` VALUES ('144', '6', '3', '155', '6000.00', '2026-01-09 10:37:19', '2026-01-09 10:37:19', '2026-01-09 10:37:19');
INSERT INTO `table_bill_out_records` VALUES ('145', '3', '1', '156', '3000.00', '2026-01-09 10:55:39', '2026-01-09 10:55:39', '2026-01-09 10:55:39');
INSERT INTO `table_bill_out_records` VALUES ('146', '3', '2', '157', '2500.00', '2026-01-09 10:55:48', '2026-01-09 10:55:48', '2026-01-09 10:55:48');
INSERT INTO `table_bill_out_records` VALUES ('147', '3', '2', '159', '3000.00', '2026-01-09 12:11:28', '2026-01-09 12:11:28', '2026-01-09 12:11:28');
INSERT INTO `table_bill_out_records` VALUES ('148', '3', '1', '160', '3000.00', '2026-01-09 12:18:21', '2026-01-09 12:18:21', '2026-01-09 12:18:21');
INSERT INTO `table_bill_out_records` VALUES ('149', '6', '1', '162', '3500.00', '2026-01-09 12:31:08', '2026-01-09 12:31:08', '2026-01-09 12:31:08');
INSERT INTO `table_bill_out_records` VALUES ('150', '6', '2', '161', '8000.00', '2026-01-09 12:33:04', '2026-01-09 12:33:04', '2026-01-09 12:33:04');
INSERT INTO `table_bill_out_records` VALUES ('151', '6', '1', '163', '3000.00', '2026-01-09 12:54:27', '2026-01-09 12:54:27', '2026-01-09 12:54:27');
INSERT INTO `table_bill_out_records` VALUES ('152', '6', '1', '164', '3500.00', '2026-01-09 13:04:50', '2026-01-09 13:04:50', '2026-01-09 13:04:50');
INSERT INTO `table_bill_out_records` VALUES ('153', '6', '3', '158', '6500.00', '2026-01-09 13:48:03', '2026-01-09 13:48:03', '2026-01-09 13:48:03');
INSERT INTO `table_bill_out_records` VALUES ('154', '6', '1', '165', '9000.00', '2026-01-09 13:50:04', '2026-01-09 13:50:04', '2026-01-09 13:50:04');
INSERT INTO `table_bill_out_records` VALUES ('155', '6', '1', '166', '2500.00', '2026-01-10 00:14:16', '2026-01-10 00:14:16', '2026-01-10 00:14:16');
INSERT INTO `table_bill_out_records` VALUES ('156', '6', '1', '167', '3500.00', '2026-01-10 01:10:39', '2026-01-10 01:10:39', '2026-01-10 01:10:39');
INSERT INTO `table_bill_out_records` VALUES ('157', '3', '1', '168', '6000.00', '2026-01-10 01:19:55', '2026-01-10 01:19:55', '2026-01-10 01:19:55');
INSERT INTO `table_bill_out_records` VALUES ('158', '3', '2', '169', '5000.00', '2026-01-10 01:20:52', '2026-01-10 01:20:52', '2026-01-10 01:20:52');
INSERT INTO `table_bill_out_records` VALUES ('159', '3', '1', '173', '0.00', '2026-01-10 01:36:04', '2026-01-10 01:36:04', '2026-01-10 01:36:04');
INSERT INTO `table_bill_out_records` VALUES ('160', '3', '2', '172', '5500.00', '2026-01-10 01:36:10', '2026-01-10 01:36:10', '2026-01-10 01:36:10');
INSERT INTO `table_bill_out_records` VALUES ('161', '6', '3', '176', '3000.00', '2026-01-10 01:51:04', '2026-01-10 01:51:04', '2026-01-10 01:51:04');
INSERT INTO `table_bill_out_records` VALUES ('162', '3', '1', '175', '7000.00', '2026-01-10 01:53:42', '2026-01-10 01:53:42', '2026-01-10 01:53:42');
INSERT INTO `table_bill_out_records` VALUES ('163', '3', '1', '171', '2500.00', '2026-01-10 01:53:50', '2026-01-10 01:53:50', '2026-01-10 01:53:50');
INSERT INTO `table_bill_out_records` VALUES ('164', '6', '2', '174', '3000.00', '2026-01-10 01:55:24', '2026-01-10 01:55:24', '2026-01-10 01:55:24');
INSERT INTO `table_bill_out_records` VALUES ('165', '6', '1', '177', '2500.00', '2026-01-10 02:24:15', '2026-01-10 02:24:15', '2026-01-10 02:24:15');
INSERT INTO `table_bill_out_records` VALUES ('166', '3', '2', '178', '1500.00', '2026-01-10 02:27:19', '2026-01-10 02:27:19', '2026-01-10 02:27:19');
INSERT INTO `table_bill_out_records` VALUES ('167', '3', '1', '179', '4500.00', '2026-01-10 02:51:49', '2026-01-10 02:51:49', '2026-01-10 02:51:49');
INSERT INTO `table_bill_out_records` VALUES ('168', '3', '3', '182', '6000.00', '2026-01-10 03:25:48', '2026-01-10 03:25:48', '2026-01-10 03:25:48');
INSERT INTO `table_bill_out_records` VALUES ('169', '3', '3', '170', '7000.00', '2026-01-10 03:25:51', '2026-01-10 03:25:51', '2026-01-10 03:25:51');
INSERT INTO `table_bill_out_records` VALUES ('170', '3', '2', '183', '1500.00', '2026-01-10 03:30:41', '2026-01-10 03:30:41', '2026-01-10 03:30:41');
INSERT INTO `table_bill_out_records` VALUES ('171', '3', '2', '181', '13500.00', '2026-01-10 03:37:55', '2026-01-10 03:37:55', '2026-01-10 03:37:55');
INSERT INTO `table_bill_out_records` VALUES ('172', '6', '4', '184', '2500.00', '2026-01-10 03:39:56', '2026-01-10 03:39:56', '2026-01-10 03:39:56');
INSERT INTO `table_bill_out_records` VALUES ('173', '3', '2', '186', '3000.00', '2026-01-10 03:46:20', '2026-01-10 03:46:20', '2026-01-10 03:46:20');
INSERT INTO `table_bill_out_records` VALUES ('174', '3', '2', '187', '6000.00', '2026-01-10 04:16:05', '2026-01-10 04:16:05', '2026-01-10 04:16:05');
INSERT INTO `table_bill_out_records` VALUES ('175', '6', '4', '188', '4000.00', '2026-01-10 04:21:19', '2026-01-10 04:21:19', '2026-01-10 04:21:19');
INSERT INTO `table_bill_out_records` VALUES ('176', '6', '5', '189', '4000.00', '2026-01-10 04:28:21', '2026-01-10 04:28:21', '2026-01-10 04:28:21');
INSERT INTO `table_bill_out_records` VALUES ('177', '3', '1', '180', '12000.00', '2026-01-10 04:54:17', '2026-01-10 04:54:17', '2026-01-10 04:54:17');
INSERT INTO `table_bill_out_records` VALUES ('178', '3', '3', '185', '6000.00', '2026-01-10 04:54:25', '2026-01-10 04:54:25', '2026-01-10 04:54:25');
INSERT INTO `table_bill_out_records` VALUES ('179', '6', '2', '190', '3000.00', '2026-01-10 04:59:49', '2026-01-10 04:59:49', '2026-01-10 04:59:49');
INSERT INTO `table_bill_out_records` VALUES ('180', '6', '1', '191', '3000.00', '2026-01-10 05:50:15', '2026-01-10 05:50:15', '2026-01-10 05:50:15');
INSERT INTO `table_bill_out_records` VALUES ('181', '6', '2', '193', '3000.00', '2026-01-10 06:19:36', '2026-01-10 06:19:36', '2026-01-10 06:19:36');
INSERT INTO `table_bill_out_records` VALUES ('182', '6', '1', '192', '5500.00', '2026-01-10 06:30:29', '2026-01-10 06:30:29', '2026-01-10 06:30:29');
INSERT INTO `table_bill_out_records` VALUES ('183', '6', '1', '194', '500.00', '2026-01-10 06:34:16', '2026-01-10 06:34:16', '2026-01-10 06:34:16');
INSERT INTO `table_bill_out_records` VALUES ('184', '3', '1', '195', '2500.00', '2026-01-10 08:01:35', '2026-01-10 08:01:35', '2026-01-10 08:01:35');
INSERT INTO `table_bill_out_records` VALUES ('185', '6', '1', '196', '3000.00', '2026-01-10 08:50:35', '2026-01-10 08:50:35', '2026-01-10 08:50:35');
INSERT INTO `table_bill_out_records` VALUES ('186', '6', '1', '197', '11500.00', '2026-01-10 10:07:15', '2026-01-10 10:07:15', '2026-01-10 10:07:15');
INSERT INTO `table_bill_out_records` VALUES ('187', '6', '2', '198', '8000.00', '2026-01-10 10:16:12', '2026-01-10 10:16:12', '2026-01-10 10:16:12');
INSERT INTO `table_bill_out_records` VALUES ('188', '6', '1', '199', '9000.00', '2026-01-10 10:22:49', '2026-01-10 10:22:49', '2026-01-10 10:22:49');
INSERT INTO `table_bill_out_records` VALUES ('189', '6', '1', '200', '6500.00', '2026-01-10 11:00:18', '2026-01-10 11:00:18', '2026-01-10 11:00:18');
INSERT INTO `table_bill_out_records` VALUES ('190', '6', '1', '201', '500.00', '2026-01-10 11:01:31', '2026-01-10 11:01:31', '2026-01-10 11:01:31');
INSERT INTO `table_bill_out_records` VALUES ('191', '6', '1', '202', '1500.00', '2026-01-10 11:03:38', '2026-01-10 11:03:38', '2026-01-10 11:03:38');
INSERT INTO `table_bill_out_records` VALUES ('192', '6', '1', '203', '3000.00', '2026-01-10 11:04:18', '2026-01-10 11:04:18', '2026-01-10 11:04:18');
INSERT INTO `table_bill_out_records` VALUES ('193', '6', '1', '205', '3500.00', '2026-01-10 11:12:16', '2026-01-10 11:12:16', '2026-01-10 11:12:16');
INSERT INTO `table_bill_out_records` VALUES ('194', '6', '1', '204', '3500.00', '2026-01-10 11:12:20', '2026-01-10 11:12:20', '2026-01-10 11:12:20');
INSERT INTO `table_bill_out_records` VALUES ('195', '6', '1', '206', '3000.00', '2026-01-10 11:31:03', '2026-01-10 11:31:03', '2026-01-10 11:31:03');
INSERT INTO `table_bill_out_records` VALUES ('196', '3', '2', '207', '12500.00', '2026-01-10 11:48:54', '2026-01-10 11:48:54', '2026-01-10 11:48:54');
INSERT INTO `table_bill_out_records` VALUES ('197', '3', '2', '209', '3000.00', '2026-01-10 12:18:27', '2026-01-10 12:18:27', '2026-01-10 12:18:27');
INSERT INTO `table_bill_out_records` VALUES ('198', '3', '10', '210', '4500.00', '2026-01-10 12:19:24', '2026-01-10 12:19:24', '2026-01-10 12:19:24');
INSERT INTO `table_bill_out_records` VALUES ('199', '3', '2', '211', '6000.00', '2026-01-10 12:38:42', '2026-01-10 12:38:42', '2026-01-10 12:38:42');
INSERT INTO `table_bill_out_records` VALUES ('200', '3', '1', '208', '3500.00', '2026-01-10 12:50:17', '2026-01-10 12:50:17', '2026-01-10 12:50:17');
INSERT INTO `table_bill_out_records` VALUES ('201', '3', '2', '212', '3500.00', '2026-01-10 12:55:40', '2026-01-10 12:55:40', '2026-01-10 12:55:40');
INSERT INTO `table_bill_out_records` VALUES ('202', '3', '1', '213', '5000.00', '2026-01-10 23:57:44', '2026-01-10 23:57:44', '2026-01-10 23:57:44');
INSERT INTO `table_bill_out_records` VALUES ('203', '3', '2', '214', '7500.00', '2026-01-10 23:57:52', '2026-01-10 23:57:52', '2026-01-10 23:57:52');
INSERT INTO `table_bill_out_records` VALUES ('204', '3', '1', '215', '1000.00', '2026-01-11 00:05:27', '2026-01-11 00:05:27', '2026-01-11 00:05:27');
INSERT INTO `table_bill_out_records` VALUES ('205', '3', '1', '216', '12500.00', '2026-01-11 00:07:41', '2026-01-11 00:07:41', '2026-01-11 00:07:41');
INSERT INTO `table_bill_out_records` VALUES ('206', '6', '1', '217', '5000.00', '2026-01-11 00:46:38', '2026-01-11 00:46:38', '2026-01-11 00:46:38');
INSERT INTO `table_bill_out_records` VALUES ('207', '6', '1', '218', '5000.00', '2026-01-11 00:51:27', '2026-01-11 00:51:27', '2026-01-11 00:51:27');
INSERT INTO `table_bill_out_records` VALUES ('208', '3', '1', '219', '6000.00', '2026-01-11 01:00:50', '2026-01-11 01:00:50', '2026-01-11 01:00:50');
INSERT INTO `table_bill_out_records` VALUES ('209', '3', '1', '221', '2500.00', '2026-01-11 01:21:09', '2026-01-11 01:21:09', '2026-01-11 01:21:09');
INSERT INTO `table_bill_out_records` VALUES ('210', '6', '1', '222', '5000.00', '2026-01-11 01:27:01', '2026-01-11 01:27:01', '2026-01-11 01:27:01');
INSERT INTO `table_bill_out_records` VALUES ('211', '3', '2', '220', '15500.00', '2026-01-11 01:29:26', '2026-01-11 01:29:26', '2026-01-11 01:29:26');
INSERT INTO `table_bill_out_records` VALUES ('212', '6', '1', '223', '3000.00', '2026-01-11 01:38:35', '2026-01-11 01:38:35', '2026-01-11 01:38:35');
INSERT INTO `table_bill_out_records` VALUES ('213', '3', '2', '224', '15000.00', '2026-01-11 01:57:26', '2026-01-11 01:57:26', '2026-01-11 01:57:26');
INSERT INTO `table_bill_out_records` VALUES ('214', '6', '1', '226', '12000.00', '2026-01-11 02:09:24', '2026-01-11 02:09:24', '2026-01-11 02:09:24');
INSERT INTO `table_bill_out_records` VALUES ('215', '3', '4', '227', '3000.00', '2026-01-11 02:13:15', '2026-01-11 02:13:15', '2026-01-11 02:13:15');
INSERT INTO `table_bill_out_records` VALUES ('216', '6', '1', '228', '10000.00', '2026-01-11 02:14:21', '2026-01-11 02:14:21', '2026-01-11 02:14:21');
INSERT INTO `table_bill_out_records` VALUES ('217', '3', '2', '225', '9000.00', '2026-01-11 02:20:03', '2026-01-11 02:20:03', '2026-01-11 02:20:03');
INSERT INTO `table_bill_out_records` VALUES ('218', '6', '1', '230', '3000.00', '2026-01-11 02:21:06', '2026-01-11 02:21:06', '2026-01-11 02:21:06');
INSERT INTO `table_bill_out_records` VALUES ('219', '3', '4', '229', '12500.00', '2026-01-11 02:26:07', '2026-01-11 02:26:07', '2026-01-11 02:26:07');
INSERT INTO `table_bill_out_records` VALUES ('220', '3', '2', '231', '2500.00', '2026-01-11 02:57:15', '2026-01-11 02:57:15', '2026-01-11 02:57:15');
INSERT INTO `table_bill_out_records` VALUES ('221', '6', '4', '234', '3000.00', '2026-01-11 02:59:37', '2026-01-11 02:59:37', '2026-01-11 02:59:37');
INSERT INTO `table_bill_out_records` VALUES ('222', '6', '3', '233', '3000.00', '2026-01-11 03:12:12', '2026-01-11 03:12:12', '2026-01-11 03:12:12');
INSERT INTO `table_bill_out_records` VALUES ('223', '6', '1', '232', '7500.00', '2026-01-11 03:12:42', '2026-01-11 03:12:42', '2026-01-11 03:12:42');
INSERT INTO `table_bill_out_records` VALUES ('224', '6', '1', '235', '5000.00', '2026-01-11 03:55:16', '2026-01-11 03:55:16', '2026-01-11 03:55:16');
INSERT INTO `table_bill_out_records` VALUES ('225', '3', '4', '237', '2500.00', '2026-01-11 04:13:26', '2026-01-11 04:13:26', '2026-01-11 04:13:26');
INSERT INTO `table_bill_out_records` VALUES ('226', '3', '2', '236', '9500.00', '2026-01-11 04:13:34', '2026-01-11 04:13:34', '2026-01-11 04:13:34');
INSERT INTO `table_bill_out_records` VALUES ('227', '3', '1', '238', '3000.00', '2026-01-11 04:26:28', '2026-01-11 04:26:28', '2026-01-11 04:26:28');
INSERT INTO `table_bill_out_records` VALUES ('228', '3', '2', '239', '3000.00', '2026-01-11 06:28:35', '2026-01-11 06:28:35', '2026-01-11 06:28:35');
INSERT INTO `table_bill_out_records` VALUES ('229', '3', '2', '241', '5500.00', '2026-01-11 07:28:30', '2026-01-11 07:28:30', '2026-01-11 07:28:30');
INSERT INTO `table_bill_out_records` VALUES ('230', '3', '1', '240', '3000.00', '2026-01-11 07:29:06', '2026-01-11 07:29:06', '2026-01-11 07:29:06');
INSERT INTO `table_bill_out_records` VALUES ('231', '3', '4', '242', '7000.00', '2026-01-11 08:21:25', '2026-01-11 08:21:25', '2026-01-11 08:21:25');
INSERT INTO `table_bill_out_records` VALUES ('232', '3', '2', '243', '3000.00', '2026-01-11 08:21:34', '2026-01-11 08:21:34', '2026-01-11 08:21:34');
INSERT INTO `table_bill_out_records` VALUES ('233', '3', '2', '244', '3000.00', '2026-01-11 08:51:34', '2026-01-11 08:51:34', '2026-01-11 08:51:34');
INSERT INTO `table_bill_out_records` VALUES ('234', '3', '1', '245', '5000.00', '2026-01-11 08:56:56', '2026-01-11 08:56:56', '2026-01-11 08:56:56');
INSERT INTO `table_bill_out_records` VALUES ('235', '3', '3', '246', '4500.00', '2026-01-11 09:06:57', '2026-01-11 09:06:57', '2026-01-11 09:06:57');
INSERT INTO `table_bill_out_records` VALUES ('236', '3', '1', '247', '6000.00', '2026-01-11 09:12:50', '2026-01-11 09:12:50', '2026-01-11 09:12:50');
INSERT INTO `table_bill_out_records` VALUES ('237', '3', '3', '250', '6000.00', '2026-01-11 10:29:18', '2026-01-11 10:29:18', '2026-01-11 10:29:18');
INSERT INTO `table_bill_out_records` VALUES ('238', '6', '2', '249', '5000.00', '2026-01-11 10:36:16', '2026-01-11 10:36:16', '2026-01-11 10:36:16');
INSERT INTO `table_bill_out_records` VALUES ('239', '3', '5', '253', '12000.00', '2026-01-11 10:40:42', '2026-01-11 10:40:42', '2026-01-11 10:40:42');
INSERT INTO `table_bill_out_records` VALUES ('240', '3', '3', '252', '2500.00', '2026-01-11 10:41:11', '2026-01-11 10:41:11', '2026-01-11 10:41:11');
INSERT INTO `table_bill_out_records` VALUES ('241', '3', '1', '248', '3000.00', '2026-01-11 10:41:40', '2026-01-11 10:41:40', '2026-01-11 10:41:40');
INSERT INTO `table_bill_out_records` VALUES ('242', '6', '2', '254', '3000.00', '2026-01-11 10:43:18', '2026-01-11 10:43:18', '2026-01-11 10:43:18');
INSERT INTO `table_bill_out_records` VALUES ('243', '3', '4', '251', '3000.00', '2026-01-11 10:51:31', '2026-01-11 10:51:31', '2026-01-11 10:51:31');
INSERT INTO `table_bill_out_records` VALUES ('244', '6', '2', '256', '3000.00', '2026-01-11 11:13:01', '2026-01-11 11:13:01', '2026-01-11 11:13:01');
INSERT INTO `table_bill_out_records` VALUES ('245', '6', '3', '257', '3000.00', '2026-01-11 11:21:08', '2026-01-11 11:21:08', '2026-01-11 11:21:08');
INSERT INTO `table_bill_out_records` VALUES ('246', '3', '1', '255', '14000.00', '2026-01-11 11:26:22', '2026-01-11 11:26:22', '2026-01-11 11:26:22');
INSERT INTO `table_bill_out_records` VALUES ('247', '6', '2', '258', '3000.00', '2026-01-11 11:27:25', '2026-01-11 11:27:25', '2026-01-11 11:27:25');
INSERT INTO `table_bill_out_records` VALUES ('248', '3', '4', '259', '5000.00', '2026-01-11 11:33:12', '2026-01-11 11:33:12', '2026-01-11 11:33:12');
INSERT INTO `table_bill_out_records` VALUES ('249', '3', '2', '261', '3000.00', '2026-01-11 11:47:04', '2026-01-11 11:47:04', '2026-01-11 11:47:04');
INSERT INTO `table_bill_out_records` VALUES ('250', '6', '1', '260', '3500.00', '2026-01-11 11:51:56', '2026-01-11 11:51:56', '2026-01-11 11:51:56');
INSERT INTO `table_bill_out_records` VALUES ('251', '3', '2', '262', '6000.00', '2026-01-11 11:59:43', '2026-01-11 11:59:43', '2026-01-11 11:59:43');
INSERT INTO `table_bill_out_records` VALUES ('252', '3', '1', '263', '13000.00', '2026-01-11 12:15:49', '2026-01-11 12:15:49', '2026-01-11 12:15:49');
INSERT INTO `table_bill_out_records` VALUES ('253', '3', '2', '264', '3000.00', '2026-01-11 12:34:34', '2026-01-11 12:34:34', '2026-01-11 12:34:34');
INSERT INTO `table_bill_out_records` VALUES ('254', '6', '1', '265', '2500.00', '2026-01-11 12:44:24', '2026-01-11 12:44:24', '2026-01-11 12:44:24');
INSERT INTO `table_bill_out_records` VALUES ('255', '6', '1', '268', '4500.00', '2026-01-11 14:07:21', '2026-01-11 14:07:21', '2026-01-11 14:07:21');
INSERT INTO `table_bill_out_records` VALUES ('256', '6', '3', '270', '4000.00', '2026-01-11 14:09:29', '2026-01-11 14:09:29', '2026-01-11 14:09:29');
INSERT INTO `table_bill_out_records` VALUES ('257', '3', '2', '267', '12500.00', '2026-01-11 14:09:36', '2026-01-11 14:09:36', '2026-01-11 14:09:36');
INSERT INTO `table_bill_out_records` VALUES ('258', '3', '4', '269', '4500.00', '2026-01-11 14:09:46', '2026-01-11 14:09:46', '2026-01-11 14:09:46');
INSERT INTO `table_bill_out_records` VALUES ('259', '6', '1', '271', '5000.00', '2026-01-12 00:13:14', '2026-01-12 00:13:14', '2026-01-12 00:13:14');
INSERT INTO `table_bill_out_records` VALUES ('260', '3', '1', '273', '6000.00', '2026-01-12 00:32:55', '2026-01-12 00:32:55', '2026-01-12 00:32:55');
INSERT INTO `table_bill_out_records` VALUES ('261', '3', '1', '266', '2500.00', '2026-01-12 00:33:09', '2026-01-12 00:33:09', '2026-01-12 00:33:09');
INSERT INTO `table_bill_out_records` VALUES ('262', '6', '2', '272', '6000.00', '2026-01-12 00:33:20', '2026-01-12 00:33:20', '2026-01-12 00:33:20');
INSERT INTO `table_bill_out_records` VALUES ('263', '3', '2', '275', '5000.00', '2026-01-12 01:02:45', '2026-01-12 01:02:45', '2026-01-12 01:02:45');
INSERT INTO `table_bill_out_records` VALUES ('264', '3', '3', '276', '6000.00', '2026-01-12 01:07:23', '2026-01-12 01:07:23', '2026-01-12 01:07:23');
INSERT INTO `table_bill_out_records` VALUES ('265', '6', '5', '278', '3000.00', '2026-01-12 01:07:53', '2026-01-12 01:07:53', '2026-01-12 01:07:53');
INSERT INTO `table_bill_out_records` VALUES ('266', '3', '4', '277', '5500.00', '2026-01-12 01:09:22', '2026-01-12 01:09:22', '2026-01-12 01:09:22');
INSERT INTO `table_bill_out_records` VALUES ('267', '6', '1', '274', '3000.00', '2026-01-12 01:15:12', '2026-01-12 01:15:12', '2026-01-12 01:15:12');
INSERT INTO `table_bill_out_records` VALUES ('268', '6', '2', '279', '3000.00', '2026-01-12 01:22:28', '2026-01-12 01:22:28', '2026-01-12 01:22:28');
INSERT INTO `table_bill_out_records` VALUES ('269', '6', '3', '280', '3000.00', '2026-01-12 01:22:38', '2026-01-12 01:22:38', '2026-01-12 01:22:38');
INSERT INTO `table_bill_out_records` VALUES ('270', '3', '2', '282', '5000.00', '2026-01-12 01:28:59', '2026-01-12 01:28:59', '2026-01-12 01:28:59');
INSERT INTO `table_bill_out_records` VALUES ('271', '3', '1', '281', '5000.00', '2026-01-12 01:35:25', '2026-01-12 01:35:25', '2026-01-12 01:35:25');
INSERT INTO `table_bill_out_records` VALUES ('272', '6', '1', '284', '2500.00', '2026-01-12 01:46:19', '2026-01-12 01:46:19', '2026-01-12 01:46:19');
INSERT INTO `table_bill_out_records` VALUES ('273', '3', '4', '285', '5000.00', '2026-01-12 01:47:31', '2026-01-12 01:47:31', '2026-01-12 01:47:31');
INSERT INTO `table_bill_out_records` VALUES ('274', '6', '1', '286', '5000.00', '2026-01-12 02:04:04', '2026-01-12 02:04:04', '2026-01-12 02:04:04');
INSERT INTO `table_bill_out_records` VALUES ('275', '3', '2', '283', '11000.00', '2026-01-12 02:09:11', '2026-01-12 02:09:11', '2026-01-12 02:09:11');
INSERT INTO `table_bill_out_records` VALUES ('276', '6', '4', '288', '3000.00', '2026-01-12 02:13:21', '2026-01-12 02:13:21', '2026-01-12 02:13:21');
INSERT INTO `table_bill_out_records` VALUES ('277', '6', '3', '289', '6500.00', '2026-01-12 02:13:34', '2026-01-12 02:13:34', '2026-01-12 02:13:34');
INSERT INTO `table_bill_out_records` VALUES ('278', '6', '1', '287', '3000.00', '2026-01-12 02:29:48', '2026-01-12 02:29:48', '2026-01-12 02:29:48');
INSERT INTO `table_bill_out_records` VALUES ('279', '6', '2', '290', '3000.00', '2026-01-12 02:29:57', '2026-01-12 02:29:57', '2026-01-12 02:29:57');
INSERT INTO `table_bill_out_records` VALUES ('280', '6', '3', '291', '4000.00', '2026-01-12 02:38:09', '2026-01-12 02:38:09', '2026-01-12 02:38:09');
INSERT INTO `table_bill_out_records` VALUES ('281', '3', '3', '295', '6000.00', '2026-01-12 03:00:24', '2026-01-12 03:00:24', '2026-01-12 03:00:24');
INSERT INTO `table_bill_out_records` VALUES ('282', '6', '1', '293', '7500.00', '2026-01-12 03:00:43', '2026-01-12 03:00:43', '2026-01-12 03:00:43');
INSERT INTO `table_bill_out_records` VALUES ('283', '6', '4', '294', '3000.00', '2026-01-12 03:01:04', '2026-01-12 03:01:04', '2026-01-12 03:01:04');
INSERT INTO `table_bill_out_records` VALUES ('284', '3', '2', '292', '45500.00', '2026-01-12 03:09:45', '2026-01-12 03:09:45', '2026-01-12 03:09:45');
INSERT INTO `table_bill_out_records` VALUES ('285', '6', '1', '297', '3500.00', '2026-01-12 03:10:30', '2026-01-12 03:10:30', '2026-01-12 03:10:30');
INSERT INTO `table_bill_out_records` VALUES ('286', '3', '1', '298', '2000.00', '2026-01-12 03:37:03', '2026-01-12 03:37:03', '2026-01-12 03:37:03');
INSERT INTO `table_bill_out_records` VALUES ('287', '6', '1', '299', '3000.00', '2026-01-12 03:55:12', '2026-01-12 03:55:12', '2026-01-12 03:55:12');
INSERT INTO `table_bill_out_records` VALUES ('288', '6', '2', '300', '3000.00', '2026-01-12 04:10:37', '2026-01-12 04:10:37', '2026-01-12 04:10:37');
INSERT INTO `table_bill_out_records` VALUES ('289', '3', '5', '296', '6500.00', '2026-01-12 04:34:26', '2026-01-12 04:34:26', '2026-01-12 04:34:26');
INSERT INTO `table_bill_out_records` VALUES ('290', '3', '1', '301', '16000.00', '2026-01-12 06:03:17', '2026-01-12 06:03:17', '2026-01-12 06:03:17');
INSERT INTO `table_bill_out_records` VALUES ('291', '3', '1', '302', '11500.00', '2026-01-12 10:46:58', '2026-01-12 10:46:58', '2026-01-12 10:46:58');
INSERT INTO `table_bill_out_records` VALUES ('292', '3', '1', '303', '8500.00', '2026-01-12 10:52:14', '2026-01-12 10:52:14', '2026-01-12 10:52:14');
INSERT INTO `table_bill_out_records` VALUES ('293', '6', '2', '305', '5500.00', '2026-01-12 11:16:54', '2026-01-12 11:16:54', '2026-01-12 11:16:54');
INSERT INTO `table_bill_out_records` VALUES ('294', '3', '1', '304', '4500.00', '2026-01-12 11:32:51', '2026-01-12 11:32:51', '2026-01-12 11:32:51');
INSERT INTO `table_bill_out_records` VALUES ('295', '3', '2', '306', '8000.00', '2026-01-12 11:33:02', '2026-01-12 11:33:02', '2026-01-12 11:33:02');
INSERT INTO `table_bill_out_records` VALUES ('296', '6', '1', '308', '1000.00', '2026-01-12 11:36:19', '2026-01-12 11:36:19', '2026-01-12 11:36:19');
INSERT INTO `table_bill_out_records` VALUES ('297', '3', '3', '307', '4000.00', '2026-01-12 11:39:09', '2026-01-12 11:39:09', '2026-01-12 11:39:09');
INSERT INTO `table_bill_out_records` VALUES ('298', '6', '1', '309', '1000.00', '2026-01-12 11:40:34', '2026-01-12 11:40:34', '2026-01-12 11:40:34');
INSERT INTO `table_bill_out_records` VALUES ('299', '6', '2', '311', '3500.00', '2026-01-12 11:54:56', '2026-01-12 11:54:56', '2026-01-12 11:54:56');
INSERT INTO `table_bill_out_records` VALUES ('300', '6', '2', '313', '1000.00', '2026-01-12 12:01:17', '2026-01-12 12:01:17', '2026-01-12 12:01:17');
INSERT INTO `table_bill_out_records` VALUES ('301', '3', '1', '310', '2500.00', '2026-01-12 12:01:40', '2026-01-12 12:01:40', '2026-01-12 12:01:40');
INSERT INTO `table_bill_out_records` VALUES ('302', '6', '3', '312', '6500.00', '2026-01-12 12:19:12', '2026-01-12 12:19:12', '2026-01-12 12:19:12');
INSERT INTO `table_bill_out_records` VALUES ('303', '3', '1', '314', '12500.00', '2026-01-12 13:08:52', '2026-01-12 13:08:52', '2026-01-12 13:08:52');
INSERT INTO `table_bill_out_records` VALUES ('304', '3', '1', '316', '5000.00', '2026-01-13 12:04:28', '2026-01-13 12:04:28', '2026-01-13 12:04:28');
INSERT INTO `table_bill_out_records` VALUES ('305', '3', '1', '315', '1000.00', '2026-01-13 12:04:30', '2026-01-13 12:04:30', '2026-01-13 12:04:30');
INSERT INTO `table_bill_out_records` VALUES ('306', '3', '1', '317', '189500.00', '2026-01-13 12:11:37', '2026-01-13 12:11:37', '2026-01-13 12:11:37');
INSERT INTO `table_bill_out_records` VALUES ('307', '6', '2', '319', '5000.00', '2026-01-13 12:38:23', '2026-01-13 12:38:23', '2026-01-13 12:38:23');
INSERT INTO `table_bill_out_records` VALUES ('308', '3', '1', '318', '3500.00', '2026-01-13 12:56:10', '2026-01-13 12:56:10', '2026-01-13 12:56:10');
INSERT INTO `table_bill_out_records` VALUES ('309', '6', '1', '321', '3500.00', '2026-01-13 13:32:23', '2026-01-13 13:32:23', '2026-01-13 13:32:23');
INSERT INTO `table_bill_out_records` VALUES ('310', '3', '1', '322', '5000.00', '2026-01-13 13:35:19', '2026-01-13 13:35:19', '2026-01-13 13:35:19');
INSERT INTO `table_bill_out_records` VALUES ('311', '6', '1', '323', '2000.00', '2026-01-14 00:32:36', '2026-01-14 00:32:36', '2026-01-14 00:32:36');
INSERT INTO `table_bill_out_records` VALUES ('312', '3', '2', '324', '3000.00', '2026-01-14 00:34:04', '2026-01-14 00:34:04', '2026-01-14 00:34:04');
INSERT INTO `table_bill_out_records` VALUES ('313', '3', '2', '320', '1500.00', '2026-01-14 00:34:14', '2026-01-14 00:34:14', '2026-01-14 00:34:14');
INSERT INTO `table_bill_out_records` VALUES ('314', '3', '3', '325', '7500.00', '2026-01-14 00:51:29', '2026-01-14 00:51:29', '2026-01-14 00:51:29');
INSERT INTO `table_bill_out_records` VALUES ('315', '3', '2', '326', '3000.00', '2026-01-14 01:05:35', '2026-01-14 01:05:35', '2026-01-14 01:05:35');
INSERT INTO `table_bill_out_records` VALUES ('316', '3', '1', '327', '2500.00', '2026-01-14 01:05:50', '2026-01-14 01:05:50', '2026-01-14 01:05:50');
INSERT INTO `table_bill_out_records` VALUES ('317', '3', '3', '328', '2500.00', '2026-01-14 01:06:00', '2026-01-14 01:06:00', '2026-01-14 01:06:00');
INSERT INTO `table_bill_out_records` VALUES ('318', '3', '3', '332', '2500.00', '2026-01-14 01:22:47', '2026-01-14 01:22:47', '2026-01-14 01:22:47');
INSERT INTO `table_bill_out_records` VALUES ('319', '3', '2', '330', '2500.00', '2026-01-14 01:28:18', '2026-01-14 01:28:18', '2026-01-14 01:28:18');
INSERT INTO `table_bill_out_records` VALUES ('320', '3', '1', '329', '8000.00', '2026-01-14 01:42:35', '2026-01-14 01:42:35', '2026-01-14 01:42:35');
INSERT INTO `table_bill_out_records` VALUES ('321', '3', '1', '333', '3000.00', '2026-01-14 01:51:41', '2026-01-14 01:51:41', '2026-01-14 01:51:41');
INSERT INTO `table_bill_out_records` VALUES ('322', '3', '10', '331', '12000.00', '2026-01-14 02:08:26', '2026-01-14 02:08:26', '2026-01-14 02:08:26');
INSERT INTO `table_bill_out_records` VALUES ('323', '3', '1', '334', '1000.00', '2026-01-14 02:11:10', '2026-01-14 02:11:11', '2026-01-14 02:11:11');
INSERT INTO `table_bill_out_records` VALUES ('324', '6', '2', '335', '3000.00', '2026-01-14 02:21:24', '2026-01-14 02:21:24', '2026-01-14 02:21:24');
INSERT INTO `table_bill_out_records` VALUES ('325', '6', '1', '336', '3000.00', '2026-01-14 02:39:46', '2026-01-14 02:39:46', '2026-01-14 02:39:46');
INSERT INTO `table_bill_out_records` VALUES ('326', '6', '5', '341', '2500.00', '2026-01-14 09:34:11', '2026-01-14 09:34:11', '2026-01-14 09:34:11');
INSERT INTO `table_bill_out_records` VALUES ('327', '3', '1', '337', '6000.00', '2026-01-14 09:35:26', '2026-01-14 09:35:26', '2026-01-14 09:35:26');
INSERT INTO `table_bill_out_records` VALUES ('328', '6', '3', '339', '5000.00', '2026-01-14 09:35:58', '2026-01-14 09:35:58', '2026-01-14 09:35:58');
INSERT INTO `table_bill_out_records` VALUES ('329', '6', '2', '338', '3000.00', '2026-01-14 09:36:58', '2026-01-14 09:36:58', '2026-01-14 09:36:58');
INSERT INTO `table_bill_out_records` VALUES ('330', '3', '1', '342', '3000.00', '2026-01-14 09:45:12', '2026-01-14 09:45:12', '2026-01-14 09:45:12');
INSERT INTO `table_bill_out_records` VALUES ('331', '6', '4', '340', '2500.00', '2026-01-14 09:45:19', '2026-01-14 09:45:19', '2026-01-14 09:45:19');
INSERT INTO `table_bill_out_records` VALUES ('332', '6', '2', '343', '3000.00', '2026-01-14 09:49:52', '2026-01-14 09:49:52', '2026-01-14 09:49:52');
INSERT INTO `table_bill_out_records` VALUES ('333', '3', '1', '344', '6000.00', '2026-01-14 10:03:43', '2026-01-14 10:03:43', '2026-01-14 10:03:43');
INSERT INTO `table_bill_out_records` VALUES ('334', '3', '1', '345', '6500.00', '2026-01-14 10:05:41', '2026-01-14 10:05:41', '2026-01-14 10:05:41');
INSERT INTO `table_bill_out_records` VALUES ('335', '6', '2', '347', '4000.00', '2026-01-14 10:27:19', '2026-01-14 10:27:19', '2026-01-14 10:27:19');
INSERT INTO `table_bill_out_records` VALUES ('336', '3', '2', '348', '13500.00', '2026-01-14 10:44:13', '2026-01-14 10:44:13', '2026-01-14 10:44:13');
INSERT INTO `table_bill_out_records` VALUES ('337', '6', '1', '346', '7500.00', '2026-01-14 11:03:22', '2026-01-14 11:03:22', '2026-01-14 11:03:22');
INSERT INTO `table_bill_out_records` VALUES ('338', '6', '1', '350', '3000.00', '2026-01-14 11:05:48', '2026-01-14 11:05:48', '2026-01-14 11:05:48');
INSERT INTO `table_bill_out_records` VALUES ('339', '6', '1', '351', '3500.00', '2026-01-14 11:19:43', '2026-01-14 11:19:43', '2026-01-14 11:19:43');
INSERT INTO `table_bill_out_records` VALUES ('340', '6', '2', '349', '3500.00', '2026-01-14 11:21:51', '2026-01-14 11:21:51', '2026-01-14 11:21:51');
INSERT INTO `table_bill_out_records` VALUES ('341', '6', '1', '352', '2500.00', '2026-01-14 11:41:51', '2026-01-14 11:41:51', '2026-01-14 11:41:51');
INSERT INTO `table_bill_out_records` VALUES ('342', '6', '2', '353', '3000.00', '2026-01-14 11:42:14', '2026-01-14 11:42:14', '2026-01-14 11:42:14');
INSERT INTO `table_bill_out_records` VALUES ('343', '6', '4', '355', '3000.00', '2026-01-14 11:48:55', '2026-01-14 11:48:55', '2026-01-14 11:48:55');
INSERT INTO `table_bill_out_records` VALUES ('344', '3', '2', '357', '3000.00', '2026-01-14 11:53:05', '2026-01-14 11:53:05', '2026-01-14 11:53:05');
INSERT INTO `table_bill_out_records` VALUES ('345', '3', '1', '356', '7500.00', '2026-01-14 12:01:37', '2026-01-14 12:01:37', '2026-01-14 12:01:37');
INSERT INTO `table_bill_out_records` VALUES ('346', '3', '3', '354', '2500.00', '2026-01-14 12:08:24', '2026-01-14 12:08:24', '2026-01-14 12:08:24');
INSERT INTO `table_bill_out_records` VALUES ('347', '6', '1', '358', '1500.00', '2026-01-14 13:50:41', '2026-01-14 13:50:41', '2026-01-14 13:50:41');
INSERT INTO `table_bill_out_records` VALUES ('348', '3', '1', '359', '7000.00', '2026-01-14 16:02:06', '2026-01-14 16:02:06', '2026-01-14 16:02:06');
INSERT INTO `table_bill_out_records` VALUES ('349', '3', '2', '360', '3000.00', '2026-01-14 16:02:46', '2026-01-14 16:02:46', '2026-01-14 16:02:46');
INSERT INTO `table_bill_out_records` VALUES ('350', '3', '3', '361', '2500.00', '2026-01-14 16:32:13', '2026-01-14 16:32:13', '2026-01-14 16:32:13');
INSERT INTO `table_bill_out_records` VALUES ('351', '6', '2', '363', '3500.00', '2026-01-14 17:11:31', '2026-01-14 17:11:31', '2026-01-14 17:11:31');
INSERT INTO `table_bill_out_records` VALUES ('352', '3', '1', '362', '2500.00', '2026-01-14 17:12:06', '2026-01-14 17:12:06', '2026-01-14 17:12:06');
INSERT INTO `table_bill_out_records` VALUES ('353', '6', '2', '364', '3000.00', '2026-01-14 17:28:53', '2026-01-14 17:28:53', '2026-01-14 17:28:53');
INSERT INTO `table_bill_out_records` VALUES ('354', '6', '2', '365', '1500.00', '2026-01-14 17:59:52', '2026-01-14 17:59:52', '2026-01-14 17:59:52');
INSERT INTO `table_bill_out_records` VALUES ('355', '6', '1', '366', '2500.00', '2026-01-14 18:00:50', '2026-01-14 18:00:50', '2026-01-14 18:00:50');
INSERT INTO `table_bill_out_records` VALUES ('356', '3', '1', '367', '2500.00', '2026-01-14 18:03:19', '2026-01-14 18:03:19', '2026-01-14 18:03:19');
INSERT INTO `table_bill_out_records` VALUES ('357', '3', '1', '368', '2500.00', '2026-01-14 18:08:30', '2026-01-14 18:08:30', '2026-01-14 18:08:30');
INSERT INTO `table_bill_out_records` VALUES ('358', '3', '1', '369', '2500.00', '2026-01-14 18:26:45', '2026-01-14 18:26:45', '2026-01-14 18:26:45');
INSERT INTO `table_bill_out_records` VALUES ('359', '6', '1', '370', '5500.00', '2026-01-14 18:51:30', '2026-01-14 18:51:30', '2026-01-14 18:51:30');
INSERT INTO `table_bill_out_records` VALUES ('360', '3', '4', '373', '4000.00', '2026-01-14 18:53:15', '2026-01-14 18:53:15', '2026-01-14 18:53:15');
INSERT INTO `table_bill_out_records` VALUES ('361', '6', '3', '372', '6000.00', '2026-01-14 19:06:55', '2026-01-14 19:06:55', '2026-01-14 19:06:55');
INSERT INTO `table_bill_out_records` VALUES ('362', '3', '1', '374', '11000.00', '2026-01-14 19:14:56', '2026-01-14 19:14:56', '2026-01-14 19:14:56');
INSERT INTO `table_bill_out_records` VALUES ('363', '3', '2', '371', '3500.00', '2026-01-14 19:39:05', '2026-01-14 19:39:05', '2026-01-14 19:39:05');
INSERT INTO `table_bill_out_records` VALUES ('364', '3', '1', '375', '5000.00', '2026-01-14 19:57:50', '2026-01-14 19:57:50', '2026-01-14 19:57:50');
INSERT INTO `table_bill_out_records` VALUES ('365', '6', '1', '376', '2500.00', '2026-01-15 06:44:59', '2026-01-15 06:44:59', '2026-01-15 06:44:59');
INSERT INTO `table_bill_out_records` VALUES ('366', '6', '1', '377', '5000.00', '2026-01-15 06:51:30', '2026-01-15 06:51:30', '2026-01-15 06:51:30');
INSERT INTO `table_bill_out_records` VALUES ('367', '6', '2', '378', '3500.00', '2026-01-15 07:12:42', '2026-01-15 07:12:42', '2026-01-15 07:12:42');
INSERT INTO `table_bill_out_records` VALUES ('368', '6', '4', '381', '1500.00', '2026-01-15 07:23:46', '2026-01-15 07:23:46', '2026-01-15 07:23:46');
INSERT INTO `table_bill_out_records` VALUES ('369', '6', '3', '380', '4000.00', '2026-01-15 07:29:52', '2026-01-15 07:29:52', '2026-01-15 07:29:52');
INSERT INTO `table_bill_out_records` VALUES ('370', '6', '1', '379', '6000.00', '2026-01-15 07:30:02', '2026-01-15 07:30:02', '2026-01-15 07:30:02');
INSERT INTO `table_bill_out_records` VALUES ('371', '6', '1', '383', '13500.00', '2026-01-15 07:35:20', '2026-01-15 07:35:20', '2026-01-15 07:35:20');
INSERT INTO `table_bill_out_records` VALUES ('372', '3', '2', '382', '3000.00', '2026-01-15 07:40:56', '2026-01-15 07:40:56', '2026-01-15 07:40:56');
INSERT INTO `table_bill_out_records` VALUES ('373', '6', '2', '385', '3000.00', '2026-01-15 07:44:52', '2026-01-15 07:44:52', '2026-01-15 07:44:52');
INSERT INTO `table_bill_out_records` VALUES ('374', '3', '1', '384', '3000.00', '2026-01-15 07:53:23', '2026-01-15 07:53:23', '2026-01-15 07:53:23');
INSERT INTO `table_bill_out_records` VALUES ('375', '3', '2', '386', '6000.00', '2026-01-15 08:01:49', '2026-01-15 08:01:49', '2026-01-15 08:01:49');
INSERT INTO `table_bill_out_records` VALUES ('376', '6', '1', '388', '2500.00', '2026-01-15 08:07:15', '2026-01-15 08:07:15', '2026-01-15 08:07:15');
INSERT INTO `table_bill_out_records` VALUES ('377', '3', '2', '390', '10500.00', '2026-01-15 08:36:49', '2026-01-15 08:36:49', '2026-01-15 08:36:49');
INSERT INTO `table_bill_out_records` VALUES ('378', '3', '3', '391', '6000.00', '2026-01-15 08:39:06', '2026-01-15 08:39:06', '2026-01-15 08:39:06');
INSERT INTO `table_bill_out_records` VALUES ('379', '3', '1', '392', '34000.00', '2026-01-15 08:39:27', '2026-01-15 08:39:27', '2026-01-15 08:39:27');
INSERT INTO `table_bill_out_records` VALUES ('380', '6', '1', '393', '6000.00', '2026-01-15 08:56:05', '2026-01-15 08:56:05', '2026-01-15 08:56:05');
INSERT INTO `table_bill_out_records` VALUES ('381', '6', '1', '394', '2500.00', '2026-01-15 09:12:36', '2026-01-15 09:12:36', '2026-01-15 09:12:36');
INSERT INTO `table_bill_out_records` VALUES ('382', '6', '2', '395', '3000.00', '2026-01-15 09:12:47', '2026-01-15 09:12:47', '2026-01-15 09:12:47');
INSERT INTO `table_bill_out_records` VALUES ('383', '6', '3', '398', '6000.00', '2026-01-15 09:30:06', '2026-01-15 09:30:06', '2026-01-15 09:30:06');
INSERT INTO `table_bill_out_records` VALUES ('384', '6', '3', '387', '6000.00', '2026-01-15 09:30:13', '2026-01-15 09:30:13', '2026-01-15 09:30:13');
INSERT INTO `table_bill_out_records` VALUES ('385', '3', '2', '397', '3000.00', '2026-01-15 09:32:43', '2026-01-15 09:32:43', '2026-01-15 09:32:43');
INSERT INTO `table_bill_out_records` VALUES ('386', '3', '1', '396', '5500.00', '2026-01-15 09:34:26', '2026-01-15 09:34:26', '2026-01-15 09:34:26');
INSERT INTO `table_bill_out_records` VALUES ('387', '3', '2', '399', '3000.00', '2026-01-15 09:49:58', '2026-01-15 09:49:58', '2026-01-15 09:49:58');
INSERT INTO `table_bill_out_records` VALUES ('388', '3', '1', '400', '3000.00', '2026-01-15 09:51:07', '2026-01-15 09:51:07', '2026-01-15 09:51:07');
INSERT INTO `table_bill_out_records` VALUES ('389', '6', '1', '401', '3000.00', '2026-01-15 10:10:37', '2026-01-15 10:10:37', '2026-01-15 10:10:37');
INSERT INTO `table_bill_out_records` VALUES ('390', '3', '1', '402', '3000.00', '2026-01-15 10:13:16', '2026-01-15 10:13:16', '2026-01-15 10:13:16');
INSERT INTO `table_bill_out_records` VALUES ('391', '6', '1', '403', '4000.00', '2026-01-15 15:10:12', '2026-01-15 15:10:12', '2026-01-15 15:10:12');
INSERT INTO `table_bill_out_records` VALUES ('392', '6', '3', '406', '6000.00', '2026-01-15 15:41:46', '2026-01-15 15:41:46', '2026-01-15 15:41:46');
INSERT INTO `table_bill_out_records` VALUES ('393', '6', '2', '405', '2500.00', '2026-01-15 15:48:57', '2026-01-15 15:48:57', '2026-01-15 15:48:57');
INSERT INTO `table_bill_out_records` VALUES ('394', '3', '1', '407', '11500.00', '2026-01-15 15:58:05', '2026-01-15 15:58:05', '2026-01-15 15:58:05');
INSERT INTO `table_bill_out_records` VALUES ('395', '3', '1', '404', '2000.00', '2026-01-15 16:01:59', '2026-01-15 16:01:59', '2026-01-15 16:01:59');
INSERT INTO `table_bill_out_records` VALUES ('396', '3', '2', '408', '5500.00', '2026-01-15 16:13:47', '2026-01-15 16:13:47', '2026-01-15 16:13:47');
INSERT INTO `table_bill_out_records` VALUES ('397', '3', '1', '409', '2500.00', '2026-01-15 16:20:58', '2026-01-15 16:20:58', '2026-01-15 16:20:58');
INSERT INTO `table_bill_out_records` VALUES ('398', '6', '3', '410', '6000.00', '2026-01-15 16:25:00', '2026-01-15 16:25:00', '2026-01-15 16:25:00');
INSERT INTO `table_bill_out_records` VALUES ('399', '6', '3', '413', '4500.00', '2026-01-15 16:39:40', '2026-01-15 16:39:40', '2026-01-15 16:39:40');
INSERT INTO `table_bill_out_records` VALUES ('400', '3', '1', '411', '6000.00', '2026-01-15 16:43:25', '2026-01-15 16:43:25', '2026-01-15 16:43:25');
INSERT INTO `table_bill_out_records` VALUES ('401', '3', '2', '412', '8500.00', '2026-01-15 16:44:54', '2026-01-15 16:44:54', '2026-01-15 16:44:54');
INSERT INTO `table_bill_out_records` VALUES ('402', '6', '5', '414', '9000.00', '2026-01-15 16:54:16', '2026-01-15 16:54:16', '2026-01-15 16:54:16');


-- Table structure for `tables`

DROP TABLE IF EXISTS `tables`;
CREATE TABLE `tables` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `table_number` int NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'available',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tables_table_number_unique` (`table_number`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `tables`

INSERT INTO `tables` VALUES ('1', '1', 'available', '2026-01-03 14:42:26', '2026-01-15 16:43:25');
INSERT INTO `tables` VALUES ('2', '2', 'available', '2026-01-03 14:42:26', '2026-01-15 16:44:54');
INSERT INTO `tables` VALUES ('3', '3', 'available', '2026-01-03 14:42:26', '2026-01-15 16:39:40');
INSERT INTO `tables` VALUES ('4', '4', 'available', '2026-01-03 14:42:26', '2026-01-15 07:23:46');
INSERT INTO `tables` VALUES ('5', '5', 'available', '2026-01-03 14:42:26', '2026-01-15 16:54:16');
INSERT INTO `tables` VALUES ('6', '6', 'available', '2026-01-03 14:42:26', '2026-01-08 10:27:06');
INSERT INTO `tables` VALUES ('7', '7', 'available', '2026-01-03 14:42:26', '2026-01-03 14:42:26');
INSERT INTO `tables` VALUES ('8', '8', 'available', '2026-01-03 14:42:26', '2026-01-03 14:42:26');
INSERT INTO `tables` VALUES ('9', '9', 'available', '2026-01-03 14:42:26', '2026-01-03 15:29:01');
INSERT INTO `tables` VALUES ('10', '10', 'available', '2026-01-03 14:42:26', '2026-01-14 02:08:26');


-- Table structure for `users`

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `users`

INSERT INTO `users` VALUES ('1', 'Admin User', 'admin@example.com', NULL, '$2y$12$DlsgEvtudgeFQI9r35cF1.phBA393CKp12PoY8s6LvIfO/HhChjh6', '71A7fdWGm0quVJHnVbJoUaHmv0LoVVkaW97ZVO6ztZUsb6uzGeY4xu02xZLl', '2026-01-04 10:29:51', '2026-01-04 10:29:51');
INSERT INTO `users` VALUES ('2', 'GM', 'gm@example.com', NULL, '$2y$12$bSS1quBRBp5BBR5PhZEdD.MDSWU3PfYccwGBbV2AFddI3GZrdmOi6', NULL, '2026-01-04 10:29:53', '2026-01-04 10:29:53');
INSERT INTO `users` VALUES ('3', 'Waiter User', 'waiter@example.com', NULL, '$2y$12$1GyNHl1e8WvVURe0Q2ZLzuDxHJbF0SYlISiYpcCQFW8O9iKbYoN0.', 'EGpcISa6kbGiT2JjLz2R8wNwW41Ua3QzYAZSeGs2YrWd9PQgTmS0m3j4eK16', '2026-01-04 10:29:54', '2026-01-06 12:34:30');
INSERT INTO `users` VALUES ('4', 'Kitchen User', 'kitchen@example.com', NULL, '$2y$12$yt6rMja.zUzf/7GmqYvNKu9VHaq1imgBII99ac89dsCEhTVM.neDi', NULL, '2026-01-04 10:29:56', '2026-01-04 10:29:56');
INSERT INTO `users` VALUES ('5', 'supplier User', 'supplier@example.com', NULL, '$2y$12$PcUlXQkhNb/iZBcwGo5Wi.VseJfTAiR5BpwepccgXB.vO.S1/9E2S', 'YZwA4h5MLGq6K8Y5JEZhrim5dlyqCIxsjCdyvLHsDflxmIfMeuQO18Bai7sc', '2026-01-04 10:29:57', '2026-01-04 10:29:57');
INSERT INTO `users` VALUES ('6', 'Waiter 2', 'waiter2@example.com', NULL, '$2y$12$IQEDade1TgxusmoXmtZkX.j1wJuHbrWUttn6TuG2uy3MLAV4PXw7u', 'jEfkNA73Qp68u9yvnD7JBhDLX0UQzcIwcUoXzHdkvnFDyYkwBAtpq6941xEI', '2026-01-07 08:45:01', '2026-01-07 08:45:01');
SET FOREIGN_KEY_CHECKS = 1;
