CREATE TABLE `woro_kity` (
  `id` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `woro_kity`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `woro_kity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

