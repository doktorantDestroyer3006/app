BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS auth_user (
        id      SERIAL PRIMARY KEY,
        password        varchar ( 128 ) NOT NULL,
        last_login      timestamp,
        is_superuser    integer NOT NULL,
        username        varchar ( 150 ) NOT NULL UNIQUE,
        last_name       varchar ( 150 ) NOT NULL,
        email   varchar ( 254 ) NOT NULL,
        is_staff        integer NOT NULL,
        is_active       integer NOT NULL,
        date_joined     timestamp NOT NULL,
        first_name      varchar ( 150 ) NOT NULL
);
INSERT INTO auth_user VALUES (1,'pbkdf2_sha256$216000$kDKmcgU8oq90$TtHIZuzElPHujC2hclDILjKFvpY/nVIT7uGiONUbEew=','2020-11-07 12:08:35.884612',1,'CoreyMS','','CoreyMSchafer@gmail.com',1,1,'2018-08-28 01:54:20.948530','');
INSERT INTO auth_user VALUES (2,'pbkdf2_sha256$120000$lpBT3NL7Srmk$eaTLwlW2wlK/I4c9uzcAqbRB+XXWXlkByUX2UlLSTVk=','2018-08-28 22:04:53.352879',0,'TestUser','','TestUser@company.com',0,1,'2018-08-28 01:59:12','');
INSERT INTO auth_user VALUES (3,'pbkdf2_sha256$120000$QZLieuQHf9cP$Dwd4yDW8jis5wthQkXTdRbeyGu96lEB7IIlGrjBmanM=',NULL,0,'NewUser','','',0,1,'2018-08-28 18:35:02.668144','');
INSERT INTO auth_user VALUES (4,'pbkdf2_sha256$120000$c4ECtZJLQoiS$NCjxt4YdGZHF9cup94IZr+6VoejhuJVOLR1dDTVK9Ec=',NULL,0,'NewUser2','','NU2@company.com',0,1,'2018-08-28 18:46:08.542313','');
INSERT INTO auth_user VALUES (5,'pbkdf2_sha256$120000$ka1zIS8RjIe4$iP95yJlLYNhp/7yqoKQpxz2+JApK4BWEjs+vkgEFt2w=','2018-08-28 22:22:40.014791',0,'NewUser3','','NU3@company.com',0,1,'2018-08-28 22:22:19.005948','');

CREATE TABLE IF NOT EXISTS users_profile (
	id	SERIAL PRIMARY KEY,
	image	varchar ( 100 ) NOT NULL,
	user_id	integer NOT NULL UNIQUE,
	FOREIGN KEY(user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO users_profile VALUES (3,'profile_pics/large_rbSbk8j.jpg',1);
INSERT INTO users_profile VALUES (4,'default.jpg',2);
INSERT INTO users_profile VALUES (5,'default.jpg',5);
CREATE TABLE IF NOT EXISTS django_session (
	session_key	varchar ( 40 ) NOT NULL,
	session_data	text NOT NULL,
	expire_date	timestamp NOT NULL,
	PRIMARY KEY(session_key)
);
INSERT INTO django_session VALUES ('lhbm9sk0w7e2b35kvovoo2ahtb4vwnmf','OThiNjQ2NTUwNjdlZWM5NzJkMjcwMDljMjJkZmMxOWZlOGUyMzBiZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMWFkYWNkN2JhYWQ1Mjc5YzU5Y2RiNTA0NjBlNzhlZWY5YjkzZDZiIn0=','2018-09-11 01:55:14.764229');
INSERT INTO django_session VALUES ('jdyqpvcquqzoxqaza5zh10gu245c59t5','ZjRiOWUxNTRkNTU1ZDgxNzM0NDNiMGY2NDAxZWIxY2Y2NTgyOTZiYTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYWVmNWViNWU5N2NkYWI5Y2ZiOTE1NDk3YTljYjY1ZWM1NzkwNzA1In0=','2018-09-11 22:22:40.019273');
INSERT INTO django_session VALUES ('x1flx3os7bdvuu74eaj5jsjq3xvi2isw','OThiNjQ2NTUwNjdlZWM5NzJkMjcwMDljMjJkZmMxOWZlOGUyMzBiZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMWFkYWNkN2JhYWQ1Mjc5YzU5Y2RiNTA0NjBlNzhlZWY5YjkzZDZiIn0=','2018-09-13 03:47:47.559634');
INSERT INTO django_session VALUES ('lqb9t94witbrsprsfbg7ov1jvecw75q3','.eJxVjEEOwiAQRe_C2pCC6QAu3XsGMswMUjWQlHbVeHdt0oVu_3vvbyriupS4dpnjxOqijDr9bgnpKXUH_MB6b5paXeYp6V3RB-361lhe18P9OyjYy7cOORFnCpn9kATQoBUaQSCAk0wmuNGxFW_OmADEDEDWQwYk7wOjqPcHHfo5Eg:1kLBFo:QRgxizcyhPGhKTwrR3wOqoUa0yYJpubbx64Qx2bBRHQ','2020-10-07 20:20:40.972193');
INSERT INTO django_session VALUES ('lk6dw2auj2da4yiqjzo9u8gplfwc281x','.eJxVjEEOwiAQRe_C2pCC6QAu3XsGMswMUjWQlHbVeHdt0oVu_3vvbyriupS4dpnjxOqijDr9bgnpKXUH_MB6b5paXeYp6V3RB-361lhe18P9OyjYy7cOORFnCpn9kATQoBUaQSCAk0wmuNGxFW_OmADEDEDWQwYk7wOjqPcHHfo5Eg:1kbN1H:zcJ4o2bxY-CYvTERJxEfWSzFzu28knomTwxQtyQG35M','2020-11-21 12:08:35.926002');
CREATE TABLE IF NOT EXISTS django_migrations (
	id	SERIAL PRIMARY KEY,
	app	varchar ( 255 ) NOT NULL,
	name	varchar ( 255 ) NOT NULL,
	applied	timestamp NOT NULL
);
INSERT INTO django_migrations VALUES (1,'contenttypes','0001_initial','2018-08-28 01:53:32.454266');
INSERT INTO django_migrations VALUES (2,'auth','0001_initial','2018-08-28 01:53:32.471737');
INSERT INTO django_migrations VALUES (3,'admin','0001_initial','2018-08-28 01:53:32.481849');
INSERT INTO django_migrations VALUES (4,'admin','0002_logentry_remove_auto_add','2018-08-28 01:53:32.492821');
INSERT INTO django_migrations VALUES (5,'admin','0003_logentry_add_action_flag_choices','2018-08-28 01:53:32.503443');
INSERT INTO django_migrations VALUES (6,'contenttypes','0002_remove_content_type_name','2018-08-28 01:53:32.522094');
INSERT INTO django_migrations VALUES (7,'auth','0002_alter_permission_name_max_length','2018-08-28 01:53:32.529421');
INSERT INTO django_migrations VALUES (8,'auth','0003_alter_user_email_max_length','2018-08-28 01:53:32.541163');
INSERT INTO django_migrations VALUES (9,'auth','0004_alter_user_username_opts','2018-08-28 01:53:32.564173');
INSERT INTO django_migrations VALUES (10,'auth','0005_alter_user_last_login_null','2018-08-28 01:53:32.574865');
INSERT INTO django_migrations VALUES (11,'auth','0006_require_contenttypes_0002','2018-08-28 01:53:32.576263');
INSERT INTO django_migrations VALUES (12,'auth','0007_alter_validators_add_error_messages','2018-08-28 01:53:32.585900');
INSERT INTO django_migrations VALUES (13,'auth','0008_alter_user_username_max_length','2018-08-28 01:53:32.595635');
INSERT INTO django_migrations VALUES (14,'auth','0009_alter_user_last_name_max_length','2018-08-28 01:53:32.607585');
INSERT INTO django_migrations VALUES (15,'sessions','0001_initial','2018-08-28 01:53:32.612766');
INSERT INTO django_migrations VALUES (16,'blog','0001_initial','2018-08-28 02:37:48.364035');
INSERT INTO django_migrations VALUES (17,'users','0001_initial','2018-08-28 21:30:15.961200');
INSERT INTO django_migrations VALUES (18,'auth','0010_alter_group_name_max_length','2020-09-23 20:20:14.882748');
INSERT INTO django_migrations VALUES (19,'auth','0011_update_proxy_permissions','2020-09-23 20:20:14.963575');
INSERT INTO django_migrations VALUES (20,'auth','0012_alter_user_first_name_max_length','2020-09-23 20:20:15.063840');
CREATE TABLE IF NOT EXISTS django_content_type (
	id	SERIAL PRIMARY KEY,
	app_label	varchar ( 100 ) NOT NULL,
	model	varchar ( 100 ) NOT NULL
);
INSERT INTO django_content_type VALUES (1,'admin','logentry');
INSERT INTO django_content_type VALUES (2,'auth','permission');
INSERT INTO django_content_type VALUES (3,'auth','group');
INSERT INTO django_content_type VALUES (4,'auth','user');
INSERT INTO django_content_type VALUES (5,'contenttypes','contenttype');
INSERT INTO django_content_type VALUES (6,'sessions','session');
INSERT INTO django_content_type VALUES (7,'blog','post');
INSERT INTO django_content_type VALUES (8,'users','profile');
CREATE TABLE IF NOT EXISTS django_admin_log (
	id	SERIAL PRIMARY KEY,
	action_time	timestamp NOT NULL,
	object_id	text,
	object_repr	varchar ( 200 ) NOT NULL,
	change_message	text NOT NULL,
	content_type_id	integer,
	user_id	integer NOT NULL,
	action_flag	integer NOT NULL,
	FOREIGN KEY(content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO django_admin_log VALUES (1,'2018-08-28 01:59:12.147285','2','TestUser','[{"added": {}}]',4,1,1);
INSERT INTO django_admin_log VALUES (2,'2018-08-28 02:01:26.023424','2','TestUser','[{"changed": {"fields": ["email"]}}]',4,1,2);
INSERT INTO django_admin_log VALUES (3,'2018-08-28 03:28:27.967025','1','Blog 1 Updated','[{"changed": {"fields": ["title", "content"]}}]',7,1,2);
INSERT INTO django_admin_log VALUES (4,'2018-08-28 03:29:13.458373','3','Blog 3','[{"changed": {"fields": ["author"]}}]',7,1,2);
INSERT INTO django_admin_log VALUES (5,'2018-08-28 21:33:22.725754','1','CoreyMS Profile','[{"added": {}}]',8,1,1);
INSERT INTO django_admin_log VALUES (6,'2018-08-28 21:33:56.757048','2','TestUser Profile','[{"added": {}}]',8,1,1);
INSERT INTO django_admin_log VALUES (7,'2018-08-28 21:48:16.717940','2','TestUser Profile','',8,1,3);
INSERT INTO django_admin_log VALUES (8,'2018-08-28 21:48:16.726635','1','CoreyMS Profile','',8,1,3);
INSERT INTO django_admin_log VALUES (9,'2018-08-28 21:48:25.163852','3','CoreyMS Profile','[{"added": {}}]',8,1,1);
INSERT INTO django_admin_log VALUES (10,'2018-08-28 21:48:31.747647','4','TestUser Profile','[{"added": {}}]',8,1,1);
INSERT INTO django_admin_log VALUES (11,'2020-11-07 12:09:06.885263','7','jebac *** (psy)','[{"added": {}}]',7,1,1);
CREATE TABLE IF NOT EXISTS blog_post (
	id	SERIAL PRIMARY KEY,
	title	varchar ( 100 ) NOT NULL,
	content	text NOT NULL,
	date_posted	timestamp NOT NULL,
	author_id	integer NOT NULL,
	FOREIGN KEY(author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO blog_post VALUES (1,'Blog 1 Updated','First Updated Content!','2018-08-28 02:46:55',1);
INSERT INTO blog_post VALUES (2,'Blog 2','Second Post Content','2018-08-28 02:55:29.858405',1);
INSERT INTO blog_post VALUES (3,'Blog 3','Third Post Content!','2018-08-28 03:05:27',2);
INSERT INTO blog_post VALUES (4,'Blog 4','4th Post! EDIT TEST 3==>','2018-08-30 03:27:42.134504',1);
INSERT INTO blog_post VALUES (7,'jebac *** (psy)','xd','2020-11-07 12:08:47',1);



CREATE TABLE IF NOT EXISTS auth_permission (
        id      SERIAL PRIMARY KEY,
        content_type_id integer NOT NULL,
        codename        varchar ( 100 ) NOT NULL,
        name    varchar ( 255 ) NOT NULL,
        FOREIGN KEY(content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED
);

INSERT INTO auth_permission VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO auth_permission VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO auth_permission VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO auth_permission VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO auth_permission VALUES (5,2,'add_permission','Can add permission');
INSERT INTO auth_permission VALUES (6,2,'change_permission','Can change permission');
INSERT INTO auth_permission VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO auth_permission VALUES (8,2,'view_permission','Can view permission');
INSERT INTO auth_permission VALUES (9,3,'add_group','Can add group');
INSERT INTO auth_permission VALUES (10,3,'change_group','Can change group');
INSERT INTO auth_permission VALUES (11,3,'delete_group','Can delete group');
INSERT INTO auth_permission VALUES (12,3,'view_group','Can view group');
INSERT INTO auth_permission VALUES (13,4,'add_user','Can add user');
INSERT INTO auth_permission VALUES (14,4,'change_user','Can change user');
INSERT INTO auth_permission VALUES (15,4,'delete_user','Can delete user');
INSERT INTO auth_permission VALUES (16,4,'view_user','Can view user');
INSERT INTO auth_permission VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO auth_permission VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO auth_permission VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO auth_permission VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO auth_permission VALUES (21,6,'add_session','Can add session');
INSERT INTO auth_permission VALUES (22,6,'change_session','Can change session');
INSERT INTO auth_permission VALUES (23,6,'delete_session','Can delete session');
INSERT INTO auth_permission VALUES (24,6,'view_session','Can view session');
INSERT INTO auth_permission VALUES (25,7,'add_post','Can add post');
INSERT INTO auth_permission VALUES (26,7,'change_post','Can change post');
INSERT INTO auth_permission VALUES (27,7,'delete_post','Can delete post');
INSERT INTO auth_permission VALUES (28,7,'view_post','Can view post');
INSERT INTO auth_permission VALUES (29,8,'add_profile','Can add profile');
INSERT INTO auth_permission VALUES (30,8,'change_profile','Can change profile');
INSERT INTO auth_permission VALUES (31,8,'delete_profile','Can delete profile');
INSERT INTO auth_permission VALUES (32,8,'view_profile','Can view profile');







CREATE TABLE IF NOT EXISTS auth_user_user_permissions (
	id	SERIAL PRIMARY KEY,
	user_id	integer NOT NULL,
	permission_id	integer NOT NULL,
	FOREIGN KEY(permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS auth_group (
        id      SERIAL PRIMARY KEY,
        name    varchar ( 150 ) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS auth_user_groups (
	id	SERIAL PRIMARY KEY,
	user_id	integer NOT NULL,
	group_id	integer NOT NULL,
	FOREIGN KEY(user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS auth_group_permissions (
	id	SERIAL PRIMARY KEY,
	group_id	integer NOT NULL,
	permission_id	integer NOT NULL,
	FOREIGN KEY(group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED
);
CREATE INDEX IF NOT EXISTS django_session_expire_date_a5c62663 ON django_session (
	expire_date
);
COMMIT;
