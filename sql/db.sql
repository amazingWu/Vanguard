CREATE TABLE `vanguard`.`author` (
  `author_name` VARCHAR(10) NOT NULL,
  `author_password` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`author_name`),
  UNIQUE INDEX `author_name_UNIQUE` (`author_name` ASC));
  


CREATE TABLE `vanguard`.`example` (
  `example_id` INT NOT NULL AUTO_INCREMENT,
  `example_name` VARCHAR(20) NOT NULL COMMENT '案例标题',
  `example_about` VARCHAR(50) NOT NULL COMMENT '案例简介',
  `example_content` TEXT NOT NULL COMMENT '案例正文',
  `example_time` DATETIME NOT NULL,
  `example_author` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`example_id`));
  
  ALTER TABLE `vanguard`.`example` 
ADD COLUMN `example_header` INT NULL DEFAULT 0 COMMENT '是否在首页的滚动头显示' AFTER `example_author`,
ADD COLUMN `example_index` INT NULL DEFAULT 0 COMMENT '是否在首页（首页的下面部分）展示' AFTER `example_header`;

ALTER TABLE `vanguard`.`example` 
ADD COLUMN `example_photo` VARCHAR(100) NOT NULL COMMENT '照片预览' AFTER `example_index`;


CREATE TABLE `vanguard`.`comment` (
  `comment_id` INT NOT NULL,
  `comment_name` VARCHAR(15) NOT NULL,
  `comment_email` VARCHAR(25) NULL,
  `comment_phone` VARCHAR(20) NULL,
  `comment_content` VARCHAR(300) NOT NULL,
  `example_id` INT NOT NULL,
  PRIMARY KEY (`comment_id`),
  INDEX `example_id_idx` (`example_id` ASC),
  CONSTRAINT `example_id`
    FOREIGN KEY (`example_id`)
    REFERENCES `vanguard`.`example` (`example_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = '案例评论';

ALTER TABLE `vanguard`.`comment` 
DROP FOREIGN KEY `example_id`;
ALTER TABLE `vanguard`.`comment` 
ADD CONSTRAINT `example_id`
  FOREIGN KEY (`example_id`)
  REFERENCES `vanguard`.`example` (`example_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `vanguard`.`comment` 
CHANGE COLUMN `comment_id` `comment_id` INT(11) NOT NULL AUTO_INCREMENT ;


CREATE TABLE `vanguard`.`company` (
  `index_about` TEXT NOT NULL COMMENT '公司首页介绍',
  `content_about` TEXT NOT NULL COMMENT '公司正文介绍')
COMMENT = '公司简介';

ALTER TABLE `vanguard`.`company` 
ADD COLUMN `id` INT NOT NULL AUTO_INCREMENT AFTER `content_about`,
ADD PRIMARY KEY (`id`);

ALTER TABLE `vanguard`.`company` 
ADD COLUMN `used` INT(1) NOT NULL DEFAULT 0 COMMENT '是否启用' AFTER `id`;

ALTER TABLE `vanguard`.`company` 
ADD COLUMN `comment` VARCHAR(45) NULL AFTER `used`;

ALTER TABLE `vanguard`.`company` 
ADD COLUMN `foot_about` TEXT NOT NULL AFTER `comment`;


CREATE TABLE `vanguard`.`wisdom` (
  `wisdom_id` INT NOT NULL AUTO_INCREMENT,
  `wisdom_name` VARCHAR(45) NOT NULL COMMENT '名人名字',
  `wisdom_content` VARCHAR(100) NULL COMMENT '名言内容',
  PRIMARY KEY (`wisdom_id`))
COMMENT = '名人语录';
ALTER TABLE `vanguard`.`wisdom` 
ADD COLUMN `wisdom_photo` VARCHAR(100) NOT NULL AFTER `wisdom_content`;

