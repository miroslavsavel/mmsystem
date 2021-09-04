CREATE TABLE `roles` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(255) NOT NULL,
 `description` text NOT NULL,
  PRIMARY KEY (`id`)
)

CREATE TABLE `users`(
    `id` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `role_id` INT(11) DEFAULT NULL,
    `username` VARCHAR(255) UNIQUE NOT NULL,
    `email` VARCHAR(255) UNIQUE NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `profile_picture` VARCHAR(255) DEFAULT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT `users_ibfk_1` FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`) ON DELETE SET NULL ON UPDATE NO ACTION
)



INSERT INTO `roles`(`id`, `name`, `description`) 
VALUES  (1, 'Admin', 'Has authority of users and roles and permissions.' ), 
		(2, 'Author', 'Has full authority of own posts'), 
		(3, 'Editor', 'Has full authority over all posts')

