-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2019-12-20 04:58:56
-- 伺服器版本： 10.3.16-MariaDB
-- PHP 版本： 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `bklaravel`
--

-- --------------------------------------------------------

--
-- 資料表結構 `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, 'database', 'default', '{\"displayName\":\"App\\\\Jobs\\\\SendRegisterMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendRegisterMail\",\"command\":\"O:25:\\\"App\\\\Jobs\\\\SendRegisterMail\\\":11:{s:13:\\\"\\u0000*\\u0000activasion\\\";s:32:\\\"d4a6226926fdb9a276f2bc6a2be0459e\\\";s:10:\\\"\\u0000*\\u0000request\\\";N;s:7:\\\"\\u0000*\\u0000user\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Call to a member function sendRegisterNotification() on null in D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\app\\Jobs\\SendRegisterMail.php:42\nStack trace:\n#0 [internal function]: App\\Jobs\\SendRegisterMail->handle()\n#1 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(32): call_user_func_array(Array, Array)\n#2 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(520): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(90): value(Object(Closure))\n#4 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(591): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#7 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(130): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendRegisterMail))\n#8 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendRegisterMail))\n#9 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(83): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendRegisterMail), false)\n#11 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(130): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendRegisterMail))\n#12 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendRegisterMail))\n#13 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(85): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(59): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendRegisterMail))\n#15 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(88): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(348): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(294): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(129): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(32): call_user_func_array(Array, Array)\n#23 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(520): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#24 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(90): value(Object(Closure))\n#25 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#26 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(591): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#27 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(202): Illuminate\\Container\\Container->call(Array)\n#28 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\symfony\\console\\Command\\Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(189): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#30 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\symfony\\console\\Application.php(934): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\symfony\\console\\Application.php(273): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\symfony\\console\\Application.php(149): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(90): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(131): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 {main}', '2019-11-07 03:23:08'),
(2, 'database', 'default', '{\"displayName\":\"App\\\\Jobs\\\\SendRegisterMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendRegisterMail\",\"command\":\"O:25:\\\"App\\\\Jobs\\\\SendRegisterMail\\\":11:{s:13:\\\"\\u0000*\\u0000activasion\\\";s:32:\\\"628e3e343280a1f08943ee57ef062570\\\";s:10:\\\"\\u0000*\\u0000request\\\";N;s:7:\\\"\\u0000*\\u0000user\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Call to a member function sendRegisterNotification() on null in D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\app\\Jobs\\SendRegisterMail.php:42\nStack trace:\n#0 [internal function]: App\\Jobs\\SendRegisterMail->handle()\n#1 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(32): call_user_func_array(Array, Array)\n#2 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(520): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(90): value(Object(Closure))\n#4 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(591): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#7 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(130): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendRegisterMail))\n#8 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendRegisterMail))\n#9 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(83): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendRegisterMail), false)\n#11 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(130): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendRegisterMail))\n#12 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendRegisterMail))\n#13 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(85): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(59): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendRegisterMail))\n#15 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(88): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(348): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(294): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(129): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(32): call_user_func_array(Array, Array)\n#23 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(520): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#24 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(90): value(Object(Closure))\n#25 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#26 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(591): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#27 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(202): Illuminate\\Container\\Container->call(Array)\n#28 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\symfony\\console\\Command\\Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(189): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#30 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\symfony\\console\\Application.php(934): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\symfony\\console\\Application.php(273): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\symfony\\console\\Application.php(149): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(90): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(131): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 {main}', '2019-11-07 03:23:08'),
(3, 'database', 'default', '{\"displayName\":\"App\\\\Jobs\\\\SendRegisterMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendRegisterMail\",\"command\":\"O:25:\\\"App\\\\Jobs\\\\SendRegisterMail\\\":10:{s:8:\\\"\\u0000*\\u0000email\\\";s:21:\\\"bokai830124@gmail.com\\\";s:13:\\\"\\u0000*\\u0000activasion\\\";s:32:\\\"5b9c841746e4ca47a435e6b8cab8eebe\\\";s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Call to undefined function App\\Jobs\\first() in D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\app\\Jobs\\SendRegisterMail.php:41\nStack trace:\n#0 [internal function]: App\\Jobs\\SendRegisterMail->handle()\n#1 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(32): call_user_func_array(Array, Array)\n#2 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(520): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(90): value(Object(Closure))\n#4 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(591): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#7 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(130): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendRegisterMail))\n#8 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendRegisterMail))\n#9 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(83): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendRegisterMail), false)\n#11 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(130): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendRegisterMail))\n#12 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendRegisterMail))\n#13 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(85): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(59): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendRegisterMail))\n#15 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(88): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(348): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(294): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(129): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(32): call_user_func_array(Array, Array)\n#23 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(520): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#24 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(90): value(Object(Closure))\n#25 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#26 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(591): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#27 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(202): Illuminate\\Container\\Container->call(Array)\n#28 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\symfony\\console\\Command\\Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(189): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#30 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\symfony\\console\\Application.php(934): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\symfony\\console\\Application.php(273): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\symfony\\console\\Application.php(149): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(90): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(131): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 {main}', '2019-11-07 03:34:38');

-- --------------------------------------------------------

--
-- 資料表結構 `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_path` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish` int(11) NOT NULL,
  `index` int(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `images`
--

INSERT INTO `images` (`id`, `image_path`, `publish`, `index`, `created_at`, `updated_at`) VALUES
(42, 'D:\\bokai\\xampp\\htdocs\\php\\bkLaravel\\public\\img\\198DBE15-6CD4-4B19-AFFA-99534C4B87F2.jpeg', 1, NULL, '2019-09-26 06:48:16', '2019-09-26 06:48:16'),
(43, 'D:\\bokai\\xampp\\htdocs\\php\\bkLaravel\\public\\img\\32C3B735-C85E-4A71-BC4D-6C9CB779D727.jpeg', 0, 0, '2019-09-26 06:48:27', '2019-11-12 06:41:49'),
(44, 'D:\\bokai\\xampp\\htdocs\\php\\bkLaravel\\public\\img\\95C5E4C0-361E-4113-9A8D-7E386B84DB63.jpeg', 0, 0, '2019-09-26 06:49:04', '2019-11-11 19:14:17'),
(49, 'D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\public\\img\\500x499x2_5.jpg.pagespeed.ic.AZSU-r27td.jpg', 0, 1, '2019-10-28 07:22:41', '2019-11-11 19:14:07'),
(50, 'D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\public\\img\\54911.jpg', 1, 0, '2019-10-28 07:57:23', '2019-10-29 03:30:24'),
(51, 'D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\public\\img\\3437613_784054b8ab4ea1964e69baecdca43583.jpg', 1, NULL, '2019-10-28 07:59:01', '2019-10-28 07:59:01'),
(52, 'D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\public\\img\\11219578_1071179139567637_4411838931098917769_n.jpg', 1, 0, '2019-10-28 08:01:25', '2019-10-29 03:26:06'),
(53, 'D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\public\\img\\紫爆.jpg', 1, 0, '2019-10-28 09:08:38', '2019-11-11 19:14:06'),
(56, 'D:\\bokai\\xampp\\htdocs\\php\\bkLaravel5.7\\public\\img\\img014.jpg', 1, NULL, '2019-11-11 19:00:32', '2019-11-11 19:00:32'),
(57, 'D:\\bokai\\xampp\\htdocs\\php\\bkLaravel5.6\\public\\img\\14dec-1920x1200.jpg', 1, NULL, '2019-11-11 22:28:08', '2019-11-11 22:28:08'),
(58, 'D:\\bokai\\xampp\\htdocs\\php\\bkLaravel_2\\public\\img\\thJV5ARIDI.jpg', 1, NULL, '2019-12-11 06:51:39', '2019-12-11 06:51:39');

-- --------------------------------------------------------

--
-- 資料表結構 `index_photo`
--

CREATE TABLE `index_photo` (
  `id` int(11) NOT NULL COMMENT 'id',
  `title` varchar(100) NOT NULL COMMENT '照片title',
  `photo_path` text NOT NULL COMMENT '照片路徑',
  `username` varchar(100) NOT NULL COMMENT 'po文者名稱',
  `userid` int(11) NOT NULL COMMENT 'po文者id',
  `content_one` text NOT NULL COMMENT '照片第一段內文',
  `content_two` text NOT NULL COMMENT '照片第二段內文',
  `created_at` datetime NOT NULL COMMENT '上傳時間',
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `index_photo`
--

INSERT INTO `index_photo` (`id`, `title`, `photo_path`, `username`, `userid`, `content_one`, `content_two`, `created_at`, `updated_at`) VALUES
(1, '去夏威夷玩時的照片', 'C:\\xampp\\htdocs\\php\\bkLaravel\\public\\img\\圖片1.jpg', 'Bokai', 1, '大學以及研究所就讀大氣科學系，除了簡單的天氣分析以及預報外，也同時 學到許多在於研究以及應用上的知識與技巧，如：空氣汙染概論、大氣動力學、天氣學、數值天氣預報、大氣測計學等。', '大學期間擔任過校內氣象台的主播，加強對於天氣預報及天氣分析的訓練，不只要將未來的天氣概況做個簡單的預報，並要練習上台講話的台風。研究所期間與實驗室同仁一同參與過許多大大小小的實驗計畫，如西南氣流實驗及雙北暴雨實驗，這些經驗令我體會團隊合作以及團隊討論是進步最快的捷徑。', '2019-08-09 04:14:25', '2019-11-11 22:43:07');

-- --------------------------------------------------------

--
-- 資料表結構 `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `body`, `created_at`, `updated_at`, `published_at`) VALUES
(8, 30, 'testtest', '2019-10-03 15:18:46', '2019-10-05 05:58:07', NULL),
(23, 30, 'dasd\nasdas\ndad', '2019-10-05 07:30:17', '2019-10-05 07:48:55', NULL),
(24, 30, 'asdasdassd', '2019-11-11 19:16:57', '2019-11-11 19:16:57', NULL),
(25, 30, 'weqeq', '2019-11-11 22:28:55', '2019-11-11 22:28:55', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `message_reply`
--

CREATE TABLE `message_reply` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message_id` bigint(20) UNSIGNED NOT NULL,
  `reply_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `message_reply`
--

INSERT INTO `message_reply` (`id`, `message_id`, `reply_id`, `created_at`, `updated_at`) VALUES
(35, 8, 39, '2019-10-03 15:19:03', '2019-10-03 15:19:03'),
(36, 8, 40, '2019-10-03 15:19:07', '2019-10-03 15:19:07'),
(37, 8, 41, '2019-10-03 15:19:10', '2019-10-03 15:19:10'),
(39, 23, 43, '2019-10-05 08:08:54', '2019-10-05 08:08:54'),
(40, 23, 44, '2019-10-05 08:12:02', '2019-10-05 08:12:02'),
(42, 23, 46, '2019-11-11 19:16:44', '2019-11-11 19:16:44'),
(43, 23, 47, '2019-11-11 19:16:50', '2019-11-11 19:16:50'),
(44, 24, 48, '2019-11-11 19:17:02', '2019-11-11 19:17:02'),
(48, 8, 52, '2019-12-19 06:18:57', '2019-12-19 06:18:57'),
(49, 24, 53, '2019-12-19 06:21:30', '2019-12-19 06:21:30');

-- --------------------------------------------------------

--
-- 資料表結構 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_09_14_055835_create_images_table', 1),
(5, '2019_09_28_213609_create_messages_table', 2),
(6, '2019_09_30_175133_create_replies_table', 3),
(7, '2019_09_30_175523_create_message_reply_table', 4),
(8, '2019_11_06_153738_create_jobs_table', 5);

-- --------------------------------------------------------

--
-- 資料表結構 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('bokai830124@gmail.com', '$2y$10$qt0xlLDBYTOE5L.PWSBg0eof6NH19N5z5tjK.bmurldNdG5PWk6j2', '2019-09-22 07:01:10');

-- --------------------------------------------------------

--
-- 資料表結構 `replies`
--

CREATE TABLE `replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `replies`
--

INSERT INTO `replies` (`id`, `user_id`, `body`, `created_at`, `updated_at`) VALUES
(39, 30, 'tesdt\ndasd\nasdas', '2019-10-03 15:19:03', '2019-10-05 07:53:46'),
(40, 30, 'dwqdq', '2019-10-03 15:19:07', '2019-10-03 15:19:07'),
(41, 30, 'wdqd', '2019-10-03 15:19:10', '2019-10-03 15:19:10'),
(43, 30, '你好可以\n跟你出去\n玩科科', '2019-10-05 08:08:54', '2019-10-05 08:38:55'),
(44, 30, '嗨\n你好\n我在這', '2019-10-05 08:12:02', '2019-10-05 08:12:17'),
(46, 30, 'wdqwdq', '2019-11-11 19:16:44', '2019-11-11 19:16:44'),
(47, 30, 'sadasd', '2019-11-11 19:16:50', '2019-11-11 19:16:50'),
(48, 30, 'asdasd', '2019-11-11 19:17:02', '2019-11-11 19:17:02'),
(52, 30, 'ttt', '2019-12-19 06:18:56', '2019-12-19 06:18:56'),
(53, 30, 'ttt', '2019-12-19 06:21:30', '2019-12-19 06:21:30');

-- --------------------------------------------------------

--
-- 資料表結構 `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL COMMENT 'id',
  `content` text NOT NULL COMMENT '學生時期自傳',
  `modify_date` datetime DEFAULT NULL COMMENT '修改時間',
  `created_at` datetime NOT NULL COMMENT '上傳時間',
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `student`
--

INSERT INTO `student` (`id`, `content`, `modify_date`, `created_at`, `updated_at`) VALUES
(1, '研究所期間，除了參加實驗計劃，同時也要資料的處理及分析，因此需要學習程式語言，系上的關系，我們需要在Linux系統下使用shell script、Fortran及GRADS等語言去處理資料及繪圖，在處理資料的過程中，我發現我對於程式語言充滿了興趣，喜歡專研程式技術勝過於學術上的學習。', NULL, '2019-08-09 05:14:15', '2019-10-18 03:57:33');

-- --------------------------------------------------------

--
-- 資料表結構 `student_skills`
--

CREATE TABLE `student_skills` (
  `id` int(11) NOT NULL COMMENT 'id',
  `skill_name` varchar(100) NOT NULL COMMENT 'skill_name',
  `created_at` datetime NOT NULL COMMENT '上傳時間',
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `student_skills`
--

INSERT INTO `student_skills` (`id`, `skill_name`, `created_at`, `updated_at`) VALUES
(2, 'Fortran', '2019-08-09 03:10:00', NULL),
(3, 'GRADS', '2019-08-09 05:13:13', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_token` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `active`, `remember_token`, `reset_token`, `level`, `created_at`, `updated_at`) VALUES
(1, '', 'admin', '', '$2y$10$ANv/TnPhzaqOwey.frx0NOBmucwDWfp9yhrMk05.kWUGCDYzG8X4G', '0', NULL, NULL, 0, NULL, NULL),
(30, 'bokai', 'bokai', 'bokai830124@gmail.com.test2', '$2y$10$E5ehMG.x8XPYQ2Kq5o3KGOYx8UkgpAtn/dZzZ2p.WzbsqoUnQms/q', 'active', '4VEXtRPhCG3YHjCZs2g0fy53nPWRECpJmi86h4zQT84JCpwgaf0XN1BFNfAS', NULL, 3, '2019-10-03 14:45:41', '2019-10-03 14:45:58'),
(56, 'bokaibokai', 'bokaibokai', 'bokai830124@gmail.com.test', '$2y$10$yPqp5TjD5Xo.JhtIBlWd0e7iv6YMMkUC5t1uaPkEXb3AfNH3OJFTe', '41e9e3039c9d8d4a3d02598ddce1d4e6', NULL, '974e7f5e301d620e33edae430d8ce602', 3, '2019-11-07 03:36:35', '2019-11-11 19:22:13'),
(72, 'test', 'test', 'bokai830124@gmail.com', '$2y$10$S0MimDFSM6Cw91MovxU5h..ArZ1Nim0tq3MynIFmOXK/fc7BClSN.', 'active', 'IfOVZ8eaoWl2ow3WTbn81w33Qeh5M1H5S8ohoSCNTJy2fveNGhECkdM01XRk', 'have reseted', 3, '2019-11-11 22:31:07', '2019-11-11 22:35:40');

-- --------------------------------------------------------

--
-- 資料表結構 `worker`
--

CREATE TABLE `worker` (
  `id` int(11) NOT NULL COMMENT 'id',
  `content` text NOT NULL COMMENT '自傳',
  `modify_date` datetime DEFAULT NULL COMMENT '修改時間',
  `created_at` datetime NOT NULL COMMENT '上傳時間',
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `worker`
--

INSERT INTO `worker` (`id`, `content`, `modify_date`, `created_at`, `updated_at`) VALUES
(1, '退伍出社會後，也順利的進入到現在公司(景丰科技)， 在公司內主要是在Linux系統下建置Weather Research and Forecasting model(WRF model)， 並利用學校所學，處理氣象及WRF model資料，在工作期間我對於程式語言的熱情不減反增， 因此開始自學HTML、CSS、Javascript、Jquery、PHP，並同時使用這些工具開始練習寫一些網站。', NULL, '2019-08-09 03:08:12', '2019-10-18 03:57:33');

-- --------------------------------------------------------

--
-- 資料表結構 `work_skills`
--

CREATE TABLE `work_skills` (
  `id` int(11) NOT NULL COMMENT 'id',
  `skill_name` varchar(100) NOT NULL COMMENT '技能名稱',
  `created_at` datetime NOT NULL COMMENT '上傳日期',
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `work_skills`
--

INSERT INTO `work_skills` (`id`, `skill_name`, `created_at`, `updated_at`) VALUES
(1, 'HTML', '2019-08-09 03:09:12', NULL),
(2, 'CSS', '2019-08-09 04:13:11', NULL),
(3, 'Javascript', '2019-08-09 04:10:12', NULL),
(4, 'Jquery', '2019-08-09 03:06:11', NULL);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `index_photo`
--
ALTER TABLE `index_photo`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- 資料表索引 `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_user_id_foreign` (`user_id`);

--
-- 資料表索引 `message_reply`
--
ALTER TABLE `message_reply`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- 資料表索引 `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `student_skills`
--
ALTER TABLE `student_skills`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `worker`
--
ALTER TABLE `worker`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `work_skills`
--
ALTER TABLE `work_skills`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `index_photo`
--
ALTER TABLE `index_photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `message_reply`
--
ALTER TABLE `message_reply`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `replies`
--
ALTER TABLE `replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `student_skills`
--
ALTER TABLE `student_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=66;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `worker`
--
ALTER TABLE `worker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `work_skills`
--
ALTER TABLE `work_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=13;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
