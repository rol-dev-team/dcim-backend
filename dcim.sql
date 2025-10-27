DROP TABLE IF EXISTS "alarm_acknowledgement_logs";
CREATE TABLE "alarm_acknowledgement_logs" (
  "id" BIGSERIAL,
  "sensor_id" int NOT NULL,
  "alarm_value" int NOT NULL,
  "checked_by" varchar(255) NOT NULL,
  "description" text,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "alarm_acknowledgement_logs" VALUES (1,6,10,'1','dasd','2025-06-23 13:23:03','2025-06-23 13:23:03'),(2,1,33,'1','sdasdas','2025-06-23 13:23:07','2025-06-23 13:23:07'),(3,1,33,'1',NULL,'2025-08-19 16:09:37','2025-08-19 16:09:37');

DROP TABLE IF EXISTS "alarm_acknowledgements";
CREATE TABLE "alarm_acknowledgements" (
  "id" BIGSERIAL,
  "sensor_id" int NOT NULL,
  "alarm_value" int NOT NULL,
  "checked_by" varchar(255) NOT NULL,
  "description" text,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "alarm_acknowledgements" VALUES (3,1,33,'1',NULL,'2025-08-19 16:09:37','2025-08-19 16:09:37');

DROP TABLE IF EXISTS "cache";
CREATE TABLE "cache" (
  "key" varchar(255) NOT NULL,
  "value" TEXT NOT NULL,
  "expiration" int NOT NULL,
  PRIMARY KEY ("key")
);

INSERT INTO "cache" VALUES ('laravel_cache_spatie.permission.cache','a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:132:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:9:\"role-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:4;i:2;i:5;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:11:\"role-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:9:\"role-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:11:\"role-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:4;i:2;i:5;}}i:4;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:14:\"product-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:5;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:12:\"product-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:6;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:14:\"product-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:7;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:4:\"home\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:9:\"dashboard\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:12:\"profile.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:10;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:14:\"profile.update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:15:\"profile.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:3:{s:1:\"a\";i:14;s:1:\"b\";s:13:\"password.edit\";s:1:\"c\";s:3:\"web\";}i:13;a:3:{s:1:\"a\";i:15;s:1:\"b\";s:15:\"password.update\";s:1:\"c\";s:3:\"web\";}i:14;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:10:\"appearance\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:8:\"register\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:5:\"login\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:5;}}i:17;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:16:\"password.request\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:18;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:14:\"password.email\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:19;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:14:\"password.reset\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:20;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:14:\"password.store\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:21;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:19:\"verification.notice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:22;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:19:\"verification.verify\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:23;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:17:\"verification.send\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:24;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:16:\"password.confirm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:25;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:11:\"roles.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:5;}}i:26;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:12:\"roles.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:11:\"roles.store\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:10:\"roles.show\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:5;}}i:29;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:10:\"roles.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:30;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:12:\"roles.update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:31;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:13:\"roles.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:32;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:11:\"users.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:33;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:12:\"users.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:11:\"users.store\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:35;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:10:\"users.show\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:36;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:10:\"users.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:37;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:12:\"users.update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:38;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:13:\"users.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:39;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:14:\"products.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:40;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:15:\"products.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:41;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:14:\"products.store\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:42;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:13:\"products.show\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:43;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:13:\"products.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:44;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:15:\"products.update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:45;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:16:\"products.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:46;a:4:{s:1:\"a\";i:49;s:1:\"b\";s:5:\"users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:47;a:4:{s:1:\"a\";i:50;s:1:\"b\";s:13:\"storage.local\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:48;a:4:{s:1:\"a\";i:51;s:1:\"b\";s:19:\"sanctum.csrf-cookie\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:49;a:4:{s:1:\"a\";i:52;s:1:\"b\";s:7:\"logout1\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:4;i:2;i:5;}}i:50;a:4:{s:1:\"a\";i:53;s:1:\"b\";s:8:\"RoleShow\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:51;a:4:{s:1:\"a\";i:54;s:1:\"b\";s:15:\"divisions.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:52;a:4:{s:1:\"a\";i:55;s:1:\"b\";s:15:\"divisions.store\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:53;a:4:{s:1:\"a\";i:56;s:1:\"b\";s:14:\"divisions.show\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:54;a:4:{s:1:\"a\";i:57;s:1:\"b\";s:16:\"divisions.update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:55;a:4:{s:1:\"a\";i:58;s:1:\"b\";s:17:\"divisions.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:56;a:4:{s:1:\"a\";i:59;s:1:\"b\";s:16:\"datacenter-index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:57;a:4:{s:1:\"a\";i:60;s:1:\"b\";s:6:\"logout\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:58;a:4:{s:1:\"a\";i:61;s:1:\"b\";s:11:\"gemini.chat\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:59;a:4:{s:1:\"a\";i:62;s:1:\"b\";s:16:\"gemini.chat.send\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:60;a:4:{s:1:\"a\";i:63;s:1:\"b\";s:15:\"datacenter-show\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:61;a:4:{s:1:\"a\";i:64;s:1:\"b\";s:15:\"datacenter-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:62;a:4:{s:1:\"a\";i:65;s:1:\"b\";s:17:\"datacenter-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:63;a:4:{s:1:\"a\";i:66;s:1:\"b\";s:14:\"datacenter-add\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:64;a:4:{s:1:\"a\";i:67;s:1:\"b\";s:12:\"device-index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:65;a:4:{s:1:\"a\";i:68;s:1:\"b\";s:13:\"device-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:66;a:4:{s:1:\"a\";i:69;s:1:\"b\";s:11:\"device-show\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:67;a:4:{s:1:\"a\";i:70;s:1:\"b\";s:11:\"device-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:68;a:4:{s:1:\"a\";i:71;s:1:\"b\";s:13:\"device-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:69;a:4:{s:1:\"a\";i:72;s:1:\"b\";s:12:\"sensor-index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:70;a:4:{s:1:\"a\";i:73;s:1:\"b\";s:13:\"sensor-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:71;a:4:{s:1:\"a\";i:74;s:1:\"b\";s:11:\"sensor-show\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:72;a:4:{s:1:\"a\";i:75;s:1:\"b\";s:11:\"sensor-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:73;a:4:{s:1:\"a\";i:76;s:1:\"b\";s:13:\"sensor-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:74;a:4:{s:1:\"a\";i:77;s:1:\"b\";s:11:\"state-index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:75;a:4:{s:1:\"a\";i:78;s:1:\"b\";s:12:\"state-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:76;a:4:{s:1:\"a\";i:79;s:1:\"b\";s:10:\"state-show\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:77;a:4:{s:1:\"a\";i:80;s:1:\"b\";s:10:\"state-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:78;a:4:{s:1:\"a\";i:81;s:1:\"b\";s:12:\"state-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:79;a:4:{s:1:\"a\";i:82;s:1:\"b\";s:19:\"thresholdtype-index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:80;a:4:{s:1:\"a\";i:83;s:1:\"b\";s:20:\"thresholdtype-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:81;a:4:{s:1:\"a\";i:84;s:1:\"b\";s:18:\"thresholdtype-show\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:82;a:4:{s:1:\"a\";i:85;s:1:\"b\";s:18:\"thresholdtype-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:83;a:4:{s:1:\"a\";i:86;s:1:\"b\";s:20:\"thresholdtype-update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:84;a:4:{s:1:\"a\";i:87;s:1:\"b\";s:20:\"thresholdtype-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:85;a:4:{s:1:\"a\";i:88;s:1:\"b\";s:20:\"thresholdvalue-index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:86;a:4:{s:1:\"a\";i:89;s:1:\"b\";s:21:\"thresholdvalue-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:87;a:4:{s:1:\"a\";i:90;s:1:\"b\";s:19:\"thresholdvalue-show\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:88;a:4:{s:1:\"a\";i:91;s:1:\"b\";s:19:\"thresholdvalue-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:89;a:4:{s:1:\"a\";i:92;s:1:\"b\";s:21:\"thresholdvalue-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:90;a:4:{s:1:\"a\";i:93;s:1:\"b\";s:11:\"sensor-data\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:91;a:4:{s:1:\"a\";i:94;s:1:\"b\";s:5:\"mqtt1\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:92;a:4:{s:1:\"a\";i:95;s:1:\"b\";s:25:\"DataCenterController-show\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:93;a:4:{s:1:\"a\";i:96;s:1:\"b\";s:27:\"DataCenterController-update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:94;a:4:{s:1:\"a\";i:97;s:1:\"b\";s:28:\"DataCenterController-destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:95;a:4:{s:1:\"a\";i:98;s:1:\"b\";s:22:\"DiagramController-show\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:96;a:4:{s:1:\"a\";i:99;s:1:\"b\";s:23:\"DiagramController-store\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:97;a:4:{s:1:\"a\";i:100;s:1:\"b\";s:23:\"DiagramController-index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:98;a:4:{s:1:\"a\";i:101;s:1:\"b\";s:19:\"SvgController-store\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:99;a:4:{s:1:\"a\";i:102;s:1:\"b\";s:21:\"SvgController-preview\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:100;a:4:{s:1:\"a\";i:103;s:1:\"b\";s:31:\"AllDashboardController-getAllDC\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:101;a:4:{s:1:\"a\";i:104;s:1:\"b\";s:28:\"DatabaseController-getSchema\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:102;a:4:{s:1:\"a\";i:105;s:1:\"b\";s:31:\"DatabaseController-executeQuery\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:103;a:4:{s:1:\"a\";i:106;s:1:\"b\";s:31:\"DatabaseController-getModelInfo\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:104;a:4:{s:1:\"a\";i:107;s:1:\"b\";s:49:\"DashboardDataController-getThresholdsByDataCenter\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:105;a:4:{s:1:\"a\";i:108;s:1:\"b\";s:49:\"DashboardDataController-getSensorTypeByDataCenter\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:106;a:4:{s:1:\"a\";i:109;s:1:\"b\";s:45:\"DashboardDataController-getStatesByDataCenter\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:107;a:4:{s:1:\"a\";i:110;s:1:\"b\";s:41:\"DataCenterController-getDataCenterMapping\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:108;a:4:{s:1:\"a\";i:111;s:1:\"b\";s:37:\"UserRegisterController-getUserMapping\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:109;a:4:{s:1:\"a\";i:112;s:1:\"b\";s:38:\"MasterDataController-getPartnerMapping\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:110;a:4:{s:1:\"a\";i:113;s:1:\"b\";s:46:\"DcOwnerMappingController-storeDcPartnerMapping\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:111;a:4:{s:1:\"a\";i:114;s:1:\"b\";s:30:\"DcOwnerMappingController-store\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:112;a:4:{s:1:\"a\";i:115;s:1:\"b\";s:35:\"MasterDataController-FetchDivisions\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:113;a:4:{s:1:\"a\";i:116;s:1:\"b\";s:39:\"MasterDataController-stFetchUserTypeore\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:114;a:4:{s:1:\"a\";i:117;s:1:\"b\";s:34:\"MasterDataController-FetchUserRole\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:115;a:4:{s:1:\"a\";i:118;s:1:\"b\";s:37:\"MasterDataController-FetchDepartments\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:116;a:4:{s:1:\"a\";i:119;s:1:\"b\";s:36:\"MasterDataController-FetchOwnerTypes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:117;a:4:{s:1:\"a\";i:120;s:1:\"b\";s:33:\"MasterDataController-indexPartner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:118;a:4:{s:1:\"a\";i:121;s:1:\"b\";s:33:\"MasterDataController-storePartner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:119;a:4:{s:1:\"a\";i:122;s:1:\"b\";s:32:\"MasterDataController-showPartner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:120;a:4:{s:1:\"a\";i:123;s:1:\"b\";s:34:\"MasterDataController-updatePartner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:121;a:4:{s:1:\"a\";i:124;s:1:\"b\";s:35:\"MasterDataController-destroyPartner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:122;a:4:{s:1:\"a\";i:125;s:1:\"b\";s:28:\"UserRegisterController-index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:123;a:4:{s:1:\"a\";i:126;s:1:\"b\";s:27:\"UserRegisterController-show\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:124;a:4:{s:1:\"a\";i:127;s:1:\"b\";s:41:\"UserRegisterController-indexupdatePartner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:125;a:4:{s:1:\"a\";i:128;s:1:\"b\";s:29:\"UserRegisterController-destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:126;a:4:{s:1:\"a\";i:129;s:1:\"b\";s:28:\"UserRegisterController-store\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:127;a:4:{s:1:\"a\";i:130;s:1:\"b\";s:28:\"UserRegisterController-update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:128;a:4:{s:1:\"a\";i:131;s:1:\"b\";s:27:\"UserRegisterController-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:129;a:4:{s:1:\"a\";i:132;s:1:\"b\";s:26:\"UserRegisterController-map\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:5:{i:1;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:5:\"Admin\";s:1:\"c\";s:3:\"web\";s:1:\"p\";a:132:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:6;i:5;i:7;i:6;i:8;i:7;i:9;i:8;i:10;i:9;i:12;i:10;i:13;i:11;i:16;i:12;i:17;i:13;i:18;i:14;i:19;i:15;i:20;i:16;i:21;i:17;i:22;i:18;i:23;i:19;i:24;i:20;i:25;i:21;i:26;i:22;i:28;i:23;i:29;i:24;i:30;i:25;i:31;i:26;i:32;i:27;i:33;i:28;i:34;i:29;i:35;i:30;i:36;i:31;i:37;i:32;i:38;i:33;i:39;i:34;i:40;i:35;i:41;i:36;i:42;i:37;i:43;i:38;i:44;i:39;i:45;i:40;i:46;i:41;i:47;i:42;i:48;i:43;i:49;i:44;i:50;i:45;i:51;i:46;i:52;i:47;i:53;i:48;i:54;i:49;i:55;i:50;i:56;i:51;i:57;i:52;i:58;i:53;i:59;i:54;i:60;i:55;i:61;i:56;i:62;i:57;i:63;i:58;i:64;i:59;i:65;i:60;i:66;i:61;i:67;i:62;i:68;i:63;i:69;i:64;i:70;i:65;i:71;i:66;i:72;i:67;i:73;i:68;i:74;i:69;i:75;i:70;i:76;i:71;i:77;i:72;i:78;i:73;i:79;i:74;i:80;i:75;i:81;i:76;i:82;i:77;i:83;i:78;i:84;i:79;i:85;i:80;i:86;i:81;i:87;i:82;i:88;i:83;i:89;i:84;i:90;i:85;i:91;i:86;i:92;i:87;i:93;i:88;i:94;i:89;i:95;i:90;i:96;i:91;i:97;i:92;i:98;i:93;i:99;i:94;i:100;i:95;i:101;i:96;i:102;i:97;i:103;i:98;i:104;i:99;i:105;i:100;i:106;i:101;i:107;i:102;i:108;i:103;i:109;i:104;i:110;i:105;i:111;i:106;i:112;i:107;i:113;i:108;i:114;i:109;i:115;i:110;i:116;i:111;i:117;i:112;i:118;i:113;i:119;i:114;i:120;i:115;i:121;i:116;i:122;i:117;i:123;i:118;i:124;i:119;i:125;i:120;i:126;i:121;i:127;i:122;i:128;i:123;i:129;i:124;i:130;i:125;i:131;i:126;i:132;}}i:2;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:10:\"DataCenter\";s:1:\"c\";s:3:\"web\";s:1:\"p\";a:10:{i:0;i:6;i:1;i:7;i:2;i:8;i:3;i:9;i:4;i:10;i:5;i:54;i:6;i:55;i:7;i:56;i:8;i:57;i:9;i:58;}}i:3;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:5:\"Admin\";s:1:\"c\";s:3:\"api\";s:1:\"p\";a:0:{}}i:4;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:8:\"Partner1\";s:1:\"c\";s:3:\"web\";s:1:\"p\";a:2:{i:0;i:1;i:1;i:4;}}i:5;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:4:\"User\";s:1:\"c\";s:3:\"web\";s:1:\"p\";a:4:{i:0;i:1;i:1;i:4;i:2;i:11;i:3;i:18;}}}','1734563854');

DROP TABLE IF EXISTS "data_center_creations";
CREATE TABLE "data_center_creations" (
  "id" BIGSERIAL,
  "data_center_name" varchar(255) NOT NULL,
  "data_center_location" varchar(255) DEFAULT NULL,
  "division_id" bigint DEFAULT NULL,
  "latitude" varchar(255) DEFAULT NULL,
  "longitude" varchar(255) DEFAULT NULL,
  "address" varchar(255) DEFAULT NULL,
  "ip_address" varchar(255) DEFAULT NULL,
  "device_range" varchar(255) DEFAULT NULL,
  "device_start_range" varchar(255) DEFAULT NULL,
  "device_end_range" varchar(255) DEFAULT NULL,
  "image" varchar(255) DEFAULT NULL,
  "status" tinyint NOT NULL DEFAULT '1',
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "data_center_creations" VALUES (1,'Mumbai DC',NULL,1,'19.0760','72.8777','Mumbai','192.168.1.1','10','1','10','20250722_072049_fE58.jpg',1,'2025-05-26 04:38:28','2025-07-22 01:50:49'),(2,'Delhi DC',NULL,2,'28.7041','77.1025','New Delhi','192.168.1.2','10','11','20',NULL,1,'2025-05-26 04:47:06','2025-05-26 04:47:06'),(3,'Kolkata DC',NULL,3,'22.5726','88.3639','Kolkata','192.168.1.3','10','21','30',NULL,1,'2025-05-26 04:51:00','2025-05-26 04:51:00');

DROP TABLE IF EXISTS "dc_owner_mappings";
CREATE TABLE "dc_owner_mappings" (
  "id" BIGSERIAL,
  "owner_type_id" bigint DEFAULT NULL,
  "data_center_id" bigint DEFAULT NULL,
  "partner_id" bigint DEFAULT NULL,
  "user_id" bigint DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "dc_owner_mappings" VALUES (1,2,1,1,NULL,'2025-07-16 16:21:49','2025-07-16 16:21:49'),(2,1,1,NULL,1,'2025-07-22 13:46:04','2025-07-22 13:46:04'),(3,1,2,NULL,3,'2025-07-22 13:47:00','2025-07-22 13:47:00'),(4,1,3,NULL,4,'2025-07-22 13:47:07','2025-07-22 13:47:07');

DROP TABLE IF EXISTS "dc_partner_mappings";
CREATE TABLE "dc_partner_mappings" (
  "id" BIGSERIAL,
  "partner_id" bigint NOT NULL,
  "data_center_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "dc_partner_mappings" VALUES (1,1,1,'2025-07-16 16:21:49','2025-07-16 16:21:49');

DROP TABLE IF EXISTS "departments";
CREATE TABLE "departments" (
  "id" BIGSERIAL,
  "department" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "departments" VALUES (1,'IT','2025-06-28 15:58:24','2025-06-28 15:58:24'),(2,'HR','2025-06-28 15:58:24','2025-06-28 15:58:24'),(3,'Sales','2025-06-28 15:58:24','2025-06-28 15:58:24'),(4,'Finance','2025-06-28 15:58:24','2025-06-28 15:58:24');

DROP TABLE IF EXISTS "device_categories";
CREATE TABLE "device_categories" (
  "id" BIGSERIAL,
  "category_name" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "device_categories" VALUES (1,'UPS','2025-06-23 13:21:51','2025-06-23 13:21:51'),(2,'AC','2025-06-23 13:21:51','2025-06-23 13:21:51'),(3,'Security','2025-06-23 13:21:51','2025-06-23 13:21:51');

DROP TABLE IF EXISTS "device_creations";
CREATE TABLE "device_creations" (
  "id" BIGSERIAL,
  "device_name" varchar(255) NOT NULL,
  "data_center_id" bigint DEFAULT NULL,
  "device_category_id" bigint NOT NULL,
  "location" varchar(255) DEFAULT NULL,
  "ip_address" varchar(255) DEFAULT NULL,
  "api_endpoint" varchar(255) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "device_creations" VALUES (1,'Device 1',1,1,NULL,'192.168.1.1',NULL,'2025-06-23 13:22:15','2025-06-23 13:22:15'),(2,'Device 2',1,2,NULL,'192.168.1.2',NULL,'2025-06-23 13:22:15','2025-06-23 13:22:15'),(3,'Device 3',2,3,NULL,'192.168.1.11',NULL,'2025-06-23 13:22:15','2025-06-23 13:22:15');

DROP TABLE IF EXISTS "diagrams";
CREATE TABLE "diagrams" (
  "id" BIGSERIAL,
  "diagram_name" varchar(255) NOT NULL,
  "data_center_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "diagrams" VALUES (1,'Mumbai DC Diagram',1,'2025-05-26 04:39:49','2025-05-26 04:39:49'),(2,'Delhi DC Diagram',2,'2025-05-26 04:48:47','2025-05-26 04:48:47'),(3,'Kolkata DC Diagram',3,'2025-05-26 04:51:48','2025-05-26 04:51:48');

DROP TABLE IF EXISTS "divisions";
CREATE TABLE "divisions" (
  "id" BIGSERIAL,
  "division_name" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "divisions" VALUES (1,'North','2025-07-22 01:46:16','2025-07-22 01:46:16'),(2,'South','2025-07-22 01:46:21','2025-07-22 01:46:21'),(3,'East','2025-07-22 01:46:26','2025-07-22 01:46:26'),(4,'West','2025-07-22 01:46:31','2025-07-22 01:46:31');

DROP TABLE IF EXISTS "do_operation_modes";
CREATE TABLE "do_operation_modes" (
  "id" BIGSERIAL,
  "mode_name" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "do_operation_modes" VALUES (1,'Manual','2025-06-28 16:03:43','2025-06-28 16:03:48'),(2,'Toggle','2025-06-28 16:03:43','2025-06-28 16:03:43'),(3,'Time','2025-06-28 16:03:43','2025-06-28 16:03:43');

DROP TABLE IF EXISTS "do_operation_triggers";
CREATE TABLE "do_operation_triggers" (
  "id" BIGSERIAL,
  "rule" bigint DEFAULT NULL,
  "sensor_id" bigint NOT NULL,
  "mode_id" bigint NOT NULL,
  "repeat_id" bigint DEFAULT NULL,
  "day_id" text,
  "on_time" varchar(255) DEFAULT NULL,
  "off_time" varchar(255) DEFAULT NULL,
  "duration" bigint DEFAULT NULL,
  "off_duration" bigint DEFAULT NULL,
  "dateFrom" date DEFAULT NULL,
  "dateTo" date DEFAULT NULL,
  "status" smallint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "do_operation_triggers" VALUES (1,1,13,2,NULL,'[]',NULL,NULL,1,1,NULL,NULL,1,'2025-07-16 16:47:00','2025-07-16 16:47:00');

DROP TABLE IF EXISTS "edges";
CREATE TABLE "edges" (
  "id" BIGSERIAL,
  "diagram_id" bigint NOT NULL,
  "data_center_id" bigint NOT NULL,
  "edge_id" varchar(255) NOT NULL,
  "source" varchar(255) NOT NULL,
  "target" varchar(255) NOT NULL,
  "source_handle" varchar(255) DEFAULT NULL,
  "target_handle" varchar(255) DEFAULT NULL,
  "type" varchar(255) NOT NULL DEFAULT 'default',
  "style" TEXT,
  "marker_end" TEXT,
  "data" TEXT,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id"),
  UNIQUE ("edge_id"),
  CONSTRAINT "edges_data_center_id_foreign" FOREIGN KEY ("data_center_id") REFERENCES "data_center_creations" ("id") ON DELETE CASCADE,
  CONSTRAINT "edges_diagram_id_foreign" FOREIGN KEY ("diagram_id") REFERENCES "diagrams" ("id") ON DELETE CASCADE
);

INSERT INTO "edges" VALUES (1,1,1,'reactflow__edge-1748255920893left-source-1748255929699left-target','1748255920893','1748255929699','left-source','left-target','smoothstep','\"null\"','\"{\\\"type\\\":\\\"arrowclosed\\\"}\"','\"null\"','2025-05-26 04:39:49','2025-05-26 04:39:49'),(2,1,1,'reactflow__edge-1748255920893top-source-1748255921781top-target','1748255920893','1748255921781','top-source','top-target','smoothstep','\"null\"','\"{\\\"type\\\":\\\"arrowclosed\\\"}\"','\"null\"','2025-05-26 04:39:49','2025-05-26 04:39:49'),(3,1,1,'reactflow__edge-1748255921781right-source-1748255931649right-target','1748255921781','1748255931649','right-source','right-target','smoothstep','\"null\"','\"{\\\"type\\\":\\\"arrowclosed\\\"}\"','\"null\"','2025-05-26 04:39:49','2025-05-26 04:39:49'),(4,1,1,'reactflow__edge-1748255931649left-source-1748255929699right-target','1748255931649','1748255929699','left-source','right-target','smoothstep','\"null\"','\"{\\\"type\\\":\\\"arrowclosed\\\"}\"','\"null\"','2025-05-26 04:39:49','2025-05-26 04:39:49'),(5,1,1,'reactflow__edge-1748255921781bottom-source-1748255931649top-source','1748255921781','1748255931649','bottom-source','top-source','smoothstep','\"null\"','\"{\\\"type\\\":\\\"arrowclosed\\\"}\"','\"null\"','2025-05-26 04:39:49','2025-05-26 04:39:49'),(6,1,1,'reactflow__edge-1748255921781left-source-1748255929699top-source','1748255921781','1748255929699','left-source','top-source','smoothstep','\"null\"','\"{\\\"type\\\":\\\"arrowclosed\\\"}\"','\"null\"','2025-05-26 04:39:49','2025-05-26 04:39:49'),(7,2,2,'reactflow__edge-1748256397424top-source-1748256395938top-source','1748256397424','1748256395938','top-source','top-source','smoothstep','\"null\"','\"{\\\"type\\\":\\\"arrowclosed\\\"}\"','\"null\"','2025-05-26 04:48:47','2025-05-26 04:48:47'),(8,2,2,'reactflow__edge-1748256417464right-source-1748256435633left-target','1748256417464','1748256435633','right-source','left-target','smoothstep','\"null\"','\"{\\\"type\\\":\\\"arrowclosed\\\"}\"','\"null\"','2025-05-26 04:48:47','2025-05-26 04:48:47'),(9,2,2,'reactflow__edge-1748256450163top-source-1748256417464bottom-target','1748256450163','1748256417464','top-source','bottom-target','smoothstep','\"null\"','\"{\\\"type\\\":\\\"arrowclosed\\\"}\"','\"null\"','2025-05-26 04:48:47','2025-05-26 04:48:47'),(10,2,2,'reactflow__edge-1748256435633right-source-1748256450163bottom-target','1748256435633','1748256450163','right-source','bottom-target','smoothstep','\"null\"','\"{\\\"type\\\":\\\"arrowclosed\\\"}\"','\"null\"','2025-05-26 04:48:47','2025-05-26 04:48:47'),(11,3,3,'reactflow__edge-1748256668627top-source-1748256669497top-target','1748256668627','1748256669497','top-source','top-target','smoothstep','\"null\"','\"{\\\"type\\\":\\\"arrowclosed\\\"}\"','\"null\"','2025-05-26 04:51:48','2025-05-26 04:51:48'),(12,3,3,'reactflow__edge-1748256669497bottom-source-1748256668627bottom-source','1748256669497','1748256668627','bottom-source','bottom-source','smoothstep','\"null\"','\"{\\\"type\\\":\\\"arrowclosed\\\"}\"','\"null\"','2025-05-26 04:51:48','2025-05-26 04:51:48'),(13,3,3,'reactflow__edge-1748256668627right-source-1748256675985left-target','1748256668627','1748256675985','right-source','left-target','smoothstep','\"null\"','\"{\\\"type\\\":\\\"arrowclosed\\\"}\"','\"null\"','2025-05-26 04:51:48','2025-05-26 04:51:48');

DROP TABLE IF EXISTS "failed_jobs";
CREATE TABLE "failed_jobs" (
  "id" BIGSERIAL,
  "uuid" varchar(255) NOT NULL,
  "connection" text NOT NULL,
  "queue" text NOT NULL,
  "payload" TEXT NOT NULL,
  "exception" TEXT NOT NULL,
  "failed_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  UNIQUE ("uuid")
);

INSERT INTO "failed_jobs" VALUES (1,'ef893388-c20b-42a4-b3e0-3fafbe0122c4','database','default','{\"uuid\":\"ef893388-c20b-42a4-b3e0-3fafbe0122c4\",\"displayName\":\"App\\\\Events\\\\MQTTPublishEvent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:27:\\\"App\\\\Events\\\\MQTTPublishEvent\\\":1:{s:10:\\\"sensorData\\\";a:2:{s:5:\\\"dc_id\\\";i:2;s:12:\\\"sensor_types\\\";a:4:{i:0;a:2:{s:2:\\\"id\\\";i:1;s:7:\\\"sensors\\\";a:10:{i:0;a:2:{s:2:\\\"id\\\";i:1;s:3:\\\"val\\\";i:31;}i:1;a:2:{s:2:\\\"id\\\";i:1000002;s:3:\\\"val\\\";i:32;}i:2;a:2:{s:2:\\\"id\\\";i:1000003;s:3:\\\"val\\\";i:33;}i:3;a:2:{s:2:\\\"id\\\";i:1000004;s:3:\\\"val\\\";i:34;}i:4;a:2:{s:2:\\\"id\\\";i:1000005;s:3:\\\"val\\\";i:35;}i:5;a:2:{s:2:\\\"id\\\";i:1000006;s:3:\\\"val\\\";i:36;}i:6;a:2:{s:2:\\\"id\\\";i:1000007;s:3:\\\"val\\\";i:37;}i:7;a:2:{s:2:\\\"id\\\";i:1000008;s:3:\\\"val\\\";i:38;}i:8;a:2:{s:2:\\\"id\\\";i:1000009;s:3:\\\"val\\\";i:39;}i:9;a:2:{s:2:\\\"id\\\";i:1000010;s:3:\\\"val\\\";i:40;}}}i:1;a:2:{s:2:\\\"id\\\";i:2;s:7:\\\"sensors\\\";a:10:{i:0;a:2:{s:2:\\\"id\\\";i:1000011;s:3:\\\"val\\\";i:71;}i:1;a:2:{s:2:\\\"id\\\";i:1000012;s:3:\\\"val\\\";i:72;}i:2;a:2:{s:2:\\\"id\\\";i:1000013;s:3:\\\"val\\\";i:73;}i:3;a:2:{s:2:\\\"id\\\";i:1000014;s:3:\\\"val\\\";i:74;}i:4;a:2:{s:2:\\\"id\\\";i:1000015;s:3:\\\"val\\\";i:75;}i:5;a:2:{s:2:\\\"id\\\";i:1000016;s:3:\\\"val\\\";i:76;}i:6;a:2:{s:2:\\\"id\\\";i:1000017;s:3:\\\"val\\\";i:77;}i:7;a:2:{s:2:\\\"id\\\";i:1000018;s:3:\\\"val\\\";i:78;}i:8;a:2:{s:2:\\\"id\\\";i:1000019;s:3:\\\"val\\\";i:79;}i:9;a:2:{s:2:\\\"id\\\";i:1000020;s:3:\\\"val\\\";i:80;}}}i:2;a:2:{s:2:\\\"id\\\";i:3;s:7:\\\"sensors\\\";a:8:{i:0;a:2:{s:2:\\\"id\\\";i:1000021;s:3:\\\"val\\\";i:1;}i:1;a:2:{s:2:\\\"id\\\";i:1000022;s:3:\\\"val\\\";i:1;}i:2;a:2:{s:2:\\\"id\\\";i:1000023;s:3:\\\"val\\\";i:1;}i:3;a:2:{s:2:\\\"id\\\";i:1000024;s:3:\\\"val\\\";i:1;}i:4;a:2:{s:2:\\\"id\\\";i:1000025;s:3:\\\"val\\\";i:1;}i:5;a:2:{s:2:\\\"id\\\";i:1000026;s:3:\\\"val\\\";i:1;}i:6;a:2:{s:2:\\\"id\\\";i:1000027;s:3:\\\"val\\\";i:1;}i:7;a:2:{s:2:\\\"id\\\";i:1000028;s:3:\\\"val\\\";i:1;}}}i:3;a:2:{s:2:\\\"id\\\";i:4;s:7:\\\"sensors\\\";a:10:{i:0;a:2:{s:2:\\\"id\\\";i:1000029;s:3:\\\"val\\\";i:1;}i:1;a:2:{s:2:\\\"id\\\";i:1000030;s:3:\\\"val\\\";i:1;}i:2;a:2:{s:2:\\\"id\\\";i:1000031;s:3:\\\"val\\\";i:1;}i:3;a:2:{s:2:\\\"id\\\";i:1000032;s:3:\\\"val\\\";i:1;}i:4;a:2:{s:2:\\\"id\\\";i:1000033;s:3:\\\"val\\\";i:1;}i:5;a:2:{s:2:\\\"id\\\";i:1000034;s:3:\\\"val\\\";i:1;}i:6;a:2:{s:2:\\\"id\\\";i:1000035;s:3:\\\"val\\\";i:1;}i:7;a:2:{s:2:\\\"id\\\";i:1000036;s:3:\\\"val\\\";i:1;}i:8;a:2:{s:2:\\\"id\\\";i:1000037;s:3:\\\"val\\\";i:1;}i:9;a:2:{s:2:\\\"id\\\";i:1000038;s:3:\\\"val\\\";i:1;}}}}}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}','Illuminate\\Queue\\MaxAttemptsExceededException: App\\Events\\MQTTPublishEvent has been attempted too many times. in C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\MaxAttemptsExceededException.php:24\nStack trace:\n#0 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(794): Illuminate\\Queue\\MaxAttemptsExceededException::forJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob))\n#1 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(528): Illuminate\\Queue\\Worker->maxAttemptsExceededException(Object(Illuminate\\Queue\\Jobs\\DatabaseJob))\n#2 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(431): Illuminate\\Queue\\Worker->markJobAsFailedIfAlreadyExceedsMaxAttempts(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), 1)\n#3 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(392): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#4 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#5 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#6 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#7 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#8 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#9 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#10 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#11 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#12 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#13 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#14 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#15 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\symfony\\console\\Application.php(1094): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#16 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#17 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#18 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#19 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 C:\\xampp\\htdocs\\dcimBackendApi\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#21 {main}','2025-05-15 01:52:03'),(2,'18ad8b3c-67e6-4955-8768-735622e73369','database','default','{\"uuid\":\"18ad8b3c-67e6-4955-8768-735622e73369\",\"displayName\":\"App\\\\Events\\\\MQTTPublishEvent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:27:\\\"App\\\\Events\\\\MQTTPublishEvent\\\":1:{s:10:\\\"sensorData\\\";a:2:{s:5:\\\"dc_id\\\";i:2;s:12:\\\"sensor_types\\\";a:4:{i:0;a:2:{s:2:\\\"id\\\";i:1;s:7:\\\"sensors\\\";a:10:{i:0;a:2:{s:2:\\\"id\\\";i:1;s:3:\\\"val\\\";i:31;}i:1;a:2:{s:2:\\\"id\\\";i:1000002;s:3:\\\"val\\\";i:32;}i:2;a:2:{s:2:\\\"id\\\";i:1000003;s:3:\\\"val\\\";i:33;}i:3;a:2:{s:2:\\\"id\\\";i:1000004;s:3:\\\"val\\\";i:34;}i:4;a:2:{s:2:\\\"id\\\";i:1000005;s:3:\\\"val\\\";i:35;}i:5;a:2:{s:2:\\\"id\\\";i:1000006;s:3:\\\"val\\\";i:36;}i:6;a:2:{s:2:\\\"id\\\";i:1000007;s:3:\\\"val\\\";i:37;}i:7;a:2:{s:2:\\\"id\\\";i:1000008;s:3:\\\"val\\\";i:38;}i:8;a:2:{s:2:\\\"id\\\";i:1000009;s:3:\\\"val\\\";i:39;}i:9;a:2:{s:2:\\\"id\\\";i:1000010;s:3:\\\"val\\\";i:40;}}}i:1;a:2:{s:2:\\\"id\\\";i:2;s:7:\\\"sensors\\\";a:10:{i:0;a:2:{s:2:\\\"id\\\";i:1000011;s:3:\\\"val\\\";i:71;}i:1;a:2:{s:2:\\\"id\\\";i:1000012;s:3:\\\"val\\\";i:72;}i:2;a:2:{s:2:\\\"id\\\";i:1000013;s:3:\\\"val\\\";i:73;}i:3;a:2:{s:2:\\\"id\\\";i:1000014;s:3:\\\"val\\\";i:74;}i:4;a:2:{s:2:\\\"id\\\";i:1000015;s:3:\\\"val\\\";i:75;}i:5;a:2:{s:2:\\\"id\\\";i:1000016;s:3:\\\"val\\\";i:76;}i:6;a:2:{s:2:\\\"id\\\";i:1000017;s:3:\\\"val\\\";i:77;}i:7;a:2:{s:2:\\\"id\\\";i:1000018;s:3:\\\"val\\\";i:78;}i:8;a:2:{s:2:\\\"id\\\";i:1000019;s:3:\\\"val\\\";i:79;}i:9;a:2:{s:2:\\\"id\\\";i:1000020;s:3:\\\"val\\\";i:80;}}}i:2;a:2:{s:2:\\\"id\\\";i:3;s:7:\\\"sensors\\\";a:8:{i:0;a:2:{s:2:\\\"id\\\";i:1000021;s:3:\\\"val\\\";i:1;}i:1;a:2:{s:2:\\\"id\\\";i:1000022;s:3:\\\"val\\\";i:1;}i:2;a:2:{s:2:\\\"id\\\";i:1000023;s:3:\\\"val\\\";i:1;}i:3;a:2:{s:2:\\\"id\\\";i:1000024;s:3:\\\"val\\\";i:1;}i:4;a:2:{s:2:\\\"id\\\";i:1000025;s:3:\\\"val\\\";i:1;}i:5;a:2:{s:2:\\\"id\\\";i:1000026;s:3:\\\"val\\\";i:1;}i:6;a:2:{s:2:\\\"id\\\";i:1000027;s:3:\\\"val\\\";i:1;}i:7;a:2:{s:2:\\\"id\\\";i:1000028;s:3:\\\"val\\\";i:1;}}}i:3;a:2:{s:2:\\\"id\\\";i:4;s:7:\\\"sensors\\\";a:10:{i:0;a:2:{s:2:\\\"id\\\";i:1000029;s:3:\\\"val\\\";i:1;}i:1;a:2:{s:2:\\\"id\\\";i:1000030;s:3:\\\"val\\\";i:1;}i:2;a:2:{s:2:\\\"id\\\";i:1000031;s:3:\\\"val\\\";i:1;}i:3;a:2:{s:2:\\\"id\\\";i:1000032;s:3:\\\"val\\\";i:1;}i:4;a:2:{s:2:\\\"id\\\";i:1000033;s:3:\\\"val\\\";i:1;}i:5;a:2:{s:2:\\\"id\\\";i:1000034;s:3:\\\"val\\\";i:1;}i:6;a:2:{s:2:\\\"id\\\";i:1000035;s:3:\\\"val\\\";i:1;}i:7;a:2:{s:2:\\\"id\\\";i:1000036;s:3:\\\"val\\\";i:1;}i:8;a:2:{s:2:\\\"id\\\";i:1000037;s:3:\\\"val\\\";i:1;}i:9;a:2:{s:2:\\\"id\\\";i:1000038;s:3:\\\"val\\\";i:1;}}}}}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}','Illuminate\\Queue\\MaxAttemptsExceededException: App\\Events\\MQTTPublishEvent has been attempted too many times. in C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\MaxAttemptsExceededException.php:24\nStack trace:\n#0 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(794): Illuminate\\Queue\\MaxAttemptsExceededException::forJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob))\n#1 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(528): Illuminate\\Queue\\Worker->maxAttemptsExceededException(Object(Illuminate\\Queue\\Jobs\\DatabaseJob))\n#2 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(431): Illuminate\\Queue\\Worker->markJobAsFailedIfAlreadyExceedsMaxAttempts(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), 1)\n#3 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(392): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#4 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#5 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#6 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#7 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#8 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#9 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#10 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#11 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#12 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#13 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#14 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#15 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\symfony\\console\\Application.php(1094): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#16 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#17 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#18 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#19 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#20 C:\\xampp\\htdocs\\dcimBackendApi\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#21 {main}','2025-05-15 01:52:03'),(3,'244962b9-e1f1-460f-ab3a-b851944e0586','database','default','{\"uuid\":\"244962b9-e1f1-460f-ab3a-b851944e0586\",\"displayName\":\"App\\\\Events\\\\MQTTPublishEvent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:27:\\\"App\\\\Events\\\\MQTTPublishEvent\\\":1:{s:10:\\\"sensorData\\\";a:2:{s:5:\\\"dc_id\\\";i:2;s:12:\\\"sensor_types\\\";a:4:{i:0;a:2:{s:2:\\\"id\\\";i:1;s:7:\\\"sensors\\\";a:10:{i:0;a:2:{s:2:\\\"id\\\";i:1;s:3:\\\"val\\\";i:31;}i:1;a:2:{s:2:\\\"id\\\";i:1000002;s:3:\\\"val\\\";i:32;}i:2;a:2:{s:2:\\\"id\\\";i:1000003;s:3:\\\"val\\\";i:33;}i:3;a:2:{s:2:\\\"id\\\";i:1000004;s:3:\\\"val\\\";i:34;}i:4;a:2:{s:2:\\\"id\\\";i:1000005;s:3:\\\"val\\\";i:35;}i:5;a:2:{s:2:\\\"id\\\";i:1000006;s:3:\\\"val\\\";i:36;}i:6;a:2:{s:2:\\\"id\\\";i:1000007;s:3:\\\"val\\\";i:37;}i:7;a:2:{s:2:\\\"id\\\";i:1000008;s:3:\\\"val\\\";i:38;}i:8;a:2:{s:2:\\\"id\\\";i:1000009;s:3:\\\"val\\\";i:39;}i:9;a:2:{s:2:\\\"id\\\";i:1000010;s:3:\\\"val\\\";i:40;}}}i:1;a:2:{s:2:\\\"id\\\";i:2;s:7:\\\"sensors\\\";a:10:{i:0;a:2:{s:2:\\\"id\\\";i:1000011;s:3:\\\"val\\\";i:71;}i:1;a:2:{s:2:\\\"id\\\";i:1000012;s:3:\\\"val\\\";i:72;}i:2;a:2:{s:2:\\\"id\\\";i:1000013;s:3:\\\"val\\\";i:73;}i:3;a:2:{s:2:\\\"id\\\";i:1000014;s:3:\\\"val\\\";i:74;}i:4;a:2:{s:2:\\\"id\\\";i:1000015;s:3:\\\"val\\\";i:75;}i:5;a:2:{s:2:\\\"id\\\";i:1000016;s:3:\\\"val\\\";i:76;}i:6;a:2:{s:2:\\\"id\\\";i:1000017;s:3:\\\"val\\\";i:77;}i:7;a:2:{s:2:\\\"id\\\";i:1000018;s:3:\\\"val\\\";i:78;}i:8;a:2:{s:2:\\\"id\\\";i:1000019;s:3:\\\"val\\\";i:79;}i:9;a:2:{s:2:\\\"id\\\";i:1000020;s:3:\\\"val\\\";i:80;}}}i:2;a:2:{s:2:\\\"id\\\";i:3;s:7:\\\"sensors\\\";a:8:{i:0;a:2:{s:2:\\\"id\\\";i:1000021;s:3:\\\"val\\\";i:1;}i:1;a:2:{s:2:\\\"id\\\";i:1000022;s:3:\\\"val\\\";i:1;}i:2;a:2:{s:2:\\\"id\\\";i:1000023;s:3:\\\"val\\\";i:1;}i:3;a:2:{s:2:\\\"id\\\";i:1000024;s:3:\\\"val\\\";i:1;}i:4;a:2:{s:2:\\\"id\\\";i:1000025;s:3:\\\"val\\\";i:1;}i:5;a:2:{s:2:\\\"id\\\";i:1000026;s:3:\\\"val\\\";i:1;}i:6;a:2:{s:2:\\\"id\\\";i:1000027;s:3:\\\"val\\\";i:1;}i:7;a:2:{s:2:\\\"id\\\";i:1000028;s:3:\\\"val\\\";i:1;}}}i:3;a:2:{s:2:\\\"id\\\";i:4;s:7:\\\"sensors\\\";a:10:{i:0;a:2:{s:2:\\\"id\\\";i:1000029;s:3:\\\"val\\\";i:1;}i:1;a:2:{s:2:\\\"id\\\";i:1000030;s:3:\\\"val\\\";i:1;}i:2;a:2:{s:2:\\\"id\\\";i:1000031;s:3:\\\"val\\\";i:1;}i:3;a:2:{s:2:\\\"id\\\";i:1000032;s:3:\\\"val\\\";i:1;}i:4;a:2:{s:2:\\\"id\\\";i:1000033;s:3:\\\"val\\\";i:1;}i:5;a:2:{s:2:\\\"id\\\";i:1000034;s:3:\\\"val\\\";i:1;}i:6;a:2:{s:2:\\\"id\\\";i:1000035;s:3:\\\"val\\\";i:1;}i:7;a:2:{s:2:\\\"id\\\";i:1000036;s:3:\\\"val\\\";i:1;}i:8;a:2:{s:2:\\\"id\\\";i:1000037;s:3:\\\"val\\\";i:1;}i:9;a:2:{s:2:\\\"id\\\";i:1000038;s:3:\\\"val\\\";i:1;}}}}}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}','Illuminate\\Queue\\MaxAttemptsExceededException: App\\Events\\MQTTPublishEvent has been attempted too many times. in C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\MaxAttemptsExceededException.php:24\nStack trace:\n#0 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(794): Illuminate\\Queue\\MaxAttemptsExceededException::forJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob))\n#1 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(528): Illuminate\\Queue\\Worker->maxAttemptsExceededException(Object(Illuminate\\Queue\\Jobs\\DatabaseJob))\n#2 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(431): Illuminate\\Queue\\Worker->markJobAsFailedIfAlreadyExceedsMaxAttempts(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), 1)\n#3 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(392): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#4 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#5 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#6 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#7 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#8 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#9 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#10 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#11 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#12 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#13 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#14 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#15 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\symfony\\console\\Application.php(1094): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#16 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#17 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#18 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#19 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#20 C:\\xampp\\htdocs\\dcimBackendApi\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#21 {main}','2025-05-15 01:52:03'),(4,'8d9b1c1d-1577-4b77-8c38-8c520894563a','database','default','{\"uuid\":\"8d9b1c1d-1577-4b77-8c38-8c520894563a\",\"displayName\":\"App\\\\Events\\\\MQTTPublishEvent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:27:\\\"App\\\\Events\\\\MQTTPublishEvent\\\":1:{s:10:\\\"sensorData\\\";a:2:{s:5:\\\"dc_id\\\";i:2;s:12:\\\"sensor_types\\\";a:4:{i:0;a:2:{s:2:\\\"id\\\";i:1;s:7:\\\"sensors\\\";a:10:{i:0;a:2:{s:2:\\\"id\\\";i:1;s:3:\\\"val\\\";i:31;}i:1;a:2:{s:2:\\\"id\\\";i:1000002;s:3:\\\"val\\\";i:32;}i:2;a:2:{s:2:\\\"id\\\";i:1000003;s:3:\\\"val\\\";i:33;}i:3;a:2:{s:2:\\\"id\\\";i:1000004;s:3:\\\"val\\\";i:34;}i:4;a:2:{s:2:\\\"id\\\";i:1000005;s:3:\\\"val\\\";i:35;}i:5;a:2:{s:2:\\\"id\\\";i:1000006;s:3:\\\"val\\\";i:36;}i:6;a:2:{s:2:\\\"id\\\";i:1000007;s:3:\\\"val\\\";i:37;}i:7;a:2:{s:2:\\\"id\\\";i:1000008;s:3:\\\"val\\\";i:38;}i:8;a:2:{s:2:\\\"id\\\";i:1000009;s:3:\\\"val\\\";i:39;}i:9;a:2:{s:2:\\\"id\\\";i:1000010;s:3:\\\"val\\\";i:40;}}}i:1;a:2:{s:2:\\\"id\\\";i:2;s:7:\\\"sensors\\\";a:10:{i:0;a:2:{s:2:\\\"id\\\";i:1000011;s:3:\\\"val\\\";i:71;}i:1;a:2:{s:2:\\\"id\\\";i:1000012;s:3:\\\"val\\\";i:72;}i:2;a:2:{s:2:\\\"id\\\";i:1000013;s:3:\\\"val\\\";i:73;}i:3;a:2:{s:2:\\\"id\\\";i:1000014;s:3:\\\"val\\\";i:74;}i:4;a:2:{s:2:\\\"id\\\";i:1000015;s:3:\\\"val\\\";i:75;}i:5;a:2:{s:2:\\\"id\\\";i:1000016;s:3:\\\"val\\\";i:76;}i:6;a:2:{s:2:\\\"id\\\";i:1000017;s:3:\\\"val\\\";i:77;}i:7;a:2:{s:2:\\\"id\\\";i:1000018;s:3:\\\"val\\\";i:78;}i:8;a:2:{s:2:\\\"id\\\";i:1000019;s:3:\\\"val\\\";i:79;}i:9;a:2:{s:2:\\\"id\\\";i:1000020;s:3:\\\"val\\\";i:80;}}}i:2;a:2:{s:2:\\\"id\\\";i:3;s:7:\\\"sensors\\\";a:8:{i:0;a:2:{s:2:\\\"id\\\";i:1000021;s:3:\\\"val\\\";i:1;}i:1;a:2:{s:2:\\\"id\\\";i:1000022;s:3:\\\"val\\\";i:1;}i:2;a:2:{s:2:\\\"id\\\";i:1000023;s:3:\\\"val\\\";i:1;}i:3;a:2:{s:2:\\\"id\\\";i:1000024;s:3:\\\"val\\\";i:1;}i:4;a:2:{s:2:\\\"id\\\";i:1000025;s:3:\\\"val\\\";i:1;}i:5;a:2:{s:2:\\\"id\\\";i:1000026;s:3:\\\"val\\\";i:1;}i:6;a:2:{s:2:\\\"id\\\";i:1000027;s:3:\\\"val\\\";i:1;}i:7;a:2:{s:2:\\\"id\\\";i:1000028;s:3:\\\"val\\\";i:1;}}}i:3;a:2:{s:2:\\\"id\\\";i:4;s:7:\\\"sensors\\\";a:10:{i:0;a:2:{s:2:\\\"id\\\";i:1000029;s:3:\\\"val\\\";i:1;}i:1;a:2:{s:2:\\\"id\\\";i:1000030;s:3:\\\"val\\\";i:1;}i:2;a:2:{s:2:\\\"id\\\";i:1000031;s:3:\\\"val\\\";i:1;}i:3;a:2:{s:2:\\\"id\\\";i:1000032;s:3:\\\"val\\\";i:1;}i:4;a:2:{s:2:\\\"id\\\";i:1000033;s:3:\\\"val\\\";i:1;}i:5;a:2:{s:2:\\\"id\\\";i:1000034;s:3:\\\"val\\\";i:1;}i:6;a:2:{s:2:\\\"id\\\";i:1000035;s:3:\\\"val\\\";i:1;}i:7;a:2:{s:2:\\\"id\\\";i:1000036;s:3:\\\"val\\\";i:1;}i:8;a:2:{s:2:\\\"id\\\";i:1000037;s:3:\\\"val\\\";i:1;}i:9;a:2:{s:2:\\\"id\\\";i:1000038;s:3:\\\"val\\\";i:1;}}}}}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}','Illuminate\\Queue\\MaxAttemptsExceededException: App\\Events\\MQTTPublishEvent has been attempted too many times. in C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\MaxAttemptsExceededException.php:24\nStack trace:\n#0 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(794): Illuminate\\Queue\\MaxAttemptsExceededException::forJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob))\n#1 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(528): Illuminate\\Queue\\Worker->maxAttemptsExceededException(Object(Illuminate\\Queue\\Jobs\\DatabaseJob))\n#2 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(431): Illuminate\\Queue\\Worker->markJobAsFailedIfAlreadyExceedsMaxAttempts(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), 1)\n#3 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(392): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#4 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#5 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#6 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#7 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#8 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#9 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#10 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#11 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#12 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#13 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#14 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#15 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\symfony\\console\\Application.php(1094): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#16 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#17 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#18 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#19 C:\\xampp\\htdocs\\dcimBackendApi\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#20 C:\\xampp\\htdocs\\dcimBackendApi\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#21 {main}','2025-05-15 01:52:03');

DROP TABLE IF EXISTS "migrations";
CREATE TABLE "migrations" (
  "id" BIGSERIAL,
  "migration" varchar(255) NOT NULL,
  "batch" int NOT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "migrations" VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2024_03_07_055627_create_products_table',1),(6,'2024_03_07_064503_create_permission_tables',1),(7,'2024_03_14_130752_create_cache_table',1),(8,'2024_05_13_110531_create_data_center_creations_table',1),(9,'2024_05_23_044238_create_diagrams_table',1),(10,'2024_05_23_044439_create_nodes_table',1),(11,'2024_05_23_044719_create_edges_table',1),(12,'2024_06_14_045314_create_sensor_types_table',1),(13,'2024_06_14_050410_create_sensors_table',1),(14,'2024_06_22_065910_create_device_categories_table',1),(15,'2024_06_22_070014_create_device_creations_table',1),(16,'2024_06_22_070636_create_sensor_mappings_table',1),(17,'2024_06_22_082305_create_alarm_acknowledgements_table',1),(18,'2024_06_22_082405_create_alarm_acknowledgement_logs_table',1),(19,'2024_06_25_114758_create_threshold_types_table',1),(20,'2024_06_25_114959_create_threshold_values_table',1),(21,'2024_06_28_095907_create_sensor_log_values_table',1),(22,'2024_06_28_102029_create_sensor_log_errors_table',1),(23,'2024_06_28_155543_create_user_types_table',1),(24,'2024_06_28_155702_create_user_roles_table',1),(25,'2024_06_28_155800_create_departments_table',1),(26,'2024_06_28_155913_create_user_type_masters_table',1),(27,'2024_06_28_160321_create_do_operation_modes_table',1),(28,'2024_07_12_040409_create_do_operation_triggers_table',1),(29,'2024_07_12_103332_create_partners_table',1),(30,'2024_07_12_103350_create_owner_types_table',1),(31,'2024_07_12_103407_create_dc_partner_mappings_table',1),(32,'2024_07_12_103429_create_dc_owner_mappings_table',1),(33,'2024_07_15_120405_create_divisions_table',1),(34,'2024_07_16_105216_create_states_table',1),(35,'2024_07_20_062145_create_sensor_max_log_values_table',1),(36,'2024_08_02_133400_create_user_register_logs_table',1);

DROP TABLE IF EXISTS "model_has_permissions";
CREATE TABLE "model_has_permissions" (
  "permission_id" bigint NOT NULL,
  "model_type" varchar(255) NOT NULL,
  "model_id" bigint NOT NULL,
  PRIMARY KEY ("permission_id","model_id","model_type")
);

DROP TABLE IF EXISTS "model_has_roles";
CREATE TABLE "model_has_roles" (
  "role_id" bigint NOT NULL,
  "model_type" varchar(255) NOT NULL,
  "model_id" bigint NOT NULL,
  PRIMARY KEY ("role_id","model_id","model_type")
);

INSERT INTO "model_has_roles" VALUES (1,'App\\Models\\User',1),(5,'App\\Models\\User',5);

DROP TABLE IF EXISTS "nodes";
CREATE TABLE "nodes" (
  "id" BIGSERIAL,
  "diagram_id" bigint NOT NULL,
  "data_center_id" bigint NOT NULL,
  "node_id" varchar(255) NOT NULL,
  "type" varchar(255) DEFAULT NULL,
  "position" TEXT,
  "data" TEXT,
  "style" TEXT,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id"),
  UNIQUE ("node_id"),
  CONSTRAINT "nodes_data_center_id_foreign" FOREIGN KEY ("data_center_id") REFERENCES "data_center_creations" ("id") ON DELETE CASCADE,
  CONSTRAINT "nodes_diagram_id_foreign" FOREIGN KEY ("diagram_id") REFERENCES "diagrams" ("id") ON DELETE CASCADE
);

INSERT INTO "nodes" VALUES (1,1,1,'1748255920893','sensorNode','{\"x\":44.97607172051699,\"y\":431.13783783783787}','{\"label\":\"Temperature\",\"device\":\"Device 1\",\"device_id\":\"1\",\"sensor_type\":\"1\",\"sensor_type_name\":\"Temperature\"}','{\"width\":160,\"height\":100,\"borderStyle\":\"solid\",\"borderWidth\":1,\"borderColor\":\"black\",\"backgroundColor\":\"rgba(255, 255, 255, 0.7)\",\"borderRadius\":5}','2025-05-26 04:39:49','2025-07-06 05:43:24'),(2,1,1,'1748255921781','sensorNode','{\"x\":298.50893708381186,\"y\":431.13783783783787}','{\"label\":\"Humidity\",\"device\":\"Device 2\",\"device_id\":\"2\",\"sensor_type\":\"2\",\"sensor_type_name\":\"Humidity\"}','{\"width\":160,\"height\":100,\"borderStyle\":\"solid\",\"borderWidth\":1,\"borderColor\":\"black\",\"backgroundColor\":\"rgba(255, 255, 255, 0.7)\",\"borderRadius\":5}','2025-05-26 04:39:49','2025-07-06 05:42:55'),(3,1,1,'1748255929699','sensorNode','{\"x\":326.6874401858547,\"y\":113.88214227926137}','{\"label\":\"Smoke\",\"device\":\"Device 1\",\"device_id\":\"1\",\"sensor_type\":\"3\",\"sensor_type_name\":\"Smoke\"}','{\"width\":160,\"height\":100,\"borderStyle\":\"solid\",\"borderWidth\":1,\"borderColor\":\"black\",\"backgroundColor\":\"rgba(255, 255, 255, 0.7)\",\"borderRadius\":5}','2025-05-26 04:39:49','2025-07-06 05:43:24'),(4,1,1,'1748255931649','actuatorNode','{\"x\":521.8213719047395,\"y\":272.5085390978716}','{\"label\":\"DO\",\"device\":\"Device 3\",\"device_id\":\"3\",\"sensor_type\":\"4\",\"sensor_type_name\":\"DO\"}','{\"width\":160,\"height\":100,\"borderStyle\":\"solid\",\"borderWidth\":1,\"borderColor\":\"black\",\"backgroundColor\":\"rgba(255, 255, 255, 0.7)\",\"borderRadius\":5}','2025-05-26 04:39:49','2025-07-06 05:43:40'),(5,2,2,'1748256395938','sensorNode','{\"x\":68.61864506822165,\"y\":419.0116853625442}','{\"label\":\"Temperature\",\"device\":\"Device 1\",\"device_id\":\"1\",\"sensor_type\":\"1\",\"sensor_type_name\":\"Temperature\"}','{\"width\":160,\"height\":100,\"borderStyle\":\"solid\",\"borderWidth\":1,\"borderColor\":\"black\",\"backgroundColor\":\"rgba(255, 255, 255, 0.7)\",\"borderRadius\":5}','2025-05-26 04:48:47','2025-07-06 05:43:24'),(6,2,2,'1748256397424','sensorNode','{\"x\":319.8659556885012,\"y\":418.06940381656546}','{\"label\":\"Humidity\",\"device\":\"Device 2\",\"device_id\":\"2\",\"sensor_type\":\"2\",\"sensor_type_name\":\"Humidity\"}','{\"width\":160,\"height\":100,\"borderStyle\":\"solid\",\"borderWidth\":1,\"borderColor\":\"black\",\"backgroundColor\":\"rgba(255, 255, 255, 0.7)\",\"borderRadius\":5}','2025-05-26 04:48:47','2025-07-06 05:42:55'),(7,2,2,'1748256417464','sensorNode','{\"x\":302.5936306059129,\"y\":115.70428988267204}','{\"label\":\"Smoke\",\"device\":\"Device 3\",\"device_id\":\"3\",\"sensor_type\":\"3\",\"sensor_type_name\":\"Smoke\"}','{\"width\":160,\"height\":100,\"borderStyle\":\"solid\",\"borderWidth\":1,\"borderColor\":\"black\",\"backgroundColor\":\"rgba(255, 255, 255, 0.7)\",\"borderRadius\":5}','2025-05-26 04:48:47','2025-07-06 05:43:24'),(8,2,2,'1748256435633','actuatorNode','{\"x\":546.0693596767706,\"y\":241.0261314988771}','{\"label\":\"DO\",\"device\":\"Device 1\",\"device_id\":\"1\",\"sensor_type\":\"4\",\"sensor_type_name\":\"DO\"}','{\"width\":160,\"height\":100,\"borderStyle\":\"solid\",\"borderWidth\":1,\"borderColor\":\"black\",\"backgroundColor\":\"rgba(255, 255, 255, 0.7)\",\"borderRadius\":5}','2025-05-26 04:48:47','2025-07-06 05:43:40'),(9,2,2,'1748256450163','sensorNode','{\"x\":54.54573173747447,\"y\":104.28821422792614}','{\"label\":\"Temperature\",\"device\":\"Device 2\",\"device_id\":\"2\",\"sensor_type\":\"1\",\"sensor_type_name\":\"Temperature\"}','{\"width\":160,\"height\":100,\"borderStyle\":\"solid\",\"borderWidth\":1,\"borderColor\":\"black\",\"backgroundColor\":\"rgba(255, 255, 255, 0.7)\",\"borderRadius\":5}','2025-05-26 04:48:47','2025-07-06 05:43:24'),(10,3,3,'1748256668627','sensorNode','{\"x\":292.8601833504445,\"y\":431.13783783783787}','{\"label\":\"Humidity\",\"device\":\"Device 3\",\"device_id\":\"3\",\"sensor_type\":\"2\",\"sensor_type_name\":\"Humidity\"}','{\"width\":160,\"height\":100,\"borderStyle\":\"solid\",\"borderWidth\":1,\"borderColor\":\"black\",\"backgroundColor\":\"rgba(255, 255, 255, 0.7)\",\"borderRadius\":5}','2025-05-26 04:51:48','2025-07-06 05:42:55'),(11,3,3,'1748256669497','sensorNode','{\"x\":63.85822393247076,\"y\":431.13783783783787}','{\"label\":\"Temperature\",\"device\":\"Device 1\",\"device_id\":\"1\",\"sensor_type\":\"1\",\"sensor_type_name\":\"Temperature\"}','{\"width\":160,\"height\":100,\"borderStyle\":\"solid\",\"borderWidth\":1,\"borderColor\":\"black\",\"backgroundColor\":\"rgba(255, 255, 255, 0.7)\",\"borderRadius\":5}','2025-05-26 04:51:48','2025-07-06 05:43:24'),(12,3,3,'1748256675985','actuatorNode','{\"x\":521.8213719047395,\"y\":431.13783783783787}','{\"label\":\"DO\",\"device\":\"Device 2\",\"device_id\":\"2\",\"sensor_type\":\"4\",\"sensor_type_name\":\"DO\"}','{\"width\":160,\"height\":100,\"borderStyle\":\"solid\",\"borderWidth\":1,\"borderColor\":\"black\",\"backgroundColor\":\"rgba(255, 255, 255, 0.7)\",\"borderRadius\":5}','2025-05-26 04:51:48','2025-07-06 05:43:40'),(13,3,3,'1748256681014','sensorNode','{\"x\":292.8601833504445,\"y\":137.9734360378875}','{\"label\":\"Smoke\",\"device\":\"Device 2\",\"device_id\":\"2\",\"sensor_type\":\"3\",\"sensor_type_name\":\"Smoke\"}','{\"width\":160,\"height\":100,\"borderStyle\":\"solid\",\"borderWidth\":1,\"borderColor\":\"black\",\"backgroundColor\":\"rgba(255, 255, 255, 0.7)\",\"borderRadius\":5}','2025-05-26 04:51:48','2025-07-06 05:43:24');

DROP TABLE IF EXISTS "owner_types";
CREATE TABLE "owner_types" (
  "id" BIGSERIAL,
  "owner_type_name" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "owner_types" VALUES (1,'User','2025-07-12 10:33:50','2025-07-12 10:33:50'),(2,'Partner','2025-07-12 10:33:50','2025-07-12 10:33:50');

DROP TABLE IF EXISTS "partners";
CREATE TABLE "partners" (
  "id" BIGSERIAL,
  "partner_name" varchar(255) NOT NULL,
  "address" varchar(255) DEFAULT NULL,
  "mobile" varchar(255) DEFAULT NULL,
  "email" varchar(255) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "partners" VALUES (1,'Partner1','Address','1234567890','Partner1@test.com','2025-07-12 10:33:32','2025-07-12 10:33:32'),(2,'Partner2','Address2',NULL,NULL,'2025-07-12 10:33:32','2025-07-12 10:33:32');

DROP TABLE IF EXISTS "password_reset_tokens";
CREATE TABLE "password_reset_tokens" (
  "email" varchar(255) NOT NULL,
  "token" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("email")
);

DROP TABLE IF EXISTS "permissions";
CREATE TABLE "permissions" (
  "id" BIGSERIAL,
  "name" varchar(255) NOT NULL,
  "guard_name" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id"),
  UNIQUE ("name","guard_name")
);

INSERT INTO "permissions" VALUES (1,'role-list','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(2,'role-create','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(3,'role-edit','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(4,'role-delete','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(5,'product-list','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(6,'product-create','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(7,'product-edit','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(8,'product-delete','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(9,'home','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(10,'dashboard','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(11,'profile.edit','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(12,'profile.update','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(13,'profile.destroy','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(14,'password.edit','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(15,'password.update','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(16,'appearance','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(17,'register','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(18,'login','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(19,'password.request','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(20,'password.email','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(21,'password.reset','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(22,'password.store','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(23,'verification.notice','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(24,'verification.verify','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(25,'verification.send','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(26,'password.confirm','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(27,'logout','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(28,'roles.index','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(29,'roles.create','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(30,'roles.store','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(31,'roles.show','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(32,'roles.edit','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(33,'roles.update','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(34,'roles.destroy','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(35,'users.index','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(36,'users.create','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(37,'users.store','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(38,'users.show','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(39,'users.edit','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(40,'users.update','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(41,'users.destroy','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(42,'products.index','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(43,'products.create','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(44,'products.store','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(45,'products.show','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(46,'products.edit','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(47,'products.update','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(48,'products.destroy','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(49,'users','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(50,'storage.local','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(51,'sanctum.csrf-cookie','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(52,'logout1','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(53,'RoleShow','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(54,'divisions.index','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(55,'divisions.store','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(56,'divisions.show','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(57,'divisions.update','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(58,'divisions.destroy','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(59,'datacenter-index','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(60,'logout','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(61,'gemini.chat','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(62,'gemini.chat.send','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(63,'datacenter-show','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(64,'datacenter-edit','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(65,'datacenter-delete','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(66,'datacenter-add','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(67,'device-index','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(68,'device-create','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(69,'device-show','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(70,'device-edit','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(71,'device-delete','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(72,'sensor-index','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(73,'sensor-create','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(74,'sensor-show','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(75,'sensor-edit','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(76,'sensor-delete','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(77,'state-index','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(78,'state-create','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(79,'state-show','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(80,'state-edit','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(81,'state-delete','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(82,'thresholdtype-index','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(83,'thresholdtype-create','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(84,'thresholdtype-show','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(85,'thresholdtype-edit','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(86,'thresholdtype-update','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(87,'thresholdtype-delete','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(88,'thresholdvalue-index','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(89,'thresholdvalue-create','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(90,'thresholdvalue-show','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(91,'thresholdvalue-edit','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(92,'thresholdvalue-delete','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(93,'sensor-data','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(94,'mqtt1','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(95,'DataCenterController-show','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(96,'DataCenterController-update','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(97,'DataCenterController-destroy','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(98,'DiagramController-show','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(99,'DiagramController-store','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(100,'DiagramController-index','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(101,'SvgController-store','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(102,'SvgController-preview','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(103,'AllDashboardController-getAllDC','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(104,'DatabaseController-getSchema','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(105,'DatabaseController-executeQuery','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(106,'DatabaseController-getModelInfo','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(107,'DashboardDataController-getThresholdsByDataCenter','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(108,'DashboardDataController-getSensorTypeByDataCenter','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(109,'DashboardDataController-getStatesByDataCenter','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(110,'DataCenterController-getDataCenterMapping','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(111,'UserRegisterController-getUserMapping','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(112,'MasterDataController-getPartnerMapping','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(113,'DcOwnerMappingController-storeDcPartnerMapping','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(114,'DcOwnerMappingController-store','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(115,'MasterDataController-FetchDivisions','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(116,'MasterDataController-stFetchUserTypeore','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(117,'MasterDataController-FetchUserRole','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(118,'MasterDataController-FetchDepartments','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(119,'MasterDataController-FetchOwnerTypes','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(120,'MasterDataController-indexPartner','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(121,'MasterDataController-storePartner','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(122,'MasterDataController-showPartner','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(123,'MasterDataController-updatePartner','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(124,'MasterDataController-destroyPartner','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(125,'UserRegisterController-index','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(126,'UserRegisterController-show','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(127,'UserRegisterController-indexupdatePartner','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(128,'UserRegisterController-destroy','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(129,'UserRegisterController-store','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(130,'UserRegisterController-update','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(131,'UserRegisterController-edit','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(132,'UserRegisterController-map','web','2024-03-07 10:59:17','2024-03-07 10:59:17');

DROP TABLE IF EXISTS "personal_access_tokens";
CREATE TABLE "personal_access_tokens" (
  "id" BIGSERIAL,
  "tokenable_type" varchar(255) NOT NULL,
  "tokenable_id" bigint NOT NULL,
  "name" varchar(255) NOT NULL,
  "token" varchar(64) NOT NULL,
  "abilities" text,
  "last_used_at" timestamp NULL DEFAULT NULL,
  "expires_at" timestamp NULL DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id"),
  UNIQUE ("token"),
  UNIQUE ("tokenable_type","tokenable_id","name")
);

DROP TABLE IF EXISTS "products";
CREATE TABLE "products" (
  "id" BIGSERIAL,
  "name" varchar(255) NOT NULL,
  "detail" text NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "products" VALUES (1,'Product1','Detail1','2024-03-07 10:59:17','2024-03-07 10:59:17');

DROP TABLE IF EXISTS "role_has_permissions";
CREATE TABLE "role_has_permissions" (
  "permission_id" bigint NOT NULL,
  "role_id" bigint NOT NULL,
  PRIMARY KEY ("permission_id","role_id")
);

INSERT INTO "role_has_permissions" VALUES (1,1),(1,4),(1,5),(2,1),(3,1),(4,1),(4,4),(4,5),(5,1),(5,2),(6,1),(6,2),(7,1),(7,2),(8,1),(8,2),(9,1),(10,1),(11,5),(12,1),(13,1),(16,1),(17,1),(18,1),(18,5),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(28,1),(28,5),(29,1),(30,1),(31,1),(31,5),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(52,4),(52,5),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(109,1),(110,1),(111,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,1),(124,1),(125,1),(126,1),(127,1),(128,1),(129,1),(130,1),(131,1),(132,1);

DROP TABLE IF EXISTS "roles";
CREATE TABLE "roles" (
  "id" BIGSERIAL,
  "name" varchar(255) NOT NULL,
  "guard_name" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id"),
  UNIQUE ("name","guard_name")
);

INSERT INTO "roles" VALUES (1,'Admin','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(3,'Admin','api','2024-03-07 10:59:17','2024-03-07 10:59:17'),(4,'Partner1','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(2,'DataCenter','web','2024-03-07 10:59:17','2024-03-07 10:59:17'),(5,'User','web','2024-03-07 10:59:17','2024-03-07 10:59:17');

DROP TABLE IF EXISTS "sensor_log_errors";
CREATE TABLE "sensor_log_errors" (
  "id" BIGSERIAL,
  "sensor_id" bigint NOT NULL,
  "value" int NOT NULL,
  "error_type" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "sensor_log_values";
CREATE TABLE "sensor_log_values" (
  "id" BIGSERIAL,
  "sensor_id" bigint NOT NULL,
  "value" int NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id","created_at")
) PARTITION BY RANGE (created_at);

DROP TABLE IF EXISTS "sensor_mappings";
CREATE TABLE "sensor_mappings" (
  "id" BIGSERIAL,
  "device_id" bigint NOT NULL,
  "sensor_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "sensor_mappings" VALUES (1,1,1,'2025-06-23 13:22:37','2025-06-23 13:22:37'),(2,1,2,'2025-06-23 13:22:37','2025-06-23 13:22:37'),(3,2,1,'2025-06-23 13:22:37','2025-06-23 13:22:37'),(4,2,2,'2025-06-23 13:22:37','2025-06-23 13:22:37'),(5,3,3,'2025-06-23 13:22:37','2025-06-23 13:22:37'),(6,3,4,'2025-06-23 13:22:37','2025-06-23 13:22:37'),(7,1,3,'2025-06-23 13:22:37','2025-06-23 13:22:37'),(8,2,3,'2025-06-23 13:22:37','2025-06-23 13:22:37'),(9,3,1,'2025-06-23 13:22:37','2025-06-23 13:22:37'),(10,3,2,'2025-06-23 13:22:37','2025-06-23 13:22:37');

DROP TABLE IF EXISTS "sensor_max_log_values";
CREATE TABLE "sensor_max_log_values" (
  "id" BIGSERIAL,
  "sensor_id" bigint NOT NULL,
  "value" int NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "sensor_types";
CREATE TABLE "sensor_types" (
  "id" BIGSERIAL,
  "sensor_type" varchar(255) NOT NULL,
  "unit" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "sensor_types" VALUES (1,'Temperature','C','2025-06-14 04:55:01','2025-06-14 04:55:01'),(2,'Humidity','%','2025-06-14 04:55:01','2025-06-14 04:55:01'),(3,'Smoke','PPM','2025-06-14 04:55:01','2025-06-14 04:55:01'),(4,'DO','ON/OFF','2025-06-14 04:55:01','2025-06-14 04:55:01');

DROP TABLE IF EXISTS "sensors";
CREATE TABLE "sensors" (
  "id" BIGSERIAL,
  "sensor_type_id" bigint NOT NULL,
  "min_value" int NOT NULL,
  "max_value" int NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "sensors" VALUES (1,1,10,60,'2025-06-14 05:07:07','2025-06-14 05:07:07'),(2,2,0,100,'2025-06-14 05:07:07','2025-06-14 05:07:07'),(3,3,0,1024,'2025-06-14 05:07:07','2025-06-14 05:07:07'),(4,4,0,1,'2025-06-14 05:07:07','2025-06-14 05:07:07');

DROP TABLE IF EXISTS "states";
CREATE TABLE "states" (
  "id" BIGSERIAL,
  "state_name" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "states" VALUES (1,'Maharashtra','2025-07-22 01:46:42','2025-07-22 01:46:42'),(2,'Delhi','2025-07-22 01:46:42','2025-07-22 01:46:42'),(3,'West Bengal','2025-07-22 01:46:42','2025-07-22 01:46:42');

DROP TABLE IF EXISTS "threshold_types";
CREATE TABLE "threshold_types" (
  "id" BIGSERIAL,
  "threshold_type" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "threshold_types" VALUES (1,'Lower','2025-06-25 11:51:30','2025-06-25 11:51:30'),(2,'Upper','2025-06-25 11:51:30','2025-06-25 11:51:30'),(3,'Equal','2025-06-25 11:51:30','2025-06-25 11:51:30');

DROP TABLE IF EXISTS "threshold_values";
CREATE TABLE "threshold_values" (
  "id" BIGSERIAL,
  "sensor_id" bigint NOT NULL,
  "threshold_type_id" bigint NOT NULL,
  "threshold_value" int NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "threshold_values" VALUES (1,1,1,12,'2025-06-25 11:53:11','2025-06-25 11:53:11'),(2,1,2,50,'2025-06-25 11:53:11','2025-06-25 11:53:11'),(3,2,1,5,'2025-06-25 11:53:11','2025-06-25 11:53:11'),(4,2,2,90,'2025-06-25 11:53:11','2025-06-25 11:53:11'),(5,3,1,10,'2025-06-25 11:53:11','2025-06-25 11:53:11'),(6,3,2,500,'2025-06-25 11:53:11','2025-06-25 11:53:11'),(7,4,3,1,'2025-06-25 11:53:11','2025-06-25 11:53:11');

DROP TABLE IF EXISTS "user_register_logs";
CREATE TABLE "user_register_logs" (
  "id" BIGSERIAL,
  "user_id" bigint NOT NULL,
  "partner_id" bigint DEFAULT NULL,
  "dc_id" bigint DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "user_register_logs" VALUES (1,1,NULL,1,'2025-08-02 13:34:00','2025-08-02 13:34:00'),(2,2,1,NULL,'2025-08-02 13:34:00','2025-08-02 13:34:00'),(3,3,NULL,2,'2025-08-02 13:34:00','2025-08-02 13:34:00'),(4,4,NULL,3,'2025-08-02 13:34:00','2025-08-02 13:34:00'),(5,5,NULL,1,'2025-08-02 13:34:00','2025-08-02 13:34:00');

DROP TABLE IF EXISTS "user_roles";
CREATE TABLE "user_roles" (
  "id" BIGSERIAL,
  "user_role" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "user_roles" VALUES (1,'DC Admin','2025-06-28 15:57:02','2025-06-28 15:57:02'),(2,'DC User','2025-06-28 15:57:02','2025-06-28 15:57:02'),(3,'Partner User','2025-06-28 15:57:02','2025-06-28 15:57:02'),(4,'Internal User','2025-06-28 15:57:02','2025-06-28 15:57:02');

DROP TABLE IF EXISTS "user_type_masters";
CREATE TABLE "user_type_masters" (
  "id" BIGSERIAL,
  "user_type" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "user_type_masters" VALUES (1,'Admin','2025-06-28 15:59:13','2025-06-28 15:59:13'),(2,'User','2025-06-28 15:59:13','2025-06-28 15:59:13'),(3,'Partner','2025-06-28 15:59:13','2025-06-28 15:59:13');

DROP TABLE IF EXISTS "users";
CREATE TABLE "users" (
  "id" BIGSERIAL,
  "user_type_id" bigint DEFAULT NULL,
  "user_role_id" bigint DEFAULT NULL,
  "department_id" bigint DEFAULT NULL,
  "name" varchar(255) NOT NULL,
  "email" varchar(255) NOT NULL,
  "email_verified_at" timestamp NULL DEFAULT NULL,
  "password" varchar(255) NOT NULL,
  "status" tinyint NOT NULL DEFAULT '1',
  "remember_token" varchar(100) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id"),
  UNIQUE ("email")
);

INSERT INTO "users" VALUES (1,1,1,1,'Admin','admin@gmail.com','2024-03-07 10:59:17','$2y$10$w85xN8fS.g43bI0z.7.eIuHw4/L31xGfFf9hVv1F7.2N0D1x2fE8C','1',NULL,'2024-03-07 10:59:17','2024-03-07 10:59:17'),(2,3,3,2,'Partner1','partner1@test.com',NULL,'$2y$10$o8sT1s8iIuM.q1mX/w.yC.O5k9R9Y7z7V9O2X2g9D9U6D1v0X3e8C','1',NULL,'2025-06-28 16:00:23','2025-06-28 16:00:23'),(3,2,1,1,'User1','user1@test.com',NULL,'$2y$10$Q.9fV3d8a7k6j5h4G3e2W1x0Z7p6O5N4M3L2K1J0I9H8G7F6E5D4','1',NULL,'2025-06-28 16:00:46','2025-06-28 16:00:46'),(4,2,2,1,'User2','user2@test.com',NULL,'$2y$10$A.b1C2d3E4f5G6h7I8j9K0l1M2n3O4p5Q6r7S8t9U0v1W2x3Y4z5','1',NULL,'2025-06-28 16:01:05','2025-06-28 16:01:05'),(5,2,2,1,'User5','user5@test.com',NULL,'$2y$10$D.e5F4g3H2i1J0k9L8m7N6o5P4q3R2s1T0u9V8w7X6y5Z4a3b2c1','1',NULL,'2025-08-02 13:34:00','2025-08-02 13:34:00');
