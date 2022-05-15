USE `database`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_baari', 'Baari', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_baari', 'Baari', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_baari', 'Baari', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('baari', 'Baari')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('baari',0,'recrue','Harjottelija',12,'{}','{}'),
	('baari',1,'novice','Aloittelija',24,'{}','{}'),
	('baari',2,'experimente','Kokenut',36,'{}','{}'),
	('baari',3,'chief','Johtaja',48,'{}','{}'),
	('baari',4,'boss','Pomo',0,'{}','{}')
;