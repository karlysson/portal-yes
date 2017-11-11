-- --------------------------------------------------------
-- Servidor:                     localhost
-- Versão do servidor:           5.6.35 - MySQL Community Server (GPL)
-- OS do Servidor:               osx10.9
-- HeidiSQL Versão:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para site_portal-yes
CREATE DATABASE IF NOT EXISTS `site_portal-yes` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `site_portal-yes`;


-- Copiando estrutura para tabela site_portal-yes.advertisings
CREATE TABLE IF NOT EXISTS `advertisings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `advertising_category_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `choice` varchar(255) DEFAULT 's',
  `facebook` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `google` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `cover_file_name` varchar(255) DEFAULT NULL,
  `cover_content_type` varchar(255) DEFAULT NULL,
  `cover_file_size` int(11) DEFAULT NULL,
  `cover_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_advertisings_on_advertising_category_id` (`advertising_category_id`),
  KEY `index_advertisings_on_company_id` (`company_id`),
  CONSTRAINT `fk_rails_24f9df8aba` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `fk_rails_b7521c7ad5` FOREIGN KEY (`advertising_category_id`) REFERENCES `advertising_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.advertisings: ~3 rows (aproximadamente)
DELETE FROM `advertisings`;
/*!40000 ALTER TABLE `advertisings` DISABLE KEYS */;
INSERT INTO `advertisings` (`id`, `name`, `description`, `advertising_category_id`, `company_id`, `address`, `phone`, `email`, `site`, `choice`, `facebook`, `instagram`, `twitter`, `google`, `created_at`, `updated_at`, `cover_file_name`, `cover_content_type`, `cover_file_size`, `cover_updated_at`) VALUES
	(1, 'Yes Treinamentos', '<p style="text-align: justify;">Treinamentos, Cursos Engenharia, Arquitetura, Urbanismos, Design Gr&aacute;fico, Publicidade, Propaganda, Inform&aacute;tica</p>\r\n', 3, 2, 'Rua', '99909', 'email@gmail.com', 'yestreinamentos.com.br', 'n', 'https://www.facebook.com/YesTreinamentos', 'https://www.instagram.com', 'https://www.twiiter.com', 'https://plus.google.com/', '2017-08-02 01:33:40', '2017-09-19 11:31:17', 'yes_cursos.jpg', 'image/jpeg', 142066, '2017-09-18 13:31:06'),
	(2, 'Empresa 02', 'descrição', 2, 1, 'Rua', '99909', 'email@gmail.com', 'www.site.com.br', 's', 'face', 'instagram', 'twiiter', 'google', '2017-08-03 01:57:25', '2017-09-15 15:30:19', 'jap.png', 'image/png', 247903, '2017-09-15 15:30:18'),
	(3, 'Anuncio', 'dfasdas', 1, 1, '', '', '', '', 's', 'face', 'instagram', 'twiiter', 'google', '2017-09-16 18:47:37', '2017-09-18 13:25:09', 'jap.jpg', 'image/jpeg', 119146, '2017-09-18 13:25:09');
/*!40000 ALTER TABLE `advertisings` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.advertising_categories
CREATE TABLE IF NOT EXISTS `advertising_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT '#2c2231',
  `font` varchar(255) DEFAULT '#fff',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.advertising_categories: ~3 rows (aproximadamente)
DELETE FROM `advertising_categories`;
/*!40000 ALTER TABLE `advertising_categories` DISABLE KEYS */;
INSERT INTO `advertising_categories` (`id`, `name`, `color`, `font`, `created_at`, `updated_at`) VALUES
	(1, 'Moda e Acessórios', '#FF69B4', '#fff', '2017-08-02 01:28:26', '2017-09-18 13:45:06'),
	(2, 'Informática e Eletrônicos', '#87CEFF', '#fff', '2017-08-02 01:30:34', '2017-09-18 13:45:25'),
	(3, 'Escola e Treinamentos', '#00FF00', '#fff', '2017-09-18 13:31:57', '2017-09-18 13:44:46');
/*!40000 ALTER TABLE `advertising_categories` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.ar_internal_metadata
CREATE TABLE IF NOT EXISTS `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.ar_internal_metadata: ~1 rows (aproximadamente)
DELETE FROM `ar_internal_metadata`;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`) VALUES
	('environment', 'development', '2017-07-25 18:11:05', '2017-07-25 18:11:05');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.assets
CREATE TABLE IF NOT EXISTS `assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `advertising_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image_file_name` varchar(255) DEFAULT NULL,
  `image_content_type` varchar(255) DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_assets_on_company_id` (`company_id`),
  KEY `index_assets_on_advertising_id` (`advertising_id`),
  CONSTRAINT `fk_rails_930cea5f95` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.assets: ~5 rows (aproximadamente)
DELETE FROM `assets`;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` (`id`, `company_id`, `advertising_id`, `created_at`, `updated_at`, `image_file_name`, `image_content_type`, `image_file_size`, `image_updated_at`) VALUES
	(12, NULL, 2, '2017-08-03 01:57:25', '2017-08-03 01:57:25', 'Cidade-sem-imagem(1).jpg', 'image/jpeg', 278620, '2017-08-03 01:57:23'),
	(13, NULL, 2, '2017-08-03 01:57:25', '2017-08-03 01:57:25', '2017-07-18.jpg', 'image/jpeg', 380974, '2017-08-03 01:57:23'),
	(14, 2, NULL, '2017-09-19 09:24:32', '2017-09-19 09:24:32', 'gl-2.jpg', 'image/jpeg', 5058517, '2017-09-19 09:24:02'),
	(15, 2, NULL, '2017-09-19 09:24:32', '2017-09-19 09:24:32', 'gl-3.jpg', 'image/jpeg', 5301067, '2017-09-19 09:24:14'),
	(16, 2, NULL, '2017-09-19 09:24:32', '2017-09-19 09:24:32', 'gl-4.jpg', 'image/jpeg', 5176861, '2017-09-19 09:24:23');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.banners
CREATE TABLE IF NOT EXISTS `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image_file_name` varchar(255) DEFAULT NULL,
  `image_content_type` varchar(255) DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.banners: ~2 rows (aproximadamente)
DELETE FROM `banners`;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` (`id`, `name`, `created_at`, `updated_at`, `image_file_name`, `image_content_type`, `image_file_size`, `image_updated_at`, `order`, `url`, `status`, `target`) VALUES
	(2, 'Banner 01', '2017-09-18 10:33:07', '2017-09-18 10:34:03', '02.png', 'image/png', 1864434, '2017-09-18 10:34:01', 1, '#', 'Ativo', ''),
	(3, 'Banner 02', '2017-09-18 10:44:21', '2017-09-18 10:44:21', '03.png', 'image/png', 7074236, '2017-09-18 10:44:11', 2, '#', 'Ativo', '');
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.cities
CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cities_on_state_id` (`state_id`),
  CONSTRAINT `fk_rails_59b5e22e07` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.cities: ~1 rows (aproximadamente)
DELETE FROM `cities`;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` (`id`, `name`, `state_id`, `created_at`, `updated_at`) VALUES
	(1, 'Goiânia', 1, '2017-07-31 14:13:46', '2017-07-31 14:13:46');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.ckeditor_assets
CREATE TABLE IF NOT EXISTS `ckeditor_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_file_name` varchar(255) NOT NULL,
  `data_content_type` varchar(255) DEFAULT NULL,
  `data_file_size` int(11) DEFAULT NULL,
  `data_fingerprint` varchar(255) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ckeditor_assets_on_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.ckeditor_assets: ~2 rows (aproximadamente)
DELETE FROM `ckeditor_assets`;
/*!40000 ALTER TABLE `ckeditor_assets` DISABLE KEYS */;
INSERT INTO `ckeditor_assets` (`id`, `data_file_name`, `data_content_type`, `data_file_size`, `data_fingerprint`, `type`, `width`, `height`, `created_at`, `updated_at`) VALUES
	(1, 'emp.png', 'image/png', 5096, '0152102f4d521f7b1a9e58c035827a6b', 'Ckeditor::Picture', 225, 225, '2017-07-26 22:14:15', '2017-07-26 22:14:15'),
	(2, '17.png', 'image/png', 1584, 'a40b6db9d78ed2b999f913489df7e69c', 'Ckeditor::Picture', 113, 113, '2017-08-03 00:25:14', '2017-08-03 00:25:14');
/*!40000 ALTER TABLE `ckeditor_assets` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.companies
CREATE TABLE IF NOT EXISTS `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `initial_care` time DEFAULT NULL,
  `end_care` time DEFAULT NULL,
  `initial_interval` time DEFAULT NULL,
  `end_range` time DEFAULT NULL,
  `md_facebook` varchar(255) DEFAULT NULL,
  `md_google` varchar(255) DEFAULT NULL,
  `md_twitter` varchar(255) DEFAULT NULL,
  `obs` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo_content_type` varchar(255) DEFAULT NULL,
  `logo_file_size` int(11) DEFAULT NULL,
  `logo_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_companies_on_city_id` (`city_id`),
  CONSTRAINT `fk_city` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.companies: ~2 rows (aproximadamente)
DELETE FROM `companies`;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` (`id`, `name`, `title`, `city_id`, `address`, `phone`, `email`, `latitude`, `longitude`, `zip_code`, `initial_care`, `end_care`, `initial_interval`, `end_range`, `md_facebook`, `md_google`, `md_twitter`, `obs`, `created_at`, `updated_at`, `logo_file_name`, `logo_content_type`, `logo_file_size`, `logo_updated_at`) VALUES
	(1, 'Anexo Soluções', 'Anexo Soluções', 1, 'Endereço', '(62) 9 9903-5935', 'conato@anexoolucoes.com.br', '', '', '740000', '08:00:00', '18:00:00', '13:00:00', '14:00:00', 'anexosolucoes', 'anexosolucoes', 'anexosolucoes', '<p><img alt="" src="/ckeditor_assets/pictures/1/content_emp.png" style="width: 225px; height: 225px;" />obs</p>\r\n', '2017-07-26 18:26:32', '2017-09-19 12:15:08', 'anexo2.png', 'image/png', 52512, '2017-09-19 12:15:08'),
	(2, 'Yes Treinamentos', 'Yes Treinamentos', 1, 'Av. Tocantins', '(62) 3223-6100', 'contato@yestreinamentos.com', '', '', '', '06:22:00', '06:22:00', '06:22:00', '06:22:00', 'anexosolucoes', 'anexosolucoes', 'anexosolucoes', 'anexosolucoes', '2017-09-19 09:23:07', '2017-09-19 09:23:28', 'yes_cursos.jpg', 'image/jpeg', 56542, '2017-09-19 09:23:28');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.company_categories
CREATE TABLE IF NOT EXISTS `company_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.company_categories: ~15 rows (aproximadamente)
DELETE FROM `company_categories`;
/*!40000 ALTER TABLE `company_categories` DISABLE KEYS */;
INSERT INTO `company_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Alimentação', '2017-07-26 17:16:44', '2017-07-26 17:16:44'),
	(2, 'Automóveis', '2017-07-26 17:17:18', '2017-07-26 17:17:18'),
	(3, 'Beleza e Cosméticos‎', '2017-07-26 17:18:29', '2017-07-26 17:18:29'),
	(4, 'Engenharia', '2017-07-31 14:02:00', '2017-07-31 14:02:00'),
	(5, 'Financeira', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(6, 'Hotelaria e Turismo', '2017-07-31 14:02:02', '2017-07-31 14:02:02'),
	(7, 'Industrial', '2017-07-31 14:02:42', '2017-07-31 14:02:42'),
	(8, 'Informática', '2017-07-31 14:03:32', '2017-07-31 14:03:32'),
	(9, 'Jurídica', '2017-07-31 14:03:32', '2017-07-31 14:03:32'),
	(10, 'Saúde', '2017-07-31 14:03:53', '2017-07-31 14:03:54'),
	(11, 'Serviços Sociais', '2017-07-31 14:04:04', '2017-07-31 14:04:05'),
	(12, 'Suprimentos', '2017-07-31 14:04:17', '2017-07-31 14:04:18'),
	(13, 'Telecomunicações', '2017-07-31 14:05:23', '2017-07-31 14:05:24'),
	(14, 'Telemarketing', '2017-07-31 14:05:36', '2017-07-31 14:05:36'),
	(15, 'Técnica', '2017-07-31 14:05:51', '2017-07-31 14:05:52');
/*!40000 ALTER TABLE `company_categories` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.company_category_relationships
CREATE TABLE IF NOT EXISTS `company_category_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `company_category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_company_category_relationships_on_company_id` (`company_id`),
  KEY `index_company_category_relationships_on_company_category_id` (`company_category_id`),
  CONSTRAINT `fk_rails_1a6960b70c` FOREIGN KEY (`company_category_id`) REFERENCES `company_categories` (`id`),
  CONSTRAINT `fk_rails_5cd68e46bc` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.company_category_relationships: ~1 rows (aproximadamente)
DELETE FROM `company_category_relationships`;
/*!40000 ALTER TABLE `company_category_relationships` DISABLE KEYS */;
INSERT INTO `company_category_relationships` (`id`, `company_id`, `company_category_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 2, '2017-07-30 22:08:13', '2017-07-30 22:08:13');
/*!40000 ALTER TABLE `company_category_relationships` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.contacts
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT 'A',
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.contacts: ~1 rows (aproximadamente)
DELETE FROM `contacts`;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` (`id`, `status`, `name`, `email`, `phone`, `subject`, `message`, `created_at`, `updated_at`) VALUES
	(7, 'A', 'Tubal Leonel', 'tubal.ti@gmail.com', '2333', 'd', 'dfasdfas', '2017-09-20 02:12:30', '2017-09-20 02:12:30');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.courses
CREATE TABLE IF NOT EXISTS `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `course_category_id` int(11) DEFAULT NULL,
  `workload` varchar(255) DEFAULT NULL,
  `obs` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_courses_on_course_category_id` (`course_category_id`),
  KEY `index_courses_on_user_id` (`user_id`),
  CONSTRAINT `fk_course` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_a24c852b08` FOREIGN KEY (`course_category_id`) REFERENCES `course_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.courses: ~2 rows (aproximadamente)
DELETE FROM `courses`;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` (`id`, `user_id`, `name`, `course_category_id`, `workload`, `obs`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Informática Basica', 3, '80hrs', 'Windows, Word, Excel, Power Point', '2017-08-01 17:12:11', '2017-08-01 17:12:11'),
	(2, 1, 'Corel', 2, '80hrs', 'sdfasdfasdf', '2017-08-01 18:55:55', '2017-08-01 18:55:55');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.course_categories
CREATE TABLE IF NOT EXISTS `course_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.course_categories: ~3 rows (aproximadamente)
DELETE FROM `course_categories`;
/*!40000 ALTER TABLE `course_categories` DISABLE KEYS */;
INSERT INTO `course_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Administrativo', '2017-08-01 17:07:01', '2017-08-01 17:07:01'),
	(2, 'Designer', '2017-08-01 17:07:10', '2017-08-01 17:07:10'),
	(3, 'Informática', '2017-08-01 17:10:53', '2017-08-01 17:10:53');
/*!40000 ALTER TABLE `course_categories` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.course_interations
CREATE TABLE IF NOT EXISTS `course_interations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `page` varchar(255) DEFAULT 'interation',
  `page_id` int(11) DEFAULT NULL,
  `others` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_course_interations_on_course_id` (`course_id`),
  KEY `index_course_interations_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_0c517ec41a` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_831d7f711a` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.course_interations: ~6 rows (aproximadamente)
DELETE FROM `course_interations`;
/*!40000 ALTER TABLE `course_interations` DISABLE KEYS */;
INSERT INTO `course_interations` (`id`, `course_id`, `user_id`, `page`, `page_id`, `others`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'curriculum', 1, 'outros curos', '2017-08-01 18:24:35', '2017-08-01 18:24:35'),
	(2, 1, 1, 'curriculum', 1, 'sdfasdfasdf', '2017-08-01 18:30:15', '2017-08-01 18:30:15'),
	(3, 1, 1, 'curriculum', 1, 'sdfasdfasdf', '2017-08-01 18:30:33', '2017-08-01 18:30:33'),
	(4, 1, 1, 'curriculum', 1, 'dfsdfg', '2017-08-01 18:55:32', '2017-08-01 18:55:32'),
	(5, 2, 1, 'curriculum', 1, 'dasdfasd', '2017-08-01 18:56:54', '2017-08-01 18:56:54'),
	(6, 1, 1, 'curriculum', 4, '', '2017-08-03 15:20:49', '2017-08-03 15:20:49');
/*!40000 ALTER TABLE `course_interations` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.curriculums
CREATE TABLE IF NOT EXISTS `curriculums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT 'a',
  `travel` varchar(255) DEFAULT NULL,
  `availability` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `marital_status` varchar(255) DEFAULT NULL,
  `identity` varchar(255) DEFAULT NULL,
  `cpf` varchar(255) DEFAULT NULL,
  `elector_title` varchar(255) DEFAULT NULL,
  `inscription` varchar(255) DEFAULT NULL,
  `zone` varchar(255) DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  `cnh` varchar(255) DEFAULT NULL,
  `professional_experience` varchar(255) DEFAULT NULL,
  `professional_preference` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `block` varchar(255) DEFAULT NULL,
  `lot` varchar(255) DEFAULT NULL,
  `sector` varchar(255) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `curriculum_office_id` int(11) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `cell_phone` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `study` varchar(255) DEFAULT NULL,
  `teaching` varchar(255) DEFAULT NULL,
  `period` varchar(255) DEFAULT NULL,
  `courses` varchar(255) DEFAULT NULL,
  `employee` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `father` varchar(255) DEFAULT NULL,
  `profession_father` varchar(255) DEFAULT NULL,
  `mother` varchar(255) DEFAULT NULL,
  `profession_mother` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_curriculums_on_city_id` (`city_id`),
  KEY `index_curriculums_on_curriculum_office_id` (`curriculum_office_id`),
  CONSTRAINT `fk_rails_48f3e2ced4` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `fk_rails_curriculum_office` FOREIGN KEY (`curriculum_office_id`) REFERENCES `curriculum_offices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.curriculums: ~2 rows (aproximadamente)
DELETE FROM `curriculums`;
/*!40000 ALTER TABLE `curriculums` DISABLE KEYS */;
INSERT INTO `curriculums` (`id`, `status`, `travel`, `availability`, `name`, `birth`, `marital_status`, `identity`, `cpf`, `elector_title`, `inscription`, `zone`, `section`, `cnh`, `professional_experience`, `professional_preference`, `email`, `address`, `street`, `block`, `lot`, `sector`, `city_id`, `curriculum_office_id`, `zip_code`, `phone`, `cell_phone`, `message`, `study`, `teaching`, `period`, `courses`, `employee`, `salary`, `father`, `profession_father`, `mother`, `profession_mother`, `created_at`, `updated_at`) VALUES
	(1, 'a', NULL, NULL, 'Tubal', '2017-08-01', 'c', '4534534', '452345234', '34523452', '3452345', '3452345', '', 'n', '2345234', '2345234', 'tubal.ti@gmail.com', 'end', 'rua', 'qd', 'lote', 'setor', 1, 1, 'c', '090909890', '0980988', '009809', 's', 'f-i', 'i', NULL, 's', '89999', 'pai', 'Profissão', 'mae', 'Profissão', '2017-08-01 12:16:15', '2017-08-01 12:16:15'),
	(5, 'a', NULL, NULL, '', '2017-09-19', 's', '', '', '', '', '', '', 'n', '', '', '', '', '', '', '', '', NULL, 1, '', '', '', '', 's', 'f-i', 'i', NULL, 's', '', '', '', '', '', '2017-09-19 21:22:05', '2017-09-19 21:22:05');
/*!40000 ALTER TABLE `curriculums` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.curriculum_categories
CREATE TABLE IF NOT EXISTS `curriculum_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.curriculum_categories: ~7 rows (aproximadamente)
DELETE FROM `curriculum_categories`;
/*!40000 ALTER TABLE `curriculum_categories` DISABLE KEYS */;
INSERT INTO `curriculum_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, ' Administrativa', '2017-07-31 16:49:51', '2017-07-31 16:58:47'),
	(2, 'Agricultura, Pecuária e Veterinária', '2017-07-31 16:59:08', '2017-07-31 16:59:58'),
	(3, 'Artes, Arquitetura e Design', '2017-07-31 16:59:29', '2017-07-31 17:00:13'),
	(4, 'Comercial e Vendas', '2017-07-31 17:00:27', '2017-07-31 17:00:27'),
	(5, 'Comunicação / Marketing', '2017-07-31 17:00:40', '2017-07-31 17:00:40'),
	(6, 'Comércio Exterior', '2017-07-31 17:00:52', '2017-07-31 17:00:52'),
	(7, 'Educação', '2017-07-31 17:01:04', '2017-07-31 17:01:04');
/*!40000 ALTER TABLE `curriculum_categories` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.curriculum_offices
CREATE TABLE IF NOT EXISTS `curriculum_offices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `curriculum_category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_curriculum_offices_on_curriculum_category_id` (`curriculum_category_id`),
  CONSTRAINT `fk_rails_6eeee20af5` FOREIGN KEY (`curriculum_category_id`) REFERENCES `curriculum_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.curriculum_offices: ~2 rows (aproximadamente)
DELETE FROM `curriculum_offices`;
/*!40000 ALTER TABLE `curriculum_offices` DISABLE KEYS */;
INSERT INTO `curriculum_offices` (`id`, `name`, `curriculum_category_id`, `created_at`, `updated_at`) VALUES
	(1, 'Aux.  Administrativa', 1, '2017-07-31 17:08:19', '2017-07-31 17:08:19'),
	(2, 'Aux. Comercial', 1, '2017-07-31 17:09:16', '2017-07-31 17:09:16');
/*!40000 ALTER TABLE `curriculum_offices` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.curriculum_profiles
CREATE TABLE IF NOT EXISTS `curriculum_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.curriculum_profiles: ~6 rows (aproximadamente)
DELETE FROM `curriculum_profiles`;
/*!40000 ALTER TABLE `curriculum_profiles` DISABLE KEYS */;
INSERT INTO `curriculum_profiles` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Profissional', '2017-07-31 11:52:16', '2017-07-31 11:52:16'),
	(2, 'Estagiário', '2017-07-31 11:52:37', '2017-07-31 11:52:37'),
	(3, 'Operacional', '2017-07-31 11:52:55', '2017-07-31 11:52:55'),
	(4, 'Gerente', '2017-08-03 18:30:13', '2017-08-03 18:30:13'),
	(5, 'Diretor', '2017-08-03 18:30:21', '2017-08-03 18:30:21'),
	(6, 'Técnico', '2017-08-03 18:30:55', '2017-08-03 18:30:55');
/*!40000 ALTER TABLE `curriculum_profiles` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.indications
CREATE TABLE IF NOT EXISTS `indications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `cell` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `profession` varchar(255) DEFAULT NULL,
  `obs` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_indications_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_4482a89de6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.indications: ~3 rows (aproximadamente)
DELETE FROM `indications`;
/*!40000 ALTER TABLE `indications` DISABLE KEYS */;
INSERT INTO `indications` (`id`, `name`, `user_id`, `page`, `page_id`, `phone`, `cell`, `email`, `profession`, `obs`, `created_at`, `updated_at`) VALUES
	(1, 'Idicação 01', 1, 'identification', 1, '0009999', '99999', 'tubal.ti@gmail.com', 'profissão', 'obs', '2017-08-01 13:50:04', '2017-08-01 13:50:04'),
	(2, 'Idicação 02', 1, 'identification', 4, '', '', '', '', '', '2017-08-01 14:18:49', '2017-08-01 14:18:49'),
	(3, 'Idicação 03', 1, 'curriculum', 1, '0009999', '99999', 'tubal.ti@gmail.com', 'profissão', 'obs', '2017-08-01 14:22:06', '2017-08-01 14:22:06');
/*!40000 ALTER TABLE `indications` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'i',
  `curriculum_profile_id` int(11) DEFAULT NULL,
  `curriculum_office_id` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `teaching` varchar(255) DEFAULT NULL,
  `cnh` varchar(255) DEFAULT NULL,
  `travel` varchar(255) DEFAULT NULL,
  `availability` varchar(255) DEFAULT NULL,
  `visible` varchar(255) DEFAULT NULL,
  `description` text,
  `benefit` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_jobs_on_company_id` (`company_id`),
  KEY `index_jobs_on_curriculum_profile_id` (`curriculum_profile_id`),
  KEY `index_jobs_on_curriculum_office_id` (`curriculum_office_id`),
  KEY `index_jobs_on_city_id` (`city_id`),
  CONSTRAINT `fk_city_job` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `fk_rails_1f9e48afa3` FOREIGN KEY (`curriculum_profile_id`) REFERENCES `curriculum_profiles` (`id`),
  CONSTRAINT `fk_rails_b34da78090` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `fk_rails_ffbcbc41c3` FOREIGN KEY (`curriculum_office_id`) REFERENCES `curriculum_offices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.jobs: ~1 rows (aproximadamente)
DELETE FROM `jobs`;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`id`, `name`, `company_id`, `status`, `curriculum_profile_id`, `curriculum_office_id`, `number`, `city_id`, `teaching`, `cnh`, `travel`, `availability`, `visible`, `description`, `benefit`, `created_at`, `updated_at`) VALUES
	(1, 'Gerente De Contas', 1, 'a', 4, 1, 1, 1, 'f-i', 'n', 'viagem', 'diponivel manhã', 's', 'dasdfasd', 'sdfasdfas', '2017-08-03 19:48:54', '2017-08-03 19:59:36');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.job_interations
CREATE TABLE IF NOT EXISTS `job_interations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page` varchar(255) DEFAULT NULL,
  `page_id` varchar(255) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_job_interations_on_job_id` (`job_id`),
  KEY `index_job_interations_on_course_id` (`course_id`),
  CONSTRAINT `fk_rails_a6f2283675` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `fk_rails_f8771e5a1a` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.job_interations: ~0 rows (aproximadamente)
DELETE FROM `job_interations`;
/*!40000 ALTER TABLE `job_interations` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_interations` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `summary` text,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.pages: ~9 rows (aproximadamente)
DELETE FROM `pages`;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `status`, `name`, `title`, `summary`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'a', 'Institucional', 'Quem Somos', 'xxxx', '<p><span style="background-color:#e67e22;">xxxxx</span></p>\r\n', '2017-09-15 14:47:09', '2017-09-15 14:48:55'),
	(2, 'a', 'Vagas', 'Vagas', '', '<p>vagas</p>\r\n', '2017-09-15 15:08:02', '2017-09-15 15:08:02'),
	(3, 'a', 'Anúncios', 'NOSSOS ANÚNCIOS', '', '<p>texto</p>\r\n', '2017-09-15 15:08:21', '2017-09-18 13:50:09'),
	(4, 'a', 'Planos', 'Planos', '', '<p>Planos</p>\r\n', '2017-09-15 15:08:48', '2017-09-15 15:08:48'),
	(5, 'a', 'Empresas', 'Empresas', '', '<p>texto</p>\r\n', '2017-09-15 15:17:39', '2017-09-15 15:21:24'),
	(6, 'a', 'Localização', 'Localização', '', '<p><iframe allowfullscreen="" frameborder="0" height="450" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d477.75002202372326!2d-49.2602815999573!3d-16.676874626868536!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x8fdec867e27029c9!2sYes+Profissional+-+EJA+e+Cursos+Livres!5e0!3m2!1spt-BR!2sbr!4v1505823675760" style="border:0" width="100%`"></iframe></p>\r\n', '2017-09-19 12:21:45', '2017-09-19 12:24:06'),
	(7, 'a', 'Consultoria', 'Consultoria', '', '', '2017-09-19 16:49:22', '2017-09-19 16:49:22'),
	(8, 'a', 'Consultoria Empresa', 'Consultoria Empresa', '', '', '2017-09-19 16:50:17', '2017-09-19 16:50:17'),
	(9, 'a', 'EJA', 'EJA', '', '', '2017-09-19 16:58:51', '2017-09-19 16:58:51');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `obs` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.permissions: ~7 rows (aproximadamente)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `prefix`, `obs`, `created_at`, `updated_at`) VALUES
	(1, 'Administrador', 'a', 'Controle Total', '2017-07-27 13:12:03', '2017-07-27 13:12:03'),
	(2, 'Coordenador', 'c', '', '2017-07-27 13:12:23', '2017-07-27 13:12:23'),
	(3, 'Secretario(a)', 's', '', '2017-07-27 13:12:38', '2017-07-27 13:12:38'),
	(4, 'Atendente', 't', '', '2017-07-27 13:12:56', '2017-07-27 13:12:56'),
	(5, 'Professor', 'p', '', '2017-07-27 13:13:09', '2017-07-27 13:13:09'),
	(6, 'Aluno', 'u', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(7, 'Cliente', 'e', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.references
CREATE TABLE IF NOT EXISTS `references` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page` varchar(255) DEFAULT 'reference',
  `page_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_references_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_67b9238c61` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.references: ~5 rows (aproximadamente)
DELETE FROM `references`;
/*!40000 ALTER TABLE `references` DISABLE KEYS */;
INSERT INTO `references` (`id`, `page`, `page_id`, `name`, `phone`, `user_id`, `created_at`, `updated_at`) VALUES
	(21, 'curriculum', 1, 'Referencia 01', '3018-0000', 1, '2017-08-01 13:19:32', '2017-08-01 13:19:32'),
	(22, 'curriculum', 2, 'Referencia 02', '3018-0000', 1, '2017-08-01 13:20:36', '2017-08-01 13:20:36'),
	(23, 'curriculum', 4, 'Referencia 01', '3018-0000', 1, '2017-08-01 14:01:00', '2017-08-01 14:01:00'),
	(24, 'curriculum', 4, 'Referencia 08', '3018-0000', 1, '2017-08-03 15:05:54', '2017-08-03 15:05:54'),
	(25, 'curriculum', 5, 'referencia', '33333', 1, '2017-09-19 21:22:22', '2017-09-19 21:22:22');
/*!40000 ALTER TABLE `references` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.schema_migrations
CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.schema_migrations: ~41 rows (aproximadamente)
DELETE FROM `schema_migrations`;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` (`version`) VALUES
	('20170725175215'),
	('20170725181931'),
	('20170726152926'),
	('20170726171026'),
	('20170726181429'),
	('20170726182136'),
	('20170726191634'),
	('20170726192031'),
	('20170726232139'),
	('20170727122753'),
	('20170729133554'),
	('20170730210934'),
	('20170731004214'),
	('20170731004234'),
	('20170731004354'),
	('20170731135654'),
	('20170731135736'),
	('20170731185625'),
	('20170801110229'),
	('20170801110530'),
	('20170801132814'),
	('20170801143024'),
	('20170801143928'),
	('20170801144040'),
	('20170801175031'),
	('20170801175731'),
	('20170802010315'),
	('20170802011015'),
	('20170802195656'),
	('20170802201354'),
	('20170803192629'),
	('20170803192859'),
	('20170803194231'),
	('20170914001413'),
	('20170916134528'),
	('20170916141157'),
	('20170916160217'),
	('20170916163521'),
	('20170916180029'),
	('20170918133344'),
	('20170918133502');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.states
CREATE TABLE IF NOT EXISTS `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sigla` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.states: ~27 rows (aproximadamente)
DELETE FROM `states`;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` (`id`, `name`, `sigla`, `created_at`, `updated_at`) VALUES
	(1, 'Goiás', 'GO', '2017-07-31 14:12:48', '2017-07-31 14:12:48'),
	(2, 'Acre', 'AC', '2017-09-11 12:06:40', '2017-09-11 12:06:40'),
	(3, 'Amazonas', 'AM', '2017-09-11 12:06:40', '2017-09-11 12:06:40'),
	(4, 'Amapa', 'AP', '2017-09-11 12:06:40', '2017-09-11 12:06:40'),
	(5, 'Bahia', 'BA', '2017-09-11 12:06:40', '2017-09-11 12:06:40'),
	(6, 'Ceará', 'CE', '2017-09-11 12:06:40', '2017-09-11 12:06:40'),
	(7, 'Paraná', 'PR', '2017-09-11 12:06:40', '2017-09-11 12:06:40'),
	(8, 'Goiás', 'GO', '2017-09-11 12:06:41', '2017-09-11 12:06:41'),
	(9, 'Minas Gerais', 'MG', '2017-09-11 12:06:41', '2017-09-11 12:06:41'),
	(10, 'Mato Grosso', 'MT', '2017-09-11 12:06:41', '2017-09-11 12:06:41'),
	(11, 'Mato Grosso do Sul', 'MS', '2017-09-11 12:06:41', '2017-09-11 12:06:41'),
	(12, 'Santa Catarina', 'SC', '2017-09-11 12:06:41', '2017-09-11 12:06:41'),
	(13, 'Rio Grade do Sul', 'RS', '2017-09-11 12:06:41', '2017-09-11 12:06:41'),
	(14, 'Rio de Janeiro', 'RJ', '2017-09-11 12:06:41', '2017-09-11 12:06:41'),
	(15, 'São Paulo', 'SP', '2017-09-11 12:06:41', '2017-09-11 12:06:41'),
	(16, 'Espirito Santo', 'ES', '2017-09-11 12:06:41', '2017-09-11 12:06:41'),
	(17, 'Rondonia', 'RO', '2017-09-11 12:06:41', '2017-09-11 12:06:41'),
	(18, 'Roraima', 'RR', '2017-09-11 12:06:41', '2017-09-11 12:06:41'),
	(19, 'Pará', 'PA', '2017-09-11 12:06:41', '2017-09-11 12:06:41'),
	(20, 'Tocanthins', 'TO', '2017-09-11 12:06:41', '2017-09-11 12:06:41'),
	(21, 'Sergipe', 'SE', '2017-09-11 12:06:41', '2017-09-11 12:06:41'),
	(22, 'Alagoas', 'AL', '2017-09-11 12:06:41', '2017-09-11 12:06:41'),
	(23, 'Paraíba', 'PB', '2017-09-11 12:06:41', '2017-09-11 12:06:41'),
	(24, 'Pernambuco', 'PE', '2017-09-11 12:06:41', '2017-09-11 12:06:41'),
	(25, 'Rio grande do Norte', 'RN', '2017-09-11 12:06:41', '2017-09-11 12:06:41'),
	(26, 'Piauí', 'PI', '2017-09-11 12:06:42', '2017-09-11 12:06:42'),
	(27, 'Maranhão', 'MA', '2017-09-11 12:06:42', '2017-09-11 12:06:42');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;


-- Copiando estrutura para tabela site_portal-yes.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL DEFAULT 'i',
  `email` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `sex` varchar(255) NOT NULL DEFAULT '',
  `permission_id` int(11) DEFAULT '7',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `photo_file_name` varchar(255) DEFAULT NULL,
  `photo_content_type` varchar(255) DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `photo_updated_at` datetime DEFAULT NULL,
  `image_file_name` varchar(255) DEFAULT NULL,
  `image_content_type` varchar(255) DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  KEY `index_users_on_permission_id` (`permission_id`),
  CONSTRAINT `fk_rais_permission` FOREIGN KEY (`permission_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela site_portal-yes.users: ~10 rows (aproximadamente)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `status`, `email`, `name`, `sex`, `permission_id`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `created_at`, `updated_at`, `photo_file_name`, `photo_content_type`, `photo_file_size`, `photo_updated_at`, `image_file_name`, `image_content_type`, `image_file_size`, `image_updated_at`) VALUES
	(1, '', 'tubal.ti@gmail.com', 'Tubal', '', 1, '$2a$11$LZU9H6XPmz1Ad5FzC7nGU.g3Ruqm/BvcUhZDqRLLBvo74zjXo9Hxu', NULL, NULL, NULL, 31, '2017-09-19 16:58:28', '2017-09-19 16:39:26', '127.0.0.1', '127.0.0.1', '2017-07-26 23:23:37', '2017-09-19 16:58:28', 'tubal.jpg', 'image/jpeg', 47532, '2017-07-29 16:05:57', NULL, NULL, NULL, NULL),
	(2, 'i', 'admin@admin.com', 'admin', '', 1, '$2a$11$/cHTf7r0clLhs1so7yKJV.LrVOk8Rg7O6CmmX7lS6Hssw0ewbFSGu', NULL, NULL, NULL, 1, '2017-09-11 12:23:12', '2017-09-11 12:23:12', '127.0.0.1', '127.0.0.1', '2017-09-11 09:12:35', '2017-09-11 12:23:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'a', 'karlysson.alves@gmail.com', 'Karlysson', 'h', 1, '$2a$11$7i80PYowy9l.BVZ5Rjjf5uf.9zMxLlRDGUMrEDCwNPxvhuZwGDxWS', NULL, NULL, NULL, 2, '2017-09-13 14:50:06', '2017-09-11 12:33:14', '127.0.0.1', '127.0.0.1', '2017-09-11 12:25:15', '2017-09-13 14:50:06', 'karlysson.jpg', 'image/jpeg', 123356, '2017-09-11 12:25:14', NULL, NULL, NULL, NULL),
	(4, 'i', 'usuario@email.com', '', '', 4, '$2a$11$9mxlbm8XbW3xfkv8rDkqZ.oPy0i4GS6TJexTetqgX3EQMSME7iXgW', NULL, NULL, NULL, 1, '2017-09-15 02:33:10', '2017-09-15 02:33:10', '127.0.0.1', '127.0.0.1', '2017-09-15 02:33:10', '2017-09-15 02:33:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(6, 'i', 'email@email.com.br', '', '', 6, '$2a$11$zC./16ErK7SZ1oS5kpPTu.q7.RubVSdBOWXaav7TExzReSrwNzhQy', NULL, NULL, NULL, 1, '2017-09-15 13:04:59', '2017-09-15 13:04:59', '127.0.0.1', '127.0.0.1', '2017-09-15 13:04:59', '2017-09-15 13:04:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 'i', 'cliente2@email2.com.br', '', '', 7, '$2a$11$c/SAnEtZdxwnfxBN/.WAd.gjiAT.7jpUkfHjXK7n973ZfLC6Melz.', NULL, NULL, NULL, 1, '2017-09-15 13:12:32', '2017-09-15 13:12:32', '127.0.0.1', '127.0.0.1', '2017-09-15 13:12:32', '2017-09-15 13:12:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 'i', 'teste4@gmail.com', '', '', 7, '$2a$11$L8k1q0Utrt/LtVL3vqK3CeIa.JYn.FxZxe5kNLBNZyYIQERh5GrYa', NULL, NULL, NULL, 1, '2017-09-15 13:45:27', '2017-09-15 13:45:27', '127.0.0.1', '127.0.0.1', '2017-09-15 13:45:27', '2017-09-15 13:45:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 'i', 'email@cliente.com.br', 'cliente', '', 7, '$2a$11$G1ofvHfRo0Q1bUS6aEWI9O639YlpkJzFrstrRijR2PCi.oG9EtkQy', NULL, NULL, NULL, 1, '2017-09-15 14:04:15', '2017-09-15 14:04:15', '127.0.0.1', '127.0.0.1', '2017-09-15 14:04:15', '2017-09-15 14:04:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 'i', 'clientesite@gmail.com', 'Cliente site', '', 7, '$2a$11$ZAiMH/ox1GzGt/rzOshKS.fulyzyhsKLsqJIp8eE6XDeJMVak3CrC', NULL, NULL, NULL, 2, '2017-09-15 14:10:25', '2017-09-15 14:05:10', '127.0.0.1', '127.0.0.1', '2017-09-15 14:05:10', '2017-09-15 14:10:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 'i', 'membro@membro.com', 'membro', '', 7, '$2a$11$UQWdG2O7k8zw7rcfwwv9QeZ0EEbeELioYSAf7C0pzrmpBKMTVDeJe', NULL, NULL, NULL, 1, '2017-09-16 12:07:03', '2017-09-16 12:07:03', '127.0.0.1', '127.0.0.1', '2017-09-16 12:07:03', '2017-09-16 12:07:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
