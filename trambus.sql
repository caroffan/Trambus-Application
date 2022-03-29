CREATE DATABASE trambus DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE trambus;

CREATE TABLE user(
    user_id INT AUTO_INCREMENT NOT NULL,
    user_status ENUM('user','admin','dataScientist')DEFAULT 'user' NOT NULL, 
    user_nom VARCHAR(20) NOT NULL,
    user_prenom VARCHAR(20) NOT NULL,
    user_sexe VARCHAR(20) NOT NULL,
    user_email VARCHAR(50) NOT NULL,
    user_date DATE NOT NULL,
    user_pswd VARCHAR(33) NOT NULL,
    user_habit VARCHAR(50),
    user_freq VARCHAR(50),
    


    PRIMARY KEY(user_id)
)ENGINE = MariaDB;

CREATE TABLE eval(
    eval_id INT AUTO_INCREMENT NOT NULL,
    eval_ligne VARCHAR(4) NOT NULL,
    eval_note FLOAT,
    eval_comment TEXT,
    eval_alerte TEXT,
    

    user_id INT NOT NULL,
    PRIMARY KEY(eval_id)
)ENGINE = MariaDB;

CREATE TABLE contact(
    contact_id INT AUTO_INCREMENT NOT NULL,
    contact_job VARCHAR(30) NOT NULL, 
    contact_entreprise VARCHAR(50) NOT NULL,
    contact_motive TEXT NOT NULL,

    user_id INT NOT NULL,
    PRIMARY KEY(contact_id)
)ENGINE = MariaDB;

ALTER TABLE eval
ADD CONSTRAINT eval_user_id_FK FOREIGN KEY(user_id) REFERENCES user(user_id);

ALTER TABLE contact 
ADD CONSTRAINT contact_user_id_FK FOREIGN KEY(user_id) REFERENCES user(user_id);

INSERT INTO `trambus`.`user` (`user_id`, `user_status`, `user_nom`, `user_prenom`, `user_sexe`, `user_email`, `user_date`, `user_pswd`, `user_habit`, `user_freq`) 
VALUES (NULL, 'admin', 'admin', 'admin', 'homme', 'admin@contact.pgl', '2021-01-01', 'adminpwd', NULL, NULL)