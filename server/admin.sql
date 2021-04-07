-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2021-04-07 06:28:02
-- 服务器版本： 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin`
--

-- --------------------------------------------------------

--
-- 表的结构 `menus`
--

CREATE TABLE `menus` (
  `menu_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL COMMENT '上级ID',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `type` char(1) NOT NULL COMMENT '类型',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `name` varchar(255) DEFAULT NULL COMMENT '路由名称',
  `component` varchar(255) DEFAULT NULL COMMENT '路由组件',
  `path` varchar(255) DEFAULT NULL COMMENT '路由地址',
  `redirect` varchar(255) DEFAULT NULL COMMENT '跳转地址',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限标识',
  `hidden` tinyint(1) DEFAULT NULL COMMENT '隐藏',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `menus`
--

INSERT INTO `menus` (`menu_id`, `parent_id`, `title`, `sort`, `type`, `icon`, `name`, `component`, `path`, `redirect`, `permission`, `hidden`, `update_time`, `create_time`) VALUES
(7, 0, '系统管理', 0, 'M', 'component', 'System', 'Layout', '/system', '/system/user', NULL, 0, NULL, '2020-05-24 18:51:21'),
(8, 7, '菜单管理', 0, 'C', 'list', 'Menu', '/system/menu', '/system/menu', '', 'system:menu', 0, '2020-09-18 17:48:34', '2020-05-24 18:52:26'),
(9, 7, '角色管理', 0, 'C', 'peoples', 'Role', '/system/role', '/system/role', '', 'system:role', 0, '2020-09-18 17:48:31', '2020-05-24 18:53:31'),
(10, 7, '用户管理', 0, 'C', 'user', 'User', '/system/user', '/system/user', '', 'system:user', 0, '2020-09-18 17:46:55', '2020-05-24 18:54:26'),
(11, 7, '登录日志', 0, 'C', 'log', 'Log', '/system/log', '/system/log', '', 'system:log', 0, '2020-09-18 17:49:13', '2020-05-24 18:55:20'),
(12, 0, 'Demo', 0, 'M', 'example', 'Demo', 'Layout', '/demo', '/demo/demo-1/demo-1-1', NULL, 0, '2020-08-27 14:10:54', '2020-05-25 20:31:21'),
(13, 12, 'Demo-1', 0, 'M', 'example', 'Demo1', '/demo/demo-1', '/demo/demo-1', '/demo/demo-1/demo-1-1', NULL, 0, '2020-08-27 14:10:47', '2020-05-25 20:32:13'),
(14, 12, 'Demo-2', 0, 'M', 'example', 'Demo2', '/demo/demo-2', '/demo/demo-2', '/demo/demo-2/demo-2-1', NULL, 0, '2020-08-27 14:11:28', '2020-05-25 20:32:54'),
(15, 13, 'Demo-1-1', 0, 'C', 'example', 'Demo11', '/demo/demo-1/demo-1-1', '/demo/demo-1/demo-1-1', '', NULL, 0, '2020-05-25 20:33:47', '2020-05-25 20:33:29'),
(16, 14, 'Demo-2-1', 0, 'C', 'example', 'Demo21', '/demo/demo-2/demo-2-1', '/demo/demo-2/demo-2-1', '', NULL, 0, '2020-05-25 20:35:12', '2020-05-25 20:34:43'),
(18, 0, '测试', 0, 'M', 'table', 'Test', 'Layout', '/test', '/test/test-1', NULL, 0, '2020-08-27 14:05:33', '2020-08-27 13:59:34'),
(19, 18, '测试1', 0, 'C', 'table', 'Test1', '/test/test-1', '/test/test-1', '', NULL, 0, '2020-08-27 14:05:59', '2020-08-27 14:02:06'),
(20, 18, '测试2', 0, 'C', 'table', 'Test2', '/test/test-2', '/test/test-2', '', NULL, 0, '2020-08-27 14:06:09', '2020-08-27 14:03:55');

-- --------------------------------------------------------

--
-- 表的结构 `roles`
--

CREATE TABLE `roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `role_name` varchar(255) NOT NULL COMMENT '角色名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `menu_ids` text COMMENT '菜单ID',
  `buttons` text COMMENT '权限标识',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `remark`, `status`, `menu_ids`, `buttons`, `update_time`, `create_time`) VALUES
(1, '管理员', '', 1, '[10,9,12,13,15,14,16,7]', '[{"menu_id":10,"btns":["system:user:query","system:user:add"]},{"menu_id":8,"btns":[]},{"menu_id":9,"btns":["system:role:query","system:role:add"]},{"menu_id":11,"btns":[]}]', '2020-08-28 13:02:32', '2020-05-16 21:14:50'),
(3, '观察者', NULL, 1, '[12,13,15,14,16,18,19,20]', '[{"menu_id":10,"btns":[]},{"menu_id":8,"btns":[]},{"menu_id":11,"btns":[]},{"menu_id":9,"btns":[]},{"menu_id":19,"btns":[]},{"menu_id":20,"btns":[]}]', '2020-08-27 14:09:47', '2020-05-22 18:50:23'),
(4, '超级管理员', NULL, 1, '[7,10,8,9,11,17]', '[{"menu_id":8,"btns":["system:menu:query","system:menu:add","system:menu:edit","system:menu:del"]},{"menu_id":11,"btns":["system:log:query","system:log:add","system:log:edit","system:log:del"]},{"menu_id":9,"btns":["system:role:query","system:role:add","system:role:edit","system:role:del"]},{"menu_id":10,"btns":["system:user:query","system:user:add","system:user:edit","system:user:del"]}]', '2020-08-27 13:53:17', '2020-08-27 10:06:46');

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(255) NOT NULL COMMENT '帐号',
  `password` char(32) NOT NULL COMMENT '密码',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `password`, `status`, `update_time`, `create_time`) VALUES
(4, 'admin', '96e79218965eb72c92a549dd5a330112', 1, '2020-08-28 13:07:13', '2020-08-27 10:05:41'),
(5, 'root', '96e79218965eb72c92a549dd5a330112', 1, '2020-08-28 13:36:57', '2020-08-27 10:09:28'),
(6, 'visitor', '96e79218965eb72c92a549dd5a330112', 1, '2020-08-27 14:12:31', '2020-08-27 10:15:29'),
(7, '111111', '96e79218965eb72c92a549dd5a330112', 1, '2020-09-18 17:50:33', '2020-09-18 17:50:14');

-- --------------------------------------------------------

--
-- 表的结构 `users_roles`
--

CREATE TABLE `users_roles` (
  `user_role_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `users_roles`
--

INSERT INTO `users_roles` (`user_role_id`, `role_id`, `user_id`, `create_time`) VALUES
(15, 1, 4, '2020-08-27 10:05:41'),
(16, 4, 5, '2020-08-27 10:09:28'),
(17, 3, 6, '2020-08-27 10:15:29'),
(18, 1, 7, '2020-09-18 17:50:14'),
(19, 3, 7, '2020-09-18 17:50:14'),
(20, 4, 7, '2020-09-18 17:50:14');

-- --------------------------------------------------------

--
-- 表的结构 `user_logs`
--

CREATE TABLE `user_logs` (
  `user_log_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `ip` varchar(255) DEFAULT NULL COMMENT '登录IP',
  `ua` varchar(500) DEFAULT NULL COMMENT 'ua标识',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `user_logs`
--

INSERT INTO `user_logs` (`user_log_id`, `user_id`, `ip`, `ua`, `create_time`) VALUES
(96, 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-08-28 10:44:30'),
(97, 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-08-28 10:44:30'),
(98, 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-08-28 12:52:05'),
(99, 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-08-28 12:52:18'),
(100, 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-08-28 12:52:19'),
(101, 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-08-28 13:11:47'),
(102, 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-08-28 13:21:30'),
(103, 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-08-28 13:21:30'),
(104, 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-08-28 13:32:31'),
(105, 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-08-28 13:34:25'),
(106, 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-08-28 13:34:45'),
(107, 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-08-28 13:36:09'),
(108, 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-08-28 13:39:19'),
(109, 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-08-28 15:40:42'),
(110, 6, '::ffff:192.168.10.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-08-28 16:30:10'),
(111, 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-08-28 16:30:20'),
(112, 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-09-17 14:18:14'),
(113, 6, '::ffff:192.168.10.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-09-17 14:20:31'),
(114, 6, '::ffff:192.168.10.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-09-17 14:20:40'),
(115, 6, '::ffff:192.168.10.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-09-17 14:20:52'),
(116, 6, '::ffff:192.168.10.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-09-17 14:21:09'),
(117, 6, '::ffff:192.168.10.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-09-17 14:23:29'),
(118, 6, '::ffff:192.168.10.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-09-17 14:24:46'),
(119, 6, '::ffff:192.168.10.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-09-17 14:25:12'),
(120, 6, '::ffff:192.168.10.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-09-17 14:25:32'),
(121, 6, '::ffff:192.168.10.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-09-17 14:25:44'),
(122, 6, '::ffff:192.168.10.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-09-17 14:26:32'),
(123, 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-09-17 14:37:58'),
(124, 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-09-18 17:38:02'),
(125, 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-09-18 17:50:29'),
(126, 7, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-09-18 17:50:43'),
(127, 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-10-13 16:02:16'),
(128, 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-10-13 16:02:29'),
(129, 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2020-10-13 16:03:27'),
(130, 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-23 15:45:20'),
(131, 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-23 15:46:19'),
(132, 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-23 15:49:25'),
(133, 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-23 15:50:31'),
(134, 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-23 15:52:33'),
(135, 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-11-19 10:35:15'),
(136, 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-11-19 10:35:26'),
(137, 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-11-19 10:36:02'),
(138, 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-11-19 10:36:25'),
(139, 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '2020-11-23 13:41:32'),
(140, 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '2020-11-23 13:44:37'),
(141, 7, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '2020-11-23 14:31:17'),
(142, 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '2021-03-18 10:34:36'),
(143, 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '2021-03-18 10:34:54'),
(144, 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '2021-03-18 10:36:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`menu_id`) USING BTREE;

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`,`role_name`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`) USING BTREE;

--
-- Indexes for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`user_role_id`) USING BTREE;

--
-- Indexes for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`user_log_id`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `menus`
--
ALTER TABLE `menus`
  MODIFY `menu_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- 使用表AUTO_INCREMENT `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `users_roles`
--
ALTER TABLE `users_roles`
  MODIFY `user_role_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- 使用表AUTO_INCREMENT `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `user_log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
