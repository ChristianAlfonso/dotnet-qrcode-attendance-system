-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2024 at 10:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sis`
--
CREATE DATABASE IF NOT EXISTS `sis` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sis`;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `student_no` varchar(255) NOT NULL,
  `student_first_name` varchar(255) NOT NULL,
  `student_last_name` varchar(255) NOT NULL,
  `student_middle_initial` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `time_of_attendance` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `student_no`, `student_first_name`, `student_last_name`, `student_middle_initial`, `subject`, `time_of_attendance`) VALUES
(15, '22-0297', 'Menard', 'Perez', '', 'Science', '2024-12-11 16:01:13'),
(16, '22-0298', 'Jayceif', 'Bola', 'B', 'SIA', '2024-12-11 16:06:54');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `age` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_At` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `first_name`, `last_name`, `middle_name`, `age`, `email_address`, `subject`, `password`, `created_At`) VALUES
('0624', 'Menard', 'Perez', '', '21', 'gpgod24@gmail.com', 'SIA', 'test', '2024-12-11 16:03:32'),
('1', 'test', 'test', 'test', '21', 'test_user@headadmin.ph', '', '', '2024-12-11 09:33:24'),
('123', 'test', 'test', 'test', '21', 'test_user@headadmin.ph', '', '', '2024-12-11 09:45:02'),
('123123', 'test', 'test', 'test', '21', 'test_user@bcpc.ph', 'Science', 'test', '2024-12-11 15:46:53');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_no` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `section` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `qr_code` longtext NOT NULL,
  `created_At` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_no`, `first_name`, `last_name`, `middle_name`, `password`, `section`, `age`, `email_address`, `qr_code`, `created_At`) VALUES
('12', 'test', 'test', 'test', '', 't', '21', 'test_user@badac.ph', 'data:image/gif;base64,R0lGODdhYgBiAIAAAAAAAP///ywAAAAAYgBiAAAC/4yPqcvtD6OctNqLs968+w+G4kiW5omm6goB7gvDTAwYLkLbLx7rckAL1ibC3MJ4OyB3yh7QWXRKkrNh8sdb+qzcrYJ6HE7FYZ03ITQ/r901WV2lsH/sLNmorof1cya4xUXXdrYFxvfWdFg4GNGnF9dk94WIFfm0CNcY6IfI45lIGfp3SapFtKnotji6yvn5aTqGWbrZWpVGmpkH1dnAainYt0sIuvtYduogrMp8OCp49qv7EAVNO3ydnepYJFe93QaODf5NggdqvSyZy7LHZJdei+ZaYk3MjZ1ZKe2mfnq8D1W4OwQN9ZpVaYzBV+wCHluXkJm+g+4YLiyG8VcwUf8EGcpqGCRaQXoIu1GjqIwRLnv9VPLCldKDw5dSsol8JnCahpkbA070Z4xkBXHoBk5qVa4lrHeaxo1MtfTbEp8SRwDsFc/gw3ZHQd4aqJWRuY4tzxFlqfFpzY9BYWoD6xISUpTzus69KZClTnbr2Fq624zTylBy5/ED1Pfk3Klx64YI+1Gq4MYeL+CEzLcpLX9uzyE2PHJvzM3ybBX15nQZzp85ffGaFRmuyK6YPYN2xhQQVM0RI5a8V1rT7s+9c58mHZUu7cmmK/fEmje6BdWTi0/Ch2ywbd3GGa8+7ruieG/Fn9tVWjVl2sPIYINuy/Q7PLLh/W4P3Dzz5fjBUbf/d1ffXxglV5tyAlY2H3v7LTeTaOLpdRxemBGT2E7MZeaeeQOmt6GFzokFUlLABcjeaNNsFVYUid3n4GeA4ZXPe29NFJR/LwY2XEZGeYXcUKHpmOKPZgllkXEuVrXRfBDVBCFr/on434n0ZDWlgZBAeZ6UuMEXo4c8SkkjaSSGhJ9llOnXGDf8aAeiiT1ap9g/bcponzxwusldixwq5BKKTJqUGpF7CtcniEN2BpefJQLD0XVrRVnmYjvG5qijAWpZ6GB6YtAgkPypaeiPInQqoZBkyjfoVyqiNxuShDmG26KWmnSobAeiGaisjhVW6YM0aUiglRjeWqGnoLrHZTLoce235a6uBnkpb6/dZmuRE5ZlpI+/YXsVhcNCW82T06560Z3OShZtsGFiWuSHeJq57bobXgSmaxys2ZpkwYLa7bDvqsvtn6aRS5+wkvLbKLbqqRWLnAS7VSq+4DbJVcUWX4xxxhpvzHHHHn8Mcsgie1wAADs=', '2024-12-11 06:31:02'),
('123', 'Dissapointed', 'Awit', 'Sila', '', 'tangina mo pagod na ako', '21', 'test_user@treasurer.ph', 'data:image/gif;base64,R0lGODdhcgByAIAAAAAAAP///ywAAAAAcgByAAAC/4yPqcvtD6OctNqLs968+w+G4kiW5omm6sq2bgXE8jwbMXIHeY7LTq3zBSU7mpEXOR5tgB7zmQAygNRm0qo0UpCKIlPZFUK5B6Q3CB42yD/rFAtP98zwt1Odra/d16/wPMdHlndG5xdWSANFFPenF3gXmAaIJ1bm6EcJUVR1iCaoGKVHJ/V5Z/ip+cCJaeqayTf2mAqKahvKtge7WMmqJZonabnZqNq2qybrGyr8C5trR8tLfJwsfelZinxaHGsdtuXNLczNijhcuY2tO0HYmigbnz4PT+8uvucuX88/6r/vT1+JZec6AZtFyhu0FgQPGoRkLSG4EaWcrWtm6R5Chf8ZQT3D9ybhII5yaE3yeDBSL2btsrR5aNLRr5I0O3IIlq/Vx2U8a7GsCLJPTojaVs4M+O9izKKMXvr0VG6JvXq8BGJA9VGZ1KxKzbkSKRMdta5Se4LFujKbzypM2RUUK6pqUrlQ7WFcGO0t3nkAVXrte6lkOIjRimqs+zdlYI5Xn7IzfA9xo5COVQ5eYPAkJbaE9Iad2JiyVs5yzbLcOTnuBaAjR8Ot6Rn122mrOrY2+nrrt5iyHc5qupjzLYvIbrkGbKw2RnU9Z0dMehR5UNCLJWdOTY73botoLYxMHD2tb67fbSr1jo510Ouuc21eixJ9ecKY3yFt+z477XBe36P/PTvXNcats5dTapUW33PhgUXXc/tdcd1CkAmEHy7mHbiahXWd49lR7ln4n04wpMagb+oBhBN1DxaoGkzELeVYIimqZtl5EMIX4WkEuhQcYzDOyB+O9r3Ynm3pdXNYhoLhRhuQ20FX2Y5tUfZiQ+VV6SNVr0gJF5VQCockiWIy95lduznVD5jkDXlfjPbJw0h3CoqoH1kw1bnhiHKW+CFk2fV5JIteolYiUZ1NtZFGgo73I3wcNopioop6kJx6SeKU5KB8ZbiikZfymGl97LU00YQoSWSmmk9a12V9pQZ6qpuRFpelp9O52uJ6sDbHpHi3EUlqrgYyehKtGEa1aJ3c/+mK5ZW6cYWgfLbWuJxid+164ZbSdhjWh+OIGqU6cOpJEqg6NggofeJuOhZQtIbq3IyquMvpllZOmpNp39KXbI9Ntpqfdn/iQ5q25M4L8EbQ+nvmV2Vq0B+Pr2oVFbrdmtdvxTAWhpTGw4W5r5K/cZmYx2VaRey5tVXaTZ4UO2waoA0Bh6Gz8ToKM8g7qitUzeXaPGfEvI47pVtPuigxl48WLOGzPR8topMl53wsuEVXM7Ba3jJsKHVXbwC00ATj3DWNBoMA7IKxDrhswWQmh+bYo74cKZ/TVtewpiGXDWax1/zr96JYdipjmGrTe+24aF9MjJ+QWv3zrTcxvvKRhLPKjW1jKHuooYCGlxUr3SLLC2Lnh0fmIKIQ66p40HSe3ejgeSv32MgAAo45vOwGqza/km7+u5DhAdc73kTje7yl5l42fM5A52XvmL2ubizezSbsu8/role9y9Zj53rzFDpdjfgJF+7XoQD2LbmNIa+f4Neqev+1isLaqRuqw7aNubSY5t+x1L2MXiFaUtw085MAhkhrocMfsF4AwQhKcIIUrKAFL4jBDGpwgxzsoAc/GMECAAA7', '2024-12-11 06:36:58'),
('22-0296', 'Menard', 'Perez', '', 'test', '3k', '19', 'test_user@bcpc.ph', 'data:image/gif;base64,R0lGODdhYgBiAIAAAAAAAP///ywAAAAAYgBiAAAC/4yPqcvtD6OctNqLs968+w+G4kiW5omm6goB7gvDRvy2NDDjh5vzgd+7ySZCWnDoEOYQviHwV0RGnoqnU0dNNG9MrHfZyCZ1DGsNCi57jbsv+q2mbK9H8vsqrUvN9fR0fTZ3BoY32KbU1tUH97coWFWkeMcFlSW4JQeIWWmnZ7iJmDdJR6TpxnZJycdJShjjZ+No6hrll7pJG9j5IJao9RpG2bXautAbFwwpOgzMLFkMmRkFelrtej2ZW1s6bZ39TY1N3W0iCs1rh8sSbKmb+bwLgqjtxny+l/4JfGwsPOr+C9UufM4OAZTAbxHCZowk0TOT8JeNZez0IXuYL6LDf/9sFHJSZmiiPwvEIhmEOJChyI4dBBac1/Akw0IaK7g06GmjvZm6KGIg6EunRJnjDhKN92cVrJgbQ82KCTPWx34CqyLNOTXIzndZA+5TFdJroYIeuVrd+k+oOpbbSD7FRwooPLSeatbNp5WpL5Zu8/qk6u+RXnoaBP8FeVNWOFZ4g3YV7NYp2rhPbWVsfBidUsB0oQKk2O6nxYqd2xW96Fiat7yyyE6FudmuV2ysGVtGidWyUKm15b4OG3qv0XNjXPseO7QpoNv1GgknznF5xdPgrvaDBz1VbcTVFsuOltYzc8MpKbvuGz44SvLcaXeVCrQXXOmb3UOHP1q+Pvapv/n/tW6WdB6p859+wS2FHmS2CQfSdjglNxg6uWCUmXYPFsOXc/yRI+GCBTaXoUhz/TYigYzRtF9zC5X0X4kqntgTTyaOwdaLCD5mHYYvygabjXr51iAjJvIo4HWelZShgvdpGNaIxpmiXoo3LgSegjda6CB4utmU0oQQYidlh1smCBxSppWHpn1dXmDlj2nOBudaa3I1pnj+PfhSjFFxqZxaq+F5oZ4jbTDfk14uRR1uLYXZW3eNuSjnd2Jd1uOAYH3oVGbtHRWfjF9hCpambGL2WZlRmhMjCUg6GiSYZ2Y5nUlqIkpfkySGp1pbdw5Zq4HeiLqbY4lN2uJvqJ4nppGtfgG2oaBavtfhsMelamSkl0ZY5aeAKgran9vMmMyC3kFZJGo0+oifedWdley5U0arbY36gdrqcwCGe5O8ZvZq6prAfjnUtzxtGeVk9z6bbab5kZqtwZFNM96+xSapEsArmbSexLdS/Jek63wMcsgij0xyySafjHLKKq/McssFAAA7', '2024-12-11 09:08:17'),
('22-0297', 'Menard', 'Perez', '', 'test', '3K', '21', 'gpgod24@gmail.com', 'data:image/gif;base64,R0lGODdhYgBiAIAAAAAAAP///ywAAAAAYgBiAAAC/4yPqcvtD6OctNqLs968+w+G4kiW5omm6goB7gvDhpy4TPzOAGIHdK/D4ShCYXBXQyqKOh7yp/QVY8ToMtqj3Z7c4SHLbTaAEfLVeXSAj1qpeD22PsBQdvduvzK/2DtcQpfjJgUVmJe0J/ZGNQjoFzZIBmfGZ2eYdEip9rioGAl5RsjYtlg3ETgphyr49+klydlYFttaOgrqeosmWjsnt7urydfbdins2fJbiSmrh5u2bLpVNcUKmdr5mZ1afbzQbb19PS4uDm4C65keF6zMAqy9jMycTZIYD189X9wHKz3rpZ48XroQ9XHiL1wHbkYM8psWrSE0DgwDDmM0T92jhP/UbpG6CBGhIEf3LOyxKDLkRW/OUFbQF9Ecnm9TUhKkWDNmvELKYEJzieGVNYbtVlV8RpAlTZ4/Z9qyNO4f1I7wmk4d2HJov61Kbe5TeM/byZGiRHY1mImsS6GhErrFeErrpUNmkbay6DPDulAaS76c+dHkQZr5cgYFTLaKwKbYbg7kGPHspsVlKx8t7DXXYbZLPar6TJQwvbics87Fatnp6Iy+hK5qtwVy2MGsN7mORXliary0m4XYq5PvY8Q2Jf+tim+1LGNba/sSLuy0c86mejmC3lP19ILVkdqmlZjdSuIOyYEkDf7sW6vlBQZubV43T+bI7yrcHL8yY60a2zb/963YTp5FB5p2jmF2QWO3EeiMbnQNh98684UHEW/0jSfYQ7vBNdmBG/ZFYRzW+dYdZTDNNmJs3pEIVn5QGfWfcQSqNxhwDS5nlzui3ZgMbKgVV+NnGeoI3G1XFRWjjiQR2ZuRSQmpX2o4NSafkh6+h6Bz37mnlpUWetmklSpWSUlombFnI4AAqfaRmecB2Z9yPZ4nXS5lhsfUk1jOAmeUttwJKGJ54WQaXE5+9RSOxnVY15en3ZkoZBFuFOaDJW441p4qwojglzK9KJeYCQoaVYH+tcnfCMy56aCdpvoJ36CwprXfmAIuqieHszq2anYKhsjojnSGmGevkL7Jp3hAe85I3oTYyQgedluKxix1ov6ZI3JnBlfepdfxyialrQo3La7YJoptneSKuOKc1gYaJz/wMqOpeO++KmGX8yJ5WIfF4lkqooreF5e/qaIaKZTrqfndid1U2CKqe+IKDozvXbiWrtq+w3HHHn8Mcsgij0xyySafjHLKKj9QAAA7', '2024-12-11 15:55:39'),
('22-0298', 'Jayceif', 'Bola', 'B', 'test', '3K', '21', 'bola@gmail.com', 'data:image/gif;base64,R0lGODdhYgBiAIAAAAAAAP///ywAAAAAYgBiAAAC/4yPqcvtD6OctNqLs968+w+G4kiW5omm6goB7gvDRvzOse0qcpDz99GjCQGUIQ33O/p6iF3wZ0MaiRPm4omlWp/RhLO21FIZ1tb4Ks52u1wv+Nsmn81SMdvuqzeh+XC5r/TnkNVWiKekB5QGtpco2EB4uIh09xcZp+g49xB5RxlWuXmJ1+hHGtHZFzq0Bjh1ugrLuYg5+lX6Kpv6KDeoK/u5Z8nHq4q6iSsKDOo2vNOqgwyZK+npam2ITV20fe2d/V3tmmuCGa3tLM3Sa3wenq7ybOq7253ozlrFOD9dT64oLxmiY6EKjpuEpo48W8vYqTloMGAmUwtpJVGHpmI+Yf9GPo2K9U/CwCnRSDL7eJAaRjMSHz0M5gamxjPFWO6DNnGmw306J1owtOVmTIBC5JhLmAEoTaGlFDI9ubLdsaM4N0r1+EYoQ25UpVp1mfVlzo76Rmq9OBCrVTpX+xE7C4eP2qL6cHJV1nSstZ218G5ouRSfOL6nhv282OoWVKeJX7nTEKhwVqyMjYX0+SGy2Ip5Kwuc3FYkWoQyAzeTm3JwhbjsKA8NWhNz57Kkh7pOxlF067+qc/MDG7n0bAzgSlq0S1FS0OGzcGPumu9hWreHnTdGHh3hdKNRHxMkmp1j8Ixvq9cFTxd2emlfu582eR3iWPX0eaK2Cd+yctMz69f/J37WbuP15dpymQWIlCZ7yUcgb/SoppiC5BmmHzcPLhjhb+yh1iBkfoEEoUoWKRYbW3mh1JdKThU3lTJxDegiaBKtaJpo6WzljXj7cWfWXd7paB0zbKVYY4s/ohfkjEgRyZxNvil5VI/oAeZBT1D+wtmUCAKYoS9PamffiSLe1ZV3JIZVpH9kmWeSZrWZBRx/DTWXnD9vvhWncyUuKSOHZIFVmnrI6bYYPzp2Od9Sgobm1nizxXkljfmRiZhtsmlJmIjueQhnn9JVSmGZvHWq1FwsakPpWhoaKKGVv6RKF5BC6nfmolFuyqio/8SW5Zfm7fRgeLOwStSg07Qao4GqdKrZ5lOZ9mZoahRKut6esVSl6J/Zspars3Q6+pxjtI5mrJJDVipchQlCRaxvFmrobo5t2Romeb/ySSyRodqXpbnrCpavZFTOKqW/xjULE4b10ovwat2IpbCy2VJr7DoWX4xxxhpvzHHHHn8Mcsgij0wyAwUAADs=', '2024-12-11 16:02:50'),
('22212', 'test', 'test', 'test', 'test', 'test', '21', 'test_user@headadmin.ph', 'data:image/gif;base64,R0lGODdhagBqAIAAAAAAAP///ywAAAAAagBqAAAC/4yPqcvtD6OctNqLs968+w+G4kiW5omm6sqiwAvHMTQHL1LfiS7LCt8LUoLCRw6Agxl0ySURuYM+fRPmAoiFNhtWZ7J7sIK3knFYqrSlyVft+etmm71V9JGOVztrezt6K+aWBTTkR6j3ltgD15d36Gj4V9f3eHa4aEk1x5U2KFkWmdeIiEnZGRdxp6YKakoXWEhkiilLqonq4PkqiMtZO+V5eVuYG7npGjU627t5nMy5TEMFuLY6/czgDDe1223rLQwuCVwtTS6O/q0evk7ey8H3fAQGq1jU0maWpZwIGV3Cylq2W+5O7XJGq1wqg5kGzis4zo+5U9rkKRQWrxYyfv8JIdVrJdDiRmsZr5VUFejjwlLqGNmjFm/iQ5Uyq1Xi+MlWTCNFWFbcFhFovUr67kELqaEjon/pRGXa+UNiBo0kFTotOpMiM6M/q6a8xsYpsl9WvfLCsK/qwGXBzh71FhWtVJYwe3J9t7QltpVui0blpvMJzrpQeQ7d+ldwYLIq28IziYoe2IZqX7brCqpk3CiFs1IThzkfw6yMIzYejdpfHZRaAbM+jTFo3tCbr2odJZnfSLZ45YYN+dC27spCy4LMPZsXXbMuh8MlvlB48uKJTypHnLzw2jbSmD6VfZhd7ejceXofK/tg+r0geYunfA749YKPi7NO7H7ufHdJb1v/hJ2TakD99lUsUtUlB0MJVudWgl25pt9hn03HGXih5FXTawfq9Z5k7OiCIXk7+cVhZDbhdRNSU20oVjsEnliMbbT5ApFmi/EHnzEX9WZYjTDeGB9uOiJXX44xVrZcWwkpVaSQRy65Y36OhVhMeH3t6GFqk5RngY1eYmnifVuOR0w/5RGl2HhBVkgkeS02ZRaJ+TkU5WqmXUiYXVZqeKSB6u0GJEFXKqUdlXYGR2Fz0FEl5m9yQSkgZSMxqqWjHTC5l5xcSuoidP0FtOCmZKr44WSZmQjnYOzFWWebfoqkl6ovAjahpVW2dqeinn0n45WP7ZoWTiCih59lvsmnmoT2/zTDYoW1ilhpickaF9itzx4LKqdUPefkfw2u2G2x58WKrLe20jjidUKm9ZVPk71nYLouIRoQrZ52Wua6G1onpYUMFtqefMGSiitZ3LLKAp/4GpmdUdKJoDC85bb7LqqHKkbafrHRdOZ68WJcsMZ3cryZxAGrGWZZbbqraKQnZ5qyph79OBzJ5iEp8q01bqckj93hTB26EPE8pM83EwqmrKK5jPO2Rw+jor7n1htz0WViOu9+oy6H8ox5tki1vGzyWOAGzP4ZtbOGqpdkgBWcXW3aWT+ZprEX0LdoTnAPTGejF5em7JuXkW2X4Pgcjnjiii/OeOOOPw555JJPTnnllAIXAAA7', '2024-12-11 15:55:02'),
('test', 'test', 'test', 'test', '', 'st', '21', 'test_user@badac.ph', 'data:image/gif;base64,R0lGODdhYgBiAIAAAAAAAP///ywAAAAAYgBiAAAC/4yPqcvtD6OctNqLs968+w+G4kiW5omm6goB7gvDjOvEsSEnNn3sO+WzzQC1IO6l8CGCtwlveGQepz1klafUERvPSDe5ZWLD22g5kMsuz2AgOc1GN78LtXxNHcPd5jF4/2DX5XcnByihZ0WYR0bFaMZImLjo9abYWPVYqAnYaUnZ8okZaQWZeZqzNijqWNk3Wih0dbZqqkrLuunKJbqaqkUnpVXEx/vqWwocJ4xn7CQmiRnNKV19/PMMTb0da91NyjwiGGernMgSKtt6OwRHByKs/j3fju3u/R5oZJg8rftn75K/fB6y5JOHsBe2ZiIMkuOHrBbEfQwrSZwkMFmbWf+kynnMhgtcRoK6PJ1TpuFkuV8sF9axxK4bSSj8Yq7s53Jjy2gzX3bkJeukylM05RUbCtBktWAPRRYMSRQVrkMoZbrsGaoi01ZBHypNeHTOpVfroiZt+m8DRlNr05a9RRJrhZ52br6d15Wtxl1FjNaUWjSX0L1Zfb6EthXwxJYfEXl9jHgZVIyM/2JAOrGZv7L3tFmeC9PcZG+cR4ppDDTgr3qdR+vdeLevasKi21IDVRJtYK45LYb+GPH3Lkp1fd9MTPZz4YGh85r9i5s17d14m4ut+Nrt4SaONcPCbTs3766YiSm+KDk57/Fiy+tjb97hvWvHYYW1aVh+Rvqfqd7/T/2TSJVdQ5Vc3skWoFVgzeIQdvowFRdisCmIj0JuQIhWZBO2xZxfhcUmFXHXndced9qZB+JPwa1HIX8pgqZeVd0p91x0auUCUFgHpXfie1HtiB9q1CllgUR3IZPjMyoKN6OR0I1FT1XuJVnkd1NZp0mSU8oIkicXWtdgZlG+CBeUBj5JmZkjIjccTnoN5qSXDF55mXBwgglVditydMGeNJUWI4po5smXmH+mFZ6g8z0X35WtkScZpGmG06SjpkF6FoeRTddBnEu5mZ+Jb+qWgadOMdqilJxmGtCSQoq3GGk9ShfmYK+i55yTMx7qIJGGlUllnxk+piWTNYpKo45qdxJIG4ZLhlllcjxRNIyqozoXrZjM3VZiPcDZ16ac28aK2qIHwqgtjtUh+aRWV61aba4mThtTgZayu2uoR9JpVZC56VqoTuDC1y+f7gKczmmxerbhfusO7Fs8m672o8P0zopOxhpvzHHHHn8Mcsgij0xyySaf3EABADs=', '2024-12-11 08:52:11'),
('test1', 'test', 'test', 'test', 'test', 'test', '21', 'test_user@badac.ph', 'data:image/gif;base64,R0lGODdhYgBiAIAAAAAAAP///ywAAAAAYgBiAAAC/4yPqcvtD6OctNqLs968+w+G4kiW5omm6goB7gvDRgzMdUO7tp7wNpLLUYK03euHEwZkvRvSSHRGfAsqj2k9LrVZx1WqoLbATeANK0V/zd4zmT35opHRsJuuNK+387i7L5d3sBfIpHfHx/WWBIUolgiY9qdlZNf4NDVJSBaEB1c0SBl6uTWk6Yh42PkQFdknUYiK2Qja1or6mtlmZzjq29vlO1vmt9vUixkIlyxpDHsrWyq96TkdDb3IgF1Nbc19fbpq8qi2CHzK8sw7qS0aOy7YbasIqhyalTtW6y09H7uJT1K+TI8q9auCK9U9bO5EPSuYaNgndgdpQTtkatnBPf+Wkux76LBCMGYSKx6LYeGjyGYbzVHcZw8kh2AjiZWjGXLeTHT8/ikEiDIiK0FjSHVbhdOiQX85h9bEWU/RuqNBSZl6yhKp1JNUzyFzSo8opIQ6haoURzDs2aAxEdpbq5Jp3KEd37K9C/QqkZScyI41uvWrzIUwA7/Ey3KiB6/xDBuMWrMahjrCxnLkqgRiZJP6GqvaOjWzS40lO2stKVjo53IaIZoWjbrpV8rnSOsiNlGz7Kr8MC4sjbBjbpe6a5tkDLwdSUY9E3tE/I3vcuXNbYe2K3nl2mHG2w5nrVo77+xLm+tWarYpdaqPG9otTlxhxurW2oJPjR/0St++8x7/F8iba7gV89tJ31zGTGHqbHCfWg4OZ5E8f2XQoE9W1ReOY4Rl8xxkffHHGYauAJicW6KRQ2Jl3xkWUImDlYiWgO/JFyJfm13nXF1hccdhOzNeBpd6NmXVY1rt5RKkgIr9UmRZ7zyX3S062tekgSJyGMlq42FYnpLMJUjkdBOiBWOVwrWUVEufoWfdgAsChaKFBY7Yn5BFmRfSTe4d1uWOHcSY45z64XGeoJN5pqKgCHIZnKHipSmmhPBJOaFekKrJpJhaapXaTh6CCeGV65QHAqc/NdTehUeaaVljAyF52GmMWrrXhjwCGStssxJIXZ2rXiohqLw26mt63YX5H4h3dEbVmq5ntrhhlgQyW5msz6YYYTRv3gVYnUmKleoFT46bIpmt5rfotiNCG2WR2yWqLot7LlnmbIEuuB44U4IbLU9enqljdEOaq2W3j9YakIwI51kreWnRBqDCpuJ4aToWX4xxxhpvzHHHHn8Mcsgij0yyBAUAADs=', '2024-12-11 09:06:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
