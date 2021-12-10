--
-- WireGuard 设备
--
CREATE TABLE IF NOT EXISTS `wireguard_device` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户 ID',
  `public_key` varchar(64) NOT NULL COMMENT '用户公钥',
  `hex_addr` varchar(64) NOT NULL COMMENT '设备地址',
  `device_name` varchar(64) NOT NULL COMMENT '设备名称',
  `last_handshake` datetime DEFAULT '1989-06-04 00:05:00' COMMENT '最后一次握手的时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `wireguard_device_ibfk_uid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='WireGuard 设备';
