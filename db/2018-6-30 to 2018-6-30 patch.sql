------------------------------------------
-- 2018-6-22号版本 升级到2018-6-30 SQL脚本
--cmchen 2018年6月30日
------------------------------------------
ALTER TABLE `sys_department` ADD COLUMN `longnumber`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '长编码，后台自动生成，用于描述层级关系' AFTER `code`;

ALTER TABLE `sys_department` MODIFY COLUMN `LEAF`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '叶子节点(0:树枝节点;1:叶子节点)' AFTER `enable`;

ALTER TABLE `sys_department` ADD COLUMN `desc`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' AFTER `LEAF`;

ALTER TABLE `sys_department` DROP COLUMN `REMARK`;

ALTER TABLE `sys_user` MODIFY COLUMN `avatar`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/images/guest.jpg' COMMENT '用户头像' AFTER `status`;