-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2023 at 06:28 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendence`
--

-- --------------------------------------------------------

--
-- Table structure for table `admininfo`
--

CREATE TABLE `admininfo` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admininfo`
--

INSERT INTO `admininfo` (`username`, `password`, `email`, `fname`, `phone`, `type`) VALUES
('admin', 'admin', 'admin@admin.com', 'Admin', '12344', 'admin'),
('student', 'admin', 'student@student.com', 'Student', '+8809121', 'student'),
('teacher', 'admin', 'teacher@teacher.com', 'Teacher', '+8809121', 'teacher');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `stat_id` int(20) NOT NULL,
  `course` varchar(20) NOT NULL,
  `st_status` varchar(20) NOT NULL,
  `stat_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`stat_id`, `course`, `st_status`, `stat_date`) VALUES
(5001, 'networking', 'Present', '2023-05-26'),
(5002, 'networking', 'Absent', '2023-05-26'),
(5003, 'networking', 'Absent', '2023-05-26'),
(5004, 'networking', 'Present', '2023-05-26'),
(5001, 'networking', 'Present', '2023-05-26'),
(5002, 'networking', 'Present', '2023-05-26'),
(5003, 'networking', 'Absent', '2023-05-26'),
(5004, 'networking', 'Present', '2023-05-26'),
(5001, 'networking', 'Present', '2023-05-26'),
(5002, 'networking', 'Absent', '2023-05-26'),
(5003, 'networking', 'Present', '2023-05-26'),
(5004, 'networking', 'Absent', '2023-05-26'),
(0, 'networking', 'Absent', '2023-06-03'),
(5001, 'networking', 'Present', '2023-06-03'),
(5002, 'networking', 'Absent', '2023-06-03'),
(5003, 'networking', 'Present', '2023-06-03'),
(5004, 'networking', 'Present', '2023-06-03'),
(5007, 'networking', 'Present', '2023-06-03'),
(5008, 'networking', 'Absent', '2023-06-03');

-- --------------------------------------------------------

--
-- Stand-in structure for view `reports`
-- (See below for the actual view)
--
CREATE TABLE `reports` (
`st_id` int(20)
,`st_name` varchar(255)
,`st_dept` varchar(255)
,`st_batch` varchar(255)
,`stat_date` date
,`st_status` varchar(20)
,`course` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `st_id` int(20) NOT NULL,
  `st_name` varchar(255) NOT NULL,
  `st_dept` varchar(255) NOT NULL,
  `st_batch` varchar(255) NOT NULL,
  `st_sem` varchar(255) NOT NULL,
  `st_email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`st_id`, `st_name`, `st_dept`, `st_batch`, `st_sem`, `st_email`) VALUES
(0, 'damo', 'IT', '2023', '5', 'dhamo0202@gmail.com'),
(5001, 'Indhumathi', 'IT', '2023', '6', 'indhu123@gmail.com'),
(5002, 'Jeevanandham', 'IT', '2023', '6', 'Jeeva@gmail.com'),
(5003, 'Tamilselvam', 'IT', '2023', '6', 'stamil9994@gmail.com'),
(5004, 'Dhamodharan $', 'IT', '2023', '6', 'dhamo0202@gmail.com'),
(5007, 'madhan', 'cse', '2023', '6', 'madhan@gmail.com'),
(5008, 'deena', 'IT', '2023', '5', 'deena@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `tc_id` int(20) NOT NULL,
  `tc_name` varchar(255) NOT NULL,
  `tc_dept` varchar(255) NOT NULL,
  `tc_email` varchar(255) NOT NULL,
  `tc_course` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`tc_id`, `tc_name`, `tc_dept`, `tc_email`, `tc_course`) VALUES
(1, 'Anitha', 'IT', 'anitha@tec.edu', 'Software Engineering'),
(2, 'priyanka', 'it', 'priya@gmail.com', 'Software Engineering'),
(3, 'hemalatha', 'IT', 'hema123@gmail.com', 'Software Engineering'),
(4, 'ezhil', 'IT', 'ezhil@gmail.com', 'Computer Network'),
(4001, 'yuvaraj', 'IT', 'yuvaraj@gmail.com', 'software engineering');

-- --------------------------------------------------------

--
-- Structure for view `reports`
--
DROP TABLE IF EXISTS `reports`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reports`  AS SELECT `students`.`st_id` AS `st_id`, `students`.`st_name` AS `st_name`, `students`.`st_dept` AS `st_dept`, `students`.`st_batch` AS `st_batch`, `attendance`.`stat_date` AS `stat_date`, `attendance`.`st_status` AS `st_status`, `attendance`.`course` AS `course` FROM (`attendance` join `students`) WHERE `students`.`st_id` = `attendance`.`stat_id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admininfo`
--
ALTER TABLE `admininfo`
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`st_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`tc_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
