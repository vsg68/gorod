CREATE TABLE {TABLE_NAME} (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) DEFAULT NULL,
  `visible` int(3) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `url_original_image` varchar(255) DEFAULT NULL,
  `url_thumbnail_image` varchar(255) DEFAULT NULL,
  `url_gallery_image` varchar(255) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `url_min_image` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `options` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=195 DEFAULT CHARSET=utf8; 
 