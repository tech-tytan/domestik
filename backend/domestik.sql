-- phpMyAdmin SQL Dump
-- version 5.2.1deb1+deb12u1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 22, 2026 at 05:16 PM
-- Server version: 10.11.14-MariaDB-0+deb12u2
-- PHP Version: 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `domestik`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

CREATE TABLE `administrators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `administrators`
--

INSERT INTO `administrators` (`id`, `uuid`, `fname`, `lname`, `email`, `phone`, `email_verified_at`, `phone_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '7497918c-67e2-11f1-86fe-78e205732f93', 'Tech', 'Tytan', 'tytan@techtytan.com', '08100000001', NULL, NULL, '$2y$10$A90T7T0umpWDS/djwVFb.eH7zPo/UISRfnZNFyLi/yYaJMITWJHnq', NULL, NULL, '2026-11-17 22:46:15'),
(2, '7497a27b-67e2-11f1-86fe-78e205732f93', 'Efeturi', 'Adjushi', 'efeturi@example.com', '08100000002', NULL, NULL, '$2y$10$MCbHthwp7FY5wH0rynK3qO09wsW5smcfmEIpERBdSnADctiMryGEC', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `uuid`, `name`, `created_at`, `updated_at`, `state_id`) VALUES
(1, '5f8b05d5-c76a-4814-9eee-c3a63768cdd6', 'Aba North', NULL, NULL, 1),
(2, 'dd3e6f33-684a-45f6-befc-538aab55892d', 'Aba South', NULL, NULL, 1),
(3, '5b77578a-6ba3-424e-89d6-4735d9cb508f', 'Arochukwu', NULL, NULL, 1),
(4, '01adfa63-1e1e-4b8c-9a81-94d63363d976', 'Bende', NULL, NULL, 1),
(5, '5378f1ad-3424-4e89-a9ed-ad218f4e2d65', 'Ikwuano', NULL, NULL, 1),
(6, 'aacecfa5-a591-43b4-be98-95afef7aab18', 'Isiala Ngwa North', NULL, NULL, 1),
(7, 'ac59fddc-e181-4e30-82be-e10996a78eab', 'Isiala Ngwa South', NULL, NULL, 1),
(8, 'abd0aa64-6f00-455d-a878-955ba8e2c058', 'Isuikwuato', NULL, NULL, 1),
(9, '43a59406-6bc7-4f90-a1ad-fb65502a64c6', 'Obi Ngwa', NULL, NULL, 1),
(10, '3ebc541a-15f5-4bb1-a251-a964f5ee8665', 'Ohafia', NULL, NULL, 1),
(11, '5c60e8e1-9f4d-476f-8ccc-1889e6efb6a8', 'Osisioma', NULL, NULL, 1),
(12, 'a985d37c-6d50-44a0-acef-ad7f8ae7c56b', 'Ugwunagbo', NULL, NULL, 1),
(13, '05e0d0f6-9166-4fb3-95b5-091eea91806e', 'Ukwa East', NULL, NULL, 1),
(14, '89103079-d862-4c20-a04e-ed2f1113d784', 'Ukwa West', NULL, NULL, 1),
(15, '54ed7625-77c8-444f-965c-d439b8924b81', 'Umuahia North', NULL, NULL, 1),
(16, 'cc38d02d-6ebe-478a-a483-c9fc4d4fd653', 'Umuahia South', NULL, NULL, 1),
(17, '8750550f-7ba8-4997-aeec-2146a699bfc9', 'Umu Nneochi', NULL, NULL, 1),
(18, '2192210f-1059-4727-b3c2-48e3c6def8b4', 'Demsa', NULL, NULL, 2),
(19, 'fe1943f8-c7af-4eca-a177-465c48fac5de', 'Fufure', NULL, NULL, 2),
(20, '67ccf7c6-9022-4c8f-a8ef-85bd47739635', 'Ganye', NULL, NULL, 2),
(21, '58eada32-47d8-4c30-a322-c4c69501b56e', 'Gayuk', NULL, NULL, 2),
(22, 'cbcf937b-55d8-4223-a03e-0c8623209871', 'Gombi', NULL, NULL, 2),
(23, '45cfefe9-f6b5-4d29-990a-abba3b073e52', 'Grie', NULL, NULL, 2),
(24, '0fa36cb8-46f7-45ed-84c3-94642393a81c', 'Hong', NULL, NULL, 2),
(25, 'ded15cc4-9cf5-42e3-ba92-e36a8a5ea33f', 'Jada', NULL, NULL, 2),
(26, 'd25eb36e-87b8-4b23-ab65-5b7293667e12', 'Lamurde', NULL, NULL, 2),
(27, '3bebc2d9-ef87-4890-8555-84d8647821c4', 'Madagali', NULL, NULL, 2),
(28, 'd02242cb-874e-4024-a17f-6736dc501b6d', 'Maiha', NULL, NULL, 2),
(29, '1cc3f86c-22ac-4750-a54f-65fa8d7424ac', 'Mayo Belwa', NULL, NULL, 2),
(30, 'a72113e7-9060-4239-b59c-a83e7792edcc', 'Michika', NULL, NULL, 2),
(31, '08bf6593-1953-4d99-9b00-ee89d6952e47', 'Mubi North', NULL, NULL, 2),
(32, 'e12e48c6-80fc-4a40-bf1d-7d3f74b15296', 'Mubi South', NULL, NULL, 2),
(33, 'a1fde553-9491-467e-96b6-ce635876c2a5', 'Numan', NULL, NULL, 2),
(34, 'b007db48-90b2-45e7-a9ff-83c9f94734bf', 'Shelleng', NULL, NULL, 2),
(35, '8a2d23d9-6f71-47ab-8c1f-0acecb90ebe4', 'Song', NULL, NULL, 2),
(36, '69e7c17c-19f3-4b73-9868-f427c86545b3', 'Toungo', NULL, NULL, 2),
(37, '4b23ef96-ee1d-40c3-a2bc-596ec3b395f7', 'Yola North', NULL, NULL, 2),
(38, '7ad466a0-ef50-4516-b73f-bd12a4955d29', 'Yola South', NULL, NULL, 2),
(39, '9a454440-4ec7-438c-8a85-e012d82a71fe', 'Abak', NULL, NULL, 3),
(40, 'e81ddca4-b05b-4fe1-89dd-bf293f67f6ae', 'Eastern Obolo', NULL, NULL, 3),
(41, '41c41ed0-471a-49b0-8248-bebbbad677ba', 'Eket', NULL, NULL, 3),
(42, '65af33e6-357b-4aa1-8fbb-b675fc52c3c5', 'Esit Eket', NULL, NULL, 3),
(43, '99162605-0011-478f-ad84-86d89f993755', 'Essien Udim', NULL, NULL, 3),
(44, '5a14f667-9e09-4b9a-ac23-8ce334addffc', 'Etim Ekpo', NULL, NULL, 3),
(45, '459b2853-6c27-49d5-b203-61a36aaa457b', 'Etinan', NULL, NULL, 3),
(46, '1ddec62d-9bd8-4893-989a-c4c9f00a3400', 'Ibeno', NULL, NULL, 3),
(47, 'd96483d0-ca74-47aa-9aed-72a8ce7e5ceb', 'Ibesikpo Asutan', NULL, NULL, 3),
(48, '9afdb541-bddb-4856-8e4c-19a7727770cc', 'Ibiono-Ibom', NULL, NULL, 3),
(49, '022546ea-17b2-44f6-baef-8a133c71970f', 'Ika', NULL, NULL, 3),
(50, 'e10bcf97-ee93-4ca4-a4cd-4f26762af20d', 'Ikono', NULL, NULL, 3),
(51, '5764ee9f-6fdd-4af1-9935-e2ff7b4394ba', 'Ikot Abasi', NULL, NULL, 3),
(52, '6243e18c-1a2a-4db3-bc0b-1c29b0d22318', 'Ikot Ekpene', NULL, NULL, 3),
(53, '7c417235-de42-4ef7-8ead-6c399d9f0279', 'Ini', NULL, NULL, 3),
(54, 'efc2d1e7-7a48-4afa-b4cd-95f505aadbc9', 'Itu', NULL, NULL, 3),
(55, 'a05ada42-d7f9-4f6b-b46b-22b9187d7bb5', 'Mbo', NULL, NULL, 3),
(56, '92e92408-0060-4434-9576-5d6ca1dc6534', 'Mkpat-Enin', NULL, NULL, 3),
(57, 'f2c00929-fcd9-4e8e-b3ca-c21312e963a5', 'Nsit-Atai', NULL, NULL, 3),
(58, 'd77946fc-cf32-47de-87ea-79087d9bfb60', 'Nsit-Ibom', NULL, NULL, 3),
(59, 'f5393836-272d-471e-97b7-693d7b86820d', 'Nsit-Ubium', NULL, NULL, 3),
(60, '8d7ff772-991e-419b-b1a3-c45a6df50038', 'Obot Akara', NULL, NULL, 3),
(61, 'b224be93-d175-4fac-99ba-09aaa3ac2cc4', 'Okobo', NULL, NULL, 3),
(62, '10e0bd22-eb68-499b-ae3a-1ba11bde9e5c', 'Onna', NULL, NULL, 3),
(63, '076508e7-a7c9-45af-a919-86236fc51da3', 'Oron', NULL, NULL, 3),
(64, '41882f10-b729-4088-94ef-d12bfa543c95', 'Oruk Anam', NULL, NULL, 3),
(65, '2811f465-7ce0-4275-90f0-765e75e9fcd0', 'Udung-Uko', NULL, NULL, 3),
(66, 'c7ca3a04-ba8a-4b30-9187-d3644f6dd826', 'Ukanafun', NULL, NULL, 3),
(67, 'af4a2d2a-726d-4a78-acfc-4622b5603f4d', 'Uruan', NULL, NULL, 3),
(68, '644669a5-f29e-4d09-a23b-0db68b37b627', 'Urue-Offong/Oruko', NULL, NULL, 3),
(69, '36c9321c-46dc-441a-858d-aef0a53f7950', 'Uyo', NULL, NULL, 3),
(70, '8a045c43-538f-4a57-97b2-2e8b7c1a65c1', 'Aguata', NULL, NULL, 4),
(71, '8610caf7-862e-41d4-a8b4-2c7946595fa2', 'Anambra East', NULL, NULL, 4),
(72, 'a0a93c0a-0009-4fc0-981d-3af312b4d3d0', 'Anambra West', NULL, NULL, 4),
(73, 'f14a0dee-4bac-45f8-a61b-e361a9e9603e', 'Anaocha', NULL, NULL, 4),
(74, 'a5dd5a35-a9c8-4ce0-990a-f11822172cfd', 'Awka North', NULL, NULL, 4),
(75, '2b1dc378-d2dd-446c-8acc-15955302cfff', 'Awka South', NULL, NULL, 4),
(76, '44d823dd-74dd-4299-8a02-6684a09791d1', 'Ayamelum', NULL, NULL, 4),
(77, '244137e4-c684-4e88-9600-a3b9d3587a0c', 'Dunukofia', NULL, NULL, 4),
(78, '60f61ba2-6c93-4c80-b5bd-ae69b59b3aa8', 'Ekwusigo', NULL, NULL, 4),
(79, '05e47b04-98ed-4da4-9a7e-d3b04ae887a0', 'Idemili North', NULL, NULL, 4),
(80, 'ec06aec3-89dc-4911-ba64-c3461d7bfaa4', 'Idemili South', NULL, NULL, 4),
(81, '04ef1d3f-07b6-44ae-a110-c8073caf3745', 'Ihiala', NULL, NULL, 4),
(82, '4c2e5e75-a566-44e6-acd2-0a99db56e86e', 'Njikoka', NULL, NULL, 4),
(83, '90ef2bd7-7832-4ac3-bed3-4d80c95b657e', 'Nnewi North', NULL, NULL, 4),
(84, '9551b6f7-76cf-49d5-bafe-d1c353683211', 'Nnewi South', NULL, NULL, 4),
(85, '2a59d0da-87c2-46e4-b769-324baf305c56', 'Ogbaru', NULL, NULL, 4),
(86, 'c2d16472-2512-42a1-8ae4-0185417d09bd', 'Onitsha North', NULL, NULL, 4),
(87, 'f558ea4a-d9b9-42a5-ad20-5acb01fb4ea3', 'Onitsha South', NULL, NULL, 4),
(88, 'dceb1f8b-7672-46c7-a7de-c1353f8bcd04', 'Orumba North', NULL, NULL, 4),
(89, '9517f941-327a-4314-a837-9cd1706386d2', 'Orumba South', NULL, NULL, 4),
(90, 'e16b5c95-6a77-49c0-b521-28128928efb1', 'Oyi', NULL, NULL, 4),
(91, '18f05853-3979-46e5-b8b1-25ba67f0649b', 'Alkaleri', NULL, NULL, 5),
(92, 'c031c14b-0c5a-4f12-8a76-1b24e5e12028', 'Bauchi', NULL, NULL, 5),
(93, '5175a250-0f86-4c58-b6ee-2f934bbdd148', 'Bogoro', NULL, NULL, 5),
(94, 'd31f92cb-9e25-4f46-8896-f5444485b6f9', 'Damban', NULL, NULL, 5),
(95, 'e5727bda-46f3-4c75-af9e-e7de284efc3e', 'Darazo', NULL, NULL, 5),
(96, 'd630d4da-4e1d-4e3d-a3c9-f02ae6b4e802', 'Dass', NULL, NULL, 5),
(97, '7887cebd-5ff6-4385-b0d0-83cf1be6f263', 'Gamawa', NULL, NULL, 5),
(98, 'ff7490c5-0ef5-4ae3-bc6d-66fba272e864', 'Ganjuwa', NULL, NULL, 5),
(99, 'cfd507df-cc05-456b-bfd3-0676448b1185', 'Giade', NULL, NULL, 5),
(100, 'cb895fba-b6cb-4b6c-b1ad-70eb2dd2a3b1', 'Itas/Gadau', NULL, NULL, 5),
(101, '88925e14-11d7-42af-bdb0-5f2afbe2f349', 'Jama\'are', NULL, NULL, 5),
(102, 'e3998417-0326-43ba-80fb-7a4abb362b54', 'Katagum', NULL, NULL, 5),
(103, '2cc4f031-0bdc-451a-9582-9ca2043b2e0e', 'Kirfi', NULL, NULL, 5),
(104, 'ffaeed40-dc8a-4ab3-87c7-9fdc043daaef', 'Misau', NULL, NULL, 5),
(105, 'b075dc9f-f471-4cc3-b002-a50d0d92b65b', 'Ningi', NULL, NULL, 5),
(106, '699066f2-4b16-4bc0-a18b-44eecfa565c3', 'Shira', NULL, NULL, 5),
(107, '5e4d1155-f837-4d4b-b241-f2c1be2d7cf5', 'Tafawa Balewa', NULL, NULL, 5),
(108, '4e3b061c-8761-4e54-9c61-c546853bde7c', 'Toro', NULL, NULL, 5),
(109, '93f44ede-316f-476c-b4b5-62b25b82d9b1', 'Warji', NULL, NULL, 5),
(110, '986d3a9e-b314-4644-b77b-2aab41a41f0a', 'Zaki', NULL, NULL, 5),
(111, '49cd8da1-7165-4247-b905-ac9871472f49', 'Brass', NULL, NULL, 6),
(112, '6ddd3769-0364-4c67-935c-c6ea2268abda', 'Ekeremor', NULL, NULL, 6),
(113, 'f796ecac-b715-4746-b859-4453a8f88775', 'Kolokuma/Opokuma', NULL, NULL, 6),
(114, '4e1d8fca-eee1-431d-ad96-ed94ffd5164f', 'Nembe', NULL, NULL, 6),
(115, '76eeacc9-22f3-4d76-9813-e23284f7ec6f', 'Ogbia', NULL, NULL, 6),
(116, 'be57c15e-c9b9-4a6b-9a68-249f3d83c936', 'Sagbama', NULL, NULL, 6),
(117, 'a2abf5b2-f8d0-47a9-abb5-46ee127d19b7', 'Southern Ijaw', NULL, NULL, 6),
(118, '9cd03345-76ec-438a-aeaa-16e2d781191f', 'Yenagoa', NULL, NULL, 6),
(119, 'd738314a-1916-4ae2-b66f-73096ce838e9', 'Agatu', NULL, NULL, 7),
(120, 'cc7fa9ea-9a96-4f68-bdd5-b07690cb9fbf', 'Apa', NULL, NULL, 7),
(121, '64a55219-cc04-49bf-8f69-c55f064522c0', 'Ado', NULL, NULL, 7),
(122, 'fc755cff-0e09-44d5-a50e-4c1ef37ce291', 'Buruku', NULL, NULL, 7),
(123, '607bed7f-1a74-4fbc-b330-0fd427b79af0', 'Gboko', NULL, NULL, 7),
(124, 'b117f0a8-5bc4-4863-bac9-585a3a94a829', 'Guma', NULL, NULL, 7),
(125, '0fe8d2ea-fedd-4236-9d67-43f8c60e86d1', 'Gwer East', NULL, NULL, 7),
(126, '22e5753c-305b-452a-ae19-57d90057825c', 'Gwer West', NULL, NULL, 7),
(127, 'b9622f3d-b227-44e2-b647-cedf40f12d12', 'Katsina-Ala', NULL, NULL, 7),
(128, '6d643643-068c-497d-a5b7-cbb08bd912e1', 'Konshisha', NULL, NULL, 7),
(129, '80ff0a3e-6bdb-493b-bccf-4c588de80c1f', 'Kwande', NULL, NULL, 7),
(130, '6924fbac-5b2c-4522-9658-ee11a46a0685', 'Logo', NULL, NULL, 7),
(131, '828fb9b3-fabe-4358-8d5d-eed2c6224456', 'Makurdi', NULL, NULL, 7),
(132, '99c63527-9c0f-4876-afef-01abf1733c7c', 'Obi', NULL, NULL, 7),
(133, '7c810f09-9db2-475b-845a-b0c42769bb4a', 'Ogbadibo', NULL, NULL, 7),
(134, '8b15e950-74f6-4272-8e22-11a6fa2b52b9', 'Ohimini', NULL, NULL, 7),
(135, '19d4ae22-bdcc-4b13-b7fe-24d5369f093e', 'Oju', NULL, NULL, 7),
(136, '4c3f91d1-9695-45d8-99db-a83d32e8db61', 'Okpokwu', NULL, NULL, 7),
(137, '1ef515f3-0fc0-4a58-9f14-3613479bb69f', 'Oturkpo', NULL, NULL, 7),
(138, 'ee36a8df-d05a-49eb-bd38-f1bb745c095f', 'Tarka', NULL, NULL, 7),
(139, 'b3279a25-30f7-4127-b4fd-983b7a66a214', 'Ukum', NULL, NULL, 7),
(140, '94fb8ac6-7ddd-486a-933f-744e2c63885d', 'Ushongo', NULL, NULL, 7),
(141, 'c8581438-3c90-44d9-a07f-1a5aede871c7', 'Vandeikya', NULL, NULL, 7),
(142, '8092b61c-d66e-4cfa-84bc-d99c76397ed4', 'Abadam', NULL, NULL, 8),
(143, '51bb4a80-978b-4620-b5be-c1a7c6e7918d', 'Askira/Uba', NULL, NULL, 8),
(144, '90e86096-ba02-463d-addf-aaf8772ef64b', 'Bama', NULL, NULL, 8),
(145, 'e03474a4-ee33-4295-8c12-b5646d3b268b', 'Bayo', NULL, NULL, 8),
(146, '54424a18-83b2-4985-a4d3-97f871f3f236', 'Biu', NULL, NULL, 8),
(147, 'e017c848-b236-4a5e-b5d2-3641e39dc470', 'Chibok', NULL, NULL, 8),
(148, 'd8a4699f-863d-4885-966e-3c74e72687e0', 'Damboa', NULL, NULL, 8),
(149, 'e3063e5f-2e99-4228-bcfe-19ffb3db8b62', 'Dikwa', NULL, NULL, 8),
(150, 'b62bfaf4-cb20-4a1d-9276-9b435377a5e9', 'Gubio', NULL, NULL, 8),
(151, 'd5cfbb72-f334-452b-868b-8f937b2c09d6', 'Guzamala', NULL, NULL, 8),
(152, 'd3b8b7c8-daca-4c01-ba78-303807a7bc60', 'Gwoza', NULL, NULL, 8),
(153, '49b20195-2258-49d7-b2c2-c1c4f9e0fa98', 'Hawul', NULL, NULL, 8),
(154, 'cfa9cd5e-0bdd-4d4f-a09c-fc7a2e091826', 'Jere', NULL, NULL, 8),
(155, '61d58dde-3da9-497a-b26d-5f9d7e9670e0', 'Kaga', NULL, NULL, 8),
(156, 'b2a46605-dac2-4b60-9aec-65c6fadcc78f', 'Kala/Balge', NULL, NULL, 8),
(157, '12102be7-9780-4d36-8092-9f9551ec4ac7', 'Konduga', NULL, NULL, 8),
(158, 'd7a033ac-e8cd-4d92-9772-6262fd167f5c', 'Kukawa', NULL, NULL, 8),
(159, 'd73e737c-a4cd-4791-b4c4-1c6062c2c638', 'Kwaya Kusar', NULL, NULL, 8),
(160, '2551b9c8-ef1a-4b11-840a-2ece4981b92d', 'Mafa', NULL, NULL, 8),
(161, 'd102aea9-8a8e-4893-8967-95632fb68d5c', 'Magumeri', NULL, NULL, 8),
(162, '5b81ebd7-9a69-4dd0-9154-99a2f5b9caf0', 'Maiduguri', NULL, NULL, 8),
(163, 'c12c88f2-224f-4bc2-a68f-4df0906a65ce', 'Marte', NULL, NULL, 8),
(164, '38aaac76-893a-4c63-802a-4c1525e25552', 'Mobbar', NULL, NULL, 8),
(165, '589082e2-1795-430c-b293-34f4a8b1fa69', 'Monguno', NULL, NULL, 8),
(166, '99c942cb-c46e-4cc0-9894-2050500a1cee', 'Ngala', NULL, NULL, 8),
(167, '84fab6f1-7f2b-41b2-8e6c-e365fed9d955', 'Nganzai', NULL, NULL, 8),
(168, 'b8b019f9-b01b-4ca8-944a-70dd8feef07c', 'Shani', NULL, NULL, 8),
(169, 'a321af97-a637-49f3-b449-8075e26f8a75', 'Abi', NULL, NULL, 9),
(170, 'b9514672-83e3-4cd1-a5a7-80646425e93c', 'Akamkpa', NULL, NULL, 9),
(171, 'c8e464b8-88d0-48e5-bbdf-da7d2289402e', 'Akpabuyo', NULL, NULL, 9),
(172, '647da036-10dc-4f33-8ad6-f417afe20314', 'Bakassi', NULL, NULL, 9),
(173, '842f199f-1a43-46ef-a28c-6c148297cea8', 'Bekwarra', NULL, NULL, 9),
(174, '52a7fdaa-047b-4e8c-ab07-284867987df4', 'Biase', NULL, NULL, 9),
(175, 'fd994d28-0d83-4c32-b1aa-9961497cffaa', 'Boki', NULL, NULL, 9),
(176, '99a5c0d0-558d-4f2d-9e24-d8370f4f20eb', 'Calabar Municipal', NULL, NULL, 9),
(177, '468337cb-0bf3-4951-819c-9e8bd77b6244', 'Calabar South', NULL, NULL, 9),
(178, 'f9b1a5a1-8de2-4ab0-a674-9e336668cf3f', 'Etung', NULL, NULL, 9),
(179, '56142b1f-c4a7-419e-badd-f1e27bbd1729', 'Ikom', NULL, NULL, 9),
(180, '85d73232-dd57-469d-8dce-cd14d4ce39c6', 'Obanliku', NULL, NULL, 9),
(181, '7eeeffa1-05ca-4cc8-9651-2004cc73bceb', 'Obubra', NULL, NULL, 9),
(182, '1ac6f3e8-e12c-4522-8731-18318e39e907', 'Obudu', NULL, NULL, 9),
(183, 'dfef0979-0b44-4459-88b5-d634f9013f97', 'Odukpani', NULL, NULL, 9),
(184, '29229e34-19dc-4b1b-b2da-61ca105faf88', 'Ogoja', NULL, NULL, 9),
(185, 'f19a400f-fe16-4e1a-ba6b-31fd61d50e82', 'Yakuur', NULL, NULL, 9),
(186, '80dd5685-90e6-495e-bce2-84e72b537f67', 'Yala', NULL, NULL, 9),
(187, 'a39bb1db-044c-49f9-adc5-8d44b135915d', 'Aniocha North', NULL, NULL, 10),
(188, 'c407769e-3064-4a56-9830-8457939c5f62', 'Aniocha South', NULL, NULL, 10),
(189, '9fb59e92-8655-4b38-aa53-332571b45b79', 'Bomadi', NULL, NULL, 10),
(190, '6c30a861-54a1-45cc-9567-7b75d2e88d9b', 'Burutu', NULL, NULL, 10),
(191, 'b16d1019-fa28-46a0-9203-7469e3c674ed', 'Ethiope East', NULL, NULL, 10),
(192, '89b22aa4-5566-4830-afc0-05f32e3e6db7', 'Ethiope West', NULL, NULL, 10),
(193, '117dca62-d62f-4e7d-a2d9-39bff52ee8f2', 'Ika North East', NULL, NULL, 10),
(194, '556380ea-0d8b-4c67-9513-78a79f1e7228', 'Ika South', NULL, NULL, 10),
(195, 'a0f10e09-e1eb-4281-a551-00c3b9caf9e9', 'Isoko North', NULL, NULL, 10),
(196, '9d96c2b7-0892-4746-88a0-eab408e860e1', 'Isoko South', NULL, NULL, 10),
(197, 'd4f05853-6a12-43d1-8519-4d9f391b0afd', 'Ndokwa East', NULL, NULL, 10),
(198, '7296b4ea-179a-46f0-843e-3ce484d2b4ee', 'Ndokwa West', NULL, NULL, 10),
(199, '2153c46b-05d5-401d-a887-81908f07e196', 'Okpe', NULL, NULL, 10),
(200, '192ddac1-944d-43bb-8f24-84f92602fb03', 'Oshimili North', NULL, NULL, 10),
(201, '25bc8778-8b28-4f24-ac81-c27edb4b7b06', 'Oshimili South', NULL, NULL, 10),
(202, 'f1beaf52-5a84-4930-9269-b9c1193b961c', 'Patani', NULL, NULL, 10),
(203, '3bf56964-5b47-4e79-80b1-08ff04eb10c8', 'Sapele', NULL, NULL, 10),
(204, '1c8e3c0b-b844-48d6-83ad-1f8534a25fbc', 'Udu', NULL, NULL, 10),
(205, '8ee98502-f64c-489c-b13b-e20d1fa20f43', 'Ughelli North', NULL, NULL, 10),
(206, '93933784-64d6-4359-bbf2-bb44feef619f', 'Ughelli South', NULL, NULL, 10),
(207, 'd1c567a4-6992-449c-8aeb-df93436b8448', 'Ukwuani', NULL, NULL, 10),
(208, 'b6faef2d-15c7-4bea-9f77-c41f9fc91d60', 'Uvwie', NULL, NULL, 10),
(209, '0cdecdda-659f-4809-8d5f-628e1a1c2cae', 'Warri North', NULL, NULL, 10),
(210, '64989288-d5b4-4eee-8d3c-618d40ef7a1d', 'Warri South', NULL, NULL, 10),
(211, '4eadea3e-9fe4-4af9-99f4-42c20fb798d1', 'Warri South West', NULL, NULL, 10),
(212, '6fdfd8b8-1df4-4c6e-93b2-cec4c7fb2e9b', 'Abakaliki', NULL, NULL, 11),
(213, '668fa0c0-0cfe-44d4-8e90-775beedaced6', 'Afikpo North', NULL, NULL, 11),
(214, 'b6b04322-334e-4beb-88e6-11eed100c198', 'Afikpo South', NULL, NULL, 11),
(215, 'ffea5a09-f0bc-4b7c-a9b0-11b06c4ace95', 'Ebonyi', NULL, NULL, 11),
(216, '6260420f-7571-42be-9194-fe8363cade6f', 'Ezza North', NULL, NULL, 11),
(217, '3c2a4155-0e27-4e53-9246-5db8e7fd031b', 'Ezza South', NULL, NULL, 11),
(218, '1c781d63-29a8-4175-bfb0-a38dbfa31a15', 'Ikwo', NULL, NULL, 11),
(219, '2b9de384-4ecb-4c96-942d-ae1570cfcbab', 'Ishielu', NULL, NULL, 11),
(220, 'e14474aa-ece6-40f2-b446-0c3d5eb33941', 'Ivo', NULL, NULL, 11),
(221, '471ff051-ef89-44ce-a02f-a43ae3c1c47b', 'Izzi', NULL, NULL, 11),
(222, '37ad32c8-4fd7-4f33-baf3-07f084dcfe45', 'Ohaozara', NULL, NULL, 11),
(223, '46fc1705-e9b3-4138-bb24-4aeb5af6585c', 'Ohaukwu', NULL, NULL, 11),
(224, '4b75a69c-97ff-49ff-a2cb-613246b7fca3', 'Onicha', NULL, NULL, 11),
(225, '33bad199-a5c1-4e80-bd27-b48d7e26e669', 'Akoko-Edo', NULL, NULL, 12),
(226, '5e010b0e-0f43-42d9-90ae-064104f000ae', 'Egor', NULL, NULL, 12),
(227, 'e9a78b0b-0ef0-4ca7-8358-054160560b2b', 'Esan Central', NULL, NULL, 12),
(228, 'f14d9100-4143-4627-9194-4da684a09108', 'Esan North-East', NULL, NULL, 12),
(229, 'a5e388a9-3d06-48d2-98cf-9080d4791b7a', 'Esan South-East', NULL, NULL, 12),
(230, 'd1901478-5e65-4c20-81a6-e11ecb0ceab6', 'Esan West', NULL, NULL, 12),
(231, 'f2521c37-7486-4717-8690-ab9d62a6674f', 'Etsako Central', NULL, NULL, 12),
(232, '92a95e9e-1a23-4267-af16-3b7b1b87f176', 'Etsako East', NULL, NULL, 12),
(233, 'b6d94e1c-eb2d-4a18-95a3-124d6e457613', 'Etsako West', NULL, NULL, 12),
(234, '48a09c79-d592-4a87-9556-11961501244e', 'Igueben', NULL, NULL, 12),
(235, 'abdcba15-fb2a-477b-b4c0-59efb154c393', 'Ikpoba-Okha', NULL, NULL, 12),
(236, '112669b6-f72c-4cb1-b97f-8d9f08f78b40', 'Oredo', NULL, NULL, 12),
(237, '0167cf66-4321-4026-ab31-77e702bd36ee', 'Orhionmwon', NULL, NULL, 12),
(238, '7fa8f196-6da8-4ce5-b83b-47cbeb6c73db', 'Ovia North-East', NULL, NULL, 12),
(239, 'b9ac2039-79d9-458d-b5e4-2986571fcce5', 'Ovia South-West', NULL, NULL, 12),
(240, '708893ad-24eb-42b3-b9d4-d574c5388c8f', 'Owan East', NULL, NULL, 12),
(241, '7c0f7dc5-0916-4c89-a161-77b71a86709b', 'Owan West', NULL, NULL, 12),
(242, '29d96fea-96c8-445e-8d9d-e46270618c93', 'Uhunmwonde', NULL, NULL, 12),
(243, 'b8aeb140-b22e-4ca5-b914-f7fd37fa0d38', 'Ado Ekiti', NULL, NULL, 13),
(244, '5817e2a2-9b24-4e5b-a031-f62c060aefa1', 'Efon', NULL, NULL, 13),
(245, 'cdee5643-983a-4e18-b20a-9a388e17c47d', 'Ekiti East', NULL, NULL, 13),
(246, '4db50d07-398e-42e8-9651-ce35eaed58a8', 'Ekiti South-West', NULL, NULL, 13),
(247, 'dc889dd3-bc67-4e77-9333-1b84ddafc740', 'Ekiti West', NULL, NULL, 13),
(248, 'aca22f9a-b651-4dd4-9c10-3b1cc9bd5c1f', 'Emure', NULL, NULL, 13),
(249, '96dc6a0c-c754-4781-b883-3bb971273d21', 'Gbonyin', NULL, NULL, 13),
(250, '48c3c62d-4203-4d6b-9c28-45a69b6e4fe7', 'Ido Osi', NULL, NULL, 13),
(251, 'aac192ea-e1d2-4b9d-9443-af04c3d2a0c3', 'Ijero', NULL, NULL, 13),
(252, '639afc65-bedd-4762-a895-3ad5643171f1', 'Ikere', NULL, NULL, 13),
(253, 'f01164c6-240e-46bf-93e1-f2dd939649e3', 'Ikole', NULL, NULL, 13),
(254, '593bcbff-85b2-4e9b-9294-83084875f5a9', 'Ilejemeje', NULL, NULL, 13),
(255, '297dd62f-2b7e-4f65-8005-f80349b4a255', 'Irepodun/Ifelodun', NULL, NULL, 13),
(256, '573a3b2a-49bb-455e-9d7d-254f614a8c57', 'Ise/Orun', NULL, NULL, 13),
(257, '0a4ef8ab-7e5b-460d-bf33-63bb654fccc0', 'Moba', NULL, NULL, 13),
(258, '85b048b4-c06c-4e95-b5ce-3627984f36d3', 'Oye', NULL, NULL, 13),
(259, '9365ac61-13d8-4218-a70c-8869e1c51d57', 'Aninri', NULL, NULL, 14),
(260, '280aaeec-f3bd-4e15-bf10-421e3fa4dfb2', 'Awgu', NULL, NULL, 14),
(261, 'd685d434-2bf1-47f5-bebc-6f3535d666b2', 'Enugu East', NULL, NULL, 14),
(262, '71704113-c05e-47c3-98fd-5dba31af11e8', 'Enugu North', NULL, NULL, 14),
(263, 'ada76a99-d106-4990-aa06-9d3a559b40bc', 'Enugu South', NULL, NULL, 14),
(264, 'ae86bdfd-48b1-428b-b7ce-89a1c215363b', 'Ezeagu', NULL, NULL, 14),
(265, '6f7440f2-a679-416f-917a-481d0981c8ba', 'Igbo Etiti', NULL, NULL, 14),
(266, '04f207a8-d972-44cd-8aae-ba208d233041', 'Igbo Eze North', NULL, NULL, 14),
(267, '327dc954-4f6a-4914-b572-73ed2f8ae094', 'Igbo Eze South', NULL, NULL, 14),
(268, '814c8a4f-2866-4bcb-857d-acd10d9d9cc2', 'Isi Uzo', NULL, NULL, 14),
(269, 'ee688048-02c9-4728-aef0-eea6487f2c98', 'Nkanu East', NULL, NULL, 14),
(270, '880febf2-9063-48bd-bbba-b15f567519cb', 'Nkanu West', NULL, NULL, 14),
(271, '02fdd68b-03c7-4b64-9b1b-7dd1d4d35862', 'Nsukka', NULL, NULL, 14),
(272, '24ad6678-132c-4cc7-abf5-d6034c2d3919', 'Oji River', NULL, NULL, 14),
(273, 'fcc080e9-419c-4650-8718-fd5131eec6bb', 'Udenu', NULL, NULL, 14),
(274, 'f9df1066-ecd3-41a0-b3a8-dfd0adf10ed7', 'Udi', NULL, NULL, 14),
(275, '1b05440c-73d5-484a-8833-36a86f97e5d0', 'Uzo-Uwani', NULL, NULL, 14),
(276, '6705e17a-9123-4974-825f-b06a54ef14e0', 'Abaji', NULL, NULL, 15),
(277, 'c810d6c7-3c37-49a8-80ea-e8507f3467d0', 'Bwari', NULL, NULL, 15),
(278, 'a18267a0-c88a-4ba4-ae12-c9ea83f96a1e', 'Gwagwalada', NULL, NULL, 15),
(279, 'cc38c516-6b28-456e-a819-5d9381094c65', 'Kuje', NULL, NULL, 15),
(280, '7fb13927-d277-43d5-a335-42ae1e1627b8', 'Kwali', NULL, NULL, 15),
(281, '0e98191f-2e42-42a3-a69d-a2886a32d25b', 'Municipal Area Council', NULL, NULL, 15),
(282, '70d517c4-04e6-49bf-8f72-c77cb1bf62d2', 'Akko', NULL, NULL, 16),
(283, 'bc1471de-a1eb-4353-ac1c-a99c5228bc5e', 'Balanga', NULL, NULL, 16),
(284, '68467e7a-1aab-4f69-abad-379c4d56376e', 'Billiri', NULL, NULL, 16),
(285, '55e22fe3-f359-4ab1-b140-e1de2e21f561', 'Dukku', NULL, NULL, 16),
(286, 'c6cf941b-1f6b-4b15-821d-4ac9beaecf0b', 'Funakaye', NULL, NULL, 16),
(287, 'fb9d14d0-e8da-4761-908a-581c975954b0', 'Gombe', NULL, NULL, 16),
(288, '4b023050-06b3-4095-8587-8c0672e94c2b', 'Kaltungo', NULL, NULL, 16),
(289, '9972c164-7ff4-4464-8173-4a225f2fe190', 'Kwami', NULL, NULL, 16),
(290, '3573b1b2-3aee-4c72-a669-7145f70c35f2', 'Nafada', NULL, NULL, 16),
(291, 'a8ded0cd-be68-44d4-b2f2-3a680083e110', 'Shongom', NULL, NULL, 16),
(292, '40dc68c7-6499-42e2-b9e1-8b25773d5ffc', 'Yamaltu/Deba', NULL, NULL, 16),
(293, '18b89316-168c-4555-86da-7a9b5373f19f', 'Aboh Mbaise', NULL, NULL, 17),
(294, 'be95dd90-90de-4dd3-9909-0dd13bcb74a1', 'Ahiazu Mbaise', NULL, NULL, 17),
(295, 'b6de92a6-5252-4cfa-b9a6-e1409185f6de', 'Ehime Mbano', NULL, NULL, 17),
(296, '4baba2a9-994c-45ab-840b-5e68f5a1153a', 'Ezinihitte', NULL, NULL, 17),
(297, 'd4be490a-c6c3-4a42-82b5-5932ed0e8839', 'Ideato North', NULL, NULL, 17),
(298, '75385eac-411c-42e1-a18f-8611629ab518', 'Ideato South', NULL, NULL, 17),
(299, '11008705-c707-4758-8d1d-922a334f408e', 'Ihitte/Uboma', NULL, NULL, 17),
(300, '006c12d1-4d4e-45c5-982f-dc091100e08a', 'Ikeduru', NULL, NULL, 17),
(301, '039c7d96-c45a-422a-b825-2099ce27db5d', 'Isiala Mbano', NULL, NULL, 17),
(302, '73bdf700-ce7b-4e11-8566-e3e5a47004f7', 'Isu', NULL, NULL, 17),
(303, '3fbb710e-133d-4166-8397-d17f69be256b', 'Mbaitoli', NULL, NULL, 17),
(304, '602ccf54-2dd3-41e5-8cf6-e5c979e62145', 'Ngor Okpala', NULL, NULL, 17),
(305, 'b0607c7d-4d89-451d-9464-1bea7381d63d', 'Njaba', NULL, NULL, 17),
(306, '9b12a4a5-7735-495d-8105-2083f5d43634', 'Nkwerre', NULL, NULL, 17),
(307, '6ef8ba2d-1193-4030-8f64-32142223a0a6', 'Nwangele', NULL, NULL, 17),
(308, 'a8ec96a2-4a7e-4ac9-b3a2-d8afce46f226', 'Obowo', NULL, NULL, 17),
(309, '35e1fc87-10f8-4699-8add-cf6a41e3fa97', 'Oguta', NULL, NULL, 17),
(310, '06dbaa2e-c7e5-4693-b0f9-61a69947a412', 'Ohaji/Egbema', NULL, NULL, 17),
(311, 'f5f062a4-4982-45ad-9eff-e6a100c3b5db', 'Okigwe', NULL, NULL, 17),
(312, 'a52b943f-1558-4589-bd9d-583c9f3899c9', 'Orlu', NULL, NULL, 17),
(313, '267f4359-945e-4ee7-8a1f-27daf48f8855', 'Orsu', NULL, NULL, 17),
(314, '4b6212db-c192-4159-97d2-b18e06b96ed1', 'Oru East', NULL, NULL, 17),
(315, '695a0f7b-48f5-4a65-909c-b4be734da1cc', 'Oru West', NULL, NULL, 17),
(316, '6fc804cc-f5a0-4857-9552-74875edc3662', 'Owerri Municipal', NULL, NULL, 17),
(317, '41a220e0-18af-4f7d-9f6f-cbf7f84ffce2', 'Owerri North', NULL, NULL, 17),
(318, 'd30851f4-2175-4548-99fb-bac4e22f2c33', 'Owerri West', NULL, NULL, 17),
(319, 'db9d94be-a829-43d0-b198-a13fa5a3fea1', 'Unuimo', NULL, NULL, 17),
(320, '082aa41e-c44f-4893-ace1-61d84b9dcbba', 'Auyo', NULL, NULL, 18),
(321, '26b15b27-855e-4d3d-b36a-4d8758c06db9', 'Babura', NULL, NULL, 18),
(322, 'c913b76b-188a-4bfa-af99-cc723e4b1f34', 'Biriniwa', NULL, NULL, 18),
(323, 'f96938d3-2f77-42f3-a867-5fbd199eac70', 'Birnin Kudu', NULL, NULL, 18),
(324, '8be0e95a-dcc4-498f-b161-8e0091dee265', 'Buji', NULL, NULL, 18),
(325, '3640ca28-4d20-44e0-9238-face731ac5b8', 'Dutse', NULL, NULL, 18),
(326, '774cd7fd-0b1e-40ac-933d-881af0dd561a', 'Gagarawa', NULL, NULL, 18),
(327, '962970a0-6d4f-4b0c-a245-2e1f0bcc45ca', 'Garki', NULL, NULL, 18),
(328, 'bb13db25-05f0-42cb-9b20-064b37cbc99c', 'Gumel', NULL, NULL, 18),
(329, 'adbc5f0b-b355-4709-a082-49984c9bcd6c', 'Guri', NULL, NULL, 18),
(330, '8570eaaf-a112-4832-9a3a-a5a1f2e902d8', 'Gwaram', NULL, NULL, 18),
(331, 'a599cb1c-9b29-4bc8-94e7-a5c063971eb3', 'Gwiwa', NULL, NULL, 18),
(332, 'f416bc6a-36d5-4e4c-868f-24a30515d92e', 'Hadejia', NULL, NULL, 18),
(333, '75b0973c-2627-4c17-b650-2519b8f153e5', 'Jahun', NULL, NULL, 18),
(334, '8b1d1747-54ca-438e-a0ee-ff8ec33dc432', 'Kafin Hausa', NULL, NULL, 18),
(335, 'd940adc0-7f68-492c-8db7-9330b4de5ba6', 'Kaugama', NULL, NULL, 18),
(336, 'd56c7d98-5e4b-4af0-88ae-1b0cd013341f', 'Kazaure', NULL, NULL, 18),
(337, '58609318-9eb4-4409-8117-ba3291cc3784', 'Kiri Kasama', NULL, NULL, 18),
(338, 'e8c621b7-f4e7-409e-a9b8-16bd357a4d35', 'Kiyawa', NULL, NULL, 18),
(339, '33d2137b-27db-49ff-bae4-8e209276cd75', 'Maigatari', NULL, NULL, 18),
(340, '9661f855-a32a-4aaf-8c4a-99ab55c803db', 'Malam Madori', NULL, NULL, 18),
(341, 'c39b5a68-358a-4cf0-965c-e02b5cbcc46e', 'Miga', NULL, NULL, 18),
(342, 'ab87c3a7-c802-4dfa-9d17-d823d3a573aa', 'Ringim', NULL, NULL, 18),
(343, '6d83b1ba-e5fc-4d6e-9a4e-018b4064cda3', 'Roni', NULL, NULL, 18),
(344, '4888a6f2-f26d-4c79-a8b9-d9c9baaccb2a', 'Sule Tankarkar', NULL, NULL, 18),
(345, '8cbc7107-0f68-4fc9-8f41-0ef94bd2e395', 'Taura', NULL, NULL, 18),
(346, 'bb4d1daf-8b1d-42ae-b2e8-be2cc3f09c72', 'Yankwashi', NULL, NULL, 18),
(347, '46155f15-5271-47f2-af35-b597b8a25b09', 'Birnin Gwari', NULL, NULL, 19),
(348, '07637994-e7ee-47e5-843d-b98f0109b313', 'Chikun', NULL, NULL, 19),
(349, '787f29d1-eeac-40fb-aaf3-140315cfbcfd', 'Giwa', NULL, NULL, 19),
(350, 'b6d53f21-cccc-4a8d-9c45-b2d57f8c3f4e', 'Igabi', NULL, NULL, 19),
(351, 'e882a239-972b-407a-89cf-0358c098a3d0', 'Ikara', NULL, NULL, 19),
(352, 'b766cfc4-916b-4557-b731-06d96046a1b2', 'Jaba', NULL, NULL, 19),
(353, '9713fc9c-8bfb-43c8-8de2-5befb45a2335', 'Jema\'a', NULL, NULL, 19),
(354, 'f96135c0-be38-4ddc-8bd4-af6019970627', 'Kachia', NULL, NULL, 19),
(355, '30d42494-6480-4479-bcaf-d0e059bd5a1f', 'Kaduna North', NULL, NULL, 19),
(356, '8d43ae6e-9cec-4991-a844-db7c3c037b31', 'Kaduna South', NULL, NULL, 19),
(357, '85075270-a37a-4ba3-b646-cb4c67b9f6df', 'Kagarko', NULL, NULL, 19),
(358, '4c820c01-39f7-483a-8084-86d3bf2462b5', 'Kajuru', NULL, NULL, 19),
(359, '38dadd8d-f60c-47f3-b881-9a67feb51cd0', 'Kaura', NULL, NULL, 19),
(360, '7c4df11e-dd9b-4ee1-96a3-2b3b34d89531', 'Kauru', NULL, NULL, 19),
(361, 'f85c411e-b0b9-461d-9843-c644566fb66f', 'Kubau', NULL, NULL, 19),
(362, '67ddd922-5b88-4504-a11a-3575f7d4e5f4', 'Kudan', NULL, NULL, 19),
(363, 'fbb6699d-d5f2-46d6-9f82-884dfa008e10', 'Lere', NULL, NULL, 19),
(364, '9d321310-98f3-4393-bce4-1dc5d56772cc', 'Makarfi', NULL, NULL, 19),
(365, '5b449c6d-54e9-490c-8038-108dd09eef0c', 'Sabon Gari', NULL, NULL, 19),
(366, '4fab6660-7adf-46ce-a2d0-d67fe3d07072', 'Sanga', NULL, NULL, 19),
(367, '63e5825f-eb7c-46c1-91a3-4e682c0bfda0', 'Soba', NULL, NULL, 19),
(368, 'c0ef7ed4-1c31-47b4-bdf9-c514723bc541', 'Zangon Kataf', NULL, NULL, 19),
(369, '42e1dbbb-9854-45ab-81c8-307851afcc32', 'Zaria', NULL, NULL, 19),
(370, '5b1818fe-625d-4a5e-a979-aefd70f51a68', 'Ajingi', NULL, NULL, 20),
(371, '46a2edd5-0ed3-459f-9d82-44cd9dd50489', 'Albasu', NULL, NULL, 20),
(372, '56b026f4-8e18-4181-a7ab-a55e64d2d2d4', 'Bagwai', NULL, NULL, 20),
(373, 'b2f227b3-5f7a-4ef4-bf2b-0d93c4a26d83', 'Bebeji', NULL, NULL, 20),
(374, 'f3eba7b3-3c70-4030-89e1-4d5ab1da29cc', 'Bichi', NULL, NULL, 20),
(375, '9d41bf8d-bb55-47c0-911d-ae34ddb71734', 'Bunkure', NULL, NULL, 20),
(376, 'a2e9f4f2-5f13-4b91-a7a5-ea40701841ad', 'Dala', NULL, NULL, 20),
(377, 'b3f750d2-42b6-4868-9be9-a98c8fd2b6ef', 'Dambatta', NULL, NULL, 20),
(378, 'f9354b76-b52f-4215-a7c8-204e9229ad0f', 'Dawakin Kudu', NULL, NULL, 20),
(379, 'db2fa78d-54c2-43d9-84e1-201d4da66c06', 'Dawakin Tofa', NULL, NULL, 20),
(380, 'e80fb289-32d7-4497-bbd7-d8119ccab8bb', 'Doguwa', NULL, NULL, 20),
(381, '059a4821-81c7-4e82-a96c-d592d4edce6d', 'Fagge', NULL, NULL, 20),
(382, '69c02682-5631-479a-9e23-f3836d918328', 'Gabasawa', NULL, NULL, 20),
(383, 'ac8f18ab-8790-424c-8478-8bb7f25937f8', 'Garko', NULL, NULL, 20),
(384, '80b9e4e1-df21-4639-b8f7-6c2e4139c130', 'Garun Mallam', NULL, NULL, 20),
(385, '35173d4c-95d0-417f-b475-c35d4ac91fba', 'Gaya', NULL, NULL, 20),
(386, '8bd275e9-98de-4a01-b795-65aadbfd67ba', 'Gezawa', NULL, NULL, 20),
(387, '03451f2c-4313-4d85-b4e2-b983da79cb57', 'Gwale', NULL, NULL, 20),
(388, '376e6543-fe53-4b8d-acd5-d8ae32bdbd6c', 'Gwarzo', NULL, NULL, 20),
(389, '2b2caf8f-19e7-4b3a-9bd7-67ac64780f21', 'Kabo', NULL, NULL, 20),
(390, '55d7bfbe-d889-4153-8334-139c35b61c57', 'Kano Municipal', NULL, NULL, 20),
(391, 'e2c668bb-3eb4-4528-8080-bf692a4e7f49', 'Karaye', NULL, NULL, 20),
(392, 'd40c9425-a679-452c-9f9d-2da08187dc1e', 'Kibiya', NULL, NULL, 20),
(393, '87e0610f-7ab0-43bb-80bb-20a6c6be9c74', 'Kiru', NULL, NULL, 20),
(394, '022f7fdb-8489-44a8-a2b4-0b0ccbb8fc9f', 'Kumbotso', NULL, NULL, 20),
(395, '6f246d0f-f65c-4117-b4a9-dc02a89e6b82', 'Kunchi', NULL, NULL, 20),
(396, '4b92822f-6053-4d6c-9303-89b2795361e4', 'Kura', NULL, NULL, 20),
(397, '26dafbdf-2201-42b1-8177-c9dfe3890ec1', 'Madobi', NULL, NULL, 20),
(398, '2d5d62b1-1ad6-40d3-b1e1-065d29d2137b', 'Makoda', NULL, NULL, 20),
(399, '5aafc517-577d-4bb6-9e7e-f25c91ea1db2', 'Minjibir', NULL, NULL, 20),
(400, '3bfd1dec-d997-4022-b6c5-96a4aa207764', 'Nasarawa', NULL, NULL, 20),
(401, '9a4c2c6d-ec64-4544-b0d7-0d6ef1b0320e', 'Rano', NULL, NULL, 20),
(402, '587d8cd7-ef99-4fce-bba3-0f49ca054395', 'Rimin Gado', NULL, NULL, 20),
(403, 'ecb95ec3-c0d2-4bef-a86d-ac19d572df49', 'Rogo', NULL, NULL, 20),
(404, 'd065213e-e3a6-4894-beae-604697e3020d', 'Shanono', NULL, NULL, 20),
(405, 'cc0a8c51-4833-48d9-b26c-d96cfcfff159', 'Sumaila', NULL, NULL, 20),
(406, '89498abd-b12f-43dc-9ae6-de7fdd6c64ca', 'Takai', NULL, NULL, 20),
(407, 'a5e42f08-23f1-4b2e-bce3-4e6fe0c2dce8', 'Tarauni', NULL, NULL, 20),
(408, 'f99ddae0-d79f-4cd1-935e-a0096fd7692d', 'Tofa', NULL, NULL, 20),
(409, '5afec540-215d-46a9-bc61-04227cb096ec', 'Tsanyawa', NULL, NULL, 20),
(410, '13a6277a-7c5f-4d8a-ba13-7163747f5c12', 'Tudun Wada', NULL, NULL, 20),
(411, '3a84bbc7-a116-41cf-af52-b9e92f15934e', 'Ungogo', NULL, NULL, 20),
(412, '710c0790-4e34-494b-b0aa-af6293b910f0', 'Warawa', NULL, NULL, 20),
(413, 'd7a946ee-0f0a-48ae-baab-2b729469fb46', 'Wudil', NULL, NULL, 20),
(414, 'f7cc76a4-c06a-464e-af52-7307336aaeb6', 'Bakori', NULL, NULL, 21),
(415, '88eedb60-b579-4246-a37b-d83c87a652e5', 'Batagarawa', NULL, NULL, 21),
(416, '6a695b69-3ebb-4583-adbd-2a5d0a1e16bb', 'Batsari', NULL, NULL, 21),
(417, '91f44db3-1d4e-472d-8b3d-ba06e47e4417', 'Baure', NULL, NULL, 21),
(418, 'ed1fa7f4-0f52-471c-9c5f-2b44e31289fb', 'Bindawa', NULL, NULL, 21),
(419, '3bf3b619-04bc-42a8-98bb-fc10b29c2c2d', 'Charanchi', NULL, NULL, 21),
(420, '8d89903f-7cd4-479d-a2a3-dc24190159e7', 'Dandume', NULL, NULL, 21),
(421, 'a72f75e1-9cb5-4b3b-9aa5-8c479cde560a', 'Danja', NULL, NULL, 21),
(422, 'd51ed809-3546-46f0-97a0-e4c1c36ddeaa', 'Dan Musa', NULL, NULL, 21),
(423, 'c000e35a-ed7b-4752-bfc8-7a635ab1dc04', 'Daura', NULL, NULL, 21),
(424, '96ab4263-e5a4-4136-a991-951dde104333', 'Dutsi', NULL, NULL, 21),
(425, 'cf734484-1ebd-4ac5-b3af-c83315861b13', 'Dutsin Ma', NULL, NULL, 21),
(426, '34d1215b-1916-4451-a3d6-99e3391b5b62', 'Faskari', NULL, NULL, 21),
(427, '9b597830-cf2d-467e-8cec-caffdbbc755e', 'Funtua', NULL, NULL, 21),
(428, '421c4aac-f663-44b3-925b-c090f3803f1e', 'Ingawa', NULL, NULL, 21),
(429, '8c0ef9ba-0f17-48fc-b913-44298bf7b81b', 'Jibia', NULL, NULL, 21),
(430, 'f15ffaef-c879-4296-870d-ccbede8dbfd7', 'Kafur', NULL, NULL, 21),
(431, 'f34e748d-a509-495a-9a39-4e070b264c5f', 'Kaita', NULL, NULL, 21),
(432, '27134607-52e1-4d3c-a3de-43da905d06db', 'Kankara', NULL, NULL, 21),
(433, '1a04629f-2857-4bd0-9928-7a6bb12a28f3', 'Kankia', NULL, NULL, 21),
(434, 'bece7b9c-1f60-492d-8703-b9397a5b03c3', 'Katsina', NULL, NULL, 21),
(435, '8816af0c-fbc5-4488-921b-632d0a597abe', 'Kurfi', NULL, NULL, 21),
(436, 'eb2524a8-7a06-44dd-aef7-979d89224dee', 'Kusada', NULL, NULL, 21),
(437, '5c6b35e8-9078-41d7-b9f5-6f8cd6323310', 'Mai\'Adua', NULL, NULL, 21),
(438, '46ffcf0b-14c6-41e3-88b3-e5bddd0c7c97', 'Malumfashi', NULL, NULL, 21),
(439, 'b8f27445-29d1-4c91-abd9-245fd3efd076', 'Mani', NULL, NULL, 21),
(440, '824778dc-5114-48ac-b3b5-5702aaf92d15', 'Mashi', NULL, NULL, 21),
(441, '41112d78-4d6c-4dc9-bfb6-a810bcd23e0b', 'Matazu', NULL, NULL, 21),
(442, '85e29dcc-8053-4f79-8316-fc1717bc0c8a', 'Musawa', NULL, NULL, 21),
(443, '11171b71-4464-4907-b7cc-78a6243ab9d1', 'Rimi', NULL, NULL, 21),
(444, '268410aa-da11-431e-a904-1ddddfa8a2b1', 'Sabuwa', NULL, NULL, 21),
(445, '96ca7616-c899-4225-bda7-191f8e8dc82f', 'Safana', NULL, NULL, 21),
(446, 'f20e65b3-b554-4b10-9bf3-06d5f3020a52', 'Sandamu', NULL, NULL, 21),
(447, 'c24afc10-5199-43d3-ad97-2525cc8336b8', 'Zango', NULL, NULL, 21),
(448, '86b7f272-eabf-4b84-bbd3-d0921a51e2c8', 'Aleiro', NULL, NULL, 22),
(449, '8e53e29a-6906-49a7-a0e7-fc01da003cb6', 'Arewa Dandi', NULL, NULL, 22),
(450, '75307639-1668-4881-ba16-35cf93596ec3', 'Argungu', NULL, NULL, 22),
(451, '97c69eda-a6c2-4bcd-a6f4-7d924bd89528', 'Augie', NULL, NULL, 22),
(452, '17c5c03c-bf00-47a2-9722-8e844a3f8414', 'Bagudo', NULL, NULL, 22),
(453, '732fc316-0e50-480a-b095-10579fc1ebc0', 'Birnin Kebbi', NULL, NULL, 22),
(454, 'c26062ef-32f1-4359-90b1-55495a16e2eb', 'Bunza', NULL, NULL, 22),
(455, 'c7431438-c2ec-4694-9ed0-59fe9f0f264d', 'Dandi', NULL, NULL, 22),
(456, '3c8ff901-668d-4572-8552-135a246cb4c4', 'Fakai', NULL, NULL, 22),
(457, '0969ba87-fe9a-4874-b3cd-127818eb6ef9', 'Gwandu', NULL, NULL, 22),
(458, '2c0a9cd1-8aa8-41ec-8e6d-7b429d030db6', 'Jega', NULL, NULL, 22),
(459, '26806792-7eb2-4784-a0ee-71aaf3063a4e', 'Kalgo', NULL, NULL, 22),
(460, '9123811a-444f-4dae-97cc-5a678124f536', 'Koko/Besse', NULL, NULL, 22),
(461, '5a26b623-3eca-440f-8d2a-6913c3fbf605', 'Maiyama', NULL, NULL, 22),
(462, '2c939df2-8c18-4a2a-ba06-6ca299770e76', 'Ngaski', NULL, NULL, 22),
(463, '2a775f42-0960-43ec-9d5d-7ac53d725b0f', 'Sakaba', NULL, NULL, 22),
(464, '5dbc2e08-1ad3-4857-916e-a57ec9d39432', 'Shanga', NULL, NULL, 22),
(465, '1bff92b2-2ea1-4343-a31d-ba66ecf03d01', 'Suru', NULL, NULL, 22),
(466, '71617e54-9d57-4d5e-9937-69239fad8c71', 'Wasagu/Danko', NULL, NULL, 22),
(467, '9919e563-4f7e-45c5-be8e-0a7344c3ce06', 'Yauri', NULL, NULL, 22),
(468, '3863e479-7d2a-4980-8531-c2ef18d2d513', 'Zuru', NULL, NULL, 22),
(469, '31d33a16-8142-427a-a288-338b4bb0d246', 'Adavi', NULL, NULL, 23),
(470, '66f6a166-0216-41cb-bedd-6694d3bc495d', 'Ajaokuta', NULL, NULL, 23),
(471, '30ceedc0-56f7-4790-ade6-50819be6e657', 'Ankpa', NULL, NULL, 23),
(472, '766e26bb-099b-4a93-8956-60fbedee22c3', 'Bassa', NULL, NULL, 23),
(473, 'd04653cf-caa7-4328-b765-46abd8e8bdb2', 'Dekina', NULL, NULL, 23),
(474, '54fe550c-e7a7-415e-b21c-adcae2cde2a4', 'Ibaji', NULL, NULL, 23),
(475, '2002835f-e888-43e8-a206-7f900b005235', 'Idah', NULL, NULL, 23),
(476, '5a3cc99a-d847-4ecc-a1d6-2a0146a6779e', 'Igalamela Odolu', NULL, NULL, 23),
(477, 'c88ad4c0-33ac-4320-afa8-c1ec2ab0afd9', 'Ijumu', NULL, NULL, 23),
(478, '458b2e16-4338-4556-94b6-118237721600', 'Kabba/Bunu', NULL, NULL, 23),
(479, 'aba0797a-5f02-4aa7-b6b6-da26ac5eb910', 'Kogi', NULL, NULL, 23),
(480, '95c1fa92-8de6-4cde-97af-004ef2fe09dd', 'Lokoja', NULL, NULL, 23),
(481, '234cb490-78c5-4650-b9f3-f97f79c36394', 'Mopa Muro', NULL, NULL, 23),
(482, '3490fa7a-f05d-4590-8d61-6c1dbeed73a4', 'Ofu', NULL, NULL, 23),
(483, '79484094-a9a9-46d4-b716-efeed0f887a8', 'Ogori/Magongo', NULL, NULL, 23),
(484, '27b31e5b-fc56-40f2-b4e0-b6e1ec9bdc18', 'Okehi', NULL, NULL, 23),
(485, 'a659c823-0aad-4cbc-9beb-c23b887dc23c', 'Okene', NULL, NULL, 23),
(486, '15155cd7-101c-4910-bdfb-be235473b5b3', 'Olamaboro', NULL, NULL, 23),
(487, 'f4a8fbba-6681-42cc-854a-da73514e6820', 'Omala', NULL, NULL, 23),
(488, 'aade4ab0-b074-44a9-89e6-e9103685f50d', 'Yagba East', NULL, NULL, 23),
(489, '167102c3-d233-4ba1-a010-f3f234c55ec2', 'Yagba West', NULL, NULL, 23),
(490, '2056d904-a56c-4a96-83a2-03780082cb8b', 'Asa', NULL, NULL, 24),
(491, 'e3489c44-8c2f-483a-a1ce-b0286d3054dc', 'Baruten', NULL, NULL, 24),
(492, '3ce14673-a085-4842-aebf-ef894474ed9c', 'Edu', NULL, NULL, 24),
(493, 'ae176e32-3738-4cfb-a954-f283dd0a2015', 'Ekiti', NULL, NULL, 24),
(494, 'a7f8147c-ac16-4883-9ed6-cab9e1ca79cc', 'Ifelodun', NULL, NULL, 24),
(495, '4c6ecb3f-f28e-4401-a8ce-4d55df4f86d0', 'Ilorin East', NULL, NULL, 24),
(496, '38b571b1-30c2-415f-8daa-2232644f292c', 'Ilorin South', NULL, NULL, 24),
(497, '6fff8e96-96e0-49a8-9f27-1fa2b21b2393', 'Ilorin West', NULL, NULL, 24),
(498, '43d8d3fe-c9e7-441f-97a5-1be3c9925dac', 'Irepodun', NULL, NULL, 24),
(499, '33579ca3-79b5-4a75-bb0a-91150a40c136', 'Isin', NULL, NULL, 24),
(500, '6927642a-264c-4626-9aec-6eb379dd3c50', 'Kaiama', NULL, NULL, 24),
(501, '7f23c0ff-698f-4696-93c6-6ca22f45f39a', 'Moro', NULL, NULL, 24),
(502, '5be41fb9-d537-4213-a35a-39cd31accf5d', 'Offa', NULL, NULL, 24),
(503, 'cf54376a-a4b7-48bf-b999-fb263ed2b223', 'Oke Ero', NULL, NULL, 24),
(504, 'c75432fc-f889-4e0c-b315-5b0f4b9f6349', 'Oyun', NULL, NULL, 24),
(505, 'b30a913b-b06b-4747-91ed-b28dd62826b0', 'Pategi', NULL, NULL, 24),
(506, '0252bbc9-0d70-4516-ac7e-622d2aec536f', 'Agege', NULL, NULL, 25),
(507, 'b4d91993-ca19-4bc7-991f-ce54ad6c9442', 'Ajeromi-Ifelodun', NULL, NULL, 25),
(508, 'bac39292-785f-4277-992a-7cf7c10290a3', 'Alimosho', NULL, NULL, 25),
(509, 'd5076cc9-4e41-4604-b68f-e84d9df57793', 'Amuwo-Odofin', NULL, NULL, 25),
(510, 'fc0af428-f6f6-4236-86f8-af1f6243349e', 'Apapa', NULL, NULL, 25),
(511, '83d5a079-7bfb-44c2-b5d9-556512807f00', 'Badagry', NULL, NULL, 25),
(512, '671c8c69-44e5-4177-be64-ca463303f6c8', 'Epe', NULL, NULL, 25),
(513, '73242e0b-2d18-4a27-a38c-65c967720d5b', 'Eti-Osa', NULL, NULL, 25),
(514, 'c10ff699-8662-4437-a78a-0c6368e13390', 'Ibeju-Lekki', NULL, NULL, 25),
(515, '7dbf620e-b8f0-41df-adb8-f7aa354aa32f', 'Ifako-Ijaiye', NULL, NULL, 25),
(516, '39dc1a5e-5afa-4a10-a9f2-38e8b5720d49', 'Ikeja', NULL, NULL, 25),
(517, '2946036d-76db-4fd8-8b26-1457a745796d', 'Ikorodu', NULL, NULL, 25),
(518, 'f4febed6-d844-4b03-8f88-628a4a1ebdec', 'Kosofe', NULL, NULL, 25),
(519, 'edfa41e3-b7f4-4685-b56d-14a331765e2c', 'Lagos Island', NULL, NULL, 25),
(520, '3be8b781-3be1-46af-baf3-c032fc7a8047', 'Lagos Mainland', NULL, NULL, 25),
(521, '929e3274-13d0-4de7-a43e-ca6f4b5e00a8', 'Mushin', NULL, NULL, 25),
(522, '949dbaae-9805-4fec-93fa-4e1b8475f1dc', 'Ojo', NULL, NULL, 25),
(523, '37e57cec-81f9-4ae1-bd43-b24f2bc45fd4', 'Oshodi-Isolo', NULL, NULL, 25),
(524, '26b64942-dc45-4752-8c84-fbcff03466b0', 'Shomolu', NULL, NULL, 25),
(525, '1dfe12c0-08fa-4e12-9097-c674e4e6cf4b', 'Surulere', NULL, NULL, 25),
(526, 'd79bd172-cb50-47bc-89ba-b011b52def36', 'Akwanga', NULL, NULL, 26),
(527, 'b71da369-282a-44a4-994d-51e09862330b', 'Awe', NULL, NULL, 26),
(528, '2c60b518-c486-42c6-b2ee-a0a3b7583282', 'Doma', NULL, NULL, 26),
(529, '1bf8c6f9-3e44-464e-b578-95b8c7e242c5', 'Karu', NULL, NULL, 26),
(530, '4f3eedde-f665-4438-a150-03532b55e678', 'Keana', NULL, NULL, 26),
(531, '7adf1b3a-a2f9-4592-9ad6-196ea2bf9eb7', 'Keffi', NULL, NULL, 26),
(532, '965878bc-8e40-448d-a308-5ec3553e1d09', 'Kokona', NULL, NULL, 26),
(533, 'e0e490b6-f1a5-4ce5-9c3f-30849e97bf1e', 'Lafia', NULL, NULL, 26),
(534, 'b4653227-103b-4344-af8f-bd6055f63def', 'Nasarawa', NULL, NULL, 26),
(535, '0e139bb8-0d7b-4768-a98e-e5fadeeb8e07', 'Nasarawa Egon', NULL, NULL, 26),
(536, '506a500d-abb2-40f7-9b25-5ea3269aedc9', 'Obi', NULL, NULL, 26),
(537, 'f634dc65-3a9e-4e90-b263-6c955a35fea3', 'Toto', NULL, NULL, 26),
(538, '7ac8d951-9e4b-4444-bccd-8d8937148536', 'Wamba', NULL, NULL, 26),
(539, '111befe2-a883-47c2-a067-1bdc3f207962', 'Agaie', NULL, NULL, 27),
(540, 'ce4a9796-a7dd-482c-b524-e058cce46737', 'Agwara', NULL, NULL, 27),
(541, 'f50246a0-0b66-4366-8a79-291794b98928', 'Bida', NULL, NULL, 27),
(542, 'd87371a2-0605-49fb-a032-cd4c6b08922a', 'Borgu', NULL, NULL, 27),
(543, 'c37f72ad-9cfa-4707-88a3-e554e97e7009', 'Bosso', NULL, NULL, 27),
(544, 'cf68c721-8eb4-4dc3-b133-03877ee013c3', 'Chanchaga', NULL, NULL, 27),
(545, 'd7534b40-9c99-47ea-be60-999fbdd82d46', 'Edati', NULL, NULL, 27),
(546, '90d331f2-92e3-4cda-a5e1-bf6a6cc12b6f', 'Gbako', NULL, NULL, 27),
(547, '8caee1d9-68e1-457f-b02b-37800e8affe8', 'Gurara', NULL, NULL, 27),
(548, '9ea82ff6-936c-4df2-87eb-ea8db4a97bd0', 'Katcha', NULL, NULL, 27),
(549, '79615f2a-12b3-40a9-bc4b-6dd1779e4386', 'Kontagora', NULL, NULL, 27),
(550, '9d433ac7-eeac-4dc6-befa-9b4f0aca62e1', 'Lapai', NULL, NULL, 27),
(551, '8909d61e-e2f4-4072-b3ce-e84962a0a31e', 'Lavun', NULL, NULL, 27),
(552, '584fa5d5-5f94-4741-9c24-d19896ea7eaf', 'Magama', NULL, NULL, 27),
(553, '32ee6805-40cb-45a1-87d8-19b4babc706a', 'Mariga', NULL, NULL, 27),
(554, 'bd9c1a87-b749-4321-822f-d950cf24a4ed', 'Mashegu', NULL, NULL, 27),
(555, '853fdea1-cfa4-4a3a-bfd9-f55ddb1d65e2', 'Mokwa', NULL, NULL, 27),
(556, 'c1916e3c-0c85-40f1-8db9-dd17d345a4f4', 'Moya', NULL, NULL, 27),
(557, 'a3667645-b66d-48cf-9821-20960450148f', 'Paikoro', NULL, NULL, 27),
(558, '08f782fd-da08-4ee7-bb19-5b993965e3f5', 'Rafi', NULL, NULL, 27),
(559, 'a4a99037-a4f1-4889-b481-8dbfabe9cb93', 'Rijau', NULL, NULL, 27),
(560, 'f4060972-2b09-484a-991b-5ee85b97f971', 'Shiroro', NULL, NULL, 27),
(561, '84103e53-e050-448f-8ccd-acecdb9b0612', 'Suleja', NULL, NULL, 27),
(562, 'e96d35d5-b5ad-477b-acfd-8e7b1d3007bc', 'Tafa', NULL, NULL, 27),
(563, 'c7b19d80-7876-4d1e-868c-608eb9cd5f2c', 'Wushishi', NULL, NULL, 27),
(564, 'f341c349-87ac-42bb-9382-d854787acdcc', 'Abeokuta North', NULL, NULL, 28),
(565, 'dc6ff65c-d96f-4064-95f8-7ed91b3bef34', 'Abeokuta South', NULL, NULL, 28),
(566, 'f412ec68-6f14-4524-9f32-4fdfcca923c6', 'Ado-Odo/Ota', NULL, NULL, 28),
(567, 'aa1807d3-c7fc-4cfb-bc3a-72c3ca112bc7', 'Egbado North', NULL, NULL, 28),
(568, '680c4623-9b50-49b4-95d9-349f7bc93c21', 'Egbado South', NULL, NULL, 28),
(569, 'e4c99925-52f3-420b-9f5a-6651a49db87f', 'Ewekoro', NULL, NULL, 28),
(570, '1e0367b7-11b0-49a5-8dde-9dfbe26381cf', 'Ifo', NULL, NULL, 28),
(571, '4e556244-c32e-4805-a4b3-eebbc049d018', 'Ijebu East', NULL, NULL, 28),
(572, 'a01a240c-9266-4aa0-9812-b199b3b00037', 'Ijebu North', NULL, NULL, 28),
(573, 'fbf7edd7-c859-49e6-9d7e-c9762713594b', 'Ijebu North East', NULL, NULL, 28),
(574, '38014e27-e67e-44f4-9331-5fd5d68bed04', 'Ijebu Ode', NULL, NULL, 28),
(575, '92038713-1c64-492e-af2e-cdd56d2cb095', 'Ikenne', NULL, NULL, 28),
(576, '4eb985c2-1cf1-41c3-a504-2393004dc029', 'Imeko Afon', NULL, NULL, 28),
(577, 'c03035f4-5dc4-4184-90ee-acc4554e7b35', 'Ipokia', NULL, NULL, 28),
(578, '2640932b-8b6a-4a10-a654-cb4a059979db', 'Obafemi Owode', NULL, NULL, 28),
(579, '92a4e330-9971-4519-b884-0e5ac205c00e', 'Odeda', NULL, NULL, 28),
(580, '6c9b6c9c-b952-4ddb-ac5d-1fb66fefcd06', 'Odogbolu', NULL, NULL, 28),
(581, 'd14a4537-115f-459a-8619-350c7fc5740d', 'Ogun Waterside', NULL, NULL, 28),
(582, 'bd4b054a-dc31-4516-ac0b-31563bfa8972', 'Remo North', NULL, NULL, 28),
(583, '570b96d6-bcee-42c8-b9aa-50cbf9cba7f2', 'Shagamu', NULL, NULL, 28),
(584, '7bc82c7d-5578-4bc4-b507-3b9acfa01b70', 'Akoko North-East', NULL, NULL, 29),
(585, 'c5b89830-a89b-48ab-a72e-d3d399a9f0d4', 'Akoko North-West', NULL, NULL, 29),
(586, '64064b35-7e39-42cd-a01f-1b735c22190c', 'Akoko South-West', NULL, NULL, 29),
(587, '6a78a0f0-e236-4033-899d-b4bb37ef4b9f', 'Akoko South-East', NULL, NULL, 29),
(588, '81c6c48b-0f66-4162-bcef-917447f61c93', 'Akure North', NULL, NULL, 29),
(589, '6d7af6b3-6682-4ddc-a58a-7641fd60bc67', 'Akure South', NULL, NULL, 29),
(590, '4a2b04ae-1ed3-4ccf-9d2a-463194930f77', 'Ese Odo', NULL, NULL, 29),
(591, 'e3fa4ca9-3f60-4380-94e6-52cacd7c87f7', 'Idanre', NULL, NULL, 29),
(592, 'acce1d2b-4044-4c57-991d-8f98325a926d', 'Ifedore', NULL, NULL, 29),
(593, 'd87ff3c0-88eb-4304-8666-c0d6e1bde6ed', 'Ilaje', NULL, NULL, 29),
(594, '43c995c4-6d70-4795-b8fb-e629376e7fe3', 'Ile Oluji/Okeigbo', NULL, NULL, 29),
(595, 'dc86c664-1a18-4805-b202-4728d2547016', 'Irele', NULL, NULL, 29),
(596, '57bb8630-d1cd-4003-bfed-2b085cd5608d', 'Odigbo', NULL, NULL, 29),
(597, 'd0e934c1-0371-47ff-8f97-4f192a5e0f35', 'Okitipupa', NULL, NULL, 29),
(598, '0264d705-7f11-49f5-84bb-877d3b29f5cd', 'Ondo East', NULL, NULL, 29),
(599, '2e087ae2-fe83-4606-8e19-b348c9e8c251', 'Ondo West', NULL, NULL, 29),
(600, '0d309b7b-cddf-4c39-a1db-355467a52b33', 'Ose', NULL, NULL, 29),
(601, '8aabfecb-d146-476c-9986-6fe126129511', 'Owo', NULL, NULL, 29),
(602, 'fbdc1bfe-37cc-4d9c-9064-e0465f0dd6d1', 'Atakunmosa East', NULL, NULL, 30),
(603, '69718db0-a114-47b3-81ce-6de233b22a6e', 'Atakunmosa West', NULL, NULL, 30),
(604, '02caf915-b754-41e1-9566-b84cdbd3477e', 'Aiyedaade', NULL, NULL, 30),
(605, '3024cfd7-81ac-4250-b627-910362e6e69b', 'Aiyedire', NULL, NULL, 30),
(606, 'bb92e6df-c9a2-488d-bf8a-6d679450bbad', 'Boluwaduro', NULL, NULL, 30),
(607, '84e07374-b915-45d5-b977-71a7dbc07a9f', 'Boripe', NULL, NULL, 30),
(608, '4242b6d3-4573-44d3-98d3-74b05fa0c171', 'Ede North', NULL, NULL, 30),
(609, '68739f38-eaf0-4ca5-9b8b-819fd38ebe6b', 'Ede South', NULL, NULL, 30),
(610, '53756d92-4b0e-43ea-a0cb-334cfd8011af', 'Ife Central', NULL, NULL, 30),
(611, '3d1c5ce8-06a7-42be-ac12-c5ccc0752372', 'Ife East', NULL, NULL, 30),
(612, 'd8263d56-c6a8-4c93-8982-2c5d9415d58c', 'Ife North', NULL, NULL, 30),
(613, '869c9386-80a3-45ad-ab28-1abba4115af2', 'Ife South', NULL, NULL, 30),
(614, '0474a7ad-0926-405c-b732-0449b30fe0c9', 'Egbedore', NULL, NULL, 30),
(615, 'ed336c12-3f60-4730-aa9a-475e80c9474e', 'Ejigbo', NULL, NULL, 30),
(616, 'bf7f4faa-a34f-40c4-ba17-5076f4149554', 'Ifedayo', NULL, NULL, 30),
(617, '7675df16-2d30-4b9b-a20d-322df899218c', 'Ifelodun', NULL, NULL, 30),
(618, '9ed1cbe7-36d3-47c8-9ca9-40c99f3ba896', 'Ila', NULL, NULL, 30),
(619, 'c9173d3d-29d7-4a3a-bc4e-584a9ce5fa98', 'Ilesa East', NULL, NULL, 30),
(620, '793e5422-6d5e-45e2-a9ae-7a2fde6d2fbe', 'Ilesa West', NULL, NULL, 30),
(621, 'ea1cd377-089e-45cf-b855-339bfb3ae4c6', 'Irepodun', NULL, NULL, 30),
(622, '901ae2ed-3c82-4e28-a8ca-da6d9a7ec1a8', 'Irewole', NULL, NULL, 30),
(623, 'c1853169-ace0-4b3c-95bd-ab7151874071', 'Isokan', NULL, NULL, 30),
(624, '0aa594b1-60f6-4eb1-bdea-50950ea25b7e', 'Iwo', NULL, NULL, 30),
(625, 'fce6c78c-3240-4f61-bc56-14272a224a78', 'Obokun', NULL, NULL, 30),
(626, '93ac6bd1-71c3-4538-b9a2-d79d8176620d', 'Odo Otin', NULL, NULL, 30),
(627, 'e5d0a25a-81e2-4c08-a854-21b3a0d6cc9c', 'Ola Oluwa', NULL, NULL, 30),
(628, '85a6dfa5-f974-4721-ab02-307e1726757d', 'Olorunda', NULL, NULL, 30),
(629, '653bc97a-06d4-47c3-bfd3-4470229b3e3f', 'Oriade', NULL, NULL, 30),
(630, '5bd89ad6-17cd-4b29-88f4-f038ac2bac6d', 'Orolu', NULL, NULL, 30),
(631, '8c5accbd-1c9a-479c-8a36-52721fe565a8', 'Osogbo', NULL, NULL, 30),
(632, '2a7f3e90-4726-46c5-8b2f-b4e42152e0ec', 'Afijio', NULL, NULL, 31),
(633, '1fd691f2-e6c0-428d-adb6-4ce6870a16b3', 'Akinyele', NULL, NULL, 31),
(634, '6cad360a-93b9-4da8-b787-f43e38aa491b', 'Atiba', NULL, NULL, 31),
(635, 'c94b8793-3c6e-4860-8dcc-3778151c4513', 'Atisbo', NULL, NULL, 31),
(636, '08ec8e89-b8f0-4509-8639-0f17013ef764', 'Egbeda', NULL, NULL, 31),
(637, '544ed5d8-9069-4c55-a0b5-b6acef1cb36d', 'Ibadan North', NULL, NULL, 31),
(638, 'ab462a64-3137-46ae-8de2-43102152bb51', 'Ibadan North-East', NULL, NULL, 31),
(639, '80bc3ea8-c592-498a-8cf9-edfa2080b953', 'Ibadan North-West', NULL, NULL, 31),
(640, '72e026bd-5a5b-4278-83dd-41d8fe27a45b', 'Ibadan South-East', NULL, NULL, 31),
(641, 'b4a49843-c93e-4675-8422-6dfbce3da00c', 'Ibadan South-West', NULL, NULL, 31),
(642, '28fd3ad8-d278-4cb1-a937-e9e44b812856', 'Ibarapa Central', NULL, NULL, 31),
(643, '5e71e097-55a9-4997-b32c-70bad43219c2', 'Ibarapa East', NULL, NULL, 31),
(644, 'f15b6236-a1c9-4790-87c6-902e40aa750f', 'Ibarapa North', NULL, NULL, 31),
(645, '71d88856-62d5-4d94-9917-942124b58183', 'Ido', NULL, NULL, 31),
(646, '1223c49b-c607-4cfe-b13e-ffdef92f280b', 'Irepo', NULL, NULL, 31),
(647, '48a2f52e-7ce0-41e7-85c6-ae07fcc08642', 'Iseyin', NULL, NULL, 31),
(648, 'f15dea53-d6d1-4595-9dba-2418eae0ad14', 'Itesiwaju', NULL, NULL, 31),
(649, 'a53405d5-df4b-4419-9b2b-21f140606d8c', 'Iwajowa', NULL, NULL, 31),
(650, '2979ce2e-2700-40cb-8d7a-cc05d2aff1a5', 'Kajola', NULL, NULL, 31),
(651, '190bbf5d-72dc-412c-9b4e-e90c3898a734', 'Lagelu', NULL, NULL, 31),
(652, '7a89715b-eba9-4bbe-87e5-e95daebcd4e1', 'Ogbomosho North', NULL, NULL, 31),
(653, 'f227123e-270e-445a-af4f-1ecdb6049aab', 'Ogbomosho South', NULL, NULL, 31),
(654, '79c5e926-b8be-426b-a08e-8dd04b45b45f', 'Ogo Oluwa', NULL, NULL, 31),
(655, '75234140-f733-4428-870a-a800bb349132', 'Olorunsogo', NULL, NULL, 31),
(656, '416c49fb-58fc-41e2-8fb6-42795585ee2e', 'Oluyole', NULL, NULL, 31),
(657, '1a9b93f9-be57-4461-adde-81cc0e6110de', 'Ona Ara', NULL, NULL, 31),
(658, '7e903478-f27d-48b4-ad31-4aa49c5fb677', 'Orelope', NULL, NULL, 31),
(659, 'b2ac89f4-9ded-4754-8505-1f45f2c4e9c4', 'Ori Ire', NULL, NULL, 31),
(660, '714f93df-1758-494b-85c9-f23b46c11f1f', 'Oyo East', NULL, NULL, 31),
(661, 'bcfa5f19-4583-4a1d-87f3-322961cb3099', 'Oyo West', NULL, NULL, 31),
(662, '557fa7e5-6a84-4143-986a-39b3750ef332', 'Saki East', NULL, NULL, 31),
(663, '44e556f7-6c67-4e4d-a000-698572b1d34f', 'Saki West', NULL, NULL, 31),
(664, '19308fd3-5ba5-473f-9ba7-1ffd0e9e1e3e', 'Surulere', NULL, NULL, 31),
(665, '54f1a458-8aa2-455a-81c5-ffc4a213b8cc', 'Bokkos', NULL, NULL, 32),
(666, '092d9b5f-bf0b-4836-a2c6-907da34b6942', 'Barkin Ladi', NULL, NULL, 32),
(667, '6b17f89c-69a6-4501-b5a5-9d10310cc807', 'Bassa', NULL, NULL, 32),
(668, 'f2ff3a10-ea28-490a-ab3d-32dee7d13590', 'Jos East', NULL, NULL, 32),
(669, '1e2883de-a502-4416-b9bf-a6d9e6bc49c9', 'Jos North', NULL, NULL, 32),
(670, 'f69af6ec-29d2-4c40-9254-a1fde6a28be2', 'Jos South', NULL, NULL, 32),
(671, '89667477-f84a-4d2e-85e0-18aedc3c376f', 'Kanam', NULL, NULL, 32),
(672, 'c7d6a13d-4921-4edb-9e91-b30ead3757a6', 'Kanke', NULL, NULL, 32),
(673, 'd0bd3817-c328-47b3-a70f-c1e22d0d6dd5', 'Langtang South', NULL, NULL, 32),
(674, '0b7ecd64-f8e9-4991-8d49-258d22aa26c8', 'Langtang North', NULL, NULL, 32),
(675, 'a166bcf5-3323-42db-be8d-b2a9ad43f1df', 'Mangu', NULL, NULL, 32),
(676, 'dad7accf-8965-4e4e-96a9-800ba40a4e1f', 'Mikang', NULL, NULL, 32),
(677, 'bb2923aa-74c3-441d-846b-dbf55f394277', 'Pankshin', NULL, NULL, 32),
(678, '99086391-1e3b-4830-8bf7-1d2e69db862a', 'Qua\'an Pan', NULL, NULL, 32),
(679, '77b957ab-95b6-49e4-9933-00d1f6ef59bd', 'Riyom', NULL, NULL, 32),
(680, 'e56b9877-de23-4ad8-97ad-466b66e0e56d', 'Shendam', NULL, NULL, 32),
(681, '7048c6ac-624f-41f6-a78b-9f9d29fb70a4', 'Wase', NULL, NULL, 32),
(682, '2abe0848-9ffd-49f0-8f69-782844dbcf1b', 'Abua/Odual', NULL, NULL, 33),
(683, '83c38057-4fa3-41fe-a132-25c1fd4ab9da', 'Ahoada East', NULL, NULL, 33),
(684, '4d47a219-3f87-4b29-a552-0ee37d4630ce', 'Ahoada West', NULL, NULL, 33),
(685, 'f108d86b-5928-4e99-a781-1482ca0a5468', 'Akuku-Toru', NULL, NULL, 33),
(686, '07c3561f-0942-439e-83b1-52ceba1bc67b', 'Andoni', NULL, NULL, 33),
(687, '126abe64-e857-4d42-873c-9c8238bc7075', 'Asari-Toru', NULL, NULL, 33),
(688, 'ecfd24b7-c2d3-43da-bf2b-a494cbebf1e1', 'Bonny', NULL, NULL, 33),
(689, 'c17ee53b-6f3a-4def-8825-e17e2bc31c88', 'Degema', NULL, NULL, 33),
(690, 'ab6d24da-873b-495e-b1f9-a728332b4ad0', 'Eleme', NULL, NULL, 33);
INSERT INTO `areas` (`id`, `uuid`, `name`, `created_at`, `updated_at`, `state_id`) VALUES
(691, '8acad312-298a-49cf-b5a5-5d613c8b64a6', 'Emuoha', NULL, NULL, 33),
(692, 'f2fba694-13f0-4411-a9d3-c619284364df', 'Etche', NULL, NULL, 33),
(693, '92220090-440a-40ba-adaa-7b0152ba4131', 'Gokana', NULL, NULL, 33),
(694, 'c0e57623-3540-4a81-962a-71809c232db4', 'Ikwerre', NULL, NULL, 33),
(695, '40c6dbcb-1333-4359-910d-a65eebfeed66', 'Khana', NULL, NULL, 33),
(696, '7bd03231-1e39-449f-8003-a2f404aab3cb', 'Obio/Akpor', NULL, NULL, 33),
(697, 'a4b46b02-ee48-42df-891b-2eaa8f39797c', 'Ogba/Egbema/Ndoni', NULL, NULL, 33),
(698, 'e4bc45b0-75f9-43da-80e5-df547b0adc14', 'Ogu/Bolo', NULL, NULL, 33),
(699, '5659429c-300e-4b70-a8ec-a4a4fd22496c', 'Okrika', NULL, NULL, 33),
(700, '89906139-6001-4c7a-a1b6-5b29e0cb6640', 'Omuma', NULL, NULL, 33),
(701, 'dfb4ed02-45f3-4350-8712-4ee8bbff2587', 'Opobo/Nkoro', NULL, NULL, 33),
(702, '200628b1-f49c-410d-bcb1-af15d2af2b88', 'Oyigbo', NULL, NULL, 33),
(703, '8bddb906-03eb-4a1e-962d-df6ab3766013', 'Port Harcourt', NULL, NULL, 33),
(704, 'bfe4488f-5714-4743-9b72-3fc7e0bf9e1d', 'Tai', NULL, NULL, 33),
(705, '60476b53-be13-4b3f-8f2d-64e4d4817174', 'Binji', NULL, NULL, 34),
(706, 'a079527e-8bc0-4682-83af-307e393efade', 'Bodinga', NULL, NULL, 34),
(707, '43ba1e31-92cb-4546-8e3f-82578e752659', 'Dange Shuni', NULL, NULL, 34),
(708, '229d476a-31da-4d5f-9c1a-8284cc79c7ad', 'Gada', NULL, NULL, 34),
(709, 'a94e17c8-6cef-41ce-8ae2-afeef132b63c', 'Goronyo', NULL, NULL, 34),
(710, '19afa167-7e1c-4d3a-a627-ecc1dd0a4daa', 'Gudu', NULL, NULL, 34),
(711, '2c1ef9f8-54f7-464d-92a7-6824875a21a3', 'Gwadabawa', NULL, NULL, 34),
(712, '2527eb2e-8db9-4622-846a-1a2f51d27f91', 'Illela', NULL, NULL, 34),
(713, '288a0556-e32f-4970-9731-2ed7dae804e8', 'Isa', NULL, NULL, 34),
(714, 'aa475c54-d05b-4e69-a688-004bfddd1d7a', 'Kebbe', NULL, NULL, 34),
(715, '842e4f2c-d289-4127-a6f8-604ce0364223', 'Kware', NULL, NULL, 34),
(716, '79c8591a-48da-42ad-9c2e-1a6bff914bc5', 'Rabah', NULL, NULL, 34),
(717, '8efa7cd8-84ec-4eed-bf6c-b0aebc154bbd', 'Sabon Birni', NULL, NULL, 34),
(718, '55233d1a-7d43-438d-85fa-9a0b11ccf759', 'Shagari', NULL, NULL, 34),
(719, 'bad0dc50-1bde-4426-81e1-bc311498fc60', 'Silame', NULL, NULL, 34),
(720, '30f26c46-2a67-474f-a35d-b16833b145e3', 'Sokoto North', NULL, NULL, 34),
(721, '6e9b7aa0-d29d-4909-b1c4-c1b9340f7855', 'Sokoto South', NULL, NULL, 34),
(722, 'ea89591c-58a6-4b05-a3e1-fd8fdc567e15', 'Tambuwal', NULL, NULL, 34),
(723, 'c34dd1d5-b592-405a-96f2-e685d0290a5a', 'Tangaza', NULL, NULL, 34),
(724, 'c2a3d3b2-aaf1-4bf3-87ca-3632168f166f', 'Tureta', NULL, NULL, 34),
(725, 'ff279500-5c9b-4e46-8868-187e12ac8149', 'Wamako', NULL, NULL, 34),
(726, '18405577-8a00-4401-9e08-ee40a5d114e9', 'Wurno', NULL, NULL, 34),
(727, '935de944-58e8-4718-84db-9329fd932180', 'Yabo', NULL, NULL, 34),
(728, '47a84e52-f937-433a-a0f4-cda559ec21ca', 'Ardo Kola', NULL, NULL, 35),
(729, '8382942e-b4a3-4e74-a563-0bfb10d257bb', 'Bali', NULL, NULL, 35),
(730, '92d5335e-f5c0-4080-b97f-700fdc1fa4d3', 'Donga', NULL, NULL, 35),
(731, '3a3fe803-6dc3-47e2-bb57-a150e70f7cff', 'Gashaka', NULL, NULL, 35),
(732, 'c430adda-ea5b-43df-b7a2-9c17cca57802', 'Gassol', NULL, NULL, 35),
(733, 'e372efff-bf71-43d6-a76c-95e113abd15d', 'Ibi', NULL, NULL, 35),
(734, '6e0f42f3-6e0a-4782-9608-8c9b782c9da6', 'Jalingo', NULL, NULL, 35),
(735, 'b28900f7-3ce9-41a6-bbfb-a09d39d2b2af', 'Karim Lamido', NULL, NULL, 35),
(736, '216f65f7-a4fb-4c32-9d3e-63b4aadc15b9', 'Kumi', NULL, NULL, 35),
(737, '468689be-faa5-4fc1-848b-a66a44cc5057', 'Lau', NULL, NULL, 35),
(738, 'ba5b35d9-02c7-40f7-8dea-6b0ff105e7f8', 'Sardauna', NULL, NULL, 35),
(739, 'ad5feb6c-8484-4eef-a866-379a959d0347', 'Takum', NULL, NULL, 35),
(740, '9b0e6a1b-bf72-46f1-82f1-19bb00b86ac9', 'Ussa', NULL, NULL, 35),
(741, '04bcee3e-7c46-497b-933d-9328f6d3b166', 'Wukari', NULL, NULL, 35),
(742, '26bfc85f-6a66-461a-92b8-f2c754eb502a', 'Yorro', NULL, NULL, 35),
(743, 'e87a8b17-d992-46f6-a35c-5306f0b6ab34', 'Zing', NULL, NULL, 35),
(744, '5b9798dd-b249-4fbb-8857-c74792a90b68', 'Bade', NULL, NULL, 36),
(745, 'cb3f75aa-1e64-470c-b82e-c9d55cbc3825', 'Bursari', NULL, NULL, 36),
(746, '4aad1c08-8250-4353-b5f1-9723694a073d', 'Damaturu', NULL, NULL, 36),
(747, '10fa2795-c99b-4522-9147-f8301750ffc4', 'Fika', NULL, NULL, 36),
(748, '23d9dcc6-894e-4d4b-9a77-9dcd8e74c0b0', 'Fune', NULL, NULL, 36),
(749, '0ed133e2-46dc-4413-b4e2-09755ea7cbea', 'Geidam', NULL, NULL, 36),
(750, '07449263-f19c-4551-b99c-6544a0e1ea9c', 'Gujba', NULL, NULL, 36),
(751, '41dba7de-eca9-45e2-8ef0-3633681c8be7', 'Gulani', NULL, NULL, 36),
(752, '041b1e15-0fd7-4d4d-84c0-eb149a1bee39', 'Jakusko', NULL, NULL, 36),
(753, '47379dff-bd10-4c5e-a619-b2be2c663f51', 'Karasuwa', NULL, NULL, 36),
(754, 'a3c3ba5c-29e1-490e-a23e-d0795c13d344', 'Machina', NULL, NULL, 36),
(755, 'ca4145f3-a68f-4f8a-9a1e-aba114c0ac6a', 'Nangere', NULL, NULL, 36),
(756, 'fe311e64-3be3-45e8-9147-194c229af5f8', 'Nguru', NULL, NULL, 36),
(757, '750fa60f-3968-4394-8f3d-2208639b8233', 'Potiskum', NULL, NULL, 36),
(758, '34dc1cb9-8bf4-4205-8244-e23e515d1341', 'Tarmuwa', NULL, NULL, 36),
(759, '36818223-0e6e-4f52-8845-cbff7eda8e5d', 'Yunusari', NULL, NULL, 36),
(760, '55683aa2-f652-4140-938c-3f55f434f834', 'Yusufari', NULL, NULL, 36),
(761, '36024186-7f72-488a-b6ae-057629dea72b', 'Anka', NULL, NULL, 37),
(762, '77971600-d5de-4260-8621-0407f1881d3f', 'Bakura', NULL, NULL, 37),
(763, 'd67c7ad1-0125-4220-ae89-96cb02c2608a', 'Birnin Magaji/Kiyaw', NULL, NULL, 37),
(764, 'c492d98e-940d-4492-91ca-06fb352d2006', 'Bukkuyum', NULL, NULL, 37),
(765, 'b4ec17fc-8a53-48d8-9004-719aa4999b25', 'Bungudu', NULL, NULL, 37),
(766, '9978228c-f8f3-485e-886f-1cc90b55d3c1', 'Gummi', NULL, NULL, 37),
(767, 'b55e0325-b20d-4e42-b30b-9b35b6528ff5', 'Gusau', NULL, NULL, 37),
(768, '04901fc6-16ed-4025-94d6-eeb7ed690629', 'Kaura Namoda', NULL, NULL, 37),
(769, '22ea1050-4bf3-48f9-b7c3-cb2b51abd039', 'Maradun', NULL, NULL, 37),
(770, '46832e83-4e12-401a-a976-56b64d3c41bf', 'Maru', NULL, NULL, 37),
(771, '016dcaa9-64bc-4dae-b651-9c6f2b69f42e', 'Shinkafi', NULL, NULL, 37),
(772, '3ffc6062-c960-4a7b-8573-a7f68bb892d6', 'Talata Mafara', NULL, NULL, 37),
(773, 'baad6dd7-f782-41a1-8e2e-2157206a090a', 'Chafe', NULL, NULL, 37),
(774, '59fc7922-217b-4a4f-89cd-2b578ec06bf2', 'Zurmi', NULL, NULL, 37);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('enabled','disabled') NOT NULL DEFAULT 'enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `uuid`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, '5cf329fa-67d2-11f1-86fe-78e205732f93', 'monthly fee', '10000', NULL, '2026-11-17 22:48:53'),
(2, '0d47e55f-7f06-11f1-a248-c63ace5e68f2', 'paystack secret key', 'sk_test_691e3f70db555b6413aaa3809ea589b84f4d9714', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `uuid`, `name`, `created_at`, `updated_at`) VALUES
(1, 'fa4ac3e0-f4fa-41c9-a36f-c549e793baae', 'Abia', NULL, NULL),
(2, 'ae1b3053-f67e-47f7-b5ca-5ef78cbba318', 'Adamawa', NULL, NULL),
(3, '8f7b97e5-46f9-422f-b79d-4df6e12d52f3', 'Akwa Ibom', NULL, NULL),
(4, 'f72c08e9-d8e2-4277-82c6-86d5c58498e6', 'Anambra', NULL, NULL),
(5, 'ee7820d5-1b3e-484e-a498-40c0cfd56879', 'Bauchi', NULL, NULL),
(6, 'dc7f30fb-1135-4179-b89a-68330582b87f', 'Bayelsa', NULL, NULL),
(7, 'c7cc5243-28ac-4846-a000-23ea52ec2178', 'Benue', NULL, NULL),
(8, 'f82dd856-d96a-441e-950f-e8c402edabd8', 'Borno', NULL, NULL),
(9, 'd287f2ba-afb0-46b6-b1d8-520be632cb0d', 'Cross River', NULL, NULL),
(10, '089d899e-6dc5-4cb6-849d-45034788d3fd', 'Delta', NULL, NULL),
(11, '9a0880ae-a0f9-4790-bccf-85401df5a2de', 'Ebonyi', NULL, NULL),
(12, '8db6421c-6404-4d2d-a98f-5b66dd4f0048', 'Edo', NULL, NULL),
(13, '604dac59-1d05-42bd-bb56-5c8617dc78cd', 'Ekiti', NULL, NULL),
(14, '4885a95a-604f-475d-ae2d-3637e6e7c8b1', 'Enugu', NULL, NULL),
(15, 'dd14e980-4945-4aef-a389-27d6a3efefeb', 'FCT', NULL, NULL),
(16, '09cf94f0-3a1e-48cf-9d7b-efb94cafd89f', 'Gombe', NULL, NULL),
(17, '1a3bd3dc-0cf1-43f9-85db-2622e6209522', 'Imo', NULL, NULL),
(18, '3602393e-af62-4d6c-9c3e-0984311b1917', 'Jigawa', NULL, NULL),
(19, '5e77df11-5b34-4732-849e-d030b82a5e2e', 'Kaduna', NULL, NULL),
(20, '49212295-0309-4427-8a03-d2bdd2272eb4', 'Kano', NULL, NULL),
(21, '84183ddb-1223-4d04-8afd-66aa30c2d146', 'Katsina', NULL, NULL),
(22, 'c3b941c4-e375-48a9-add8-b65a9b3c3737', 'Kebbi', NULL, NULL),
(23, '0202e244-94e6-4e56-8819-b28cf627fc05', 'Kogi', NULL, NULL),
(24, 'a183c770-6e82-44cd-84ef-f416821707ec', 'Kwara', NULL, NULL),
(25, 'f208a98e-1256-4cbf-a97b-1182af2cdc18', 'Lagos', NULL, NULL),
(26, '05fb3602-a38d-4fbf-a688-38d419af85e1', 'Nasarawa', NULL, NULL),
(27, 'bc58f9d9-272c-442d-a738-fdf0317996eb', 'Niger', NULL, NULL),
(28, 'dc86d86b-2993-4884-a05e-dbb117baf6d2', 'Ogun', NULL, NULL),
(29, 'ac0ee902-0389-47dd-ab2f-e693fd6cea7f', 'Ondo', NULL, NULL),
(30, '1b382159-999b-45f2-9bf6-e6f04806f24f', 'Osun', NULL, NULL),
(31, 'aec664d1-235a-43b5-ae53-83153a513c78', 'Oyo', NULL, NULL),
(32, '94a8a293-193c-42fa-acef-dd2a9867b298', 'Plateau', NULL, NULL),
(33, '5002df8b-39a6-4dfe-ac68-05a495584ae9', 'Rivers', NULL, NULL),
(34, '76f13fe5-16ed-4f98-ae57-0cf703064c7e', 'Sokoto', NULL, NULL),
(35, '2cd6019d-a710-4234-a1cc-19559f4e3c7a', 'Taraba', NULL, NULL),
(36, '81fb511f-654d-4717-8d17-67e8305bb2b0', 'Yobe', NULL, NULL),
(37, 'ad3b1c68-df19-49b2-a4d5-504f88d7cffc', 'Zamfara', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `amount` double NOT NULL,
  `no_of_months` varchar(255) NOT NULL,
  `status` enum('pending','canceled','confirmed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `address` text NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('activated','deactivated') NOT NULL DEFAULT 'activated',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verification_codes`
--

CREATE TABLE `verification_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `email` varchar(255) NOT NULL,
  `code` varchar(6) NOT NULL,
  `expires_at` timestamp NOT NULL,
  `req_count` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `blocked_until` timestamp NULL DEFAULT NULL,
  `duration` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrators`
--
ALTER TABLE `administrators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `administrators_email_unique` (`email`),
  ADD UNIQUE KEY `administrators_phone_unique` (`phone`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `administrators_uuid_index` (`uuid`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `areas_state_id_foreign` (`state_id`),
  ADD KEY `areas_uuid_index` (`uuid`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `locations_name_unique` (`name`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `locations_area_id_foreign` (`area_id`),
  ADD KEY `locations_state_id_foreign` (`state_id`),
  ADD KEY `locations_uuid_index` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_name_unique` (`name`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `settings_uuid_index` (`uuid`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `states_uuid_index` (`uuid`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD UNIQUE KEY `transactions_reference_unique` (`reference`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_uuid_index` (`uuid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `users_uuid_index` (`uuid`),
  ADD KEY `users_location_id_foreign` (`location_id`);

--
-- Indexes for table `verification_codes`
--
ALTER TABLE `verification_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `verification_codes_uuid_index` (`uuid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrators`
--
ALTER TABLE `administrators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=775;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `verification_codes`
--
ALTER TABLE `verification_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `areas`
--
ALTER TABLE `areas`
  ADD CONSTRAINT `areas_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`),
  ADD CONSTRAINT `locations_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
