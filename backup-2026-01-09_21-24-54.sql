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

INSERT INTO `cache` VALUES ('myanmarsar-cache-waiter2@exalple|45.125.4.32', 'i:1;', '1767776225');
INSERT INTO `cache` VALUES ('myanmarsar-cache-waiter2@exalple|45.125.4.32:timer', 'i:1767776225;', '1767776225');
INSERT INTO `cache` VALUES ('myanmarsar-cache-waiter2@example|45.125.4.32', 'i:1;', '1767776247');
INSERT INTO `cache` VALUES ('myanmarsar-cache-waiter2@example|45.125.4.32:timer', 'i:1767776247;', '1767776247');


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

INSERT INTO `expense_groups` VALUES ('1', 'နံနံပင် ဝယ်ခြင်း', '2026-01-04 14:17:04', '2026-01-04 14:17:04', 'restaurant');
INSERT INTO `expense_groups` VALUES ('2', '5*9 ပါဆယ်အိတ်', '2026-01-06 09:08:58', '2026-01-06 09:08:58', 'restaurant');
INSERT INTO `expense_groups` VALUES ('3', '6*11 ပါဆယ်အိတ်', '2026-01-06 09:09:19', '2026-01-06 09:09:19', 'restaurant');
INSERT INTO `expense_groups` VALUES ('4', 'ငရုပ်သီး ပါဆယ်အိတ်', '2026-01-06 09:09:33', '2026-01-06 09:09:33', 'restaurant');
INSERT INTO `expense_groups` VALUES ('5', 'ကောက်ညှင်းမွှေး', '2026-01-06 09:09:45', '2026-01-06 09:09:45', 'restaurant');
INSERT INTO `expense_groups` VALUES ('6', 'သံပုရာသီး', '2026-01-06 09:09:56', '2026-01-06 09:09:56', 'restaurant');
INSERT INTO `expense_groups` VALUES ('7', 'ပဲသီး', '2026-01-06 09:10:21', '2026-01-06 09:10:21', 'restaurant');
INSERT INTO `expense_groups` VALUES ('8', '20L သောက်ရေဘူး', '2026-01-06 09:10:37', '2026-01-06 09:10:37', 'restaurant');
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

INSERT INTO `food_item_ingredient` VALUES ('8', '18', '0.41');
INSERT INTO `food_item_ingredient` VALUES ('8', '22', '1');
INSERT INTO `food_item_ingredient` VALUES ('8', '25', '0.23');
INSERT INTO `food_item_ingredient` VALUES ('8', '27', '0.5');
INSERT INTO `food_item_ingredient` VALUES ('8', '28', '0.05');
INSERT INTO `food_item_ingredient` VALUES ('8', '30', '0.07');
INSERT INTO `food_item_ingredient` VALUES ('8', '39', '1.7');
INSERT INTO `food_item_ingredient` VALUES ('8', '54', '5');
INSERT INTO `food_item_ingredient` VALUES ('8', '59', '0.17');
INSERT INTO `food_item_ingredient` VALUES ('8', '68', '0.05');
INSERT INTO `food_item_ingredient` VALUES ('10', '18', '0.41');
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
INSERT INTO `food_item_ingredient` VALUES ('11', '18', '0.4');
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
INSERT INTO `food_item_ingredient` VALUES ('20', '18', '0.41');
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
INSERT INTO `food_item_ingredient` VALUES ('21', '18', '0.4');
INSERT INTO `food_item_ingredient` VALUES ('21', '22', '1');
INSERT INTO `food_item_ingredient` VALUES ('21', '25', '0.23');
INSERT INTO `food_item_ingredient` VALUES ('21', '27', '0.58');
INSERT INTO `food_item_ingredient` VALUES ('21', '28', '0.05');
INSERT INTO `food_item_ingredient` VALUES ('21', '30', '0.05');
INSERT INTO `food_item_ingredient` VALUES ('21', '39', '1.7');
INSERT INTO `food_item_ingredient` VALUES ('21', '57', '0.2');
INSERT INTO `food_item_ingredient` VALUES ('21', '59', '0.17');
INSERT INTO `food_item_ingredient` VALUES ('21', '68', '0.05');
INSERT INTO `food_item_ingredient` VALUES ('22', '18', '0.2');
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
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `ingredient_imports` VALUES ('29', '18', '11121', '91.00', '60.00', '2026-01-06', '2026-01-06 05:57:23', '2026-01-06 05:57:23');
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
INSERT INTO `ingredient_imports` VALUES ('41', '18', '61/9', '100.00', '60.00', '2026-01-06', '2026-01-06 07:46:10', '2026-01-06 07:46:10');
INSERT INTO `ingredient_imports` VALUES ('42', '18', '61/9', '100.00', '60.00', '2026-01-06', '2026-01-06 07:51:07', '2026-01-06 07:51:07');
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
INSERT INTO `ingredient_imports` VALUES ('65', '18', '71/13', '28.00', '107.00', '2026-01-07', '2026-01-07 02:17:46', '2026-01-07 02:17:46');
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
INSERT INTO `ingredient_imports` VALUES ('76', '18', '71/24', '300.00', '70.00', '2026-01-07', '2026-01-07 14:46:33', '2026-01-07 14:46:33');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `ingredients`

INSERT INTO `ingredients` VALUES ('18', 'ပဲဆန်', 'ကျပ်သား', '440.88', '70.00', '2026-01-04 08:15:43', '2026-01-09 13:49:37');
INSERT INTO `ingredients` VALUES ('19', 'ကြက်သွန်ဖြူ', 'ကျပ်သား', '289.75', '70.00', '2026-01-04 08:16:24', '2026-01-09 13:49:37');
INSERT INTO `ingredients` VALUES ('21', 'ကြက်နီ (အကြီး)', 'ကျပ်သား', '665.33', '37.00', '2026-01-04 08:17:49', '2026-01-09 13:49:37');
INSERT INTO `ingredients` VALUES ('22', 'ကြက်နီ (အသေး)', 'ကျပ်သား', '555.40', '11.00', '2026-01-04 08:18:14', '2026-01-09 13:49:37');
INSERT INTO `ingredients` VALUES ('24', 'ဆန်မှုန့်', 'ကျပ်သား', '224.95', '30.00', '2026-01-04 08:19:12', '2026-01-09 13:49:37');
INSERT INTO `ingredients` VALUES ('25', 'ပဲစိမ်းမှုန့်', 'ကျပ်သား', '55.66', '120.00', '2026-01-04 08:21:14', '2026-01-09 13:49:37');
INSERT INTO `ingredients` VALUES ('27', 'ဆီ', 'ကျပ်သား', '608.93', '112.00', '2026-01-04 08:22:05', '2026-01-09 13:49:37');
INSERT INTO `ingredients` VALUES ('28', 'ငရုတ်သီး(အလျှော်မှုန်)', 'ကျပ်သား', '50.10', '200.00', '2026-01-04 08:23:54', '2026-01-09 13:49:37');
INSERT INTO `ingredients` VALUES ('29', 'ငရုတ်ကောင်း', 'ကျပ်သား', '32.37', '550.00', '2026-01-04 08:26:19', '2026-01-09 13:49:37');
INSERT INTO `ingredients` VALUES ('30', 'ဆား', 'ကျပ်သား', '129.06', '20.00', '2026-01-04 08:26:56', '2026-01-09 13:49:37');
INSERT INTO `ingredients` VALUES ('31', 'ဆီချက်ကြက်သွန်‌ကြော်', 'ကျပ်သား', '62.00', '200.00', '2026-01-04 08:29:28', '2026-01-07 14:56:09');
INSERT INTO `ingredients` VALUES ('32', 'ဘဲဥ', 'လုံး', '52.00', '430.00', '2026-01-04 08:34:23', '2026-01-09 13:49:37');
INSERT INTO `ingredients` VALUES ('33', 'ကျောက်ချဉ်', 'ကျပ်သား', '20.00', '80.00', '2026-01-04 08:36:14', '2026-01-06 07:11:05');
INSERT INTO `ingredients` VALUES ('34', 'နံနံပင်', 'ကျပ်သား', '80.00', '50.00', '2026-01-04 08:37:23', '2026-01-09 10:55:43');
INSERT INTO `ingredients` VALUES ('35', 'သံပုရာသီး', 'လုံး', '1.00', '100.00', '2026-01-04 08:37:53', '2026-01-04 08:37:53');
INSERT INTO `ingredients` VALUES ('37', 'ပဲသီး', 'စီး', '18.00', '350.00', '2026-01-04 08:39:08', '2026-01-09 10:55:16');
INSERT INTO `ingredients` VALUES ('38', 'ငါးခြစ်', 'ကျပ်သား', '154.00', '550.00', '2026-01-04 08:40:16', '2026-01-09 12:28:55');
INSERT INTO `ingredients` VALUES ('39', 'ကြက်သား', 'ကျပ်သား', '238.40', '120.00', '2026-01-04 08:41:07', '2026-01-09 13:49:37');
INSERT INTO `ingredients` VALUES ('40', 'ငါးခြင်းဖြူ', 'ကျပ်သား', '387.17', '270.00', '2026-01-04 08:42:38', '2026-01-09 13:49:37');
INSERT INTO `ingredients` VALUES ('42', 'အချိုမှုန့် (500g=30ကျပ်သား)', 'ကျပ်သား', '111.39', '200.00', '2026-01-04 08:53:13', '2026-01-09 13:49:37');
INSERT INTO `ingredients` VALUES ('44', 'ငံပြာရည်အသေး', 'ဗူး', '1.00', '1000.00', '2026-01-04 08:56:53', '2026-01-04 08:56:53');
INSERT INTO `ingredients` VALUES ('47', 'ကောက်ညှင်းပဲကြော်', 'ခု', '8.00', '400.00', '2026-01-04 08:59:02', '2026-01-09 13:49:37');
INSERT INTO `ingredients` VALUES ('48', 'ဘူးသီး‌ကြော်', 'ခု', '11.00', '400.00', '2026-01-04 08:59:50', '2026-01-09 10:51:49');
INSERT INTO `ingredients` VALUES ('49', 'ကြက်သွန်ကြော်', 'ခု', '2.00', '400.00', '2026-01-04 09:00:24', '2026-01-09 12:11:20');
INSERT INTO `ingredients` VALUES ('50', 'ဘဲသွေး', 'ခု', '23.00', '375.00', '2026-01-04 09:01:05', '2026-01-09 10:26:39');
INSERT INTO `ingredients` VALUES ('51', 'အိကြာကွေ', 'ခြမ်း', '26.00', '300.00', '2026-01-04 09:01:38', '2026-01-09 10:50:27');
INSERT INTO `ingredients` VALUES ('52', 'မုန့်ဟင်းခါး(မုန့်ဖတ်)', 'ကျပ်သား', '309.00', '25.00', '2026-01-04 09:02:34', '2026-01-09 13:00:16');
INSERT INTO `ingredients` VALUES ('53', 'ညှပ်ခေါက်ဆွဲ(မုန့်ဖတ်)', 'ကျပ်သား', '719.00', '24.00', '2026-01-04 09:05:53', '2026-01-09 13:49:37');
INSERT INTO `ingredients` VALUES ('54', 'အုန်းနို့ခေါက်ဆွဲ(မုန့်ဖတ်)', 'ကျပ်သား', '363.00', '75.00', '2026-01-04 09:13:11', '2026-01-09 13:49:37');
INSERT INTO `ingredients` VALUES ('57', 'ဟင်းချက်ရေသန့်', 'လီတာ', '147.90', '75.00', '2026-01-04 09:19:45', '2026-01-09 13:49:37');
INSERT INTO `ingredients` VALUES ('58', 'လက်ဖက်ခြောက်', 'ကျပ်သား', '26.00', '280.00', '2026-01-04 09:20:31', '2026-01-06 07:45:49');
INSERT INTO `ingredients` VALUES ('59', 'သကြား', 'ကျပ်သား', '99.14', '50.00', '2026-01-04 09:56:15', '2026-01-09 13:49:37');
INSERT INTO `ingredients` VALUES ('60', 'အကျွတ်‌ကြော်', 'ထုပ်', '1.00', '5000.00', '2026-01-04 09:56:55', '2026-01-04 09:56:55');
INSERT INTO `ingredients` VALUES ('61', 'ဆော်တာ', 'ကျပ်သား', '20.00', '30.00', '2026-01-04 09:57:46', '2026-01-06 07:13:00');
INSERT INTO `ingredients` VALUES ('62', 'နနွင်းမှုန့်', 'ကျပ်သား', '28.00', '200.00', '2026-01-04 09:58:34', '2026-01-08 13:33:25');
INSERT INTO `ingredients` VALUES ('63', 'ငရုတ်သီး(အရောင်တင်မှုန့်)', 'ကျပ်သား', '18.00', '25.00', '2026-01-04 10:01:54', '2026-01-06 07:10:12');
INSERT INTO `ingredients` VALUES ('65', 'ပဲ‌ကြော်', 'ခု', '101.00', '250.00', '2026-01-04 10:05:14', '2026-01-06 09:01:02');
INSERT INTO `ingredients` VALUES ('66', 'ငှက်ပျောအူ', 'ချောင်း', '1.00', '3000.00', '2026-01-04 10:07:52', '2026-01-04 10:07:52');
INSERT INTO `ingredients` VALUES ('68', 'အုန်းသီးအသား(ခြစ်ညှစ်)', 'အလုံး', '5.10', '1500.00', '2026-01-04 10:11:59', '2026-01-09 13:49:37');
INSERT INTO `ingredients` VALUES ('69', 'ငံပြာရည် (1Liter=69 ကျပ်သား)', 'ကျပ်သား', '79.87', '36.00', '2026-01-06 07:17:15', '2026-01-09 13:49:37');
INSERT INTO `ingredients` VALUES ('70', 'မီးသွေး', 'ကျပ်သား', '1700.00', '26.50', '2026-01-06 08:53:10', '2026-01-06 08:53:48');


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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=423 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

INSERT INTO `sessions` VALUES ('09ZrcA2dPKNCIvQ5D6xdqLc3KCQthukerGQ0u1RM', '1', '163.123.193.4', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSmFCQjk0MmtGWEUzMFF5aWtmbU54d05SNFl5MDM2Z3plam1oeUhldCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vcG9zLm1vZXN0YXJ0cmF2ZWwuY29tL2FkbWluIjtzOjU6InJvdXRlIjtzOjE1OiJhZG1pbi5kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', '1767993892');
INSERT INTO `sessions` VALUES ('dIJz8E3k6h1qO0JpPKiLEFxzZKCZ4RfAwpP56dGC', NULL, '64.226.65.160', 'Mozilla/5.0 (l9scan/2.0.330313e21383e25393e2035313; +https://leakix.net)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUJTSG02aUJOaUJJczJLTE1nYUxmSVdRV1drYTRqeURMMktES2lHWSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjI6Imh0dHBzOi8vd3d3LnNhd2h0dXRuYWluZy5jb20vP3Jlc3Rfcm91dGU9JTJGd3AlMkZ2MiUyRnVzZXJzJTJGIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', '1767992979');
INSERT INTO `sessions` VALUES ('GacKXDBy3YJLY1jAwVUqr0aR9PlVREQxYp1ugDgf', NULL, '93.183.125.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.1.2 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMmI0UHpXMmQzWmx5N25ZbWJxMzF3N1NrQ09jelA0cHhneVl2Z3hmVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1767989633');
INSERT INTO `sessions` VALUES ('IMogPZMdxUef6MyJ2nFIqCeb0c5MSNyBzsLzrNzq', NULL, '18.224.192.118', 'cypex.ai/scanning Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFpYQTd6Z0RSUkFQcnRQdDF4N1VHWmczdTVYVzNobW9KenRZQWNOayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vZWNvbW1lcmVuY2VhcGkuc2F3aHR1dG5haW5nLmNvbSI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1767993594');
INSERT INTO `sessions` VALUES ('KKC7SqNs54dkBDO30C8MZjJ1WP3xbu9OxH2nUSbs', NULL, '68.64.178.11', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_8; es-es) AppleWebKit/533.21.1 (KHTML, like Gecko) Version/5.0.5 Safari/533.21.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUTlnNEJnN1FUa2l3SDBQdk8wZTRlNzZyRTEwbHlBWjZBdHpWdnpVNyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1767988171');
INSERT INTO `sessions` VALUES ('klCdQNMXPVOYNxScXB9kJ8zv9goUvohfvuZYybw5', NULL, '204.76.203.25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFEzUlU3ZG9kU3pvVjFIVFhDZHBaRFl6YzJ1UWZpbHptM0NRdEJ6QiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjU6Imh0dHBzOi8vbW9lc3RhcnRyYXZlbC5jb20iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', '1767992710');
INSERT INTO `sessions` VALUES ('M9gI1C0D8Ky5PXyQqNWjpWG88NX6GtKCmypP94iY', NULL, '64.226.65.160', 'Mozilla/5.0 (l9scan/2.0.330313e21383e25393e2035313; +https://leakix.net)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2lzM2hubHdkNlp3WmNxenNYR3A0Wk42d1JCTG9KWDl0OUtMMzBocSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vd3d3LnNhd2h0dXRuYWluZy5jb20iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', '1767992941');
INSERT INTO `sessions` VALUES ('OmQQ6FZWqCqjrBL6wOHjeIbLQdPRVurWM9zZg8zu', NULL, '64.226.65.160', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmZVbmdreVRTRzFUYk1TalJTWDZIekttSTlvU2cwMUNSU1ZCVzRQRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vd3d3LnNhd2h0dXRuYWluZy5jb20iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', '1767992938');
INSERT INTO `sessions` VALUES ('ORltntUTMwX3A9SarudZhXvhXPPNwaaTgIzwGyRl', NULL, '141.98.82.26', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:127.0) Gecko/20100101 Firefox/127.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQml3bHhwUmdhVUgwSUpyeWxwdTdCRHlrMWcxc1ZQV3pubWt4MmlFdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vMTUwLjk1LjgxLjEwMyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1767993204');
INSERT INTO `sessions` VALUES ('pdXlJeNdID4Sp7vZEpz5BxQwR3g2X8bUiAqx6jyF', NULL, '3.80.247.73', 'Screaming Frog SEO Spider/8.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmpocWVNckhvVE9MaGNYMVVvUlAzU2R2eU9VTWlwQVJkS3Q5cTUySSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjU6Imh0dHBzOi8vbW9lc3RhcnRyYXZlbC5jb20iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', '1767987528');
INSERT INTO `sessions` VALUES ('QFpPLBE1AcKYSSmDvBOBI4VBwTYHkQxRX0wGuaBn', NULL, '165.22.120.7', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0pLeWx4dXpkekN6UkxKWE1WdHNuSU5QYzljRHh0d01sVEtaWEFSSiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjU6Imh0dHBzOi8vbW9lc3RhcnRyYXZlbC5jb20iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', '1767991852');
INSERT INTO `sessions` VALUES ('REiI1encVpUnRVYiMWI3lDgbHIUlAEbpj7GQi9qO', NULL, '93.183.125.2', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRFJwNk1IMGpnRWlEZTNGazFKUEYwNmZWaEE3TFNjNmkwdjdPeENlNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1767992205');
INSERT INTO `sessions` VALUES ('Uit3RHlxX0vblJwI3uEQjCiMw9YmYfJuJBXgjJ96', NULL, '54.163.2.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidEVVNEtlS1g4Z1RETHQwSUc0R2pGcW5TVk9zWFFodVk3ajFyVTJ6RSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vMTUwLjk1LjgxLjEwMyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1767992670');
INSERT INTO `sessions` VALUES ('X1ZvfZqnBFLvGvr9blLo2XdaC8qmJ83fIPfPhAiZ', NULL, '3.146.111.124', 'cypex.ai/scanning Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFZTVjgxY3Yzbk5TbEhPR1loSjNXdDNXTzJZdGNKREZITkFxRWRQVSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vdGVsZWdyYW1ib3Quc2F3aHR1dG5haW5nLmNvbSI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1767990893');
INSERT INTO `sessions` VALUES ('Y630VHPOymx3WOlvEsY8mUiK5d7xxHk1doqo9J4g', NULL, '185.242.226.121', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2VGSEUzY3ZrbWk0Qld1RkozWTRjYTIxRzVWbXdTWTdOUFNGU0pJdSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vMTUwLjk1LjgxLjEwMyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1767991824');
INSERT INTO `sessions` VALUES ('YkrYl5bA0umP2gmDJuY1ZWO8738GVrCDKxehSsku', NULL, '204.76.203.25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWY4c0l2NmxLbFB1RXRuaXdOQ3lGQUpLMmRqTTFXcWdMa3dURDZqTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdGVzdC1zb2Z0d2FyZS5zYXdodHV0bmFpbmcuY29tIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', '1767989225');


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
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

INSERT INTO `tables` VALUES ('1', '1', 'available', '2026-01-03 14:42:26', '2026-01-09 13:50:04');
INSERT INTO `tables` VALUES ('2', '2', 'available', '2026-01-03 14:42:26', '2026-01-09 12:33:04');
INSERT INTO `tables` VALUES ('3', '3', 'available', '2026-01-03 14:42:26', '2026-01-09 13:48:03');
INSERT INTO `tables` VALUES ('4', '4', 'available', '2026-01-03 14:42:26', '2026-01-09 00:56:56');
INSERT INTO `tables` VALUES ('5', '5', 'available', '2026-01-03 14:42:26', '2026-01-08 11:27:41');
INSERT INTO `tables` VALUES ('6', '6', 'available', '2026-01-03 14:42:26', '2026-01-08 10:27:06');
INSERT INTO `tables` VALUES ('7', '7', 'available', '2026-01-03 14:42:26', '2026-01-03 14:42:26');
INSERT INTO `tables` VALUES ('8', '8', 'available', '2026-01-03 14:42:26', '2026-01-03 14:42:26');
INSERT INTO `tables` VALUES ('9', '9', 'available', '2026-01-03 14:42:26', '2026-01-03 15:29:01');
INSERT INTO `tables` VALUES ('10', '10', 'available', '2026-01-03 14:42:26', '2026-01-04 08:03:56');


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

INSERT INTO `users` VALUES ('1', 'Admin User', 'admin@example.com', NULL, '$2y$12$DlsgEvtudgeFQI9r35cF1.phBA393CKp12PoY8s6LvIfO/HhChjh6', 'YjOepuyhbGw8mdfg1eKUsTLJ92oSmwxNR3x1iRcpm2EG4O9kc2so8Z2qVpPz', '2026-01-04 10:29:51', '2026-01-04 10:29:51');
INSERT INTO `users` VALUES ('2', 'GM', 'gm@example.com', NULL, '$2y$12$bSS1quBRBp5BBR5PhZEdD.MDSWU3PfYccwGBbV2AFddI3GZrdmOi6', NULL, '2026-01-04 10:29:53', '2026-01-04 10:29:53');
INSERT INTO `users` VALUES ('3', 'Waiter User', 'waiter@example.com', NULL, '$2y$12$1GyNHl1e8WvVURe0Q2ZLzuDxHJbF0SYlISiYpcCQFW8O9iKbYoN0.', 'wVEoe1v6g8nnGxdiOuplPCi5EqWJt0HS7TbtpYy0zQnlEhdf00B6YGtASLmE', '2026-01-04 10:29:54', '2026-01-06 12:34:30');
INSERT INTO `users` VALUES ('4', 'Kitchen User', 'kitchen@example.com', NULL, '$2y$12$yt6rMja.zUzf/7GmqYvNKu9VHaq1imgBII99ac89dsCEhTVM.neDi', NULL, '2026-01-04 10:29:56', '2026-01-04 10:29:56');
INSERT INTO `users` VALUES ('5', 'supplier User', 'supplier@example.com', NULL, '$2y$12$PcUlXQkhNb/iZBcwGo5Wi.VseJfTAiR5BpwepccgXB.vO.S1/9E2S', 'oFAD6JR2PDGHzspajS8toCL4uaFSUvetvUTViSXQn3WD1pWBEkJPFmTmP55j', '2026-01-04 10:29:57', '2026-01-04 10:29:57');
INSERT INTO `users` VALUES ('6', 'Waiter 2', 'waiter2@example.com', NULL, '$2y$12$IQEDade1TgxusmoXmtZkX.j1wJuHbrWUttn6TuG2uy3MLAV4PXw7u', 'jEfkNA73Qp68u9yvnD7JBhDLX0UQzcIwcUoXzHdkvnFDyYkwBAtpq6941xEI', '2026-01-07 08:45:01', '2026-01-07 08:45:01');
SET FOREIGN_KEY_CHECKS = 0;
