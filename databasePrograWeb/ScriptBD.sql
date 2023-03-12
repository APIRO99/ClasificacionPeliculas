use movies;
-- MySqlBackup.NET 2.3.5
-- Dump Time: 2023-03-08 14:05:44
-- --------------------------------------
-- Server version 8.0.31 MySQL Community Server - GPL


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  release_date DATE NOT NULL,
  duration INTEGER NOT NULL,
  director VARCHAR(255) NOT NULL,
  actors TEXT NOT NULL,
  plot TEXT NOT NULL,
  rating DECIMAL(3,1) NOT NULL,
  votes INTEGER NOT NULL,
  poster_url VARCHAR(255) NOT NULL,
  imdb_id VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE categories (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE moviescategories (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  movie_id INTEGER NOT NULL,
  category_id INTEGER NOT NULL,
  FOREIGN KEY (movie_id) REFERENCES movies(id),
  FOREIGN KEY (category_id) REFERENCES categories(id)
);

INSERT INTO movies (title, release_date, duration, director, actors, plot, rating, votes, poster_url, imdb_id) VALUES ('The Matrix', '1999-03-31', 136, 'The Wachowski Brothers', 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', 8.7, 1641192, 'https://www.imdb.com/title/tt0133093/mediaviewer/rm2062304000/', 'tt0133093');
INSERT INTO movies (title, release_date, duration, director, actors, plot, rating, votes, poster_url, imdb_id) VALUES ('Forrest Gump', '1994-07-06', 142, 'Robert Zemeckis', 'Tom Hanks, Robin Wright, Gary Sinise, Sally Field', 'The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate and other historical events unfold through the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.', 8.8, 1888015, 'https://www.imdb.com/title/tt0109830/mediaviewer/rm695361536/', 'tt0109830');
INSERT INTO movies (title, release_date, duration, director, actors, plot, rating, votes, poster_url, imdb_id) VALUES ('The Social Network', '2010-10-01', 120, 'David Fincher', 'Jesse Eisenberg, Andrew Garfield, Justin Timberlake, Armie Hammer', 'As Harvard student Mark Zuckerberg creates the social networking site that would become known as Facebook, he is sued by the twins who claimed he stole their idea, and by the co-founder who was later squeezed out of the business.', 7.7, 650386, 'https://www.imdb.com/title/tt1285016/mediaviewer/rm3851806208/', 'tt1285016');

INSERT INTO categories (name) VALUES ('Action');
INSERT INTO categories (name) VALUES ('Comedy');
INSERT INTO categories (name) VALUES ('Drama');

INSERT INTO moviescategories (movie_id, category_id) VALUES (1, 1);
INSERT INTO moviescategories (movie_id, category_id) VALUES (2, 3);
INSERT INTO moviescategories (movie_id, category_id) VALUES (3, 3);
INSERT INTO moviescategories (movie_id, category_id) VALUES (3, 2);


-- 
-- Definition of city
-- 

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `geonameid` bigint NOT NULL,
  `geonameidRegion` bigint NOT NULL,
  `name` varchar(64) NOT NULL,
  `longitude` decimal(15,8) DEFAULT NULL,
  `latitude` decimal(15,8) DEFAULT NULL,
  `population` bigint DEFAULT NULL,
  `userlastmodified` varchar(32) NOT NULL,
  `timecreated` datetime NOT NULL,
  `timemodified` datetime DEFAULT NULL,
  PRIMARY KEY (`geonameid`),
  UNIQUE KEY `UK_GEONAMEID_GEONAMEIDREGION_W_CITY` (`geonameid`,`geonameidRegion`),
  KEY `FK_GEONAMEIDREGION_WCITY_W_REGION` (`geonameidRegion`),
  CONSTRAINT `FK_GEONAMEIDREGION_WCITY_W_REGION` FOREIGN KEY (`geonameidRegion`) REFERENCES `region` (`geonameid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=103;

-- 
-- Dumping data for table city
-- 

/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city`(`geonameid`,`geonameidRegion`,`name`,`longitude`,`latitude`,`population`,`userlastmodified`,`timecreated`,`timemodified`) VALUES
(3587506,3588668,'Zunilito',-91.51667,14.61667,2745,'administrator','2021-08-23 21:45:37',NULL),
(3587510,3590978,'Zunil',-91.48333,14.78333,9986,'administrator','2021-08-23 21:45:36',NULL),
(3587543,3598571,'Zaragoza',-90.88944,14.65444,9361,'administrator','2021-08-23 21:45:36',NULL),
(3587546,3595067,'ZapotitlÃ¡n',-89.83333,14.13333,1617,'administrator','2021-08-23 21:45:36',NULL),
(3587578,3590964,'Zacualpa',-90.83333,15.08333,9241,'administrator','2021-08-23 21:45:37',NULL),
(3587587,3587586,'Zacapa',-89.53056,14.97222,36088,'administrator','2021-08-23 21:45:37',NULL),
(3587593,3595067,'Yupiltepeque',-89.78333,14.2,3028,'administrator','2021-08-23 21:45:36',NULL),
(3587636,3598571,'Yepocapa',-90.95694,14.50417,8961,'administrator','2021-08-23 21:45:36',NULL),
(3587902,3595530,'Villa Nueva',-90.5875,14.52694,406830,'administrator','2021-08-23 21:45:36',NULL),
(3587923,3595530,'Villa Canales',-90.53167,14.48139,122194,'administrator','2021-08-23 21:45:36',NULL),
(3588040,3587586,'UsumatlÃ¡n',-89.78333,14.95,4987,'administrator','2021-08-23 21:45:37',NULL),
(3588043,3590964,'UspantÃ¡n',-90.83333,15.38333,4714,'administrator','2021-08-23 21:45:37',NULL),
(3588057,3595415,'UniÃ³n',-91.77621,15.92051,0,'administrator','2021-08-23 21:45:36',NULL),
(3588206,3599773,'TucurÃº',-90.06667,15.3,4772,'administrator','2021-08-23 21:45:35',NULL),
(3588258,3588257,'TotonicapÃ¡n',-91.36111,14.91167,69734,'administrator','2021-08-23 21:45:37',NULL),
(3588308,3595415,'Todos Santos CuchumatÃ¡n',-91.61667,15.51667,3289,'administrator','2021-08-23 21:45:36',NULL),
(3588460,3589801,'Tejutla',-91.8,15.11667,2653,'administrator','2021-08-23 21:45:37',NULL),
(3588469,3587586,'TeculutÃ¡n',-89.71667,14.98333,6407,'administrator','2021-08-23 21:45:37',NULL),
(3588474,3595415,'TectitÃ¡n',-92.03333,15.33333,743,'administrator','2021-08-23 21:45:36',NULL),
(3588476,3598571,'TecpÃ¡n Guatemala',-90.99417,14.76694,21978,'administrator','2021-08-23 21:45:36',NULL),
(3588491,3589172,'Taxisco',-90.46791,14.06719,6518,'administrator','2021-08-23 21:45:37',NULL),
(3588554,3599773,'TamahÃº',-90.23599,15.3089,1012,'administrator','2021-08-23 21:45:35',NULL),
(3588588,3589801,'Tajumulco',-91.88333,15.08333,4329,'administrator','2021-08-23 21:45:37',NULL),
(3588603,3599773,'Tactic',-90.35448,15.32218,8999,'administrator','2021-08-23 21:45:35',NULL),
(3588612,3589801,'TacanÃ¡',-92.06736,15.23932,6438,'administrator','2021-08-23 21:45:37',NULL),
(3588653,3590686,'Sumpango',-90.73389,14.64639,20884,'administrator','2021-08-23 21:45:37',NULL),
(3588694,3595415,'Soloma',-91.45,15.71667,10916,'administrator','2021-08-23 21:45:36',NULL),
(3588698,3588697,'SololÃ¡',-91.18333,14.77222,45373,'administrator','2021-08-23 21:45:37',NULL),
(3588720,3595802,'SiquinalÃ¡',-90.965,14.30611,0,'administrator','2021-08-23 21:45:36',NULL),
(3588726,3589801,'Sipacapa',-91.66667,15.2,661,'administrator','2021-08-23 21:45:37',NULL),
(3588760,3589801,'Sibinal',-92.04892,15.14963,1657,'administrator','2021-08-23 21:45:37',NULL),
(3588762,3590978,'Sibilia',-91.61667,15,1180,'administrator','2021-08-23 21:45:36',NULL),
(3588858,3599773,'SenahÃº',-89.83333,15.4,5633,'administrator','2021-08-23 21:45:36',NULL),
(3588984,3591410,'SayaxchÃ©',-90.16667,16.51667,9100,'administrator','2021-08-23 21:45:37',NULL),
(3589036,3595802,'San Vicente Pacaya',-90.63917,14.41611,7162,'administrator','2021-08-23 21:45:36',NULL),
(3589062,3588668,'Santo TomÃ¡s La UniÃ³n',-91.38333,14.63333,7081,'administrator','2021-08-23 21:45:37',NULL),
(3589072,3590686,'Santo Domingo Xenacoj',-90.69778,14.67778,8791,'administrator','2021-08-23 21:45:37',NULL),
(3589074,3588668,'Santo Domingo SuchitepÃ©quez',-91.48333,14.46667,6270,'administrator','2021-08-23 21:45:37',NULL),
(3589101,3590686,'Santiago SacatepÃ©quez',-90.67639,14.63528,24210,'administrator','2021-08-23 21:45:37',NULL),
(3589103,3595415,'Santiago Chimaltenango',-91.71667,15.46667,3020,'administrator','2021-08-23 21:45:36',NULL),
(3589105,3588697,'Santiago AtitlÃ¡n',-91.22901,14.63823,33309,'administrator','2021-08-23 21:45:37',NULL),
(3589159,3589172,'Santa Rosa de Lima',-90.29556,14.38806,5984,'administrator','2021-08-23 21:45:37',NULL),
(3589247,3588697,'Santa MarÃ­a VisitaciÃ³n',-91.31667,14.71667,1487,'administrator','2021-08-23 21:45:37',NULL),
(3589249,3589172,'Santa MarÃ­a IxhuatÃ¡n',-90.27472,14.19,3634,'administrator','2021-08-23 21:45:37',NULL),
(3589253,3590686,'Santa MarÃ­a de JesÃºs',-90.72667,14.51833,15529,'administrator','2021-08-23 21:45:37',NULL),
(3589256,3588257,'Santa MarÃ­a Chiquimula',-91.32917,15.03028,6980,'administrator','2021-08-23 21:45:37',NULL),
(3589282,3588697,'Santa LucÃ­a UtatlÃ¡n',-91.26667,14.76667,1305,'administrator','2021-08-23 21:45:37',NULL),
(3589285,3590686,'Santa LucÃ­a Milpas Altas',-90.67861,14.57583,13001,'administrator','2021-08-23 21:45:37',NULL),
(3589287,3588257,'Santa LucÃ­a La Reforma',-91.23556,15.12833,1406,'administrator','2021-08-23 21:45:37',NULL),
(3589289,3595802,'Santa LucÃ­a Cotzumalguapa',-91.01667,14.33333,62097,'administrator','2021-08-23 21:45:36',NULL),
(3589355,3595415,'Santa Eulalia',-91.45694,15.73306,4921,'administrator','2021-08-23 21:45:36',NULL),
(3589395,3599773,'Santa Cruz Verapaz',-90.43333,15.36667,5843,'administrator','2021-08-23 21:45:36',NULL),
(3589398,3589172,'Santa Cruz Naranjo',-90.36972,14.38806,6254,'administrator','2021-08-23 21:45:37',NULL),
(3589400,3590857,'Santa Cruz MuluÃ¡',-91.61667,14.58333,2706,'administrator','2021-08-23 21:45:37',NULL),
(3589402,3588697,'Santa Cruz La Laguna',-91.21667,14.75,1422,'administrator','2021-08-23 21:45:37',NULL),
(3589404,3590964,'Santa Cruz del QuichÃ©',-91.14889,15.03056,23618,'administrator','2021-08-23 21:45:37',NULL),
(3589408,3598571,'Santa Cruz BalanyÃ¡',-90.915,14.68722,7825,'administrator','2021-08-23 21:45:36',NULL),
(3589433,3588697,'Santa Clara La Laguna',-91.3,14.71667,5306,'administrator','2021-08-23 21:45:37',NULL),
(3589452,3595530,'Santa Catarina Pinula',-90.49528,14.56889,67994,'administrator','2021-08-23 21:45:36',NULL),
(3589454,3588697,'Santa Catarina PalopÃ³',-91.13333,14.71667,2948,'administrator','2021-08-23 21:45:37',NULL),
(3589456,3595067,'Santa Catarina Mita',-89.75,14.45,10817,'administrator','2021-08-23 21:45:36',NULL),
(3589458,3588697,'Santa Catarina IxtahuacÃ¡n',-91.36667,14.8,14734,'administrator','2021-08-23 21:45:37',NULL),
(3589460,3590686,'Santa Catarina Barahona',-90.78833,14.54889,3214,'administrator','2021-08-23 21:45:37',NULL),
(3589468,3595415,'Santa BÃ¡rbara',-91.61667,15.31667,888,'administrator','2021-08-23 21:45:36',NULL),
(3589475,3588668,'Santa BÃ¡rbara',-91.23333,14.43333,12906,'administrator','2021-08-23 21:45:37',NULL),
(3589480,3598571,'Santa Apolonia',-90.97083,14.79139,2396,'administrator','2021-08-23 21:45:36',NULL),
(3589498,3595415,'Santa Ana Huista',-91.82005,15.68085,2004,'administrator','2021-08-23 21:45:36',NULL),
(3589507,3591410,'Santa Ana',-89.83333,16.8,9523,'administrator','2021-08-23 21:45:37',NULL),
(3589541,3595415,'San SebastiÃ¡n Huehuetenango',-91.58333,15.38333,1311,'administrator','2021-08-23 21:45:36',NULL),
(3589543,3595415,'San SebastiÃ¡n CoatÃ¡n',-91.56667,15.73333,801,'administrator','2021-08-23 21:45:36',NULL),
(3589548,3590857,'San SebastiÃ¡n',-91.65,14.56667,14823,'administrator','2021-08-23 21:45:37',NULL),
(3589554,3596416,'Sansare',-90.1125,14.74722,3792,'administrator','2021-08-23 21:45:36',NULL),
(3589569,3595530,'San Raimundo',-90.59556,14.76472,8689,'administrator','2021-08-23 21:45:36',NULL),
(3589577,3589801,'San Rafael Pie de La Cuesta',-91.91667,14.93333,4320,'administrator','2021-08-23 21:45:37',NULL),
(3589579,3595415,'San Rafael Petzal',-91.66451,15.40487,1525,'administrator','2021-08-23 21:45:36',NULL),
(3589592,3589172,'San Rafael Las Flores',-90.17333,14.48139,2572,'administrator','2021-08-23 21:45:37',NULL),
(3589595,3595415,'San Rafael La Independencia',-91.53333,15.71667,1059,'administrator','2021-08-23 21:45:36',NULL),
(3589626,3589801,'San Pedro SacatepÃ©quez',-91.76667,14.96667,40021,'administrator','2021-08-23 21:45:37',NULL),
(3589627,3595530,'San Pedro SacatepÃ©quez',-90.64417,14.68417,14315,'administrator','2021-08-23 21:45:36',NULL),
(3589629,3595236,'San Pedro Pinula',-89.85,14.66667,3302,'administrator','2021-08-23 21:45:36',NULL),
(3589632,3595415,'San Pedro Necta',-91.76551,15.49142,3554,'administrator','2021-08-23 21:45:36',NULL),
(3589637,3588697,'San Pedro La Laguna',-91.27201,14.69297,9681,'administrator','2021-08-23 21:45:37',NULL),
(3589640,3590964,'San Pedro Jocopilas',-91.15139,15.09444,1040,'administrator','2021-08-23 21:45:37',NULL),
(3589643,3599773,'San Pedro CarchÃ¡',-90.26667,15.48333,13332,'administrator','2021-08-23 21:45:36',NULL),
(3589646,3595530,'San Pedro Ayampuc',-90.45111,14.78667,46803,'administrator','2021-08-23 21:45:36',NULL),
(3589669,3588697,'San Pablo La Laguna',-91.26667,14.71667,6186,'administrator','2021-08-23 21:45:37',NULL),
(3589671,3588668,'San Pablo Jocopilas',-91.45,14.58333,20259,'administrator','2021-08-23 21:45:37',NULL),
(3589677,3589801,'San Pablo',-92.00392,14.93154,13668,'administrator','2021-08-23 21:45:37',NULL),
(3589706,3590978,'San Miguel SigÃ¼ilÃ¡',-91.61667,14.9,7551,'administrator','2021-08-23 21:45:36',NULL),
(3589709,3588668,'San Miguel PanÃ¡n',-91.36667,14.53333,2024,'administrator','2021-08-23 21:45:37',NULL),
(3589720,3589801,'San Miguel IxtahuacÃ¡n',-91.75,15.25,3662,'administrator','2021-08-23 21:45:37',NULL),
(3589727,3590686,'San Miguel DueÃ±as',-90.79833,14.52389,8424,'administrator','2021-08-23 21:45:37',NULL),
(3589730,3599602,'San Miguel Chicaj',-90.4,15.1,13747,'administrator','2021-08-23 21:45:36',NULL),
(3589734,3595415,'San Miguel AcatÃ¡n',-91.61667,15.7,2773,'administrator','2021-08-23 21:45:36',NULL),
(3589770,3595415,'San Mateo IxtatÃ¡n',-91.47806,15.83194,13213,'administrator','2021-08-23 21:45:36',NULL),
(3589774,3590978,'San Mateo',-91.58333,14.86667,5534,'administrator','2021-08-23 21:45:36',NULL),
(3589776,3590857,'San MartÃ­n ZapotitlÃ¡n',-91.6,14.6,4419,'administrator','2021-08-23 21:45:37',NULL),
(3589778,3590978,'San MartÃ­n SacatepÃ©quez',-91.65,14.81667,3658,'administrator','2021-08-23 21:45:36',NULL),
(3589780,3598571,'San MartÃ­n Jilotepeque',-90.7925,14.78778,9846,'administrator','2021-08-23 21:45:36',NULL),
(3589795,3588697,'San Marcos La Laguna',-91.26667,14.71667,2681,'administrator','2021-08-23 21:45:37',NULL),
(3589805,3589801,'San Marcos',-91.79444,14.96389,25088,'administrator','2021-08-23 21:45:37',NULL),
(3589812,3595236,'San Manuel ChaparrÃ³n',-89.76667,14.51667,2624,'administrator','2021-08-23 21:45:36',NULL),
(3589822,3595236,'San Luis Jilotepeque',-89.73333,14.65,10306,'administrator','2021-08-23 21:45:36',NULL),
(3589824,3590964,'San Luis IxcÃ¡n',-91.095,15.78722,7850,'administrator','2021-08-23 21:45:37',NULL),
(3589841,3591410,'San Luis',-89.44028,16.19889,6776,'administrator','2021-08-23 21:45:37',NULL),
(3589850,3588697,'San Lucas TolimÃ¡n',-91.14659,14.59471,14545,'administrator','2021-08-23 21:45:37',NULL),
(3589852,3590686,'San Lucas SacatepÃ©quez',-90.65694,14.60972,17959,'administrator','2021-08-23 21:45:37',NULL),
(3589865,3589801,'San Lorenzo',-91.73333,15.03333,945,'administrator','2021-08-23 21:45:37',NULL),
(3589869,3588668,'San Lorenzo',-91.51667,14.48333,2165,'administrator','2021-08-23 21:45:37',NULL),
(3589880,3589172,'San Juan Tecuaco',-90.26111,14.08222,2210,'administrator','2021-08-23 21:45:37',NULL),
(3589885,3595530,'San Juan SacatepÃ©quez',-90.64417,14.71889,136886,'administrator','2021-08-23 21:45:36',NULL),
(3589896,3588697,'San Juan La Laguna',-91.28333,14.7,4608,'administrator','2021-08-23 21:45:37',NULL),
(3589900,3595415,'San Juan Ixcoy',-91.44528,15.59972,2535,'administrator','2021-08-23 21:45:36',NULL),
(3589903,3598464,'San Juan Ermita',-89.43333,14.76667,1623,'administrator','2021-08-23 21:45:36',NULL),
(3589913,3590964,'San Juan Cotzal',-91.03417,15.43417,11046,'administrator','2021-08-23 21:45:37',NULL),
(3589917,3599773,'San Juan Chamelco',-90.33333,15.43333,11944,'administrator','2021-08-23 21:45:36',NULL),
(3589923,3588668,'San Juan Bautista',-91.18333,14.41667,2680,'administrator','2021-08-23 21:45:37',NULL),
(3589925,3595415,'San Juan AtitÃ¡n',-91.63333,15.43333,1910,'administrator','2021-08-23 21:45:36',NULL),
(3589975,3598571,'San JosÃ© Poaquil',-90.90639,14.81972,5987,'administrator','2021-08-23 21:45:36',NULL),
(3589977,3595530,'San JosÃ© Pinula',-90.41139,14.54611,47247,'administrator','2021-08-23 21:45:36',NULL),
(3589983,3589801,'San JosÃ© OjetenÃ¡n',-91.96667,15.21667,1269,'administrator','2021-08-23 21:45:37',NULL),
(3589985,3589801,'San JosÃ© Ojetenam',-91.96667,15.21667,0,'administrator','2021-08-23 21:45:37',NULL),
(3590017,3598464,'San JosÃ© La Arada',-89.58333,14.71667,2361,'administrator','2021-08-23 21:45:36',NULL),
(3590029,3588668,'San JosÃ© El Ãdolo',-91.41667,14.45,2412,'administrator','2021-08-23 21:45:37',NULL),
(3590030,3595530,'San JosÃ© del Golfo',-90.37639,14.76278,4908,'administrator','2021-08-23 21:45:36',NULL),
(3590041,3588697,'San JosÃ© ChacayÃ¡',-91.21667,14.76667,839,'administrator','2021-08-23 21:45:37',NULL),
(3590053,3595067,'San JosÃ© Acatempa',-90.12694,14.26528,6367,'administrator','2021-08-23 21:45:36',NULL),
(3590069,3591410,'San JosÃ©',-89.9,16.98333,1201,'administrator','2021-08-23 21:45:37',NULL),
(3590090,3587586,'San Jorge',-89.58333,14.93333,0,'administrator','2021-08-23 21:45:37',NULL),
(3590114,3599602,'San JerÃ³nimo',-90.2405,15.06032,8093,'administrator','2021-08-23 21:45:36',NULL),
(3590127,3598464,'San Jacinto',-89.5,14.66667,1519,'administrator','2021-08-23 21:45:36',NULL),
(3590188,3595415,'San Gaspar Ixchil',-91.71667,15.38333,551,'administrator','2021-08-23 21:45:36',NULL),
(3590195,3588668,'San Gabriel',-91.51667,14.51667,4118,'administrator','2021-08-23 21:45:37',NULL),
(3590197,3588668,'San Francisco ZapotitlÃ¡n',-91.51667,14.58333,13855,'administrator','2021-08-23 21:45:37',NULL),
(3590213,3590978,'San Francisco La UniÃ³n',-91.53333,14.91667,1170,'administrator','2021-08-23 21:45:36',NULL),
(3590219,3588257,'San Francisco El Alto',-91.45,14.95,54493,'administrator','2021-08-23 21:45:37',NULL),
(3590249,3591410,'San Francisco',-89.93333,16.8,3954,'administrator','2021-08-23 21:45:37',NULL),
(3590288,3590857,'San Felipe',-91.6,14.61667,8921,'administrator','2021-08-23 21:45:37',NULL),
(3590312,3587586,'San Diego',-89.78333,14.78333,557,'administrator','2021-08-23 21:45:37',NULL),
(3590316,3599773,'San CristÃ³bal Verapaz',-90.56513,15.39632,19664,'administrator','2021-08-23 21:45:36',NULL),
(3590318,3588257,'San CristÃ³bal TotonicapÃ¡n',-91.43333,14.91667,4191,'administrator','2021-08-23 21:45:37',NULL),
(3590323,3589801,'San CristÃ³bal Cucho',-91.78333,14.9,9152,'administrator','2021-08-23 21:45:37',NULL),
(3590325,3596416,'San CristÃ³bal AcasaguastlÃ¡n',-89.88333,14.91667,2171,'administrator','2021-08-23 21:45:36',NULL),
(3590347,3590978,'San Carlos Sija',-91.55,14.98333,6831,'administrator','2021-08-23 21:45:36',NULL),
(3590355,3595236,'San Carlos Alzatate',-90.06028,14.49778,0,'administrator','2021-08-23 21:45:36',NULL),
(3590384,3588668,'San Bernardino',-91.45,14.53333,5501,'administrator','2021-08-23 21:45:37',NULL),
(3590389,3591410,'San Benito',-89.91898,16.91675,30764,'administrator','2021-08-23 21:45:37',NULL),
(3590393,3590686,'San BartolomÃ© Milpas Altas',-90.68,14.60611,6261,'administrator','2021-08-23 21:45:37',NULL),
(3590395,3590964,'San BartolomÃ© Jocotenango',-91.07722,15.19278,1620,'administrator','2021-08-23 21:45:38',NULL),
(3590399,3588257,'San Bartolo',-91.45583,15.08444,1290,'administrator','2021-08-23 21:45:37',NULL),
(3590406,3596416,'Sanarate',-90.19222,14.795,15843,'administrator','2021-08-23 21:45:36',NULL),
(3590412,3588668,'San Antonio SuchitepÃ©quez',-91.41667,14.53333,10951,'administrator','2021-08-23 21:45:37',NULL),
(3590419,3589801,'San Antonio SacatepÃ©quez',-91.73333,14.96667,1658,'administrator','2021-08-23 21:45:37',NULL),
(3590424,3588697,'San Antonio PalopÃ³',-91.11667,14.7,3588,'administrator','2021-08-23 21:45:37',NULL),
(3590449,3596416,'San Antonio La Paz',-90.28667,14.74972,7781,'administrator','2021-08-23 21:45:36',NULL),
(3590456,3590964,'San Antonio Ilotenango',-91.22972,15.05472,2021,'administrator','2021-08-23 21:45:38',NULL),
(3590458,3595415,'San Antonio Huista',-91.77163,15.6501,5669,'administrator','2021-08-23 21:45:36',NULL),
(3590475,3590686,'San Antonio Aguas Calientes',-90.76944,14.53972,7811,'administrator','2021-08-23 21:45:37',NULL),
(3590520,3588257,'San AndrÃ©s Xecul',-91.48333,14.9,12133,'administrator','2021-08-23 21:45:37',NULL),
(3590522,3590857,'San AndrÃ©s Villa Seca',-91.58333,14.56667,5102,'administrator','2021-08-23 21:45:37',NULL),
(3590524,3588697,'San AndrÃ©s Semetabaj',-91.13333,14.75,2605,'administrator','2021-08-23 21:45:37',NULL),
(3590526,3590964,'San AndrÃ©s SajcabajÃ¡',-90.91667,15.21667,1988,'administrator','2021-08-23 21:45:38',NULL),
(3590529,3598571,'San AndrÃ©s Itzapa',-90.84417,14.62,18647,'administrator','2021-08-23 21:45:36',NULL),
(3590537,3591410,'San AndrÃ©s',-89.91667,16.96667,7235,'administrator','2021-08-23 21:45:37',NULL),
(3590547,3596416,'San AgustÃ­n AcasaguastlÃ¡n',-89.96667,14.95,10335,'administrator','2021-08-23 21:45:36',NULL),
(3590567,3590978,'Samayac',-91.46135,14.58084,8994,'administrator','2021-08-23 21:45:36',NULL),
(3590605,3590978,'SalcajÃ¡',-91.45,14.88333,11966,'administrator','2021-08-23 21:45:36',NULL),
(3590616,3599602,'SalamÃ¡',-90.31806,15.10278,40000,'administrator','2021-08-23 21:45:36',NULL),
(3590690,3590964,'Sacapulas',-91.08722,15.28667,12088,'administrator','2021-08-23 21:45:38',NULL),
(3590788,3587586,'RÃ­o Hondo',-89.58333,15.06667,5997,'administrator','2021-08-23 21:45:37',NULL),
(3590804,3588668,'RÃ­o Bravo',-91.31713,14.40042,7568,'administrator','2021-08-23 21:45:37',NULL),
(3590814,3589801,'RÃ­o Blanco',-91.68333,15.03333,829,'administrator','2021-08-23 21:45:37',NULL),
(3590858,3590857,'Retalhuleu',-91.67778,14.53611,36656,'administrator','2021-08-23 21:45:37',NULL),
(3590881,3599773,'RaxruhÃ¡',-90.03333,15.86667,0,'administrator','2021-08-23 21:45:36',NULL),
(3590924,3599602,'Rabinal',-90.45,15.1,10737,'administrator','2021-08-23 21:45:36',NULL),
(3590973,3598464,'Quezaltepeque',-89.45,14.63333,4126,'administrator','2021-08-23 21:45:36',NULL),
(3590979,3590978,'Quetzaltenango',-91.51806,14.83472,132230,'administrator','2021-08-23 21:45:36',NULL),
(3590987,3595067,'Quesada',-90.04028,14.27028,2250,'administrator','2021-08-23 21:45:36',NULL),
(3591028,3599602,'PurulhÃ¡',-90.2,15.26667,5370,'administrator','2021-08-23 21:45:36',NULL),
(3591060,3595802,'Puerto San JosÃ©',-90.82166,13.9274,18655,'administrator','2021-08-23 21:45:36',NULL),
(3591062,3595259,'Puerto Barrios',-88.59444,15.72778,56605,'administrator','2021-08-23 21:45:36',NULL),
(3591092,3589172,'Pueblo Nuevo ViÃ±as',-90.47417,14.22583,4211,'administrator','2021-08-23 21:45:37',NULL),
(3591093,3595802,'Tiquisate',-91.36063,14.28356,18189,'administrator','2021-08-23 21:45:36',NULL),
(3591106,3588668,'Pueblo Nuevo',-91.53333,14.65,3116,'administrator','2021-08-23 21:45:37',NULL),
(3591181,3591410,'PoptÃºn',-89.41694,16.33111,17320,'administrator','2021-08-23 21:45:37',NULL),
(3591210,3598571,'Pochuta',-91.08333,14.55,3879,'administrator','2021-08-23 21:45:36',NULL),
(3591216,3590964,'Playa Grande',-90.73333,15.93333,0,'administrator','2021-08-23 21:45:38',NULL),
(3591415,3595530,'Petapa',-90.55167,14.50278,141455,'administrator','2021-08-23 21:45:36',NULL),
(3591512,3598571,'PatzÃºn',-91.01667,14.68333,18704,'administrator','2021-08-23 21:45:36',NULL),
(3591517,3590964,'PatzitÃ©',-91.21667,14.96667,1003,'administrator','2021-08-23 21:45:38',NULL),
(3591523,3598571,'PatzicÃ­a',-90.92694,14.63167,16494,'administrator','2021-08-23 21:45:36',NULL),
(3591541,3588668,'Patulul',-91.16667,14.41667,14196,'administrator','2021-08-23 21:45:37',NULL),
(3591574,3590686,'Pastores',-90.75472,14.59667,10393,'administrator','2021-08-23 21:45:37',NULL),
(3591618,3595067,'Pasaco',-90.20639,13.97722,1873,'administrator','2021-08-23 21:45:36',NULL),
(3591629,3598571,'Parramos',-90.80306,14.60778,9613,'administrator','2021-08-23 21:45:36',NULL),
(3591676,3599773,'PanzÃ³s',-89.66667,15.4,25569,'administrator','2021-08-23 21:45:36',NULL),
(3591750,3588697,'Panajachel',-91.15,14.73333,12863,'administrator','2021-08-23 21:45:37',NULL),
(3591833,3595802,'PalÃ­n',-90.69833,14.40556,31329,'administrator','2021-08-23 21:45:36',NULL),
(3591841,3590978,'Palestina de los Altos',-91.7,14.93333,1691,'administrator','2021-08-23 21:45:36',NULL),
(3591851,3595530,'Palencia',-90.35861,14.66472,18574,'administrator','2021-08-23 21:45:36',NULL),
(3591885,3589801,'Pajapita',-92.03521,14.72152,8164,'administrator','2021-08-23 21:45:37',NULL),
(3591955,3590964,'Pachalun',-90.66278,14.92472,2344,'administrator','2021-08-23 21:45:38',NULL),
(3591997,3590978,'Ostuncalco',-91.61667,14.86667,28894,'administrator','2021-08-23 21:45:36',NULL),
(3592019,3589172,'Oratorio',-90.17583,14.22806,10155,'administrator','2021-08-23 21:45:37',NULL),
(3592035,3598464,'Olopa',-89.35,14.68333,1690,'administrator','2021-08-23 21:45:36',NULL),
(3592041,3590978,'Olintepeque',-91.51667,14.88333,0,'administrator','2021-08-23 21:45:36',NULL),
(3592086,3589801,'OcÃ³s',-92.19298,14.50998,9463,'administrator','2021-08-23 21:45:37',NULL),
(3592105,3590857,'Nuevo San Carlos',-91.7,14.6,19162,'administrator','2021-08-23 21:45:37',NULL),
(3592108,3589801,'Nuevo Progreso',-91.91667,14.8,8113,'administrator','2021-08-23 21:45:37',NULL),
(3592126,3589172,'Nueva Santa Rosa',-90.27611,14.38111,10130,'administrator','2021-08-23 21:45:37',NULL),
(3592145,3595802,'Nueva ConcepciÃ³n',-91.3,14.2,11121,'administrator','2021-08-23 21:45:36',NULL),
(3592217,3595415,'NentÃ³n',-91.75464,15.8007,2530,'administrator','2021-08-23 21:45:36',NULL),
(3592237,3590964,'Nebaj',-91.14611,15.40583,23301,'administrator','2021-08-23 21:45:38',NULL),
(3592286,3588697,'NahualÃ¡',-91.31667,14.85,27690,'administrator','2021-08-23 21:45:37',NULL),
(3592322,3595067,'Moyuta',-90.08083,14.03861,8145,'administrator','2021-08-23 21:45:36',NULL),
(3592349,3596416,'MorazÃ¡n',-90.14306,14.93278,2554,'administrator','2021-08-23 21:45:36',NULL),
(3592362,3595259,'Morales',-88.81667,15.48333,18994,'administrator','2021-08-23 21:45:36',NULL),
(3592477,3595236,'Monjas',-89.86667,14.5,10351,'administrator','2021-08-23 21:45:36',NULL),
(3592483,3588257,'Momostenango',-91.40861,15.04361,31739,'administrator','2021-08-23 21:45:37',NULL),
(3592519,3595530,'Mixco',-90.60639,14.63333,473080,'administrator','2021-08-23 21:45:36',NULL),
(3592609,3588668,'Mazatenango',-91.50333,14.53417,44132,'administrator','2021-08-23 21:45:37',NULL),
(3592635,3595236,'Mataquescuintla',-90.18417,14.52917,7539,'administrator','2021-08-23 21:45:36',NULL),
(3592642,3595802,'Masagua',-90.84806,14.20306,10045,'administrator','2021-08-23 21:45:36',NULL),
(3592751,3595415,'Malacatancito',-91.51667,15.21667,2121,'administrator','2021-08-23 21:45:36',NULL),
(3592753,3589801,'MalacatÃ¡n',-92.05795,14.91065,14923,'administrator','2021-08-23 21:45:37',NULL),
(3592770,3590686,'Magdalena Milpas Altas',-90.67528,14.54528,5582,'administrator','2021-08-23 21:45:37',NULL),
(3593235,3595259,'Los Amates',-89.09723,15.25645,3417,'administrator','2021-08-23 21:45:36',NULL),
(3593376,3595259,'LÃ­vingston',-88.75039,15.82826,14350,'administrator','2021-08-23 21:45:36',NULL),
(3593500,3587586,'La UniÃ³n',-89.28333,14.96667,3682,'administrator','2021-08-23 21:45:37',NULL),
(3593542,3599773,'La Tinta',-89.88333,15.31667,0,'administrator','2021-08-23 21:45:36',NULL),
(3594143,3589801,'La Reforma',-91.81667,14.8,4905,'administrator','2021-08-23 21:45:37',NULL),
(3594315,3599773,'LanquÃ­n',-89.96667,15.56667,2006,'administrator','2021-08-23 21:45:36',NULL),
(3594422,3591410,'La Libertad',-90.11667,16.78333,8646,'administrator','2021-08-23 21:45:37',NULL),
(3594423,3595415,'La Libertad',-91.86944,15.51421,6439,'administrator','2021-08-23 21:45:36',NULL),
(3594575,3595802,'La Gomera',-91.05,14.08333,24001,'administrator','2021-08-23 21:45:36',NULL),
(3594703,3590978,'La Esperanza',-91.56667,14.86667,16461,'administrator','2021-08-23 21:45:36',NULL),
(3594753,3595802,'La Democracia',-90.94722,14.23083,5479,'administrator','2021-08-23 21:45:36',NULL),
(3594754,3595415,'La Democracia',-91.8867,15.62544,0,'administrator','2021-08-23 21:45:36',NULL),
(3594989,3589801,'La Blanca',-92.14137,14.57889,0,'administrator','2021-08-23 21:45:37',NULL),
(3595069,3595067,'Jutiapa',-89.89583,14.29167,34332,'administrator','2021-08-23 21:45:36',NULL),
(3595148,3590964,'Joyabaj',-90.80611,14.995,13164,'administrator','2021-08-23 21:45:38',NULL),
(3595171,3590686,'Jocotenango',-90.74361,14.58194,17918,'administrator','2021-08-23 21:45:37',NULL),
(3595181,3598464,'JocotÃ¡n',-89.38333,14.81667,4930,'administrator','2021-08-23 21:45:36',NULL),
(3595224,3595067,'Jerez',-89.75,14.1,4421,'administrator','2021-08-23 21:45:36',NULL),
(3595232,3595067,'Jalpatagua',-90.00861,14.14167,10469,'administrator','2021-08-23 21:45:36',NULL),
(3595237,3595236,'Jalapa',-89.98889,14.63472,45834,'administrator','2021-08-23 21:45:36',NULL),
(3595248,3595415,'Jacaltenango',-91.73333,15.66667,34084,'administrator','2021-08-23 21:45:36',NULL),
(3595255,3595802,'Iztapa',-90.7075,13.93333,4020,'administrator','2021-08-23 21:45:36',NULL),
(3595282,3595415,'IxtahuacÃ¡n',-91.76667,15.41667,3708,'administrator','2021-08-23 21:45:36',NULL),
(3595329,3589801,'IxchiguÃ¡n',-91.88333,15.2,2263,'administrator','2021-08-23 21:45:37',NULL),
(3595366,3598464,'Ipala',-89.61667,14.61667,5283,'administrator','2021-08-23 21:45:36',NULL),
(3595403,3587586,'HuitÃ©',-89.71667,14.93333,2712,'administrator','2021-08-23 21:45:37',NULL),
(3595406,3590978,'HuitÃ¡n',-91.61667,15.1,9958,'administrator','2021-08-23 21:45:36',NULL),
(3595416,3595415,'Huehuetenango',-91.47083,15.31972,79426,'administrator','2021-08-23 21:45:36',NULL),
(3595503,3589172,'GuazacapÃ¡n',-90.41667,14.07417,7080,'administrator','2021-08-23 21:45:37',NULL),
(3595554,3595802,'Guanagazapa',-90.64333,14.22528,2842,'administrator','2021-08-23 21:45:36',NULL),
(3595560,3587586,'GualÃ¡n',-89.35721,15.11952,19354,'administrator','2021-08-23 21:45:37',NULL),
(3595631,3599602,'Granados',-90.52278,14.91361,937,'administrator','2021-08-23 21:45:36',NULL),
(3595674,3590978,'GÃ©nova',-91.83333,14.61667,3744,'administrator','2021-08-23 21:45:36',NULL),
(3595714,3595530,'Fraijanes',-90.44083,14.46528,28492,'administrator','2021-08-23 21:45:36',NULL),
(3595721,3590978,'Flores Costa Cuca',-91.86341,14.63238,11984,'administrator','2021-08-23 21:45:36',NULL),
(3595725,3591410,'Flores',-89.89941,16.92258,20464,'administrator','2021-08-23 21:45:37',NULL),
(3595757,3587586,'Estanzuela',-89.56667,15,8937,'administrator','2021-08-23 21:45:37',NULL),
(3595778,3589801,'Esquipulas Palo Gordo',-91.81667,14.93333,1533,'administrator','2021-08-23 21:45:37',NULL),
(3595783,3598464,'Esquipulas',-89.35,14.56667,20674,'administrator','2021-08-23 21:45:36',NULL),
(3595803,3595802,'Escuintla',-90.785,14.305,103165,'administrator','2021-08-23 21:45:36',NULL),
(3595929,3589801,'El Tumbador',-91.93333,14.86667,7562,'administrator','2021-08-23 21:45:37',NULL),
(3596041,3598571,'El Tejar',-90.79278,14.64778,15770,'administrator','2021-08-23 21:45:36',NULL),
(3596249,3589801,'El Rodeo',-91.96667,14.91667,1887,'administrator','2021-08-23 21:45:37',NULL),
(3596389,3589801,'El Quetzal',-91.81667,14.76667,12122,'administrator','2021-08-23 21:45:37',NULL),
(3596421,3596416,'Guastatoya',-90.06944,14.85417,13467,'administrator','2021-08-23 21:45:36',NULL),
(3596423,3595067,'El Progreso',-89.85,14.35,7350,'administrator','2021-08-23 21:45:36',NULL),
(3596644,3590978,'El Palmar',-91.58333,14.65,15167,'administrator','2021-08-23 21:45:36',NULL),
(3596940,3596416,'El JÃ­caro',-89.9,14.91667,4242,'administrator','2021-08-23 21:45:36',NULL),
(3597078,3595259,'El Estor',-89.35,15.53333,15842,'administrator','2021-08-23 21:45:36',NULL),
(3597301,3599602,'El Chol',-90.48056,14.96417,2391,'administrator','2021-08-23 21:45:36',NULL),
(3597339,3591410,'El Chal',-89.63333,16.66667,0,'administrator','2021-08-23 21:45:37',NULL),
(3597587,3590857,'El Asintal',-91.73333,14.6,6156,'administrator','2021-08-23 21:45:37',NULL),
(3597676,3595067,'El Adelanto',-89.83333,14.16667,1964,'administrator','2021-08-23 21:45:36',NULL),
(3597722,3591410,'Dolores',-89.41583,16.51417,10604,'administrator','2021-08-23 21:45:37',NULL),
(3597750,3588668,'Cuyotenango',-91.56667,14.53333,10825,'administrator','2021-08-23 21:45:37',NULL),
(3597772,3590964,'CunÃ©n',-91.02694,15.3375,8400,'administrator','2021-08-23 21:45:38',NULL),
(3597802,3595415,'Cuilco',-91.96667,15.4,1713,'administrator','2021-08-23 21:45:36',NULL),
(3597804,3589172,'Cuilapa',-90.29889,14.27639,16484,'administrator','2021-08-23 21:45:37',NULL),
(3597837,3599602,'Cubulco',-90.58333,15.13333,9753,'administrator','2021-08-23 21:45:36',NULL),
(3597966,3595067,'Conguaco',-90.03111,14.04417,3415,'administrator','2021-08-23 21:45:36',NULL),
(3597976,3589801,'ConcepciÃ³n Tutuapa',-91.78333,15.28333,1171,'administrator','2021-08-23 21:45:37',NULL),
(3597985,3598464,'ConcepciÃ³n Las Minas',-89.45,14.51667,1295,'administrator','2021-08-23 21:45:36',NULL),
(3597993,3590978,'ConcepciÃ³n Chiquirichapa',-91.61667,14.85,8080,'administrator','2021-08-23 21:45:36',NULL),
(3598005,3595415,'ConcepciÃ³n',-91.68333,15.61667,8925,'administrator','2021-08-23 21:45:36',NULL),
(3598006,3588697,'ConcepciÃ³n',-91.15,14.78333,3292,'administrator','2021-08-23 21:45:37',NULL),
(3598025,3589801,'Comitancillo',-91.71667,15.08333,19669,'administrator','2021-08-23 21:45:37',NULL),
(3598031,3595067,'Comapa',-89.91667,14.11667,1493,'administrator','2021-08-23 21:45:36',NULL),
(3598034,3598571,'Comalapa',-90.8875,14.74111,20738,'administrator','2021-08-23 21:45:36',NULL),
(3598041,3595415,'Colotenango',-91.71267,15.40602,1690,'administrator','2021-08-23 21:45:36',NULL),
(3598073,3590978,'Colomba',-91.73333,14.71667,19115,'administrator','2021-08-23 21:45:36',NULL),
(3598119,3599773,'CobÃ¡n',-90.37083,15.47083,53375,'administrator','2021-08-23 21:45:36',NULL),
(3598122,3590978,'Coatepeque',-91.86667,14.7,45654,'administrator','2021-08-23 21:45:36',NULL),
(3598128,3590686,'Ciudad Vieja',-90.75972,14.52639,30203,'administrator','2021-08-23 21:45:37',NULL),
(3598129,3589801,'Ayutla',-92.13994,14.67383,11432,'administrator','2021-08-23 21:45:37',NULL),
(3598131,3591410,'Melchor de Mencos',-89.15229,17.06606,11457,'administrator','2021-08-23 21:45:37',NULL),
(3598132,3595530,'Ciudad de Guatemala',-90.51327,14.64072,994938,'administrator','2021-08-23 21:45:36',NULL),
(3598277,3595530,'Chuarrancho',-90.50861,14.82167,7149,'administrator','2021-08-23 21:45:36',NULL),
(3598415,3599773,'Chisec',-90.28333,15.81667,17018,'administrator','2021-08-23 21:45:36',NULL),
(3598462,3589172,'Chiquimulilla',-90.38547,14.0838,12842,'administrator','2021-08-23 21:45:37',NULL),
(3598465,3598464,'Chiquimula',-89.54583,14.8,41521,'administrator','2021-08-23 21:45:36',NULL),
(3598513,3590964,'Chinique',-91.02583,15.04472,2693,'administrator','2021-08-23 21:45:38',NULL),
(3598529,3595530,'Chinautla',-90.49944,14.70833,97172,'administrator','2021-08-23 21:45:36',NULL),
(3598572,3598571,'Chimaltenango',-90.81944,14.66111,82370,'administrator','2021-08-23 21:45:36',NULL),
(3598655,3590964,'Chichicastenango',-91.11667,14.93333,79759,'administrator','2021-08-23 21:45:38',NULL),
(3598659,3590964,'ChichÃ©',-91.065,15.00861,2406,'administrator','2021-08-23 21:45:38',NULL),
(3598670,3590964,'ChicamÃ¡n',-90.76667,15.4,2090,'administrator','2021-08-23 21:45:38',NULL),
(3598678,3588668,'Chicacao',-91.31667,14.53333,20426,'administrator','2021-08-23 21:45:37',NULL),
(3598692,3595415,'Chiantla',-91.45833,15.35472,8465,'administrator','2021-08-23 21:45:36',NULL),
(3598787,3590857,'Champerico',-91.91667,14.3,7761,'administrator','2021-08-23 21:45:37',NULL),
(3598804,3590964,'Chajul',-91.03417,15.48528,11657,'administrator','2021-08-23 21:45:38',NULL),
(3598825,3599773,'Chahal Guatemala',-89.60518,15.79122,7465,'administrator','2021-08-23 21:45:36',NULL),
(3598958,3589801,'Catarina',-92.07646,14.8515,3040,'administrator','2021-08-23 21:45:37',NULL),
(3598968,3589172,'Casillas',-90.24417,14.42222,8970,'administrator','2021-08-23 21:45:37',NULL),
(3599069,3590978,'Cantel',-91.45,14.81667,26063,'administrator','2021-08-23 21:45:36',NULL),
(3599094,3590964,'CanillÃ¡',-90.85,15.16667,1698,'administrator','2021-08-23 21:45:38',NULL),
(3599181,3598464,'CamotÃ¡n',-89.36667,14.81667,1597,'administrator','2021-08-23 21:45:36',NULL),
(3599253,3590978,'CajolÃ¡',-91.61667,14.91667,2927,'administrator','2021-08-23 21:45:36',NULL),
(3599265,3599773,'CahabÃ³n',-89.81667,15.56667,4671,'administrator','2021-08-23 21:45:36',NULL),
(3599287,3590978,'CabricÃ¡n',-91.61667,15.13333,11946,'administrator','2021-08-23 21:45:36',NULL),
(3599298,3587586,'CabaÃ±as',-89.8,14.93333,4678,'administrator','2021-08-23 21:45:37',NULL),
(3599575,3595415,'Barillas',-91.31583,15.80361,14100,'administrator','2021-08-23 21:45:36',NULL),
(3599582,3589172,'Barberena',-90.36111,14.30944,30539,'administrator','2021-08-23 21:45:37',NULL),
(3599633,3595067,'Atescatempa',-89.7425,14.17444,11543,'administrator','2021-08-23 21:45:36',NULL),
(3599639,3595067,'AsunciÃ³n Mita',-89.71083,14.33083,15608,'administrator','2021-08-23 21:45:36',NULL),
(3599699,3590686,'Antigua Guatemala',-90.73444,14.56111,39368,'administrator','2021-08-23 21:45:37',NULL),
(3599735,3595530,'AmatitlÃ¡n',-90.61528,14.4875,71836,'administrator','2021-08-23 21:45:36',NULL),
(3599788,3590686,'Alotenango',-90.8075,14.48028,17410,'administrator','2021-08-23 21:45:37',NULL),
(3599793,3590978,'Almolonga',-91.5,14.81667,11913,'administrator','2021-08-23 21:45:37',NULL),
(3599912,3595415,'AguacatÃ¡n',-91.31167,15.34306,5572,'administrator','2021-08-23 21:45:36',NULL),
(3599972,3595067,'Agua Blanca',-89.65,14.5,2776,'administrator','2021-08-23 21:45:36',NULL),
(3600008,3598571,'Acatenango',-90.94222,14.55194,7050,'administrator','2021-08-23 21:45:36',NULL),
(9975222,3590978,'San Juan Ostuncalco',-91.6897,14.87328,0,'administrator','2021-08-23 21:45:37',NULL),
(9975226,3588668,'San JosÃ© La MÃ¡quina',-91.56707,14.30178,0,'administrator','2021-08-23 21:45:37',NULL),
(9980863,3599773,'Fray BartolomÃ© de Las Casas',-89.88931,15.81516,0,'administrator','2021-08-23 21:45:36',NULL);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;

-- 
-- Definition of country
-- 

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `geonameid` bigint NOT NULL,
  `alpha2Code` char(2) NOT NULL,
  `alpha3Code` char(3) NOT NULL,
  `name` varchar(64) NOT NULL,
  `capital` varchar(64) NOT NULL,
  `region` varchar(32) DEFAULT NULL,
  `subregion` varchar(64) DEFAULT NULL,
  `population` bigint DEFAULT NULL,
  `demonym` varchar(64) DEFAULT NULL,
  `numericCode` varchar(15) DEFAULT NULL,
  `flag_url` text,
  `neighbours` text,
  `userlastmodified` varchar(32) NOT NULL,
  `timecreated` datetime NOT NULL,
  `timemodified` datetime DEFAULT NULL,
  PRIMARY KEY (`geonameid`),
  UNIQUE KEY `UK_ALPHA2CODE_W_COUNTRY` (`alpha2Code`),
  UNIQUE KEY `UK_ALPHA3CODE_W_COUNTRY` (`alpha3Code`),
  UNIQUE KEY `UK_NAME_W_COUNTRY` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=327;

-- 
-- Dumping data for table country
-- 

/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country`(`geonameid`,`alpha2Code`,`alpha3Code`,`name`,`capital`,`region`,`subregion`,`population`,`demonym`,`numericCode`,`flag_url`,`neighbours`,`userlastmodified`,`timecreated`,`timemodified`) VALUES
(3595528,'GT','GTM','Guatemala','Guatemala City','Americas','Central America',16176133,'Guatemalan','320','https://restcountries.eu/data/gtm.svg',NULL,'administrador','2021-08-23 21:40:58',NULL);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;

-- 
-- Definition of region
-- 

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `geonameid` bigint NOT NULL,
  `geonameidCountry` bigint NOT NULL,
  `name` varchar(128) NOT NULL,
  `name2` varchar(128) DEFAULT NULL,
  `longitude` decimal(15,8) DEFAULT NULL,
  `latitude` decimal(15,8) DEFAULT NULL,
  PRIMARY KEY (`geonameid`),
  UNIQUE KEY `UK_GEONAMEID_GEONAMEIDCOUNTRY_W_REGION` (`geonameid`,`geonameidCountry`),
  KEY `FK_GEONAMEIDCOUNTRY_W_REGION_W_COUNTRY` (`geonameidCountry`),
  CONSTRAINT `FK_GEONAMEIDCOUNTRY_W_REGION_W_COUNTRY` FOREIGN KEY (`geonameidCountry`) REFERENCES `country` (`geonameid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=87;

-- 
-- Dumping data for table region
-- 

/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region`(`geonameid`,`geonameidCountry`,`name`,`name2`,`longitude`,`latitude`) VALUES
(3587586,3595528,'Departamento de Zacapa','Zacapa',-89.5,15),
(3588257,3595528,'Departamento de TotonicapÃ¡n','TotonicapÃ¡n',-91.33333,15),
(3588668,3595528,'Departamento de SuchitepÃ©quez ','SuchitepÃ©quez',-91.43046,14.38084),
(3588697,3595528,'Departamento de SololÃ¡','SololÃ¡',-91.25,14.66667),
(3589172,3595528,'Departamento de Santa Rosa','Santa Rosa',-90.3,14.16667),
(3589801,3595528,'Departamento de San Marcos','San Marcos',-91.91667,15),
(3590686,3595528,'Departamento de SacatepÃ©quez','SacatepÃ©quez',-90.75,14.58333),
(3590857,3595528,'Departamento de Retalhuleu','Retalhuleu',-91.83333,14.33333),
(3590964,3595528,'Departamento del QuichÃ©','QuichÃ©',-90.91667,15.5),
(3590978,3595528,'Departamento de Quetzaltenango','Quetzaltenango',-91.66667,14.75),
(3591410,3595528,'Departamento del PetÃ©n','PetÃ©n',-90,16.83333),
(3595067,3595528,'Departamento de Jutiapa','Jutiapa',-89.83333,14.16667),
(3595236,3595528,'Departamento de Jalapa','Jalapa',-89.91667,14.58333),
(3595259,3595528,'Departamento de Izabal','Izabal',-89,15.5),
(3595415,3595528,'Departamento de Huehuetenango','Huehuetenango',-91.58333,15.66667),
(3595530,3595528,'Departamento de Guatemala','Guatemala',-90.5,14.66667),
(3595802,3595528,'Departamento de Escuintla','Escuintla',-91,14.16667),
(3596416,3595528,'Departamento de El Progreso','El Progreso',-90,14.83333),
(3598464,3595528,'Departamento de Chiquimula','Chiquimula',-89.41667,14.66667),
(3598571,3595528,'Departamento de Chimaltenango','Chimaltenango',-90.91667,14.66667),
(3599602,3595528,'Departamento de Baja Verapaz','Baja Verapaz',-90.33333,15.08333),
(3599773,3595528,'Departamento de Alta Verapaz','Alta Verapaz',-90,15.66667);
/*!40000 ALTER TABLE `region` ENABLE KEYS */;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


-- Dump completed on 2023-03-08 14:05:44
-- Total time: 0:0:0:0:266 (d:h:m:s:ms)
CREATE TABLE personal_information (
   id INT NOT NULL AUTO_INCREMENT,
   geonameidCity bigint not null,
   name VARCHAR(255) NOT NULL,
   date_of_birth DATE NOT NULL,
   email VARCHAR(255) NOT NULL,
   phone_number VARCHAR(20) NOT NULL,
   address VARCHAR(255),
   PRIMARY KEY (id),
	CONSTRAINT `FK_GEONAMEIDCITY_WCITY_personal_information` FOREIGN KEY (`geonameidCity`) REFERENCES `city` (`geonameid`)
);

DROP TABLE IF EXISTS `votes`;
CREATE TABLE votes (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  pi_id INT NOT NULL,
  movies_id INT NOT NULL,
  row_creation_time DATETIME NOT NULL,
  rate DECIMAL(4,2) NOT NULL,
  CONSTRAINT FK_PI_VOTES FOREIGN KEY (PI_ID) REFERENCES personal_information (id),
  CONSTRAINT `FK_movies_votes` FOREIGN KEY (`MOVIES_ID`) REFERENCES `movies` (`id`)    
);


INSERT INTO VOTES (`pi_id`, `movies_id`, `row_creation_time`, `rate`)
VALUES (4, 1, now(), 8.95)