-- public.ir_logging definition

-- Drop table

-- DROP TABLE public.ir_logging;

CREATE TABLE public.ir_logging (
	id serial NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	"name" varchar NOT NULL,
	"type" varchar NOT NULL,
	dbname varchar NULL,
	"level" varchar NULL,
	message text NOT NULL,
	"path" varchar NOT NULL,
	func varchar NOT NULL,
	line varchar NOT NULL,
	CONSTRAINT ir_logging_pkey PRIMARY KEY (id)
);
CREATE INDEX ir_logging_dbname_index ON public.ir_logging USING btree (dbname);
CREATE INDEX ir_logging_level_index ON public.ir_logging USING btree (level);
CREATE INDEX ir_logging_type_index ON public.ir_logging USING btree (type);


-- public.lw_category definition

-- Drop table

-- DROP TABLE public.lw_category;

CREATE TABLE public.lw_category (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	code varchar NOT NULL,
	create_date timestamp NULL,
	write_date timestamp NULL,
	CONSTRAINT lw_food_category_pkey PRIMARY KEY (id)
);


-- public.lw_diet_today definition

-- Drop table

-- DROP TABLE public.lw_diet_today;

CREATE TABLE public.lw_diet_today (
	id serial NOT NULL,
	diet_id int8 NULL,
	status bool NULL,
	created_date date NULL,
	CONSTRAINT lw_diet_today_pkey PRIMARY KEY (id)
);


-- public.lw_exercise_video definition

-- Drop table

-- DROP TABLE public.lw_exercise_video;

CREATE TABLE public.lw_exercise_video (
	id serial NOT NULL,
	exercise_id int4 NULL,
	video_id int4 NULL,
	CONSTRAINT lw_exercise_video_pkey PRIMARY KEY (id)
);


-- public.lw_exercise_video_partner definition

-- Drop table

-- DROP TABLE public.lw_exercise_video_partner;

CREATE TABLE public.lw_exercise_video_partner (
	exercise_video_id int8 NULL,
	partner_id int8 NULL,
	finish_flag bool NULL,
	finish_date timestamp NULL
);


-- public.lw_food_category definition

-- Drop table

-- DROP TABLE public.lw_food_category;

CREATE TABLE public.lw_food_category (
	food_id int8 NOT NULL,
	category_code varchar NOT NULL,
	"partner_id " int8 NULL,
	partner_id int4 NULL,
	CONSTRAINT lw_food_category_pkey1 PRIMARY KEY (food_id, category_code)
);


-- public.lw_food_menu_partner definition

-- Drop table

-- DROP TABLE public.lw_food_menu_partner;

CREATE TABLE public.lw_food_menu_partner (
	id serial NOT NULL,
	food_id int8 NOT NULL,
	menu_code varchar NOT NULL,
	partner_id int8 NOT NULL,
	day_of_week varchar NOT NULL,
	lw_menu_id int4 NULL,
	CONSTRAINT lw_food_menu_partner_pkey PRIMARY KEY (id)
);


-- public.lw_food_menu_partner_today definition

-- Drop table

-- DROP TABLE public.lw_food_menu_partner_today;

CREATE TABLE public.lw_food_menu_partner_today (
	id serial NOT NULL,
	lw_food_menu_partner_id int8 NULL,
	status bool NULL,
	created_date timestamp NULL,
	CONSTRAINT lw_food_menu_partner_today_pkey PRIMARY KEY (id)
);


-- public.lw_food_star definition

-- Drop table

-- DROP TABLE public.lw_food_star;

CREATE TABLE public.lw_food_star (
	food_id serial NOT NULL,
	res_partner_id serial NOT NULL,
	star int4 NULL,
	like_flag int4 NULL,
	CONSTRAINT lw_food_star_pkey PRIMARY KEY (food_id, res_partner_id)
);


-- public.lw_menu definition

-- Drop table

-- DROP TABLE public.lw_menu;

CREATE TABLE public.lw_menu (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	total_kcal float8 NOT NULL,
	create_date timestamp NULL,
	write_date timestamp NULL,
	code varchar NULL,
	CONSTRAINT lw_menu_pkey PRIMARY KEY (id)
);


-- public.lw_video definition

-- Drop table

-- DROP TABLE public.lw_video;

CREATE TABLE public.lw_video (
	id serial NOT NULL,
	video_name varchar NOT NULL,
	image varchar NULL,
	url varchar NULL,
	calo float8 NOT NULL,
	description text NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT lw_video_pkey PRIMARY KEY (id)
);


-- public.lw_food_lw_menu_rel definition

-- Drop table

-- DROP TABLE public.lw_food_lw_menu_rel;

CREATE TABLE public.lw_food_lw_menu_rel (
	id serial NOT NULL,
	lw_menu_id int4 NOT NULL,
	lw_food_id int4 NOT NULL,
	CONSTRAINT lw_food_lw_menu_rel_lw_menu_id_lw_food_id_key UNIQUE (lw_menu_id, lw_food_id),
	CONSTRAINT lw_food_lw_menu_rel_pkey PRIMARY KEY (id),
	CONSTRAINT lw_food_lw_menu_rel_lw_menu_id_fkey FOREIGN KEY (lw_menu_id) REFERENCES lw_menu(id) ON DELETE CASCADE
);
CREATE INDEX lw_food_lw_menu_rel_lw_food_id_idx ON public.lw_food_lw_menu_rel USING btree (lw_food_id);
CREATE INDEX lw_food_lw_menu_rel_lw_menu_id_idx ON public.lw_food_lw_menu_rel USING btree (lw_menu_id);


-- public.lw_video_category definition

-- Drop table

-- DROP TABLE public.lw_video_category;

CREATE TABLE public.lw_video_category (
	id serial NOT NULL,
	video_id serial NOT NULL,
	category_id serial NOT NULL,
	CONSTRAINT lw_video_category_pkey PRIMARY KEY (id),
	CONSTRAINT lw_category_id_fkey FOREIGN KEY (category_id) REFERENCES lw_category(id) ON DELETE SET NULL,
	CONSTRAINT lw_video_id_fkey FOREIGN KEY (video_id) REFERENCES lw_video(id) ON DELETE SET NULL
);


-- public.base_import_import definition

-- Drop table

-- DROP TABLE public.base_import_import;

CREATE TABLE public.base_import_import (
	id serial NOT NULL,
	res_model varchar NULL,
	file bytea NULL,
	file_name varchar NULL,
	file_type varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_import_import_pkey PRIMARY KEY (id)
);


-- public.base_import_mapping definition

-- Drop table

-- DROP TABLE public.base_import_mapping;

CREATE TABLE public.base_import_mapping (
	id serial NOT NULL,
	res_model varchar NULL,
	column_name varchar NULL,
	field_name varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_import_mapping_pkey PRIMARY KEY (id)
);
CREATE INDEX base_import_mapping_res_model_index ON public.base_import_mapping USING btree (res_model);


-- public.base_import_tests_models_char definition

-- Drop table

-- DROP TABLE public.base_import_tests_models_char;

CREATE TABLE public.base_import_tests_models_char (
	id serial NOT NULL,
	value varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_import_tests_models_char_pkey PRIMARY KEY (id)
);


-- public.base_import_tests_models_char_noreadonly definition

-- Drop table

-- DROP TABLE public.base_import_tests_models_char_noreadonly;

CREATE TABLE public.base_import_tests_models_char_noreadonly (
	id serial NOT NULL,
	value varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_import_tests_models_char_noreadonly_pkey PRIMARY KEY (id)
);


-- public.base_import_tests_models_char_readonly definition

-- Drop table

-- DROP TABLE public.base_import_tests_models_char_readonly;

CREATE TABLE public.base_import_tests_models_char_readonly (
	id serial NOT NULL,
	value varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_import_tests_models_char_readonly_pkey PRIMARY KEY (id)
);


-- public.base_import_tests_models_char_required definition

-- Drop table

-- DROP TABLE public.base_import_tests_models_char_required;

CREATE TABLE public.base_import_tests_models_char_required (
	id serial NOT NULL,
	value varchar NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_import_tests_models_char_required_pkey PRIMARY KEY (id)
);


-- public.base_import_tests_models_char_states definition

-- Drop table

-- DROP TABLE public.base_import_tests_models_char_states;

CREATE TABLE public.base_import_tests_models_char_states (
	id serial NOT NULL,
	value varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_import_tests_models_char_states_pkey PRIMARY KEY (id)
);


-- public.base_import_tests_models_char_stillreadonly definition

-- Drop table

-- DROP TABLE public.base_import_tests_models_char_stillreadonly;

CREATE TABLE public.base_import_tests_models_char_stillreadonly (
	id serial NOT NULL,
	value varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_import_tests_models_char_stillreadonly_pkey PRIMARY KEY (id)
);


-- public.base_import_tests_models_complex definition

-- Drop table

-- DROP TABLE public.base_import_tests_models_complex;

CREATE TABLE public.base_import_tests_models_complex (
	id serial NOT NULL,
	f float8 NULL,
	m numeric NULL,
	c varchar NULL,
	currency_id int4 NULL,
	d date NULL,
	dt timestamp NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_import_tests_models_complex_pkey PRIMARY KEY (id)
);


-- public.base_import_tests_models_float definition

-- Drop table

-- DROP TABLE public.base_import_tests_models_float;

CREATE TABLE public.base_import_tests_models_float (
	id serial NOT NULL,
	value float8 NULL,
	value2 numeric NULL,
	currency_id int4 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_import_tests_models_float_pkey PRIMARY KEY (id)
);


-- public.base_import_tests_models_m2o definition

-- Drop table

-- DROP TABLE public.base_import_tests_models_m2o;

CREATE TABLE public.base_import_tests_models_m2o (
	id serial NOT NULL,
	value int4 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_import_tests_models_m2o_pkey PRIMARY KEY (id)
);


-- public.base_import_tests_models_m2o_related definition

-- Drop table

-- DROP TABLE public.base_import_tests_models_m2o_related;

CREATE TABLE public.base_import_tests_models_m2o_related (
	id serial NOT NULL,
	value int4 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_import_tests_models_m2o_related_pkey PRIMARY KEY (id)
);


-- public.base_import_tests_models_m2o_required definition

-- Drop table

-- DROP TABLE public.base_import_tests_models_m2o_required;

CREATE TABLE public.base_import_tests_models_m2o_required (
	id serial NOT NULL,
	value int4 NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_import_tests_models_m2o_required_pkey PRIMARY KEY (id)
);


-- public.base_import_tests_models_m2o_required_related definition

-- Drop table

-- DROP TABLE public.base_import_tests_models_m2o_required_related;

CREATE TABLE public.base_import_tests_models_m2o_required_related (
	id serial NOT NULL,
	value int4 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_import_tests_models_m2o_required_related_pkey PRIMARY KEY (id)
);


-- public.base_import_tests_models_o2m definition

-- Drop table

-- DROP TABLE public.base_import_tests_models_o2m;

CREATE TABLE public.base_import_tests_models_o2m (
	id serial NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_import_tests_models_o2m_pkey PRIMARY KEY (id)
);


-- public.base_import_tests_models_o2m_child definition

-- Drop table

-- DROP TABLE public.base_import_tests_models_o2m_child;

CREATE TABLE public.base_import_tests_models_o2m_child (
	id serial NOT NULL,
	parent_id int4 NULL,
	value int4 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_import_tests_models_o2m_child_pkey PRIMARY KEY (id)
);


-- public.base_import_tests_models_preview definition

-- Drop table

-- DROP TABLE public.base_import_tests_models_preview;

CREATE TABLE public.base_import_tests_models_preview (
	id serial NOT NULL,
	"name" varchar NULL,
	somevalue int4 NOT NULL,
	othervalue int4 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_import_tests_models_preview_pkey PRIMARY KEY (id)
);


-- public.base_language_export definition

-- Drop table

-- DROP TABLE public.base_language_export;

CREATE TABLE public.base_language_export (
	id serial NOT NULL,
	"name" varchar NULL,
	lang varchar NOT NULL,
	format varchar NOT NULL,
	"data" bytea NULL,
	state varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_language_export_pkey PRIMARY KEY (id)
);


-- public.base_language_import definition

-- Drop table

-- DROP TABLE public.base_language_import;

CREATE TABLE public.base_language_import (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	code varchar(6) NOT NULL,
	"data" bytea NOT NULL,
	filename varchar NOT NULL,
	overwrite bool NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_language_import_pkey PRIMARY KEY (id)
);


-- public.base_language_install definition

-- Drop table

-- DROP TABLE public.base_language_install;

CREATE TABLE public.base_language_install (
	id serial NOT NULL,
	lang varchar NOT NULL,
	overwrite bool NULL,
	state varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_language_install_pkey PRIMARY KEY (id)
);


-- public.base_module_uninstall definition

-- Drop table

-- DROP TABLE public.base_module_uninstall;

CREATE TABLE public.base_module_uninstall (
	id serial NOT NULL,
	show_all bool NULL,
	module_id int4 NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_module_uninstall_pkey PRIMARY KEY (id)
);


-- public.base_module_update definition

-- Drop table

-- DROP TABLE public.base_module_update;

CREATE TABLE public.base_module_update (
	id serial NOT NULL,
	updated int4 NULL,
	added int4 NULL,
	state varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_module_update_pkey PRIMARY KEY (id)
);


-- public.base_module_upgrade definition

-- Drop table

-- DROP TABLE public.base_module_upgrade;

CREATE TABLE public.base_module_upgrade (
	id serial NOT NULL,
	module_info text NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_module_upgrade_pkey PRIMARY KEY (id)
);


-- public.base_partner_merge_automatic_wizard definition

-- Drop table

-- DROP TABLE public.base_partner_merge_automatic_wizard;

CREATE TABLE public.base_partner_merge_automatic_wizard (
	id serial NOT NULL,
	group_by_email bool NULL,
	group_by_name bool NULL,
	group_by_is_company bool NULL,
	group_by_vat bool NULL,
	group_by_parent_id bool NULL,
	state varchar NOT NULL,
	number_group int4 NULL,
	current_line_id int4 NULL,
	dst_partner_id int4 NULL,
	exclude_contact bool NULL,
	exclude_journal_item bool NULL,
	maximum_group int4 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_partner_merge_automatic_wizard_pkey PRIMARY KEY (id)
);


-- public.base_partner_merge_automatic_wizard_res_partner_rel definition

-- Drop table

-- DROP TABLE public.base_partner_merge_automatic_wizard_res_partner_rel;

CREATE TABLE public.base_partner_merge_automatic_wizard_res_partner_rel (
	base_partner_merge_automatic_wizard_id int4 NOT NULL,
	res_partner_id int4 NOT NULL,
	CONSTRAINT base_partner_merge_automatic__base_partner_merge_automatic__key UNIQUE (base_partner_merge_automatic_wizard_id, res_partner_id)
);
CREATE INDEX base_partner_merge_automatic__base_partner_merge_automatic__idx ON public.base_partner_merge_automatic_wizard_res_partner_rel USING btree (base_partner_merge_automatic_wizard_id);
CREATE INDEX base_partner_merge_automatic_wizard_res_part_res_partner_id_idx ON public.base_partner_merge_automatic_wizard_res_partner_rel USING btree (res_partner_id);


-- public.base_partner_merge_line definition

-- Drop table

-- DROP TABLE public.base_partner_merge_line;

CREATE TABLE public.base_partner_merge_line (
	id serial NOT NULL,
	wizard_id int4 NULL,
	min_id int4 NULL,
	aggr_ids varchar NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_partner_merge_line_pkey PRIMARY KEY (id)
);


-- public.base_update_translations definition

-- Drop table

-- DROP TABLE public.base_update_translations;

CREATE TABLE public.base_update_translations (
	id serial NOT NULL,
	lang varchar NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT base_update_translations_pkey PRIMARY KEY (id)
);


-- public.bus_bus definition

-- Drop table

-- DROP TABLE public.bus_bus;

CREATE TABLE public.bus_bus (
	id serial NOT NULL,
	channel varchar NULL,
	message varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT bus_bus_pkey PRIMARY KEY (id)
);


-- public.bus_presence definition

-- Drop table

-- DROP TABLE public.bus_presence;

CREATE TABLE public.bus_presence (
	id serial NOT NULL,
	user_id int4 NOT NULL,
	last_poll timestamp NULL,
	last_presence timestamp NULL,
	status varchar NULL,
	CONSTRAINT bus_presence_bus_user_presence_unique UNIQUE (user_id),
	CONSTRAINT bus_presence_pkey PRIMARY KEY (id)
);
CREATE INDEX bus_presence_user_id_index ON public.bus_presence USING btree (user_id);


-- public.change_password_user definition

-- Drop table

-- DROP TABLE public.change_password_user;

CREATE TABLE public.change_password_user (
	id serial NOT NULL,
	wizard_id int4 NOT NULL,
	user_id int4 NOT NULL,
	user_login varchar NULL,
	new_passwd varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT change_password_user_pkey PRIMARY KEY (id)
);


-- public.change_password_wizard definition

-- Drop table

-- DROP TABLE public.change_password_wizard;

CREATE TABLE public.change_password_wizard (
	id serial NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT change_password_wizard_pkey PRIMARY KEY (id)
);


-- public.email_template_attachment_rel definition

-- Drop table

-- DROP TABLE public.email_template_attachment_rel;

CREATE TABLE public.email_template_attachment_rel (
	email_template_id int4 NOT NULL,
	attachment_id int4 NOT NULL,
	CONSTRAINT email_template_attachment_rel_email_template_id_attachment__key UNIQUE (email_template_id, attachment_id)
);
CREATE INDEX email_template_attachment_rel_attachment_id_idx ON public.email_template_attachment_rel USING btree (attachment_id);
CREATE INDEX email_template_attachment_rel_email_template_id_idx ON public.email_template_attachment_rel USING btree (email_template_id);


-- public.email_template_preview definition

-- Drop table

-- DROP TABLE public.email_template_preview;

CREATE TABLE public.email_template_preview (
	id serial NOT NULL,
	res_id varchar NULL,
	"name" varchar NULL,
	model_id int4 NULL,
	model varchar NULL,
	lang varchar NULL,
	user_signature bool NULL,
	subject varchar NULL,
	email_from varchar NULL,
	use_default_to bool NULL,
	email_to varchar NULL,
	partner_to varchar NULL,
	email_cc varchar NULL,
	reply_to varchar NULL,
	mail_server_id int4 NULL,
	body_html text NULL,
	report_name varchar NULL,
	report_template int4 NULL,
	ref_ir_act_window int4 NULL,
	auto_delete bool NULL,
	model_object_field int4 NULL,
	sub_object int4 NULL,
	sub_model_object_field int4 NULL,
	null_value varchar NULL,
	copyvalue varchar NULL,
	scheduled_date varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT email_template_preview_pkey PRIMARY KEY (id)
);
CREATE INDEX email_template_preview_model_index ON public.email_template_preview USING btree (model);


-- public.email_template_preview_res_partner_rel definition

-- Drop table

-- DROP TABLE public.email_template_preview_res_partner_rel;

CREATE TABLE public.email_template_preview_res_partner_rel (
	email_template_preview_id int4 NOT NULL,
	res_partner_id int4 NOT NULL,
	CONSTRAINT email_template_preview_res_pa_email_template_preview_id_res_key UNIQUE (email_template_preview_id, res_partner_id)
);
CREATE INDEX email_template_preview_res_partne_email_template_preview_id_idx ON public.email_template_preview_res_partner_rel USING btree (email_template_preview_id);
CREATE INDEX email_template_preview_res_partner_rel_res_partner_id_idx ON public.email_template_preview_res_partner_rel USING btree (res_partner_id);


-- public.employee_category_rel definition

-- Drop table

-- DROP TABLE public.employee_category_rel;

CREATE TABLE public.employee_category_rel (
	category_id int4 NOT NULL,
	emp_id int4 NOT NULL,
	CONSTRAINT employee_category_rel_category_id_emp_id_key UNIQUE (category_id, emp_id)
);
CREATE INDEX employee_category_rel_category_id_idx ON public.employee_category_rel USING btree (category_id);
CREATE INDEX employee_category_rel_emp_id_idx ON public.employee_category_rel USING btree (emp_id);


-- public.fetchmail_server definition

-- Drop table

-- DROP TABLE public.fetchmail_server;

CREATE TABLE public.fetchmail_server (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	active bool NULL,
	state varchar NULL,
	"server" varchar NULL,
	port int4 NULL,
	"type" varchar NOT NULL,
	is_ssl bool NULL,
	"attach" bool NULL,
	original bool NULL,
	"date" timestamp NULL,
	"user" varchar NULL,
	"password" varchar NULL,
	object_id int4 NULL,
	priority int4 NULL,
	"configuration" text NULL,
	script varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT fetchmail_server_pkey PRIMARY KEY (id)
);
CREATE INDEX fetchmail_server_state_index ON public.fetchmail_server USING btree (state);
CREATE INDEX fetchmail_server_type_index ON public.fetchmail_server USING btree (type);


-- public.hr_department definition

-- Drop table

-- DROP TABLE public.hr_department;

CREATE TABLE public.hr_department (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	complete_name varchar NULL,
	active bool NULL,
	company_id int4 NULL,
	parent_id int4 NULL,
	manager_id int4 NULL,
	note text NULL,
	color int4 NULL,
	message_main_attachment_id int4 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT hr_department_pkey PRIMARY KEY (id)
);
CREATE INDEX hr_department_company_id_index ON public.hr_department USING btree (company_id);
CREATE INDEX hr_department_message_main_attachment_id_index ON public.hr_department USING btree (message_main_attachment_id);
CREATE INDEX hr_department_parent_id_index ON public.hr_department USING btree (parent_id);


-- public.hr_department_mail_channel_rel definition

-- Drop table

-- DROP TABLE public.hr_department_mail_channel_rel;

CREATE TABLE public.hr_department_mail_channel_rel (
	mail_channel_id int4 NOT NULL,
	hr_department_id int4 NOT NULL,
	CONSTRAINT hr_department_mail_channel_re_mail_channel_id_hr_department_key UNIQUE (mail_channel_id, hr_department_id)
);
CREATE INDEX hr_department_mail_channel_rel_hr_department_id_idx ON public.hr_department_mail_channel_rel USING btree (hr_department_id);
CREATE INDEX hr_department_mail_channel_rel_mail_channel_id_idx ON public.hr_department_mail_channel_rel USING btree (mail_channel_id);


-- public.hr_employee definition

-- Drop table

-- DROP TABLE public.hr_employee;

CREATE TABLE public.hr_employee (
	id serial NOT NULL,
	"name" varchar NULL,
	user_id int4 NULL,
	active bool NULL,
	address_home_id int4 NULL,
	country_id int4 NULL,
	gender varchar NULL,
	marital varchar NULL,
	spouse_complete_name varchar NULL,
	spouse_birthdate date NULL,
	children int4 NULL,
	place_of_birth varchar NULL,
	country_of_birth int4 NULL,
	birthday date NULL,
	ssnid varchar NULL,
	sinid varchar NULL,
	identification_id varchar NULL,
	passport_id varchar NULL,
	bank_account_id int4 NULL,
	permit_no varchar NULL,
	visa_no varchar NULL,
	visa_expire date NULL,
	additional_note text NULL,
	certificate varchar NULL,
	study_field varchar NULL,
	study_school varchar NULL,
	emergency_contact varchar NULL,
	emergency_phone varchar NULL,
	km_home_work int4 NULL,
	google_drive_link varchar NULL,
	job_title varchar NULL,
	address_id int4 NULL,
	work_phone varchar NULL,
	mobile_phone varchar NULL,
	work_email varchar NULL,
	work_location varchar NULL,
	job_id int4 NULL,
	department_id int4 NULL,
	parent_id int4 NULL,
	coach_id int4 NULL,
	notes text NULL,
	color int4 NULL,
	message_main_attachment_id int4 NULL,
	resource_id int4 NOT NULL,
	company_id int4 NULL,
	resource_calendar_id int4 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT hr_employee_pkey PRIMARY KEY (id)
);
CREATE INDEX hr_employee_company_id_index ON public.hr_employee USING btree (company_id);
CREATE INDEX hr_employee_message_main_attachment_id_index ON public.hr_employee USING btree (message_main_attachment_id);
CREATE INDEX hr_employee_resource_calendar_id_index ON public.hr_employee USING btree (resource_calendar_id);
CREATE INDEX hr_employee_resource_id_index ON public.hr_employee USING btree (resource_id);


-- public.hr_employee_category definition

-- Drop table

-- DROP TABLE public.hr_employee_category;

CREATE TABLE public.hr_employee_category (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	color int4 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT hr_employee_category_name_uniq UNIQUE (name),
	CONSTRAINT hr_employee_category_pkey PRIMARY KEY (id)
);


-- public.hr_job definition

-- Drop table

-- DROP TABLE public.hr_job;

CREATE TABLE public.hr_job (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	expected_employees int4 NULL,
	no_of_employee int4 NULL,
	no_of_recruitment int4 NULL,
	no_of_hired_employee int4 NULL,
	description text NULL,
	requirements text NULL,
	department_id int4 NULL,
	company_id int4 NULL,
	state varchar NOT NULL,
	message_main_attachment_id int4 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT hr_job_name_company_uniq UNIQUE (name, company_id, department_id),
	CONSTRAINT hr_job_pkey PRIMARY KEY (id)
);
CREATE INDEX hr_job_message_main_attachment_id_index ON public.hr_job USING btree (message_main_attachment_id);
CREATE INDEX hr_job_name_index ON public.hr_job USING btree (name);


-- public.iap_account definition

-- Drop table

-- DROP TABLE public.iap_account;

CREATE TABLE public.iap_account (
	id serial NOT NULL,
	service_name varchar NULL,
	account_token varchar NULL,
	company_id int4 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT iap_account_pkey PRIMARY KEY (id)
);


-- public.ir_act_client definition

-- Drop table

-- DROP TABLE public.ir_act_client;

CREATE TABLE public.ir_act_client (
	tag varchar NOT NULL,
	target varchar NULL,
	res_model varchar NULL,
	context varchar NOT NULL,
	params_store bytea NULL,
	CONSTRAINT ir_act_client_pkey PRIMARY KEY (id)
)
INHERITS (public.ir_actions);


-- public.ir_act_report_xml definition

-- Drop table

-- DROP TABLE public.ir_act_report_xml;

CREATE TABLE public.ir_act_report_xml (
	model varchar NOT NULL,
	report_type varchar NOT NULL,
	report_name varchar NOT NULL,
	report_file varchar NULL,
	multi bool NULL,
	paperformat_id int4 NULL,
	print_report_name varchar NULL,
	attachment_use bool NULL,
	attachment varchar NULL,
	CONSTRAINT ir_act_report_xml_pkey PRIMARY KEY (id)
)
INHERITS (public.ir_actions);


-- public.ir_act_server definition

-- Drop table

-- DROP TABLE public.ir_act_server;

CREATE TABLE public.ir_act_server (
	"usage" varchar NOT NULL,
	state varchar NOT NULL,
	"sequence" int4 NULL,
	model_id int4 NOT NULL,
	model_name varchar NULL,
	code text NULL,
	crud_model_id int4 NULL,
	link_field_id int4 NULL,
	template_id int4 NULL,
	activity_type_id int4 NULL,
	activity_summary varchar NULL,
	activity_note text NULL,
	activity_date_deadline_range int4 NULL,
	activity_date_deadline_range_type varchar NULL,
	activity_user_type varchar NOT NULL,
	activity_user_id int4 NULL,
	activity_user_field_name varchar NULL,
	CONSTRAINT ir_act_server_pkey PRIMARY KEY (id)
)
INHERITS (public.ir_actions);


-- public.ir_act_server_mail_channel_rel definition

-- Drop table

-- DROP TABLE public.ir_act_server_mail_channel_rel;

CREATE TABLE public.ir_act_server_mail_channel_rel (
	ir_act_server_id int4 NOT NULL,
	mail_channel_id int4 NOT NULL,
	CONSTRAINT ir_act_server_mail_channel_re_ir_act_server_id_mail_channel_key UNIQUE (ir_act_server_id, mail_channel_id)
);
CREATE INDEX ir_act_server_mail_channel_rel_ir_act_server_id_idx ON public.ir_act_server_mail_channel_rel USING btree (ir_act_server_id);
CREATE INDEX ir_act_server_mail_channel_rel_mail_channel_id_idx ON public.ir_act_server_mail_channel_rel USING btree (mail_channel_id);


-- public.ir_act_server_res_partner_rel definition

-- Drop table

-- DROP TABLE public.ir_act_server_res_partner_rel;

CREATE TABLE public.ir_act_server_res_partner_rel (
	ir_act_server_id int4 NOT NULL,
	res_partner_id int4 NOT NULL,
	CONSTRAINT ir_act_server_res_partner_rel_ir_act_server_id_res_partner__key UNIQUE (ir_act_server_id, res_partner_id)
);
CREATE INDEX ir_act_server_res_partner_rel_ir_act_server_id_idx ON public.ir_act_server_res_partner_rel USING btree (ir_act_server_id);
CREATE INDEX ir_act_server_res_partner_rel_res_partner_id_idx ON public.ir_act_server_res_partner_rel USING btree (res_partner_id);


-- public.ir_act_url definition

-- Drop table

-- DROP TABLE public.ir_act_url;

CREATE TABLE public.ir_act_url (
	url text NOT NULL,
	target varchar NOT NULL,
	CONSTRAINT ir_act_url_pkey PRIMARY KEY (id)
)
INHERITS (public.ir_actions);


-- public.ir_act_window definition

-- Drop table

-- DROP TABLE public.ir_act_window;

CREATE TABLE public.ir_act_window (
	view_id int4 NULL,
	"domain" varchar NULL,
	context varchar NOT NULL,
	res_id int4 NULL,
	res_model varchar NOT NULL,
	src_model varchar NULL,
	target varchar NULL,
	view_mode varchar NOT NULL,
	view_type varchar NOT NULL,
	"usage" varchar NULL,
	"limit" int4 NULL,
	search_view_id int4 NULL,
	"filter" bool NULL,
	auto_search bool NULL,
	multi bool NULL,
	CONSTRAINT ir_act_window_pkey PRIMARY KEY (id)
)
INHERITS (public.ir_actions);


-- public.ir_act_window_group_rel definition

-- Drop table

-- DROP TABLE public.ir_act_window_group_rel;

CREATE TABLE public.ir_act_window_group_rel (
	act_id int4 NOT NULL,
	gid int4 NOT NULL,
	CONSTRAINT ir_act_window_group_rel_act_id_gid_key UNIQUE (act_id, gid)
);
CREATE INDEX ir_act_window_group_rel_act_id_idx ON public.ir_act_window_group_rel USING btree (act_id);
CREATE INDEX ir_act_window_group_rel_gid_idx ON public.ir_act_window_group_rel USING btree (gid);


-- public.ir_act_window_view definition

-- Drop table

-- DROP TABLE public.ir_act_window_view;

CREATE TABLE public.ir_act_window_view (
	id serial NOT NULL,
	"sequence" int4 NULL,
	view_id int4 NULL,
	view_mode varchar NOT NULL,
	act_window_id int4 NULL,
	multi bool NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_act_window_view_pkey PRIMARY KEY (id)
);
CREATE UNIQUE INDEX act_window_view_unique_mode_per_action ON public.ir_act_window_view USING btree (act_window_id, view_mode);


-- public.ir_actions definition

-- Drop table

-- DROP TABLE public.ir_actions;

CREATE TABLE public.ir_actions (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	"type" varchar NOT NULL,
	help text NULL,
	binding_model_id int4 NULL,
	binding_type varchar NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_actions_pkey PRIMARY KEY (id)
);


-- public.ir_actions_todo definition

-- Drop table

-- DROP TABLE public.ir_actions_todo;

CREATE TABLE public.ir_actions_todo (
	id serial NOT NULL,
	action_id int4 NOT NULL,
	"sequence" int4 NULL,
	state varchar NOT NULL,
	"name" varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_actions_todo_pkey PRIMARY KEY (id)
);
CREATE INDEX ir_actions_todo_action_id_index ON public.ir_actions_todo USING btree (action_id);


-- public.ir_attachment definition

-- Drop table

-- DROP TABLE public.ir_attachment;

CREATE TABLE public.ir_attachment (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	datas_fname varchar NULL,
	description text NULL,
	res_name varchar NULL,
	res_model varchar NULL,
	res_model_name varchar NULL,
	res_field varchar NULL,
	res_id int4 NULL,
	company_id int4 NULL,
	"type" varchar NOT NULL,
	url varchar(1024) NULL,
	public bool NULL,
	access_token varchar NULL,
	db_datas bytea NULL,
	store_fname varchar NULL,
	file_size int4 NULL,
	checksum varchar(40) NULL,
	mimetype varchar NULL,
	index_content text NULL,
	active bool NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_attachment_pkey PRIMARY KEY (id)
);
CREATE INDEX ir_attachment_checksum_index ON public.ir_attachment USING btree (checksum);
CREATE INDEX ir_attachment_res_idx ON public.ir_attachment USING btree (res_model, res_id);
CREATE INDEX ir_attachment_res_model_name_index ON public.ir_attachment USING btree (res_model_name);
CREATE INDEX ir_attachment_url_index ON public.ir_attachment USING btree (url);


-- public.ir_config_parameter definition

-- Drop table

-- DROP TABLE public.ir_config_parameter;

CREATE TABLE public.ir_config_parameter (
	id serial NOT NULL,
	"key" varchar NOT NULL,
	value text NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_config_parameter_key_uniq UNIQUE (key),
	CONSTRAINT ir_config_parameter_pkey PRIMARY KEY (id)
);
CREATE INDEX ir_config_parameter_key_index ON public.ir_config_parameter USING btree (key);


-- public.ir_cron definition

-- Drop table

-- DROP TABLE public.ir_cron;

CREATE TABLE public.ir_cron (
	id serial NOT NULL,
	ir_actions_server_id int4 NOT NULL,
	cron_name varchar NULL,
	user_id int4 NOT NULL,
	active bool NULL,
	interval_number int4 NULL,
	interval_type varchar NULL,
	numbercall int4 NULL,
	doall bool NULL,
	nextcall timestamp NOT NULL,
	priority int4 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_cron_pkey PRIMARY KEY (id)
);


-- public.ir_default definition

-- Drop table

-- DROP TABLE public.ir_default;

CREATE TABLE public.ir_default (
	id serial NOT NULL,
	field_id int4 NOT NULL,
	user_id int4 NULL,
	company_id int4 NULL,
	"condition" varchar NULL,
	json_value varchar NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_default_pkey PRIMARY KEY (id)
);
CREATE INDEX ir_default_company_id_index ON public.ir_default USING btree (company_id);
CREATE INDEX ir_default_field_id_index ON public.ir_default USING btree (field_id);
CREATE INDEX ir_default_user_id_index ON public.ir_default USING btree (user_id);


-- public.ir_demo definition

-- Drop table

-- DROP TABLE public.ir_demo;

CREATE TABLE public.ir_demo (
	id serial NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_demo_pkey PRIMARY KEY (id)
);


-- public.ir_demo_failure definition

-- Drop table

-- DROP TABLE public.ir_demo_failure;

CREATE TABLE public.ir_demo_failure (
	id serial NOT NULL,
	module_id int4 NOT NULL,
	error varchar NULL,
	wizard_id int4 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_demo_failure_pkey PRIMARY KEY (id)
);


-- public.ir_demo_failure_wizard definition

-- Drop table

-- DROP TABLE public.ir_demo_failure_wizard;

CREATE TABLE public.ir_demo_failure_wizard (
	id serial NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_demo_failure_wizard_pkey PRIMARY KEY (id)
);


-- public.ir_exports definition

-- Drop table

-- DROP TABLE public.ir_exports;

CREATE TABLE public.ir_exports (
	id serial NOT NULL,
	"name" varchar NULL,
	resource varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_exports_pkey PRIMARY KEY (id)
);
CREATE INDEX ir_exports_resource_index ON public.ir_exports USING btree (resource);


-- public.ir_exports_line definition

-- Drop table

-- DROP TABLE public.ir_exports_line;

CREATE TABLE public.ir_exports_line (
	id serial NOT NULL,
	"name" varchar NULL,
	export_id int4 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_exports_line_pkey PRIMARY KEY (id)
);
CREATE INDEX ir_exports_line_export_id_index ON public.ir_exports_line USING btree (export_id);


-- public.ir_filters definition

-- Drop table

-- DROP TABLE public.ir_filters;

CREATE TABLE public.ir_filters (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	user_id int4 NULL,
	"domain" text NOT NULL,
	context text NOT NULL,
	sort text NOT NULL,
	model_id varchar NOT NULL,
	is_default bool NULL,
	action_id int4 NULL,
	active bool NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_filters_name_model_uid_unique UNIQUE (name, model_id, user_id, action_id),
	CONSTRAINT ir_filters_pkey PRIMARY KEY (id)
);
CREATE UNIQUE INDEX ir_filters_name_model_uid_unique_action_index ON public.ir_filters USING btree (lower((name)::text), model_id, COALESCE(user_id, '-1'::integer), COALESCE(action_id, '-1'::integer));


-- public.ir_mail_server definition

-- Drop table

-- DROP TABLE public.ir_mail_server;

CREATE TABLE public.ir_mail_server (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	smtp_host varchar NOT NULL,
	smtp_port int4 NOT NULL,
	smtp_user varchar NULL,
	smtp_pass varchar NULL,
	smtp_encryption varchar NOT NULL,
	smtp_debug bool NULL,
	"sequence" int4 NULL,
	active bool NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_mail_server_pkey PRIMARY KEY (id)
);
CREATE INDEX ir_mail_server_name_index ON public.ir_mail_server USING btree (name);


-- public.ir_model definition

-- Drop table

-- DROP TABLE public.ir_model;

CREATE TABLE public.ir_model (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	model varchar NOT NULL,
	info text NULL,
	state varchar NULL,
	transient bool NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	is_mail_thread bool NULL,
	CONSTRAINT ir_model_obj_name_uniq UNIQUE (model),
	CONSTRAINT ir_model_pkey PRIMARY KEY (id)
);
CREATE INDEX ir_model_model_index ON public.ir_model USING btree (model);


-- public.ir_model_access definition

-- Drop table

-- DROP TABLE public.ir_model_access;

CREATE TABLE public.ir_model_access (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	active bool NULL,
	model_id int4 NOT NULL,
	group_id int4 NULL,
	perm_read bool NULL,
	perm_write bool NULL,
	perm_create bool NULL,
	perm_unlink bool NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_model_access_pkey PRIMARY KEY (id)
);
CREATE INDEX ir_model_access_group_id_index ON public.ir_model_access USING btree (group_id);
CREATE INDEX ir_model_access_model_id_index ON public.ir_model_access USING btree (model_id);
CREATE INDEX ir_model_access_name_index ON public.ir_model_access USING btree (name);


-- public.ir_model_constraint definition

-- Drop table

-- DROP TABLE public.ir_model_constraint;

CREATE TABLE public.ir_model_constraint (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	definition varchar NULL,
	model int4 NOT NULL,
	"module" int4 NOT NULL,
	"type" varchar(1) NOT NULL,
	date_update timestamp NULL,
	date_init timestamp NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_model_constraint_module_name_uniq UNIQUE (name, module),
	CONSTRAINT ir_model_constraint_pkey PRIMARY KEY (id)
);
CREATE INDEX ir_model_constraint_model_index ON public.ir_model_constraint USING btree (model);
CREATE INDEX ir_model_constraint_module_index ON public.ir_model_constraint USING btree (module);
CREATE INDEX ir_model_constraint_name_index ON public.ir_model_constraint USING btree (name);
CREATE INDEX ir_model_constraint_type_index ON public.ir_model_constraint USING btree (type);


-- public.ir_model_data definition

-- Drop table

-- DROP TABLE public.ir_model_data;

CREATE TABLE public.ir_model_data (
	id serial NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_date timestamp NULL,
	write_uid int4 NULL,
	noupdate bool NULL,
	"name" varchar NOT NULL,
	date_init timestamp NULL,
	date_update timestamp NULL,
	"module" varchar NOT NULL,
	model varchar NOT NULL,
	res_id int4 NULL,
	CONSTRAINT ir_model_data_pkey PRIMARY KEY (id)
);
CREATE INDEX ir_model_data_model_res_id_index ON public.ir_model_data USING btree (model, res_id);
CREATE UNIQUE INDEX ir_model_data_module_name_uniq_index ON public.ir_model_data USING btree (module, name);


-- public.ir_model_fields definition

-- Drop table

-- DROP TABLE public.ir_model_fields;

CREATE TABLE public.ir_model_fields (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	complete_name varchar NULL,
	model varchar NOT NULL,
	relation varchar NULL,
	relation_field varchar NULL,
	relation_field_id int4 NULL,
	model_id int4 NOT NULL,
	field_description varchar NOT NULL,
	help text NULL,
	ttype varchar NOT NULL,
	selection varchar NULL,
	copied bool NULL,
	related varchar NULL,
	related_field_id int4 NULL,
	required bool NULL,
	readonly bool NULL,
	"index" bool NULL,
	"translate" bool NULL,
	"size" int4 NULL,
	state varchar NOT NULL,
	on_delete varchar NULL,
	"domain" varchar NULL,
	selectable bool NULL,
	relation_table varchar NULL,
	column1 varchar NULL,
	column2 varchar NULL,
	compute text NULL,
	"depends" varchar NULL,
	store bool NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	track_visibility varchar NULL,
	CONSTRAINT ir_model_fields_name_unique UNIQUE (model, name),
	CONSTRAINT ir_model_fields_pkey PRIMARY KEY (id),
	CONSTRAINT ir_model_fields_size_gt_zero CHECK ((size >= 0))
);
CREATE INDEX ir_model_fields_complete_name_index ON public.ir_model_fields USING btree (complete_name);
CREATE INDEX ir_model_fields_model_id_index ON public.ir_model_fields USING btree (model_id);
CREATE INDEX ir_model_fields_model_index ON public.ir_model_fields USING btree (model);
CREATE INDEX ir_model_fields_name_index ON public.ir_model_fields USING btree (name);
CREATE INDEX ir_model_fields_state_index ON public.ir_model_fields USING btree (state);


-- public.ir_model_fields_group_rel definition

-- Drop table

-- DROP TABLE public.ir_model_fields_group_rel;

CREATE TABLE public.ir_model_fields_group_rel (
	field_id int4 NOT NULL,
	group_id int4 NOT NULL,
	CONSTRAINT ir_model_fields_group_rel_field_id_group_id_key UNIQUE (field_id, group_id)
);
CREATE INDEX ir_model_fields_group_rel_field_id_idx ON public.ir_model_fields_group_rel USING btree (field_id);
CREATE INDEX ir_model_fields_group_rel_group_id_idx ON public.ir_model_fields_group_rel USING btree (group_id);


-- public.ir_model_relation definition

-- Drop table

-- DROP TABLE public.ir_model_relation;

CREATE TABLE public.ir_model_relation (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	model int4 NOT NULL,
	"module" int4 NOT NULL,
	date_update timestamp NULL,
	date_init timestamp NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_model_relation_pkey PRIMARY KEY (id)
);
CREATE INDEX ir_model_relation_model_index ON public.ir_model_relation USING btree (model);
CREATE INDEX ir_model_relation_module_index ON public.ir_model_relation USING btree (module);
CREATE INDEX ir_model_relation_name_index ON public.ir_model_relation USING btree (name);


-- public.ir_module_category definition

-- Drop table

-- DROP TABLE public.ir_module_category;

CREATE TABLE public.ir_module_category (
	id serial NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_date timestamp NULL,
	write_uid int4 NULL,
	parent_id int4 NULL,
	"name" varchar NOT NULL,
	description text NULL,
	"sequence" int4 NULL,
	visible bool NULL,
	"exclusive" bool NULL,
	CONSTRAINT ir_module_category_pkey PRIMARY KEY (id)
);
CREATE INDEX ir_module_category_name_index ON public.ir_module_category USING btree (name);
CREATE INDEX ir_module_category_parent_id_index ON public.ir_module_category USING btree (parent_id);


-- public.ir_module_module definition

-- Drop table

-- DROP TABLE public.ir_module_module;

CREATE TABLE public.ir_module_module (
	id serial NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_date timestamp NULL,
	write_uid int4 NULL,
	website varchar NULL,
	summary varchar NULL,
	"name" varchar NOT NULL,
	author varchar NULL,
	icon varchar NULL,
	state varchar(16) NULL,
	latest_version varchar NULL,
	shortdesc varchar NULL,
	category_id int4 NULL,
	description text NULL,
	application bool NULL DEFAULT false,
	demo bool NULL DEFAULT false,
	web bool NULL DEFAULT false,
	license varchar(32) NULL,
	"sequence" int4 NULL DEFAULT 100,
	auto_install bool NULL DEFAULT false,
	to_buy bool NULL DEFAULT false,
	maintainer varchar NULL,
	contributors text NULL,
	published_version varchar NULL,
	url varchar NULL,
	menus_by_module text NULL,
	reports_by_module text NULL,
	views_by_module text NULL,
	CONSTRAINT ir_module_module_name_uniq UNIQUE (name),
	CONSTRAINT ir_module_module_pkey PRIMARY KEY (id),
	CONSTRAINT name_uniq UNIQUE (name)
);
CREATE INDEX ir_module_module_category_id_index ON public.ir_module_module USING btree (category_id);
CREATE INDEX ir_module_module_name_index ON public.ir_module_module USING btree (name);
CREATE INDEX ir_module_module_state_index ON public.ir_module_module USING btree (state);


-- public.ir_module_module_dependency definition

-- Drop table

-- DROP TABLE public.ir_module_module_dependency;

CREATE TABLE public.ir_module_module_dependency (
	id serial NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_date timestamp NULL,
	write_uid int4 NULL,
	"name" varchar NULL,
	module_id int4 NULL,
	CONSTRAINT ir_module_module_dependency_pkey PRIMARY KEY (id)
);
CREATE INDEX ir_module_module_dependency_name_index ON public.ir_module_module_dependency USING btree (name);


-- public.ir_module_module_exclusion definition

-- Drop table

-- DROP TABLE public.ir_module_module_exclusion;

CREATE TABLE public.ir_module_module_exclusion (
	id serial NOT NULL,
	"name" varchar NULL,
	module_id int4 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_module_module_exclusion_pkey PRIMARY KEY (id)
);
CREATE INDEX ir_module_module_exclusion_name_index ON public.ir_module_module_exclusion USING btree (name);


-- public.ir_property definition

-- Drop table

-- DROP TABLE public.ir_property;

CREATE TABLE public.ir_property (
	id serial NOT NULL,
	"name" varchar NULL,
	res_id varchar NULL,
	company_id int4 NULL,
	fields_id int4 NOT NULL,
	value_float float8 NULL,
	value_integer int4 NULL,
	value_text text NULL,
	value_binary bytea NULL,
	value_reference varchar NULL,
	value_datetime timestamp NULL,
	"type" varchar NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_property_pkey PRIMARY KEY (id)
);
CREATE INDEX ir_property_company_id_index ON public.ir_property USING btree (company_id);
CREATE INDEX ir_property_fields_id_index ON public.ir_property USING btree (fields_id);
CREATE INDEX ir_property_name_index ON public.ir_property USING btree (name);
CREATE INDEX ir_property_res_id_index ON public.ir_property USING btree (res_id);
CREATE INDEX ir_property_type_index ON public.ir_property USING btree (type);


-- public.ir_rule definition

-- Drop table

-- DROP TABLE public.ir_rule;

CREATE TABLE public.ir_rule (
	id serial NOT NULL,
	"name" varchar NULL,
	active bool NULL,
	model_id int4 NOT NULL,
	domain_force text NULL,
	perm_read bool NULL,
	perm_write bool NULL,
	perm_create bool NULL,
	perm_unlink bool NULL,
	"global" bool NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_rule_no_access_rights CHECK (((perm_read <> false) OR (perm_write <> false) OR (perm_create <> false) OR (perm_unlink <> false))),
	CONSTRAINT ir_rule_pkey PRIMARY KEY (id)
);
CREATE INDEX ir_rule_model_id_index ON public.ir_rule USING btree (model_id);
CREATE INDEX ir_rule_name_index ON public.ir_rule USING btree (name);


-- public.ir_sequence definition

-- Drop table

-- DROP TABLE public.ir_sequence;

CREATE TABLE public.ir_sequence (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	code varchar NULL,
	"implementation" varchar NOT NULL,
	active bool NULL,
	prefix varchar NULL,
	suffix varchar NULL,
	number_next int4 NOT NULL,
	number_increment int4 NOT NULL,
	padding int4 NOT NULL,
	company_id int4 NULL,
	use_date_range bool NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_sequence_pkey PRIMARY KEY (id)
);


-- public.ir_sequence_date_range definition

-- Drop table

-- DROP TABLE public.ir_sequence_date_range;

CREATE TABLE public.ir_sequence_date_range (
	id serial NOT NULL,
	date_from date NOT NULL,
	date_to date NOT NULL,
	sequence_id int4 NOT NULL,
	number_next int4 NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_sequence_date_range_pkey PRIMARY KEY (id)
);


-- public.ir_server_object_lines definition

-- Drop table

-- DROP TABLE public.ir_server_object_lines;

CREATE TABLE public.ir_server_object_lines (
	id serial NOT NULL,
	server_id int4 NULL,
	col1 int4 NOT NULL,
	value text NOT NULL,
	"type" varchar NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_server_object_lines_pkey PRIMARY KEY (id)
);


-- public.ir_translation definition

-- Drop table

-- DROP TABLE public.ir_translation;

CREATE TABLE public.ir_translation (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	res_id int4 NULL,
	lang varchar NULL,
	"type" varchar NULL,
	src text NULL,
	value text NULL,
	"module" varchar NULL,
	state varchar NULL,
	"comments" text NULL,
	CONSTRAINT ir_translation_pkey PRIMARY KEY (id)
);
CREATE UNIQUE INDEX ir_translation_code_unique ON public.ir_translation USING btree (type, lang, md5(src)) WHERE ((type)::text = 'code'::text);
CREATE INDEX ir_translation_comments_index ON public.ir_translation USING btree (comments);
CREATE UNIQUE INDEX ir_translation_model_unique ON public.ir_translation USING btree (type, lang, name, res_id) WHERE ((type)::text = 'model'::text);
CREATE INDEX ir_translation_module_index ON public.ir_translation USING btree (module);
CREATE INDEX ir_translation_res_id_index ON public.ir_translation USING btree (res_id);
CREATE UNIQUE INDEX ir_translation_selection_unique ON public.ir_translation USING btree (type, lang, name, md5(src)) WHERE ((type)::text = ANY (ARRAY[('selection'::character varying)::text, ('constraint'::character varying)::text, ('sql_constraint'::character varying)::text]));
CREATE INDEX ir_translation_src_md5 ON public.ir_translation USING btree (md5(src));
CREATE INDEX ir_translation_type_index ON public.ir_translation USING btree (type);
CREATE UNIQUE INDEX ir_translation_unique ON public.ir_translation USING btree (type, name, lang, res_id, md5(src));


-- public.ir_ui_menu definition

-- Drop table

-- DROP TABLE public.ir_ui_menu;

CREATE TABLE public.ir_ui_menu (
	id serial NOT NULL,
	parent_path varchar NULL,
	"name" varchar NOT NULL,
	active bool NULL,
	"sequence" int4 NULL,
	parent_id int4 NULL,
	web_icon varchar NULL,
	"action" varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_ui_menu_pkey PRIMARY KEY (id)
);
CREATE INDEX ir_ui_menu_parent_id_index ON public.ir_ui_menu USING btree (parent_id);
CREATE INDEX ir_ui_menu_parent_path_index ON public.ir_ui_menu USING btree (parent_path);


-- public.ir_ui_menu_group_rel definition

-- Drop table

-- DROP TABLE public.ir_ui_menu_group_rel;

CREATE TABLE public.ir_ui_menu_group_rel (
	menu_id int4 NOT NULL,
	gid int4 NOT NULL,
	CONSTRAINT ir_ui_menu_group_rel_menu_id_gid_key UNIQUE (menu_id, gid)
);
CREATE INDEX ir_ui_menu_group_rel_gid_idx ON public.ir_ui_menu_group_rel USING btree (gid);
CREATE INDEX ir_ui_menu_group_rel_menu_id_idx ON public.ir_ui_menu_group_rel USING btree (menu_id);


-- public.ir_ui_view definition

-- Drop table

-- DROP TABLE public.ir_ui_view;

CREATE TABLE public.ir_ui_view (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	model varchar NULL,
	"key" varchar NULL,
	priority int4 NOT NULL,
	"type" varchar NULL,
	arch_db text NULL,
	arch_fs varchar NULL,
	inherit_id int4 NULL,
	field_parent varchar NULL,
	"mode" varchar NOT NULL,
	active bool NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_ui_view_inheritance_mode CHECK ((((mode)::text <> 'extension'::text) OR (inherit_id IS NOT NULL))),
	CONSTRAINT ir_ui_view_pkey PRIMARY KEY (id),
	CONSTRAINT ir_ui_view_qweb_required_key CHECK ((((type)::text <> 'qweb'::text) OR (key IS NOT NULL)))
);
CREATE INDEX ir_ui_view_inherit_id_index ON public.ir_ui_view USING btree (inherit_id);
CREATE INDEX ir_ui_view_model_index ON public.ir_ui_view USING btree (model);
CREATE INDEX ir_ui_view_model_type_inherit_id ON public.ir_ui_view USING btree (model, inherit_id);


-- public.ir_ui_view_custom definition

-- Drop table

-- DROP TABLE public.ir_ui_view_custom;

CREATE TABLE public.ir_ui_view_custom (
	id serial NOT NULL,
	ref_id int4 NOT NULL,
	user_id int4 NOT NULL,
	arch text NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT ir_ui_view_custom_pkey PRIMARY KEY (id)
);
CREATE INDEX ir_ui_view_custom_ref_id_index ON public.ir_ui_view_custom USING btree (ref_id);
CREATE INDEX ir_ui_view_custom_user_id_index ON public.ir_ui_view_custom USING btree (user_id);
CREATE INDEX ir_ui_view_custom_user_id_ref_id ON public.ir_ui_view_custom USING btree (user_id, ref_id);


-- public.ir_ui_view_group_rel definition

-- Drop table

-- DROP TABLE public.ir_ui_view_group_rel;

CREATE TABLE public.ir_ui_view_group_rel (
	view_id int4 NOT NULL,
	group_id int4 NOT NULL,
	CONSTRAINT ir_ui_view_group_rel_view_id_group_id_key UNIQUE (view_id, group_id)
);
CREATE INDEX ir_ui_view_group_rel_group_id_idx ON public.ir_ui_view_group_rel USING btree (group_id);
CREATE INDEX ir_ui_view_group_rel_view_id_idx ON public.ir_ui_view_group_rel USING btree (view_id);


-- public.lw_access_token definition

-- Drop table

-- DROP TABLE public.lw_access_token;

CREATE TABLE public.lw_access_token (
	id serial NOT NULL,
	partner_id int4 NOT NULL,
	"token" varchar NOT NULL,
	device_id varchar NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT lw_access_token_pkey PRIMARY KEY (id)
);


-- public.lw_calo_history definition

-- Drop table

-- DROP TABLE public.lw_calo_history;

CREATE TABLE public.lw_calo_history (
	id serial NOT NULL,
	partner_id int4 NOT NULL,
	calo_input float8 NULL,
	calo_ouput float8 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT lw_calo_history_pkey PRIMARY KEY (id)
);


-- public.lw_diet definition

-- Drop table

-- DROP TABLE public.lw_diet;

CREATE TABLE public.lw_diet (
	id serial NOT NULL,
	partner_id int4 NOT NULL,
	lw_week_id int4 NOT NULL,
	lw_menu_id int4 NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT lw_diet_pkey PRIMARY KEY (id)
);


-- public.lw_ex_partner_week definition

-- Drop table

-- DROP TABLE public.lw_ex_partner_week;

CREATE TABLE public.lw_ex_partner_week (
	id serial NOT NULL,
	lw_week_id int4 NOT NULL,
	lw_exercise_partner_id int4 NOT NULL,
	active bool NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	finish_flag bool NULL,
	CONSTRAINT lw_ex_partner_week_pkey PRIMARY KEY (id)
);


-- public.lw_exercise definition

-- Drop table

-- DROP TABLE public.lw_exercise;

CREATE TABLE public.lw_exercise (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	duration int4 NOT NULL,
	description text NOT NULL,
	kcal float8 NULL,
	min_weight float8 NULL,
	max_weight float8 NULL,
	min_height float8 NULL,
	max_height float8 NULL,
	fixed bool NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	image varchar NULL,
	video varchar NULL,
	CONSTRAINT lw_exercise_pkey PRIMARY KEY (id)
);


-- public.lw_exercise_lw_weightloss_area_rel definition

-- Drop table

-- DROP TABLE public.lw_exercise_lw_weightloss_area_rel;

CREATE TABLE public.lw_exercise_lw_weightloss_area_rel (
	id serial NOT NULL,
	lw_exercise_id int4 NOT NULL,
	lw_weightloss_area_id int4 NOT NULL,
	CONSTRAINT lw_exercise_lw_weightloss_are_lw_exercise_id_lw_weightloss__key UNIQUE (lw_exercise_id, lw_weightloss_area_id),
	CONSTRAINT lw_exercise_lw_weightloss_area_rel_pkey PRIMARY KEY (id)
);
CREATE INDEX lw_exercise_lw_weightloss_area_rel_lw_exercise_id_idx ON public.lw_exercise_lw_weightloss_area_rel USING btree (lw_exercise_id);
CREATE INDEX lw_exercise_lw_weightloss_area_rel_lw_weightloss_area_id_idx ON public.lw_exercise_lw_weightloss_area_rel USING btree (lw_weightloss_area_id);


-- public.lw_exercise_partner definition

-- Drop table

-- DROP TABLE public.lw_exercise_partner;

CREATE TABLE public.lw_exercise_partner (
	id serial NOT NULL,
	exercise_id int4 NOT NULL,
	partner_id int4 NOT NULL,
	progress float8 NOT NULL,
	emotion varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT lw_exercise_partner_pkey PRIMARY KEY (id)
);


-- public.lw_fcm_token definition

-- Drop table

-- DROP TABLE public.lw_fcm_token;

CREATE TABLE public.lw_fcm_token (
	id serial NOT NULL,
	partner_id int4 NOT NULL,
	"token" varchar NOT NULL,
	device_id varchar NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT lw_fcm_token_pkey PRIMARY KEY (id)
);


-- public.lw_food definition

-- Drop table

-- DROP TABLE public.lw_food;

CREATE TABLE public.lw_food (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	calo float8 NOT NULL,
	description text NULL,
	total_like int4 NOT NULL,
	recommend_level varchar NULL,
	prepare_time float8 NOT NULL,
	cooking_time float8 NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	image varchar NULL,
	CONSTRAINT lw_food_pkey PRIMARY KEY (id)
);


-- public.lw_news definition

-- Drop table

-- DROP TABLE public.lw_news;

CREATE TABLE public.lw_news (
	id serial NOT NULL,
	title varchar NOT NULL,
	description text NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	image_url_list varchar NULL,
	CONSTRAINT lw_news_pkey PRIMARY KEY (id)
);


-- public.lw_news_trace definition

-- Drop table

-- DROP TABLE public.lw_news_trace;

CREATE TABLE public.lw_news_trace (
	id serial NOT NULL,
	partner_id int4 NOT NULL,
	news_id int4 NOT NULL,
	read_flg bool NOT NULL,
	like_flg bool NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT lw_news_trace_pkey PRIMARY KEY (id)
);


-- public.lw_week definition

-- Drop table

-- DROP TABLE public.lw_week;

CREATE TABLE public.lw_week (
	id serial NOT NULL,
	day_of_week varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT lw_week_pkey PRIMARY KEY (id)
);


-- public.lw_weightloss_area definition

-- Drop table

-- DROP TABLE public.lw_weightloss_area;

CREATE TABLE public.lw_weightloss_area (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT lw_weightloss_area_pkey PRIMARY KEY (id)
);


-- public.lw_weightloss_area_partner definition

-- Drop table

-- DROP TABLE public.lw_weightloss_area_partner;

CREATE TABLE public.lw_weightloss_area_partner (
	id serial NOT NULL,
	partner_id int4 NOT NULL,
	weightloss_area_id int4 NOT NULL,
	active bool NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT lw_weightloss_area_partner_pkey PRIMARY KEY (id)
);


-- public.mail_activity definition

-- Drop table

-- DROP TABLE public.mail_activity;

CREATE TABLE public.mail_activity (
	id serial NOT NULL,
	res_id int4 NOT NULL,
	res_model_id int4 NOT NULL,
	res_model varchar NULL,
	res_name varchar NULL,
	activity_type_id int4 NULL,
	summary varchar NULL,
	note text NULL,
	feedback text NULL,
	date_deadline date NOT NULL,
	automated bool NULL,
	user_id int4 NOT NULL,
	create_user_id int4 NULL,
	recommended_activity_type_id int4 NULL,
	previous_activity_type_id int4 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT mail_activity_pkey PRIMARY KEY (id)
);
CREATE INDEX mail_activity_create_user_id_index ON public.mail_activity USING btree (create_user_id);
CREATE INDEX mail_activity_date_deadline_index ON public.mail_activity USING btree (date_deadline);
CREATE INDEX mail_activity_res_id_index ON public.mail_activity USING btree (res_id);
CREATE INDEX mail_activity_res_model_id_index ON public.mail_activity USING btree (res_model_id);
CREATE INDEX mail_activity_res_model_index ON public.mail_activity USING btree (res_model);
CREATE INDEX mail_activity_user_id_index ON public.mail_activity USING btree (user_id);


-- public.mail_activity_rel definition

-- Drop table

-- DROP TABLE public.mail_activity_rel;

CREATE TABLE public.mail_activity_rel (
	activity_id int4 NOT NULL,
	recommended_id int4 NOT NULL,
	CONSTRAINT mail_activity_rel_activity_id_recommended_id_key UNIQUE (activity_id, recommended_id)
);
CREATE INDEX mail_activity_rel_activity_id_idx ON public.mail_activity_rel USING btree (activity_id);
CREATE INDEX mail_activity_rel_recommended_id_idx ON public.mail_activity_rel USING btree (recommended_id);


-- public.mail_activity_type definition

-- Drop table

-- DROP TABLE public.mail_activity_type;

CREATE TABLE public.mail_activity_type (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	summary varchar NULL,
	"sequence" int4 NULL,
	active bool NULL,
	delay_count int4 NULL,
	delay_unit varchar NOT NULL,
	delay_from varchar NOT NULL,
	icon varchar NULL,
	decoration_type varchar NULL,
	res_model_id int4 NULL,
	default_next_type_id int4 NULL,
	force_next bool NULL,
	category varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT mail_activity_type_pkey PRIMARY KEY (id)
);
CREATE INDEX mail_activity_type_res_model_id_index ON public.mail_activity_type USING btree (res_model_id);


-- public.mail_activity_type_mail_template_rel definition

-- Drop table

-- DROP TABLE public.mail_activity_type_mail_template_rel;

CREATE TABLE public.mail_activity_type_mail_template_rel (
	mail_activity_type_id int4 NOT NULL,
	mail_template_id int4 NOT NULL,
	CONSTRAINT mail_activity_type_mail_templ_mail_activity_type_id_mail_te_key UNIQUE (mail_activity_type_id, mail_template_id)
);
CREATE INDEX mail_activity_type_mail_template_rel_mail_activity_type_id_idx ON public.mail_activity_type_mail_template_rel USING btree (mail_activity_type_id);
CREATE INDEX mail_activity_type_mail_template_rel_mail_template_id_idx ON public.mail_activity_type_mail_template_rel USING btree (mail_template_id);


-- public.mail_alias definition

-- Drop table

-- DROP TABLE public.mail_alias;

CREATE TABLE public.mail_alias (
	id serial NOT NULL,
	alias_name varchar NULL,
	alias_model_id int4 NOT NULL,
	alias_user_id int4 NULL,
	alias_defaults text NOT NULL,
	alias_force_thread_id int4 NULL,
	alias_parent_model_id int4 NULL,
	alias_parent_thread_id int4 NULL,
	alias_contact varchar NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT mail_alias_alias_unique UNIQUE (alias_name),
	CONSTRAINT mail_alias_pkey PRIMARY KEY (id)
);


-- public.mail_blacklist definition

-- Drop table

-- DROP TABLE public.mail_blacklist;

CREATE TABLE public.mail_blacklist (
	id serial NOT NULL,
	email varchar NOT NULL,
	active bool NULL,
	message_main_attachment_id int4 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT mail_blacklist_pkey PRIMARY KEY (id),
	CONSTRAINT mail_blacklist_unique_email UNIQUE (email)
);
CREATE INDEX mail_blacklist_email_index ON public.mail_blacklist USING btree (email);
CREATE INDEX mail_blacklist_message_main_attachment_id_index ON public.mail_blacklist USING btree (message_main_attachment_id);


-- public.mail_channel definition

-- Drop table

-- DROP TABLE public.mail_channel;

CREATE TABLE public.mail_channel (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	channel_type varchar NULL,
	description text NULL,
	uuid varchar(50) NULL,
	email_send bool NULL,
	public varchar NOT NULL,
	group_public_id int4 NULL,
	moderation bool NULL,
	moderation_notify bool NULL,
	moderation_notify_msg text NULL,
	moderation_guidelines bool NULL,
	moderation_guidelines_msg text NULL,
	alias_id int4 NOT NULL,
	message_main_attachment_id int4 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT mail_channel_pkey PRIMARY KEY (id)
);
CREATE INDEX mail_channel_message_main_attachment_id_index ON public.mail_channel USING btree (message_main_attachment_id);
CREATE INDEX mail_channel_uuid_index ON public.mail_channel USING btree (uuid);


-- public.mail_channel_mail_wizard_invite_rel definition

-- Drop table

-- DROP TABLE public.mail_channel_mail_wizard_invite_rel;

CREATE TABLE public.mail_channel_mail_wizard_invite_rel (
	mail_wizard_invite_id int4 NOT NULL,
	mail_channel_id int4 NOT NULL,
	CONSTRAINT mail_channel_mail_wizard_invi_mail_wizard_invite_id_mail_ch_key UNIQUE (mail_wizard_invite_id, mail_channel_id)
);
CREATE INDEX mail_channel_mail_wizard_invite_rel_mail_channel_id_idx ON public.mail_channel_mail_wizard_invite_rel USING btree (mail_channel_id);
CREATE INDEX mail_channel_mail_wizard_invite_rel_mail_wizard_invite_id_idx ON public.mail_channel_mail_wizard_invite_rel USING btree (mail_wizard_invite_id);


-- public.mail_channel_moderator_rel definition

-- Drop table

-- DROP TABLE public.mail_channel_moderator_rel;

CREATE TABLE public.mail_channel_moderator_rel (
	mail_channel_id int4 NOT NULL,
	res_users_id int4 NOT NULL,
	CONSTRAINT mail_channel_moderator_rel_mail_channel_id_res_users_id_key UNIQUE (mail_channel_id, res_users_id)
);
CREATE INDEX mail_channel_moderator_rel_mail_channel_id_idx ON public.mail_channel_moderator_rel USING btree (mail_channel_id);
CREATE INDEX mail_channel_moderator_rel_res_users_id_idx ON public.mail_channel_moderator_rel USING btree (res_users_id);


-- public.mail_channel_partner definition

-- Drop table

-- DROP TABLE public.mail_channel_partner;

CREATE TABLE public.mail_channel_partner (
	id serial NOT NULL,
	partner_id int4 NULL,
	channel_id int4 NULL,
	seen_message_id int4 NULL,
	fold_state varchar NULL,
	is_minimized bool NULL,
	is_pinned bool NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT mail_channel_partner_pkey PRIMARY KEY (id)
);
CREATE INDEX mail_channel_partner_seen_message_id_idx ON public.mail_channel_partner USING btree (channel_id, partner_id, seen_message_id);


-- public.mail_channel_res_groups_rel definition

-- Drop table

-- DROP TABLE public.mail_channel_res_groups_rel;

CREATE TABLE public.mail_channel_res_groups_rel (
	mail_channel_id int4 NOT NULL,
	res_groups_id int4 NOT NULL,
	CONSTRAINT mail_channel_res_groups_rel_mail_channel_id_res_groups_id_key UNIQUE (mail_channel_id, res_groups_id)
);
CREATE INDEX mail_channel_res_groups_rel_mail_channel_id_idx ON public.mail_channel_res_groups_rel USING btree (mail_channel_id);
CREATE INDEX mail_channel_res_groups_rel_res_groups_id_idx ON public.mail_channel_res_groups_rel USING btree (res_groups_id);


-- public.mail_compose_message definition

-- Drop table

-- DROP TABLE public.mail_compose_message;

CREATE TABLE public.mail_compose_message (
	id serial NOT NULL,
	composition_mode varchar NULL,
	use_active_domain bool NULL,
	active_domain text NULL,
	is_log bool NULL,
	subject varchar NULL,
	"notify" bool NULL,
	auto_delete bool NULL,
	auto_delete_message bool NULL,
	template_id int4 NULL,
	message_type varchar NOT NULL,
	subtype_id int4 NULL,
	"date" timestamp NULL,
	body text NULL,
	parent_id int4 NULL,
	model varchar NULL,
	res_id int4 NULL,
	record_name varchar NULL,
	mail_activity_type_id int4 NULL,
	email_from varchar NULL,
	author_id int4 NULL,
	no_auto_thread bool NULL,
	message_id varchar NULL,
	reply_to varchar NULL,
	mail_server_id int4 NULL,
	moderation_status varchar NULL,
	moderator_id int4 NULL,
	layout varchar NULL,
	add_sign bool NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT mail_compose_message_pkey PRIMARY KEY (id)
);
CREATE INDEX mail_compose_message_author_id_index ON public.mail_compose_message USING btree (author_id);
CREATE INDEX mail_compose_message_mail_activity_type_id_index ON public.mail_compose_message USING btree (mail_activity_type_id);
CREATE INDEX mail_compose_message_message_id_index ON public.mail_compose_message USING btree (message_id);
CREATE INDEX mail_compose_message_model_index ON public.mail_compose_message USING btree (model);
CREATE INDEX mail_compose_message_moderation_status_index ON public.mail_compose_message USING btree (moderation_status);
CREATE INDEX mail_compose_message_moderator_id_index ON public.mail_compose_message USING btree (moderator_id);
CREATE INDEX mail_compose_message_parent_id_index ON public.mail_compose_message USING btree (parent_id);
CREATE INDEX mail_compose_message_res_id_index ON public.mail_compose_message USING btree (res_id);
CREATE INDEX mail_compose_message_subtype_id_index ON public.mail_compose_message USING btree (subtype_id);
CREATE INDEX mail_compose_message_template_id_index ON public.mail_compose_message USING btree (template_id);


-- public.mail_compose_message_ir_attachments_rel definition

-- Drop table

-- DROP TABLE public.mail_compose_message_ir_attachments_rel;

CREATE TABLE public.mail_compose_message_ir_attachments_rel (
	wizard_id int4 NOT NULL,
	attachment_id int4 NOT NULL,
	CONSTRAINT mail_compose_message_ir_attachments_wizard_id_attachment_id_key UNIQUE (wizard_id, attachment_id)
);
CREATE INDEX mail_compose_message_ir_attachments_rel_attachment_id_idx ON public.mail_compose_message_ir_attachments_rel USING btree (attachment_id);
CREATE INDEX mail_compose_message_ir_attachments_rel_wizard_id_idx ON public.mail_compose_message_ir_attachments_rel USING btree (wizard_id);


-- public.mail_compose_message_res_partner_rel definition

-- Drop table

-- DROP TABLE public.mail_compose_message_res_partner_rel;

CREATE TABLE public.mail_compose_message_res_partner_rel (
	wizard_id int4 NOT NULL,
	partner_id int4 NOT NULL,
	CONSTRAINT mail_compose_message_res_partner_rel_wizard_id_partner_id_key UNIQUE (wizard_id, partner_id)
);
CREATE INDEX mail_compose_message_res_partner_rel_partner_id_idx ON public.mail_compose_message_res_partner_rel USING btree (partner_id);
CREATE INDEX mail_compose_message_res_partner_rel_wizard_id_idx ON public.mail_compose_message_res_partner_rel USING btree (wizard_id);


-- public.mail_followers definition

-- Drop table

-- DROP TABLE public.mail_followers;

CREATE TABLE public.mail_followers (
	id serial NOT NULL,
	res_model varchar NOT NULL,
	res_id int4 NULL,
	partner_id int4 NULL,
	channel_id int4 NULL,
	CONSTRAINT mail_followers_mail_followers_res_channel_res_model_id_uniq UNIQUE (res_model, res_id, channel_id),
	CONSTRAINT mail_followers_mail_followers_res_partner_res_model_id_uniq UNIQUE (res_model, res_id, partner_id),
	CONSTRAINT mail_followers_partner_xor_channel CHECK (((partner_id IS NULL) <> (channel_id IS NULL))),
	CONSTRAINT mail_followers_pkey PRIMARY KEY (id)
);
CREATE INDEX mail_followers_channel_id_index ON public.mail_followers USING btree (channel_id);
CREATE INDEX mail_followers_partner_id_index ON public.mail_followers USING btree (partner_id);
CREATE INDEX mail_followers_res_id_index ON public.mail_followers USING btree (res_id);
CREATE INDEX mail_followers_res_model_index ON public.mail_followers USING btree (res_model);


-- public.mail_followers_mail_message_subtype_rel definition

-- Drop table

-- DROP TABLE public.mail_followers_mail_message_subtype_rel;

CREATE TABLE public.mail_followers_mail_message_subtype_rel (
	mail_followers_id int4 NOT NULL,
	mail_message_subtype_id int4 NOT NULL,
	CONSTRAINT mail_followers_mail_message_s_mail_followers_id_mail_messag_key UNIQUE (mail_followers_id, mail_message_subtype_id)
);
CREATE INDEX mail_followers_mail_message_subtype_mail_message_subtype_id_idx ON public.mail_followers_mail_message_subtype_rel USING btree (mail_message_subtype_id);
CREATE INDEX mail_followers_mail_message_subtype_rel_mail_followers_id_idx ON public.mail_followers_mail_message_subtype_rel USING btree (mail_followers_id);


-- public.mail_mail definition

-- Drop table

-- DROP TABLE public.mail_mail;

CREATE TABLE public.mail_mail (
	id serial NOT NULL,
	mail_message_id int4 NOT NULL,
	body_html text NULL,
	"references" text NULL,
	headers text NULL,
	notification bool NULL,
	email_to text NULL,
	email_cc varchar NULL,
	state varchar NULL,
	auto_delete bool NULL,
	failure_reason text NULL,
	scheduled_date varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	fetchmail_server_id int4 NULL,
	CONSTRAINT mail_mail_pkey PRIMARY KEY (id)
);
CREATE INDEX mail_mail_fetchmail_server_id_index ON public.mail_mail USING btree (fetchmail_server_id);
CREATE INDEX mail_mail_mail_message_id_index ON public.mail_mail USING btree (mail_message_id);


-- public.mail_mail_res_partner_rel definition

-- Drop table

-- DROP TABLE public.mail_mail_res_partner_rel;

CREATE TABLE public.mail_mail_res_partner_rel (
	mail_mail_id int4 NOT NULL,
	res_partner_id int4 NOT NULL,
	CONSTRAINT mail_mail_res_partner_rel_mail_mail_id_res_partner_id_key UNIQUE (mail_mail_id, res_partner_id)
);
CREATE INDEX mail_mail_res_partner_rel_mail_mail_id_idx ON public.mail_mail_res_partner_rel USING btree (mail_mail_id);
CREATE INDEX mail_mail_res_partner_rel_res_partner_id_idx ON public.mail_mail_res_partner_rel USING btree (res_partner_id);


-- public.mail_message definition

-- Drop table

-- DROP TABLE public.mail_message;

CREATE TABLE public.mail_message (
	id serial NOT NULL,
	subject varchar NULL,
	"date" timestamp NULL,
	body text NULL,
	parent_id int4 NULL,
	model varchar NULL,
	res_id int4 NULL,
	record_name varchar NULL,
	message_type varchar NOT NULL,
	subtype_id int4 NULL,
	mail_activity_type_id int4 NULL,
	email_from varchar NULL,
	author_id int4 NULL,
	no_auto_thread bool NULL,
	message_id varchar NULL,
	reply_to varchar NULL,
	mail_server_id int4 NULL,
	moderation_status varchar NULL,
	moderator_id int4 NULL,
	layout varchar NULL,
	add_sign bool NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT mail_message_pkey PRIMARY KEY (id)
);
CREATE INDEX mail_message_author_id_index ON public.mail_message USING btree (author_id);
CREATE INDEX mail_message_mail_activity_type_id_index ON public.mail_message USING btree (mail_activity_type_id);
CREATE INDEX mail_message_message_id_index ON public.mail_message USING btree (message_id);
CREATE INDEX mail_message_model_index ON public.mail_message USING btree (model);
CREATE INDEX mail_message_model_res_id_idx ON public.mail_message USING btree (model, res_id);
CREATE INDEX mail_message_moderation_status_index ON public.mail_message USING btree (moderation_status);
CREATE INDEX mail_message_moderator_id_index ON public.mail_message USING btree (moderator_id);
CREATE INDEX mail_message_parent_id_index ON public.mail_message USING btree (parent_id);
CREATE INDEX mail_message_res_id_index ON public.mail_message USING btree (res_id);
CREATE INDEX mail_message_subtype_id_index ON public.mail_message USING btree (subtype_id);


-- public.mail_message_mail_channel_rel definition

-- Drop table

-- DROP TABLE public.mail_message_mail_channel_rel;

CREATE TABLE public.mail_message_mail_channel_rel (
	mail_message_id int4 NOT NULL,
	mail_channel_id int4 NOT NULL,
	CONSTRAINT mail_message_mail_channel_rel_mail_message_id_mail_channel__key UNIQUE (mail_message_id, mail_channel_id)
);
CREATE INDEX mail_message_mail_channel_rel_mail_channel_id_idx ON public.mail_message_mail_channel_rel USING btree (mail_channel_id);
CREATE INDEX mail_message_mail_channel_rel_mail_message_id_idx ON public.mail_message_mail_channel_rel USING btree (mail_message_id);


-- public.mail_message_res_partner_needaction_rel definition

-- Drop table

-- DROP TABLE public.mail_message_res_partner_needaction_rel;

CREATE TABLE public.mail_message_res_partner_needaction_rel (
	id serial NOT NULL,
	mail_message_id int4 NOT NULL,
	res_partner_id int4 NOT NULL,
	is_read bool NULL,
	is_email bool NULL,
	email_status varchar NULL,
	mail_id int4 NULL,
	failure_type varchar NULL,
	failure_reason text NULL,
	CONSTRAINT mail_message_res_partner_needaction_rel_pkey PRIMARY KEY (id)
);
CREATE INDEX mail_message_res_partner_needaction_rel_email_status_index ON public.mail_message_res_partner_needaction_rel USING btree (email_status);
CREATE INDEX mail_message_res_partner_needaction_rel_is_email_index ON public.mail_message_res_partner_needaction_rel USING btree (is_email);
CREATE INDEX mail_message_res_partner_needaction_rel_is_read_index ON public.mail_message_res_partner_needaction_rel USING btree (is_read);
CREATE INDEX mail_message_res_partner_needaction_rel_mail_id_index ON public.mail_message_res_partner_needaction_rel USING btree (mail_id);
CREATE INDEX mail_message_res_partner_needaction_rel_mail_message_id_index ON public.mail_message_res_partner_needaction_rel USING btree (mail_message_id);
CREATE INDEX mail_message_res_partner_needaction_rel_res_partner_id_index ON public.mail_message_res_partner_needaction_rel USING btree (res_partner_id);
CREATE INDEX mail_notification_res_partner_id_is_read_email_status_mail_mess ON public.mail_message_res_partner_needaction_rel USING btree (res_partner_id, is_read, email_status, mail_message_id);


-- public.mail_message_res_partner_needaction_rel_mail_resend_message_rel definition

-- Drop table

-- DROP TABLE public.mail_message_res_partner_needaction_rel_mail_resend_message_rel;

CREATE TABLE public.mail_message_res_partner_needaction_rel_mail_resend_message_rel (
	mail_resend_message_id int4 NOT NULL,
	mail_message_res_partner_needaction_rel_id int4 NOT NULL,
	CONSTRAINT mail_message_res_partner_need_mail_resend_message_id_mail_m_key UNIQUE (mail_resend_message_id, mail_message_res_partner_needaction_rel_id)
);
CREATE INDEX mail_message_res_partner_need_mail_message_res_partner_need_idx ON public.mail_message_res_partner_needaction_rel_mail_resend_message_rel USING btree (mail_message_res_partner_needaction_rel_id);
CREATE INDEX mail_message_res_partner_needaction__mail_resend_message_id_idx ON public.mail_message_res_partner_needaction_rel_mail_resend_message_rel USING btree (mail_resend_message_id);


-- public.mail_message_res_partner_rel definition

-- Drop table

-- DROP TABLE public.mail_message_res_partner_rel;

CREATE TABLE public.mail_message_res_partner_rel (
	mail_message_id int4 NOT NULL,
	res_partner_id int4 NOT NULL,
	CONSTRAINT mail_message_res_partner_rel_mail_message_id_res_partner_id_key UNIQUE (mail_message_id, res_partner_id)
);
CREATE INDEX mail_message_res_partner_rel_mail_message_id_idx ON public.mail_message_res_partner_rel USING btree (mail_message_id);
CREATE INDEX mail_message_res_partner_rel_res_partner_id_idx ON public.mail_message_res_partner_rel USING btree (res_partner_id);


-- public.mail_message_res_partner_starred_rel definition

-- Drop table

-- DROP TABLE public.mail_message_res_partner_starred_rel;

CREATE TABLE public.mail_message_res_partner_starred_rel (
	mail_message_id int4 NOT NULL,
	res_partner_id int4 NOT NULL,
	CONSTRAINT mail_message_res_partner_star_mail_message_id_res_partner_i_key UNIQUE (mail_message_id, res_partner_id)
);
CREATE INDEX mail_message_res_partner_starred_rel_mail_message_id_idx ON public.mail_message_res_partner_starred_rel USING btree (mail_message_id);
CREATE INDEX mail_message_res_partner_starred_rel_res_partner_id_idx ON public.mail_message_res_partner_starred_rel USING btree (res_partner_id);


-- public.mail_message_subtype definition

-- Drop table

-- DROP TABLE public.mail_message_subtype;

CREATE TABLE public.mail_message_subtype (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	description text NULL,
	internal bool NULL,
	parent_id int4 NULL,
	relation_field varchar NULL,
	res_model varchar NULL,
	"default" bool NULL,
	"sequence" int4 NULL,
	hidden bool NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT mail_message_subtype_pkey PRIMARY KEY (id)
);


-- public.mail_moderation definition

-- Drop table

-- DROP TABLE public.mail_moderation;

CREATE TABLE public.mail_moderation (
	id serial NOT NULL,
	email varchar NOT NULL,
	status varchar NOT NULL,
	channel_id int4 NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT mail_moderation_channel_email_uniq UNIQUE (email, channel_id),
	CONSTRAINT mail_moderation_pkey PRIMARY KEY (id)
);
CREATE INDEX mail_moderation_channel_id_index ON public.mail_moderation USING btree (channel_id);
CREATE INDEX mail_moderation_email_index ON public.mail_moderation USING btree (email);


-- public.mail_resend_cancel definition

-- Drop table

-- DROP TABLE public.mail_resend_cancel;

CREATE TABLE public.mail_resend_cancel (
	id serial NOT NULL,
	model varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT mail_resend_cancel_pkey PRIMARY KEY (id)
);


-- public.mail_resend_message definition

-- Drop table

-- DROP TABLE public.mail_resend_message;

CREATE TABLE public.mail_resend_message (
	id serial NOT NULL,
	mail_message_id int4 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT mail_resend_message_pkey PRIMARY KEY (id)
);


-- public.mail_resend_partner definition

-- Drop table

-- DROP TABLE public.mail_resend_partner;

CREATE TABLE public.mail_resend_partner (
	id serial NOT NULL,
	partner_id int4 NOT NULL,
	resend bool NULL,
	resend_wizard_id int4 NULL,
	message varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT mail_resend_partner_pkey PRIMARY KEY (id)
);


-- public.mail_shortcode definition

-- Drop table

-- DROP TABLE public.mail_shortcode;

CREATE TABLE public.mail_shortcode (
	id serial NOT NULL,
	"source" varchar NOT NULL,
	substitution text NOT NULL,
	description varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT mail_shortcode_pkey PRIMARY KEY (id)
);
CREATE INDEX mail_shortcode_source_index ON public.mail_shortcode USING btree (source);
CREATE INDEX mail_shortcode_substitution_index ON public.mail_shortcode USING btree (substitution);


-- public.mail_template definition

-- Drop table

-- DROP TABLE public.mail_template;

CREATE TABLE public.mail_template (
	id serial NOT NULL,
	"name" varchar NULL,
	model_id int4 NULL,
	model varchar NULL,
	lang varchar NULL,
	user_signature bool NULL,
	subject varchar NULL,
	email_from varchar NULL,
	use_default_to bool NULL,
	email_to varchar NULL,
	partner_to varchar NULL,
	email_cc varchar NULL,
	reply_to varchar NULL,
	mail_server_id int4 NULL,
	body_html text NULL,
	report_name varchar NULL,
	report_template int4 NULL,
	ref_ir_act_window int4 NULL,
	auto_delete bool NULL,
	model_object_field int4 NULL,
	sub_object int4 NULL,
	sub_model_object_field int4 NULL,
	null_value varchar NULL,
	copyvalue varchar NULL,
	scheduled_date varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT mail_template_pkey PRIMARY KEY (id)
);
CREATE INDEX mail_template_model_index ON public.mail_template USING btree (model);


-- public.mail_tracking_value definition

-- Drop table

-- DROP TABLE public.mail_tracking_value;

CREATE TABLE public.mail_tracking_value (
	id serial NOT NULL,
	field varchar NOT NULL,
	field_desc varchar NOT NULL,
	field_type varchar NULL,
	old_value_integer int4 NULL,
	old_value_float float8 NULL,
	old_value_monetary float8 NULL,
	old_value_char varchar NULL,
	old_value_text text NULL,
	old_value_datetime timestamp NULL,
	new_value_integer int4 NULL,
	new_value_float float8 NULL,
	new_value_monetary float8 NULL,
	new_value_char varchar NULL,
	new_value_text text NULL,
	new_value_datetime timestamp NULL,
	mail_message_id int4 NOT NULL,
	track_sequence int4 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT mail_tracking_value_pkey PRIMARY KEY (id)
);
CREATE INDEX mail_tracking_value_mail_message_id_index ON public.mail_tracking_value USING btree (mail_message_id);


-- public.mail_wizard_invite definition

-- Drop table

-- DROP TABLE public.mail_wizard_invite;

CREATE TABLE public.mail_wizard_invite (
	id serial NOT NULL,
	res_model varchar NOT NULL,
	res_id int4 NULL,
	message text NULL,
	send_mail bool NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT mail_wizard_invite_pkey PRIMARY KEY (id)
);
CREATE INDEX mail_wizard_invite_res_id_index ON public.mail_wizard_invite USING btree (res_id);
CREATE INDEX mail_wizard_invite_res_model_index ON public.mail_wizard_invite USING btree (res_model);


-- public.mail_wizard_invite_res_partner_rel definition

-- Drop table

-- DROP TABLE public.mail_wizard_invite_res_partner_rel;

CREATE TABLE public.mail_wizard_invite_res_partner_rel (
	mail_wizard_invite_id int4 NOT NULL,
	res_partner_id int4 NOT NULL,
	CONSTRAINT mail_wizard_invite_res_partne_mail_wizard_invite_id_res_par_key UNIQUE (mail_wizard_invite_id, res_partner_id)
);
CREATE INDEX mail_wizard_invite_res_partner_rel_mail_wizard_invite_id_idx ON public.mail_wizard_invite_res_partner_rel USING btree (mail_wizard_invite_id);
CREATE INDEX mail_wizard_invite_res_partner_rel_res_partner_id_idx ON public.mail_wizard_invite_res_partner_rel USING btree (res_partner_id);


-- public.message_attachment_rel definition

-- Drop table

-- DROP TABLE public.message_attachment_rel;

CREATE TABLE public.message_attachment_rel (
	message_id int4 NOT NULL,
	attachment_id int4 NOT NULL,
	CONSTRAINT message_attachment_rel_message_id_attachment_id_key UNIQUE (message_id, attachment_id)
);
CREATE INDEX message_attachment_rel_attachment_id_idx ON public.message_attachment_rel USING btree (attachment_id);
CREATE INDEX message_attachment_rel_message_id_idx ON public.message_attachment_rel USING btree (message_id);


-- public.rel_modules_langexport definition

-- Drop table

-- DROP TABLE public.rel_modules_langexport;

CREATE TABLE public.rel_modules_langexport (
	wiz_id int4 NOT NULL,
	module_id int4 NOT NULL,
	CONSTRAINT rel_modules_langexport_wiz_id_module_id_key UNIQUE (wiz_id, module_id)
);
CREATE INDEX rel_modules_langexport_module_id_idx ON public.rel_modules_langexport USING btree (module_id);
CREATE INDEX rel_modules_langexport_wiz_id_idx ON public.rel_modules_langexport USING btree (wiz_id);


-- public.rel_server_actions definition

-- Drop table

-- DROP TABLE public.rel_server_actions;

CREATE TABLE public.rel_server_actions (
	server_id int4 NOT NULL,
	action_id int4 NOT NULL,
	CONSTRAINT rel_server_actions_server_id_action_id_key UNIQUE (server_id, action_id)
);
CREATE INDEX rel_server_actions_action_id_idx ON public.rel_server_actions USING btree (action_id);
CREATE INDEX rel_server_actions_server_id_idx ON public.rel_server_actions USING btree (server_id);


-- public.report_layout definition

-- Drop table

-- DROP TABLE public.report_layout;

CREATE TABLE public.report_layout (
	id serial NOT NULL,
	view_id int4 NOT NULL,
	image varchar NULL,
	pdf varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT report_layout_pkey PRIMARY KEY (id)
);


-- public.report_paperformat definition

-- Drop table

-- DROP TABLE public.report_paperformat;

CREATE TABLE public.report_paperformat (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	"default" bool NULL,
	format varchar NULL,
	margin_top float8 NULL,
	margin_bottom float8 NULL,
	margin_left float8 NULL,
	margin_right float8 NULL,
	page_height int4 NULL,
	page_width int4 NULL,
	orientation varchar NULL,
	header_line bool NULL,
	header_spacing int4 NULL,
	dpi int4 NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT report_paperformat_pkey PRIMARY KEY (id)
);


-- public.res_bank definition

-- Drop table

-- DROP TABLE public.res_bank;

CREATE TABLE public.res_bank (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	street varchar NULL,
	street2 varchar NULL,
	zip varchar NULL,
	city varchar NULL,
	state int4 NULL,
	country int4 NULL,
	email varchar NULL,
	phone varchar NULL,
	active bool NULL,
	bic varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT res_bank_pkey PRIMARY KEY (id)
);
CREATE INDEX res_bank_bic_index ON public.res_bank USING btree (bic);


-- public.res_company definition

-- Drop table

-- DROP TABLE public.res_company;

CREATE TABLE public.res_company (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	partner_id int4 NOT NULL,
	currency_id int4 NOT NULL,
	"sequence" int4 NULL,
	create_date timestamp NULL,
	parent_id int4 NULL,
	report_header text NULL,
	report_footer text NULL,
	logo_web bytea NULL,
	account_no varchar NULL,
	email varchar NULL,
	phone varchar NULL,
	company_registry varchar NULL,
	paperformat_id int4 NULL,
	external_report_layout_id int4 NULL,
	base_onboarding_company_state varchar NULL,
	create_uid int4 NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	partner_gid int4 NULL,
	snailmail_color bool NULL,
	snailmail_duplex bool NULL,
	resource_calendar_id int4 NULL,
	CONSTRAINT res_company_name_uniq UNIQUE (name),
	CONSTRAINT res_company_pkey PRIMARY KEY (id)
);
CREATE INDEX res_company_parent_id_index ON public.res_company USING btree (parent_id);


-- public.res_company_users_rel definition

-- Drop table

-- DROP TABLE public.res_company_users_rel;

CREATE TABLE public.res_company_users_rel (
	cid int4 NOT NULL,
	user_id int4 NOT NULL,
	CONSTRAINT res_company_users_rel_cid_user_id_key UNIQUE (cid, user_id)
);
CREATE INDEX res_company_users_rel_cid_idx ON public.res_company_users_rel USING btree (cid);
CREATE INDEX res_company_users_rel_user_id_idx ON public.res_company_users_rel USING btree (user_id);


-- public.res_config definition

-- Drop table

-- DROP TABLE public.res_config;

CREATE TABLE public.res_config (
	id serial NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT res_config_pkey PRIMARY KEY (id)
);


-- public.res_config_installer definition

-- Drop table

-- DROP TABLE public.res_config_installer;

CREATE TABLE public.res_config_installer (
	id serial NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT res_config_installer_pkey PRIMARY KEY (id)
);


-- public.res_config_settings definition

-- Drop table

-- DROP TABLE public.res_config_settings;

CREATE TABLE public.res_config_settings (
	id serial NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	group_multi_company bool NULL,
	company_id int4 NOT NULL,
	user_default_rights bool NULL,
	external_email_server_default bool NULL,
	module_base_import bool NULL,
	module_google_calendar bool NULL,
	module_google_drive bool NULL,
	module_google_spreadsheet bool NULL,
	module_auth_oauth bool NULL,
	module_auth_ldap bool NULL,
	module_base_gengo bool NULL,
	module_inter_company_rules bool NULL,
	module_pad bool NULL,
	module_voip bool NULL,
	module_web_unsplash bool NULL,
	module_partner_autocomplete bool NULL,
	company_share_partner bool NULL,
	group_multi_currency bool NULL,
	show_effect bool NULL,
	fail_counter int4 NULL,
	alias_domain varchar NULL,
	unsplash_access_key varchar NULL,
	auth_signup_reset_password bool NULL,
	auth_signup_uninvited varchar NULL,
	auth_signup_template_user_id int4 NULL,
	ocn_push_notification bool NULL,
	module_hr_org_chart bool NULL,
	CONSTRAINT res_config_settings_pkey PRIMARY KEY (id)
);


-- public.res_country definition

-- Drop table

-- DROP TABLE public.res_country;

CREATE TABLE public.res_country (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	code varchar(2) NULL,
	address_format text NULL,
	address_view_id int4 NULL,
	currency_id int4 NULL,
	phone_code int4 NULL,
	name_position varchar NULL,
	vat_label varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT res_country_code_uniq UNIQUE (code),
	CONSTRAINT res_country_name_uniq UNIQUE (name),
	CONSTRAINT res_country_pkey PRIMARY KEY (id)
);


-- public.res_country_group definition

-- Drop table

-- DROP TABLE public.res_country_group;

CREATE TABLE public.res_country_group (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT res_country_group_pkey PRIMARY KEY (id)
);


-- public.res_country_res_country_group_rel definition

-- Drop table

-- DROP TABLE public.res_country_res_country_group_rel;

CREATE TABLE public.res_country_res_country_group_rel (
	res_country_id int4 NOT NULL,
	res_country_group_id int4 NOT NULL,
	CONSTRAINT res_country_res_country_group_res_country_id_res_country_gr_key UNIQUE (res_country_id, res_country_group_id)
);
CREATE INDEX res_country_res_country_group_rel_res_country_group_id_idx ON public.res_country_res_country_group_rel USING btree (res_country_group_id);
CREATE INDEX res_country_res_country_group_rel_res_country_id_idx ON public.res_country_res_country_group_rel USING btree (res_country_id);


-- public.res_country_state definition

-- Drop table

-- DROP TABLE public.res_country_state;

CREATE TABLE public.res_country_state (
	id serial NOT NULL,
	country_id int4 NOT NULL,
	"name" varchar NOT NULL,
	code varchar NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT res_country_state_name_code_uniq UNIQUE (country_id, code),
	CONSTRAINT res_country_state_pkey PRIMARY KEY (id)
);


-- public.res_currency definition

-- Drop table

-- DROP TABLE public.res_currency;

CREATE TABLE public.res_currency (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	symbol varchar NOT NULL,
	rounding numeric NULL,
	decimal_places int4 NULL,
	active bool NULL,
	"position" varchar NULL,
	currency_unit_label varchar NULL,
	currency_subunit_label varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT res_currency_pkey PRIMARY KEY (id),
	CONSTRAINT res_currency_rounding_gt_zero CHECK ((rounding > (0)::numeric)),
	CONSTRAINT res_currency_unique_name UNIQUE (name)
);


-- public.res_currency_rate definition

-- Drop table

-- DROP TABLE public.res_currency_rate;

CREATE TABLE public.res_currency_rate (
	id serial NOT NULL,
	"name" date NOT NULL,
	rate numeric NULL,
	currency_id int4 NULL,
	company_id int4 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT res_currency_rate_currency_rate_check CHECK ((rate > (0)::numeric)),
	CONSTRAINT res_currency_rate_pkey PRIMARY KEY (id),
	CONSTRAINT res_currency_rate_unique_name_per_day UNIQUE (name, currency_id, company_id)
);
CREATE INDEX res_currency_rate_name_index ON public.res_currency_rate USING btree (name);


-- public.res_groups definition

-- Drop table

-- DROP TABLE public.res_groups;

CREATE TABLE public.res_groups (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	"comment" text NULL,
	category_id int4 NULL,
	color int4 NULL,
	"share" bool NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT res_groups_name_uniq UNIQUE (category_id, name),
	CONSTRAINT res_groups_pkey PRIMARY KEY (id)
);
CREATE INDEX res_groups_category_id_index ON public.res_groups USING btree (category_id);


-- public.res_groups_implied_rel definition

-- Drop table

-- DROP TABLE public.res_groups_implied_rel;

CREATE TABLE public.res_groups_implied_rel (
	gid int4 NOT NULL,
	hid int4 NOT NULL,
	CONSTRAINT res_groups_implied_rel_gid_hid_key UNIQUE (gid, hid)
);
CREATE INDEX res_groups_implied_rel_gid_idx ON public.res_groups_implied_rel USING btree (gid);
CREATE INDEX res_groups_implied_rel_hid_idx ON public.res_groups_implied_rel USING btree (hid);


-- public.res_groups_report_rel definition

-- Drop table

-- DROP TABLE public.res_groups_report_rel;

CREATE TABLE public.res_groups_report_rel (
	uid int4 NOT NULL,
	gid int4 NOT NULL,
	CONSTRAINT res_groups_report_rel_uid_gid_key UNIQUE (uid, gid)
);
CREATE INDEX res_groups_report_rel_gid_idx ON public.res_groups_report_rel USING btree (gid);
CREATE INDEX res_groups_report_rel_uid_idx ON public.res_groups_report_rel USING btree (uid);


-- public.res_groups_users_rel definition

-- Drop table

-- DROP TABLE public.res_groups_users_rel;

CREATE TABLE public.res_groups_users_rel (
	gid int4 NOT NULL,
	uid int4 NOT NULL,
	CONSTRAINT res_groups_users_rel_gid_uid_key UNIQUE (gid, uid)
);
CREATE INDEX res_groups_users_rel_gid_idx ON public.res_groups_users_rel USING btree (gid);
CREATE INDEX res_groups_users_rel_uid_idx ON public.res_groups_users_rel USING btree (uid);


-- public.res_lang definition

-- Drop table

-- DROP TABLE public.res_lang;

CREATE TABLE public.res_lang (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	code varchar NOT NULL,
	iso_code varchar NULL,
	translatable bool NULL,
	active bool NULL,
	direction varchar NOT NULL,
	date_format varchar NOT NULL,
	time_format varchar NOT NULL,
	week_start int4 NOT NULL,
	"grouping" varchar NOT NULL,
	decimal_point varchar NOT NULL,
	thousands_sep varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT res_lang_code_uniq UNIQUE (code),
	CONSTRAINT res_lang_name_uniq UNIQUE (name),
	CONSTRAINT res_lang_pkey PRIMARY KEY (id)
);


-- public.res_partner definition

-- Drop table

-- DROP TABLE public.res_partner;

CREATE TABLE public.res_partner (
	id serial NOT NULL,
	"name" varchar NULL,
	company_id int4 NULL,
	create_date timestamp NULL,
	display_name varchar NULL,
	"date" date NULL,
	title int4 NULL,
	parent_id int4 NULL,
	"ref" varchar NULL,
	lang varchar NULL,
	tz varchar NULL,
	user_id int4 NULL,
	vat varchar NULL,
	website varchar NULL,
	"comment" text NULL,
	credit_limit float8 NULL,
	barcode varchar NULL,
	active bool NULL,
	customer bool NULL,
	supplier bool NULL,
	employee bool NULL,
	"function" varchar NULL,
	"type" varchar NULL,
	street varchar NULL,
	street2 varchar NULL,
	zip varchar NULL,
	city varchar NULL,
	state_id int4 NULL,
	country_id int4 NULL,
	email varchar NULL,
	phone varchar NULL,
	mobile varchar NULL,
	is_company bool NULL,
	industry_id int4 NULL,
	color int4 NULL,
	partner_share bool NULL,
	commercial_partner_id int4 NULL,
	commercial_company_name varchar NULL,
	company_name varchar NULL,
	create_uid int4 NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	message_main_attachment_id int4 NULL,
	message_bounce int4 NULL,
	signup_token varchar NULL,
	signup_type varchar NULL,
	signup_expiration timestamp NULL,
	ocn_token varchar NULL,
	partner_gid int4 NULL,
	additional_info varchar NULL,
	x_lw_password varchar NULL,
	x_lw_height float8 NULL,
	x_lw_weight float8 NULL,
	x_lw_dob timestamp NULL,
	x_lw_gender varchar NULL,
	x_lw_expected_weight float8 NULL,
	x_lw_steps_per_day float8 NULL,
	x_lw_meals_per_day float8 NULL,
	x_lw_power varchar NULL,
	facebook_user_id varchar NULL,
	avatar varchar NULL,
	physical varchar NULL,
	address varchar NULL,
	CONSTRAINT res_partner_check_name CHECK (((((type)::text = 'contact'::text) AND (name IS NOT NULL)) OR ((type)::text <> 'contact'::text))),
	CONSTRAINT res_partner_pkey PRIMARY KEY (id)
);
CREATE INDEX res_partner_commercial_partner_id_index ON public.res_partner USING btree (commercial_partner_id);
CREATE INDEX res_partner_company_id_index ON public.res_partner USING btree (company_id);
CREATE INDEX res_partner_date_index ON public.res_partner USING btree (date);
CREATE INDEX res_partner_display_name_index ON public.res_partner USING btree (display_name);
CREATE INDEX res_partner_message_main_attachment_id_index ON public.res_partner USING btree (message_main_attachment_id);
CREATE INDEX res_partner_name_index ON public.res_partner USING btree (name);
CREATE INDEX res_partner_parent_id_index ON public.res_partner USING btree (parent_id);
CREATE INDEX res_partner_ref_index ON public.res_partner USING btree (ref);
CREATE INDEX res_partner_vat_index ON public.res_partner USING btree (regexp_replace(upper((vat)::text), '[^A-Z0-9]+'::text, ''::text, 'g'::text));


-- public.res_partner_autocomplete_sync definition

-- Drop table

-- DROP TABLE public.res_partner_autocomplete_sync;

CREATE TABLE public.res_partner_autocomplete_sync (
	id serial NOT NULL,
	partner_id int4 NULL,
	synched bool NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT res_partner_autocomplete_sync_pkey PRIMARY KEY (id)
);


-- public.res_partner_bank definition

-- Drop table

-- DROP TABLE public.res_partner_bank;

CREATE TABLE public.res_partner_bank (
	id serial NOT NULL,
	acc_number varchar NOT NULL,
	sanitized_acc_number varchar NULL,
	acc_holder_name varchar NULL,
	partner_id int4 NOT NULL,
	bank_id int4 NULL,
	"sequence" int4 NULL,
	currency_id int4 NULL,
	company_id int4 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT res_partner_bank_pkey PRIMARY KEY (id),
	CONSTRAINT res_partner_bank_unique_number UNIQUE (sanitized_acc_number, company_id)
);
CREATE INDEX res_partner_bank_partner_id_index ON public.res_partner_bank USING btree (partner_id);


-- public.res_partner_category definition

-- Drop table

-- DROP TABLE public.res_partner_category;

CREATE TABLE public.res_partner_category (
	id serial NOT NULL,
	parent_path varchar NULL,
	"name" varchar NOT NULL,
	color int4 NULL,
	parent_id int4 NULL,
	active bool NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT res_partner_category_pkey PRIMARY KEY (id)
);
CREATE INDEX res_partner_category_parent_id_index ON public.res_partner_category USING btree (parent_id);
CREATE INDEX res_partner_category_parent_path_index ON public.res_partner_category USING btree (parent_path);


-- public.res_partner_industry definition

-- Drop table

-- DROP TABLE public.res_partner_industry;

CREATE TABLE public.res_partner_industry (
	id serial NOT NULL,
	"name" varchar NULL,
	full_name varchar NULL,
	active bool NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT res_partner_industry_pkey PRIMARY KEY (id)
);


-- public.res_partner_res_partner_category_rel definition

-- Drop table

-- DROP TABLE public.res_partner_res_partner_category_rel;

CREATE TABLE public.res_partner_res_partner_category_rel (
	category_id int4 NOT NULL,
	partner_id int4 NOT NULL,
	CONSTRAINT res_partner_res_partner_category_rel_category_id_partner_id_key UNIQUE (category_id, partner_id)
);
CREATE INDEX res_partner_res_partner_category_rel_category_id_idx ON public.res_partner_res_partner_category_rel USING btree (category_id);
CREATE INDEX res_partner_res_partner_category_rel_partner_id_idx ON public.res_partner_res_partner_category_rel USING btree (partner_id);


-- public.res_partner_title definition

-- Drop table

-- DROP TABLE public.res_partner_title;

CREATE TABLE public.res_partner_title (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	shortcut varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT res_partner_title_pkey PRIMARY KEY (id)
);


-- public.res_users definition

-- Drop table

-- DROP TABLE public.res_users;

CREATE TABLE public.res_users (
	id serial NOT NULL,
	active bool NULL DEFAULT true,
	login varchar NOT NULL,
	"password" varchar NULL,
	company_id int4 NOT NULL,
	partner_id int4 NOT NULL,
	create_date timestamp NULL,
	signature text NULL,
	action_id int4 NULL,
	"share" bool NULL,
	create_uid int4 NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	alias_id int4 NULL,
	notification_type varchar NOT NULL,
	odoobot_state varchar NOT NULL,
	CONSTRAINT res_users_login_key UNIQUE (login),
	CONSTRAINT res_users_pkey PRIMARY KEY (id)
);


-- public.res_users_log definition

-- Drop table

-- DROP TABLE public.res_users_log;

CREATE TABLE public.res_users_log (
	id serial NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT res_users_log_pkey PRIMARY KEY (id)
);


-- public.resource_calendar definition

-- Drop table

-- DROP TABLE public.resource_calendar;

CREATE TABLE public.resource_calendar (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	company_id int4 NULL,
	hours_per_day float8 NULL,
	tz varchar NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT resource_calendar_pkey PRIMARY KEY (id)
);


-- public.resource_calendar_attendance definition

-- Drop table

-- DROP TABLE public.resource_calendar_attendance;

CREATE TABLE public.resource_calendar_attendance (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	dayofweek varchar NOT NULL,
	date_from date NULL,
	date_to date NULL,
	hour_from float8 NOT NULL,
	hour_to float8 NOT NULL,
	calendar_id int4 NOT NULL,
	day_period varchar NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT resource_calendar_attendance_pkey PRIMARY KEY (id)
);
CREATE INDEX resource_calendar_attendance_dayofweek_index ON public.resource_calendar_attendance USING btree (dayofweek);
CREATE INDEX resource_calendar_attendance_hour_from_index ON public.resource_calendar_attendance USING btree (hour_from);


-- public.resource_calendar_leaves definition

-- Drop table

-- DROP TABLE public.resource_calendar_leaves;

CREATE TABLE public.resource_calendar_leaves (
	id serial NOT NULL,
	"name" varchar NULL,
	company_id int4 NULL,
	calendar_id int4 NULL,
	date_from timestamp NOT NULL,
	date_to timestamp NOT NULL,
	resource_id int4 NULL,
	time_type varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT resource_calendar_leaves_pkey PRIMARY KEY (id)
);


-- public.resource_resource definition

-- Drop table

-- DROP TABLE public.resource_resource;

CREATE TABLE public.resource_resource (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	active bool NULL,
	company_id int4 NULL,
	resource_type varchar NOT NULL,
	user_id int4 NULL,
	time_efficiency float8 NOT NULL,
	calendar_id int4 NOT NULL,
	tz varchar NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT resource_resource_check_time_efficiency CHECK ((time_efficiency > (0)::double precision)),
	CONSTRAINT resource_resource_pkey PRIMARY KEY (id)
);


-- public.resource_test definition

-- Drop table

-- DROP TABLE public.resource_test;

CREATE TABLE public.resource_test (
	id serial NOT NULL,
	"name" varchar NULL,
	resource_id int4 NOT NULL,
	company_id int4 NULL,
	resource_calendar_id int4 NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT resource_test_pkey PRIMARY KEY (id)
);
CREATE INDEX resource_test_company_id_index ON public.resource_test USING btree (company_id);
CREATE INDEX resource_test_resource_calendar_id_index ON public.resource_test USING btree (resource_calendar_id);
CREATE INDEX resource_test_resource_id_index ON public.resource_test USING btree (resource_id);


-- public.rule_group_rel definition

-- Drop table

-- DROP TABLE public.rule_group_rel;

CREATE TABLE public.rule_group_rel (
	rule_group_id int4 NOT NULL,
	group_id int4 NOT NULL,
	CONSTRAINT rule_group_rel_rule_group_id_group_id_key UNIQUE (rule_group_id, group_id)
);
CREATE INDEX rule_group_rel_group_id_idx ON public.rule_group_rel USING btree (group_id);
CREATE INDEX rule_group_rel_rule_group_id_idx ON public.rule_group_rel USING btree (rule_group_id);


-- public.sms_send_sms definition

-- Drop table

-- DROP TABLE public.sms_send_sms;

CREATE TABLE public.sms_send_sms (
	id serial NOT NULL,
	recipients varchar NOT NULL,
	message text NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT sms_send_sms_pkey PRIMARY KEY (id)
);


-- public.snailmail_letter definition

-- Drop table

-- DROP TABLE public.snailmail_letter;

CREATE TABLE public.snailmail_letter (
	id serial NOT NULL,
	user_id int4 NULL,
	model varchar NOT NULL,
	res_id int4 NOT NULL,
	partner_id int4 NOT NULL,
	company_id int4 NOT NULL,
	report_template int4 NULL,
	attachment_id int4 NULL,
	color bool NULL,
	duplex bool NULL,
	state varchar NULL,
	info_msg varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT snailmail_letter_pkey PRIMARY KEY (id)
);


-- public.web_editor_converter_test definition

-- Drop table

-- DROP TABLE public.web_editor_converter_test;

CREATE TABLE public.web_editor_converter_test (
	id serial NOT NULL,
	"char" varchar NULL,
	"integer" int4 NULL,
	"float" float8 NULL,
	"numeric" numeric NULL,
	many2one int4 NULL,
	"binary" bytea NULL,
	"date" date NULL,
	datetime timestamp NULL,
	selection int4 NULL,
	selection_str varchar NULL,
	html text NULL,
	"text" text NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT web_editor_converter_test_pkey PRIMARY KEY (id)
);


-- public.web_editor_converter_test_sub definition

-- Drop table

-- DROP TABLE public.web_editor_converter_test_sub;

CREATE TABLE public.web_editor_converter_test_sub (
	id serial NOT NULL,
	"name" varchar NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT web_editor_converter_test_sub_pkey PRIMARY KEY (id)
);


-- public.web_tour_tour definition

-- Drop table

-- DROP TABLE public.web_tour_tour;

CREATE TABLE public.web_tour_tour (
	id serial NOT NULL,
	"name" varchar NOT NULL,
	user_id int4 NULL,
	CONSTRAINT web_tour_tour_pkey PRIMARY KEY (id)
);


-- public.wizard_ir_model_menu_create definition

-- Drop table

-- DROP TABLE public.wizard_ir_model_menu_create;

CREATE TABLE public.wizard_ir_model_menu_create (
	id serial NOT NULL,
	menu_id int4 NOT NULL,
	"name" varchar NOT NULL,
	create_uid int4 NULL,
	create_date timestamp NULL,
	write_uid int4 NULL,
	write_date timestamp NULL,
	CONSTRAINT wizard_ir_model_menu_create_pkey PRIMARY KEY (id)
);


-- public.base_import_import foreign keys

ALTER TABLE public.base_import_import ADD CONSTRAINT base_import_import_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_import_import ADD CONSTRAINT base_import_import_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_import_mapping foreign keys

ALTER TABLE public.base_import_mapping ADD CONSTRAINT base_import_mapping_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_import_mapping ADD CONSTRAINT base_import_mapping_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_import_tests_models_char foreign keys

ALTER TABLE public.base_import_tests_models_char ADD CONSTRAINT base_import_tests_models_char_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_import_tests_models_char ADD CONSTRAINT base_import_tests_models_char_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_import_tests_models_char_noreadonly foreign keys

ALTER TABLE public.base_import_tests_models_char_noreadonly ADD CONSTRAINT base_import_tests_models_char_noreadonly_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_import_tests_models_char_noreadonly ADD CONSTRAINT base_import_tests_models_char_noreadonly_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_import_tests_models_char_readonly foreign keys

ALTER TABLE public.base_import_tests_models_char_readonly ADD CONSTRAINT base_import_tests_models_char_readonly_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_import_tests_models_char_readonly ADD CONSTRAINT base_import_tests_models_char_readonly_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_import_tests_models_char_required foreign keys

ALTER TABLE public.base_import_tests_models_char_required ADD CONSTRAINT base_import_tests_models_char_required_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_import_tests_models_char_required ADD CONSTRAINT base_import_tests_models_char_required_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_import_tests_models_char_states foreign keys

ALTER TABLE public.base_import_tests_models_char_states ADD CONSTRAINT base_import_tests_models_char_states_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_import_tests_models_char_states ADD CONSTRAINT base_import_tests_models_char_states_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_import_tests_models_char_stillreadonly foreign keys

ALTER TABLE public.base_import_tests_models_char_stillreadonly ADD CONSTRAINT base_import_tests_models_char_stillreadonly_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_import_tests_models_char_stillreadonly ADD CONSTRAINT base_import_tests_models_char_stillreadonly_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_import_tests_models_complex foreign keys

ALTER TABLE public.base_import_tests_models_complex ADD CONSTRAINT base_import_tests_models_complex_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_import_tests_models_complex ADD CONSTRAINT base_import_tests_models_complex_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES res_currency(id) ON DELETE SET NULL;
ALTER TABLE public.base_import_tests_models_complex ADD CONSTRAINT base_import_tests_models_complex_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_import_tests_models_float foreign keys

ALTER TABLE public.base_import_tests_models_float ADD CONSTRAINT base_import_tests_models_float_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_import_tests_models_float ADD CONSTRAINT base_import_tests_models_float_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES res_currency(id) ON DELETE SET NULL;
ALTER TABLE public.base_import_tests_models_float ADD CONSTRAINT base_import_tests_models_float_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_import_tests_models_m2o foreign keys

ALTER TABLE public.base_import_tests_models_m2o ADD CONSTRAINT base_import_tests_models_m2o_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_import_tests_models_m2o ADD CONSTRAINT base_import_tests_models_m2o_value_fkey FOREIGN KEY (value) REFERENCES base_import_tests_models_m2o_related(id) ON DELETE SET NULL;
ALTER TABLE public.base_import_tests_models_m2o ADD CONSTRAINT base_import_tests_models_m2o_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_import_tests_models_m2o_related foreign keys

ALTER TABLE public.base_import_tests_models_m2o_related ADD CONSTRAINT base_import_tests_models_m2o_related_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_import_tests_models_m2o_related ADD CONSTRAINT base_import_tests_models_m2o_related_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_import_tests_models_m2o_required foreign keys

ALTER TABLE public.base_import_tests_models_m2o_required ADD CONSTRAINT base_import_tests_models_m2o_required_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_import_tests_models_m2o_required ADD CONSTRAINT base_import_tests_models_m2o_required_value_fkey FOREIGN KEY (value) REFERENCES base_import_tests_models_m2o_required_related(id) ON DELETE SET NULL;
ALTER TABLE public.base_import_tests_models_m2o_required ADD CONSTRAINT base_import_tests_models_m2o_required_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_import_tests_models_m2o_required_related foreign keys

ALTER TABLE public.base_import_tests_models_m2o_required_related ADD CONSTRAINT base_import_tests_models_m2o_required_related_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_import_tests_models_m2o_required_related ADD CONSTRAINT base_import_tests_models_m2o_required_related_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_import_tests_models_o2m foreign keys

ALTER TABLE public.base_import_tests_models_o2m ADD CONSTRAINT base_import_tests_models_o2m_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_import_tests_models_o2m ADD CONSTRAINT base_import_tests_models_o2m_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_import_tests_models_o2m_child foreign keys

ALTER TABLE public.base_import_tests_models_o2m_child ADD CONSTRAINT base_import_tests_models_o2m_child_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_import_tests_models_o2m_child ADD CONSTRAINT base_import_tests_models_o2m_child_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES base_import_tests_models_o2m(id) ON DELETE SET NULL;
ALTER TABLE public.base_import_tests_models_o2m_child ADD CONSTRAINT base_import_tests_models_o2m_child_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_import_tests_models_preview foreign keys

ALTER TABLE public.base_import_tests_models_preview ADD CONSTRAINT base_import_tests_models_preview_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_import_tests_models_preview ADD CONSTRAINT base_import_tests_models_preview_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_language_export foreign keys

ALTER TABLE public.base_language_export ADD CONSTRAINT base_language_export_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_language_export ADD CONSTRAINT base_language_export_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_language_import foreign keys

ALTER TABLE public.base_language_import ADD CONSTRAINT base_language_import_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_language_import ADD CONSTRAINT base_language_import_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_language_install foreign keys

ALTER TABLE public.base_language_install ADD CONSTRAINT base_language_install_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_language_install ADD CONSTRAINT base_language_install_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_module_uninstall foreign keys

ALTER TABLE public.base_module_uninstall ADD CONSTRAINT base_module_uninstall_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_module_uninstall ADD CONSTRAINT base_module_uninstall_module_id_fkey FOREIGN KEY (module_id) REFERENCES ir_module_module(id) ON DELETE CASCADE;
ALTER TABLE public.base_module_uninstall ADD CONSTRAINT base_module_uninstall_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_module_update foreign keys

ALTER TABLE public.base_module_update ADD CONSTRAINT base_module_update_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_module_update ADD CONSTRAINT base_module_update_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_module_upgrade foreign keys

ALTER TABLE public.base_module_upgrade ADD CONSTRAINT base_module_upgrade_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_module_upgrade ADD CONSTRAINT base_module_upgrade_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_partner_merge_automatic_wizard foreign keys

ALTER TABLE public.base_partner_merge_automatic_wizard ADD CONSTRAINT base_partner_merge_automatic_wizard_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_partner_merge_automatic_wizard ADD CONSTRAINT base_partner_merge_automatic_wizard_current_line_id_fkey FOREIGN KEY (current_line_id) REFERENCES base_partner_merge_line(id) ON DELETE SET NULL;
ALTER TABLE public.base_partner_merge_automatic_wizard ADD CONSTRAINT base_partner_merge_automatic_wizard_dst_partner_id_fkey FOREIGN KEY (dst_partner_id) REFERENCES res_partner(id) ON DELETE SET NULL;
ALTER TABLE public.base_partner_merge_automatic_wizard ADD CONSTRAINT base_partner_merge_automatic_wizard_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_partner_merge_automatic_wizard_res_partner_rel foreign keys

ALTER TABLE public.base_partner_merge_automatic_wizard_res_partner_rel ADD CONSTRAINT base_partner_merge_automatic__base_partner_merge_automatic_fkey FOREIGN KEY (base_partner_merge_automatic_wizard_id) REFERENCES base_partner_merge_automatic_wizard(id) ON DELETE CASCADE;
ALTER TABLE public.base_partner_merge_automatic_wizard_res_partner_rel ADD CONSTRAINT base_partner_merge_automatic_wizard_res_par_res_partner_id_fkey FOREIGN KEY (res_partner_id) REFERENCES res_partner(id) ON DELETE CASCADE;


-- public.base_partner_merge_line foreign keys

ALTER TABLE public.base_partner_merge_line ADD CONSTRAINT base_partner_merge_line_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_partner_merge_line ADD CONSTRAINT base_partner_merge_line_wizard_id_fkey FOREIGN KEY (wizard_id) REFERENCES base_partner_merge_automatic_wizard(id) ON DELETE SET NULL;
ALTER TABLE public.base_partner_merge_line ADD CONSTRAINT base_partner_merge_line_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.base_update_translations foreign keys

ALTER TABLE public.base_update_translations ADD CONSTRAINT base_update_translations_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.base_update_translations ADD CONSTRAINT base_update_translations_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.bus_bus foreign keys

ALTER TABLE public.bus_bus ADD CONSTRAINT bus_bus_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.bus_bus ADD CONSTRAINT bus_bus_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.bus_presence foreign keys

ALTER TABLE public.bus_presence ADD CONSTRAINT bus_presence_user_id_fkey FOREIGN KEY (user_id) REFERENCES res_users(id) ON DELETE CASCADE;


-- public.change_password_user foreign keys

ALTER TABLE public.change_password_user ADD CONSTRAINT change_password_user_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.change_password_user ADD CONSTRAINT change_password_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES res_users(id) ON DELETE CASCADE;
ALTER TABLE public.change_password_user ADD CONSTRAINT change_password_user_wizard_id_fkey FOREIGN KEY (wizard_id) REFERENCES change_password_wizard(id) ON DELETE CASCADE;
ALTER TABLE public.change_password_user ADD CONSTRAINT change_password_user_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.change_password_wizard foreign keys

ALTER TABLE public.change_password_wizard ADD CONSTRAINT change_password_wizard_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.change_password_wizard ADD CONSTRAINT change_password_wizard_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.email_template_attachment_rel foreign keys

ALTER TABLE public.email_template_attachment_rel ADD CONSTRAINT email_template_attachment_rel_attachment_id_fkey FOREIGN KEY (attachment_id) REFERENCES ir_attachment(id) ON DELETE CASCADE;
ALTER TABLE public.email_template_attachment_rel ADD CONSTRAINT email_template_attachment_rel_email_template_id_fkey FOREIGN KEY (email_template_id) REFERENCES mail_template(id) ON DELETE CASCADE;


-- public.email_template_preview foreign keys

ALTER TABLE public.email_template_preview ADD CONSTRAINT email_template_preview_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.email_template_preview ADD CONSTRAINT email_template_preview_mail_server_id_fkey FOREIGN KEY (mail_server_id) REFERENCES ir_mail_server(id) ON DELETE SET NULL;
ALTER TABLE public.email_template_preview ADD CONSTRAINT email_template_preview_model_id_fkey FOREIGN KEY (model_id) REFERENCES ir_model(id) ON DELETE SET NULL;
ALTER TABLE public.email_template_preview ADD CONSTRAINT email_template_preview_model_object_field_fkey FOREIGN KEY (model_object_field) REFERENCES ir_model_fields(id) ON DELETE SET NULL;
ALTER TABLE public.email_template_preview ADD CONSTRAINT email_template_preview_ref_ir_act_window_fkey FOREIGN KEY (ref_ir_act_window) REFERENCES ir_act_window(id) ON DELETE SET NULL;
ALTER TABLE public.email_template_preview ADD CONSTRAINT email_template_preview_report_template_fkey FOREIGN KEY (report_template) REFERENCES ir_act_report_xml(id) ON DELETE SET NULL;
ALTER TABLE public.email_template_preview ADD CONSTRAINT email_template_preview_sub_model_object_field_fkey FOREIGN KEY (sub_model_object_field) REFERENCES ir_model_fields(id) ON DELETE SET NULL;
ALTER TABLE public.email_template_preview ADD CONSTRAINT email_template_preview_sub_object_fkey FOREIGN KEY (sub_object) REFERENCES ir_model(id) ON DELETE SET NULL;
ALTER TABLE public.email_template_preview ADD CONSTRAINT email_template_preview_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.email_template_preview_res_partner_rel foreign keys

ALTER TABLE public.email_template_preview_res_partner_rel ADD CONSTRAINT email_template_preview_res_partn_email_template_preview_id_fkey FOREIGN KEY (email_template_preview_id) REFERENCES email_template_preview(id) ON DELETE CASCADE;
ALTER TABLE public.email_template_preview_res_partner_rel ADD CONSTRAINT email_template_preview_res_partner_rel_res_partner_id_fkey FOREIGN KEY (res_partner_id) REFERENCES res_partner(id) ON DELETE CASCADE;


-- public.employee_category_rel foreign keys

ALTER TABLE public.employee_category_rel ADD CONSTRAINT employee_category_rel_category_id_fkey FOREIGN KEY (category_id) REFERENCES hr_employee_category(id) ON DELETE CASCADE;
ALTER TABLE public.employee_category_rel ADD CONSTRAINT employee_category_rel_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES hr_employee(id) ON DELETE CASCADE;


-- public.fetchmail_server foreign keys

ALTER TABLE public.fetchmail_server ADD CONSTRAINT fetchmail_server_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.fetchmail_server ADD CONSTRAINT fetchmail_server_object_id_fkey FOREIGN KEY (object_id) REFERENCES ir_model(id) ON DELETE SET NULL;
ALTER TABLE public.fetchmail_server ADD CONSTRAINT fetchmail_server_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.hr_department foreign keys

ALTER TABLE public.hr_department ADD CONSTRAINT hr_department_company_id_fkey FOREIGN KEY (company_id) REFERENCES res_company(id) ON DELETE SET NULL;
ALTER TABLE public.hr_department ADD CONSTRAINT hr_department_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.hr_department ADD CONSTRAINT hr_department_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES hr_employee(id) ON DELETE SET NULL;
ALTER TABLE public.hr_department ADD CONSTRAINT hr_department_message_main_attachment_id_fkey FOREIGN KEY (message_main_attachment_id) REFERENCES ir_attachment(id) ON DELETE SET NULL;
ALTER TABLE public.hr_department ADD CONSTRAINT hr_department_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES hr_department(id) ON DELETE SET NULL;
ALTER TABLE public.hr_department ADD CONSTRAINT hr_department_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.hr_department_mail_channel_rel foreign keys

ALTER TABLE public.hr_department_mail_channel_rel ADD CONSTRAINT hr_department_mail_channel_rel_hr_department_id_fkey FOREIGN KEY (hr_department_id) REFERENCES hr_department(id) ON DELETE CASCADE;
ALTER TABLE public.hr_department_mail_channel_rel ADD CONSTRAINT hr_department_mail_channel_rel_mail_channel_id_fkey FOREIGN KEY (mail_channel_id) REFERENCES mail_channel(id) ON DELETE CASCADE;


-- public.hr_employee foreign keys

ALTER TABLE public.hr_employee ADD CONSTRAINT hr_employee_address_home_id_fkey FOREIGN KEY (address_home_id) REFERENCES res_partner(id) ON DELETE SET NULL;
ALTER TABLE public.hr_employee ADD CONSTRAINT hr_employee_address_id_fkey FOREIGN KEY (address_id) REFERENCES res_partner(id) ON DELETE SET NULL;
ALTER TABLE public.hr_employee ADD CONSTRAINT hr_employee_bank_account_id_fkey FOREIGN KEY (bank_account_id) REFERENCES res_partner_bank(id) ON DELETE SET NULL;
ALTER TABLE public.hr_employee ADD CONSTRAINT hr_employee_coach_id_fkey FOREIGN KEY (coach_id) REFERENCES hr_employee(id) ON DELETE SET NULL;
ALTER TABLE public.hr_employee ADD CONSTRAINT hr_employee_company_id_fkey FOREIGN KEY (company_id) REFERENCES res_company(id) ON DELETE SET NULL;
ALTER TABLE public.hr_employee ADD CONSTRAINT hr_employee_country_id_fkey FOREIGN KEY (country_id) REFERENCES res_country(id) ON DELETE SET NULL;
ALTER TABLE public.hr_employee ADD CONSTRAINT hr_employee_country_of_birth_fkey FOREIGN KEY (country_of_birth) REFERENCES res_country(id) ON DELETE SET NULL;
ALTER TABLE public.hr_employee ADD CONSTRAINT hr_employee_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.hr_employee ADD CONSTRAINT hr_employee_department_id_fkey FOREIGN KEY (department_id) REFERENCES hr_department(id) ON DELETE SET NULL;
ALTER TABLE public.hr_employee ADD CONSTRAINT hr_employee_job_id_fkey FOREIGN KEY (job_id) REFERENCES hr_job(id) ON DELETE SET NULL;
ALTER TABLE public.hr_employee ADD CONSTRAINT hr_employee_message_main_attachment_id_fkey FOREIGN KEY (message_main_attachment_id) REFERENCES ir_attachment(id) ON DELETE SET NULL;
ALTER TABLE public.hr_employee ADD CONSTRAINT hr_employee_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES hr_employee(id) ON DELETE SET NULL;
ALTER TABLE public.hr_employee ADD CONSTRAINT hr_employee_resource_calendar_id_fkey FOREIGN KEY (resource_calendar_id) REFERENCES resource_calendar(id) ON DELETE SET NULL;
ALTER TABLE public.hr_employee ADD CONSTRAINT hr_employee_resource_id_fkey FOREIGN KEY (resource_id) REFERENCES resource_resource(id) ON DELETE RESTRICT;
ALTER TABLE public.hr_employee ADD CONSTRAINT hr_employee_user_id_fkey FOREIGN KEY (user_id) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.hr_employee ADD CONSTRAINT hr_employee_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.hr_employee_category foreign keys

ALTER TABLE public.hr_employee_category ADD CONSTRAINT hr_employee_category_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.hr_employee_category ADD CONSTRAINT hr_employee_category_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.hr_job foreign keys

ALTER TABLE public.hr_job ADD CONSTRAINT hr_job_company_id_fkey FOREIGN KEY (company_id) REFERENCES res_company(id) ON DELETE SET NULL;
ALTER TABLE public.hr_job ADD CONSTRAINT hr_job_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.hr_job ADD CONSTRAINT hr_job_department_id_fkey FOREIGN KEY (department_id) REFERENCES hr_department(id) ON DELETE SET NULL;
ALTER TABLE public.hr_job ADD CONSTRAINT hr_job_message_main_attachment_id_fkey FOREIGN KEY (message_main_attachment_id) REFERENCES ir_attachment(id) ON DELETE SET NULL;
ALTER TABLE public.hr_job ADD CONSTRAINT hr_job_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.iap_account foreign keys

ALTER TABLE public.iap_account ADD CONSTRAINT iap_account_company_id_fkey FOREIGN KEY (company_id) REFERENCES res_company(id) ON DELETE SET NULL;
ALTER TABLE public.iap_account ADD CONSTRAINT iap_account_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.iap_account ADD CONSTRAINT iap_account_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_act_client foreign keys

ALTER TABLE public.ir_act_client ADD CONSTRAINT ir_act_client_binding_model_id_fkey FOREIGN KEY (binding_model_id) REFERENCES ir_model(id) ON DELETE CASCADE;
ALTER TABLE public.ir_act_client ADD CONSTRAINT ir_act_client_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_act_client ADD CONSTRAINT ir_act_client_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_act_report_xml foreign keys

ALTER TABLE public.ir_act_report_xml ADD CONSTRAINT ir_act_report_xml_binding_model_id_fkey FOREIGN KEY (binding_model_id) REFERENCES ir_model(id) ON DELETE CASCADE;
ALTER TABLE public.ir_act_report_xml ADD CONSTRAINT ir_act_report_xml_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_act_report_xml ADD CONSTRAINT ir_act_report_xml_paperformat_id_fkey FOREIGN KEY (paperformat_id) REFERENCES report_paperformat(id) ON DELETE SET NULL;
ALTER TABLE public.ir_act_report_xml ADD CONSTRAINT ir_act_report_xml_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_act_server foreign keys

ALTER TABLE public.ir_act_server ADD CONSTRAINT ir_act_server_activity_type_id_fkey FOREIGN KEY (activity_type_id) REFERENCES mail_activity_type(id) ON DELETE SET NULL;
ALTER TABLE public.ir_act_server ADD CONSTRAINT ir_act_server_activity_user_id_fkey FOREIGN KEY (activity_user_id) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_act_server ADD CONSTRAINT ir_act_server_binding_model_id_fkey FOREIGN KEY (binding_model_id) REFERENCES ir_model(id) ON DELETE CASCADE;
ALTER TABLE public.ir_act_server ADD CONSTRAINT ir_act_server_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_act_server ADD CONSTRAINT ir_act_server_crud_model_id_fkey FOREIGN KEY (crud_model_id) REFERENCES ir_model(id) ON DELETE SET NULL;
ALTER TABLE public.ir_act_server ADD CONSTRAINT ir_act_server_link_field_id_fkey FOREIGN KEY (link_field_id) REFERENCES ir_model_fields(id) ON DELETE SET NULL;
ALTER TABLE public.ir_act_server ADD CONSTRAINT ir_act_server_model_id_fkey FOREIGN KEY (model_id) REFERENCES ir_model(id) ON DELETE CASCADE;
ALTER TABLE public.ir_act_server ADD CONSTRAINT ir_act_server_template_id_fkey FOREIGN KEY (template_id) REFERENCES mail_template(id) ON DELETE SET NULL;
ALTER TABLE public.ir_act_server ADD CONSTRAINT ir_act_server_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_act_server_mail_channel_rel foreign keys

ALTER TABLE public.ir_act_server_mail_channel_rel ADD CONSTRAINT ir_act_server_mail_channel_rel_ir_act_server_id_fkey FOREIGN KEY (ir_act_server_id) REFERENCES ir_act_server(id) ON DELETE CASCADE;
ALTER TABLE public.ir_act_server_mail_channel_rel ADD CONSTRAINT ir_act_server_mail_channel_rel_mail_channel_id_fkey FOREIGN KEY (mail_channel_id) REFERENCES mail_channel(id) ON DELETE CASCADE;


-- public.ir_act_server_res_partner_rel foreign keys

ALTER TABLE public.ir_act_server_res_partner_rel ADD CONSTRAINT ir_act_server_res_partner_rel_ir_act_server_id_fkey FOREIGN KEY (ir_act_server_id) REFERENCES ir_act_server(id) ON DELETE CASCADE;
ALTER TABLE public.ir_act_server_res_partner_rel ADD CONSTRAINT ir_act_server_res_partner_rel_res_partner_id_fkey FOREIGN KEY (res_partner_id) REFERENCES res_partner(id) ON DELETE CASCADE;


-- public.ir_act_url foreign keys

ALTER TABLE public.ir_act_url ADD CONSTRAINT ir_act_url_binding_model_id_fkey FOREIGN KEY (binding_model_id) REFERENCES ir_model(id) ON DELETE CASCADE;
ALTER TABLE public.ir_act_url ADD CONSTRAINT ir_act_url_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_act_url ADD CONSTRAINT ir_act_url_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_act_window foreign keys

ALTER TABLE public.ir_act_window ADD CONSTRAINT ir_act_window_binding_model_id_fkey FOREIGN KEY (binding_model_id) REFERENCES ir_model(id) ON DELETE CASCADE;
ALTER TABLE public.ir_act_window ADD CONSTRAINT ir_act_window_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_act_window ADD CONSTRAINT ir_act_window_search_view_id_fkey FOREIGN KEY (search_view_id) REFERENCES ir_ui_view(id) ON DELETE SET NULL;
ALTER TABLE public.ir_act_window ADD CONSTRAINT ir_act_window_view_id_fkey FOREIGN KEY (view_id) REFERENCES ir_ui_view(id) ON DELETE SET NULL;
ALTER TABLE public.ir_act_window ADD CONSTRAINT ir_act_window_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_act_window_group_rel foreign keys

ALTER TABLE public.ir_act_window_group_rel ADD CONSTRAINT ir_act_window_group_rel_act_id_fkey FOREIGN KEY (act_id) REFERENCES ir_act_window(id) ON DELETE CASCADE;
ALTER TABLE public.ir_act_window_group_rel ADD CONSTRAINT ir_act_window_group_rel_gid_fkey FOREIGN KEY (gid) REFERENCES res_groups(id) ON DELETE CASCADE;


-- public.ir_act_window_view foreign keys

ALTER TABLE public.ir_act_window_view ADD CONSTRAINT ir_act_window_view_act_window_id_fkey FOREIGN KEY (act_window_id) REFERENCES ir_act_window(id) ON DELETE CASCADE;
ALTER TABLE public.ir_act_window_view ADD CONSTRAINT ir_act_window_view_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_act_window_view ADD CONSTRAINT ir_act_window_view_view_id_fkey FOREIGN KEY (view_id) REFERENCES ir_ui_view(id) ON DELETE SET NULL;
ALTER TABLE public.ir_act_window_view ADD CONSTRAINT ir_act_window_view_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_actions foreign keys

ALTER TABLE public.ir_actions ADD CONSTRAINT ir_actions_binding_model_id_fkey FOREIGN KEY (binding_model_id) REFERENCES ir_model(id) ON DELETE CASCADE;
ALTER TABLE public.ir_actions ADD CONSTRAINT ir_actions_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_actions ADD CONSTRAINT ir_actions_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_actions_todo foreign keys

ALTER TABLE public.ir_actions_todo ADD CONSTRAINT ir_actions_todo_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_actions_todo ADD CONSTRAINT ir_actions_todo_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_attachment foreign keys

ALTER TABLE public.ir_attachment ADD CONSTRAINT ir_attachment_company_id_fkey FOREIGN KEY (company_id) REFERENCES res_company(id) ON DELETE SET NULL;
ALTER TABLE public.ir_attachment ADD CONSTRAINT ir_attachment_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_attachment ADD CONSTRAINT ir_attachment_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_config_parameter foreign keys

ALTER TABLE public.ir_config_parameter ADD CONSTRAINT ir_config_parameter_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_config_parameter ADD CONSTRAINT ir_config_parameter_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_cron foreign keys

ALTER TABLE public.ir_cron ADD CONSTRAINT ir_cron_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_cron ADD CONSTRAINT ir_cron_ir_actions_server_id_fkey FOREIGN KEY (ir_actions_server_id) REFERENCES ir_act_server(id) ON DELETE RESTRICT;
ALTER TABLE public.ir_cron ADD CONSTRAINT ir_cron_user_id_fkey FOREIGN KEY (user_id) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_cron ADD CONSTRAINT ir_cron_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_default foreign keys

ALTER TABLE public.ir_default ADD CONSTRAINT ir_default_company_id_fkey FOREIGN KEY (company_id) REFERENCES res_company(id) ON DELETE CASCADE;
ALTER TABLE public.ir_default ADD CONSTRAINT ir_default_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_default ADD CONSTRAINT ir_default_field_id_fkey FOREIGN KEY (field_id) REFERENCES ir_model_fields(id) ON DELETE CASCADE;
ALTER TABLE public.ir_default ADD CONSTRAINT ir_default_user_id_fkey FOREIGN KEY (user_id) REFERENCES res_users(id) ON DELETE CASCADE;
ALTER TABLE public.ir_default ADD CONSTRAINT ir_default_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_demo foreign keys

ALTER TABLE public.ir_demo ADD CONSTRAINT ir_demo_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_demo ADD CONSTRAINT ir_demo_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_demo_failure foreign keys

ALTER TABLE public.ir_demo_failure ADD CONSTRAINT ir_demo_failure_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_demo_failure ADD CONSTRAINT ir_demo_failure_module_id_fkey FOREIGN KEY (module_id) REFERENCES ir_module_module(id) ON DELETE SET NULL;
ALTER TABLE public.ir_demo_failure ADD CONSTRAINT ir_demo_failure_wizard_id_fkey FOREIGN KEY (wizard_id) REFERENCES ir_demo_failure_wizard(id) ON DELETE SET NULL;
ALTER TABLE public.ir_demo_failure ADD CONSTRAINT ir_demo_failure_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_demo_failure_wizard foreign keys

ALTER TABLE public.ir_demo_failure_wizard ADD CONSTRAINT ir_demo_failure_wizard_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_demo_failure_wizard ADD CONSTRAINT ir_demo_failure_wizard_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_exports foreign keys

ALTER TABLE public.ir_exports ADD CONSTRAINT ir_exports_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_exports ADD CONSTRAINT ir_exports_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_exports_line foreign keys

ALTER TABLE public.ir_exports_line ADD CONSTRAINT ir_exports_line_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_exports_line ADD CONSTRAINT ir_exports_line_export_id_fkey FOREIGN KEY (export_id) REFERENCES ir_exports(id) ON DELETE CASCADE;
ALTER TABLE public.ir_exports_line ADD CONSTRAINT ir_exports_line_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_filters foreign keys

ALTER TABLE public.ir_filters ADD CONSTRAINT ir_filters_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_filters ADD CONSTRAINT ir_filters_user_id_fkey FOREIGN KEY (user_id) REFERENCES res_users(id) ON DELETE CASCADE;
ALTER TABLE public.ir_filters ADD CONSTRAINT ir_filters_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_mail_server foreign keys

ALTER TABLE public.ir_mail_server ADD CONSTRAINT ir_mail_server_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_mail_server ADD CONSTRAINT ir_mail_server_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_model foreign keys

ALTER TABLE public.ir_model ADD CONSTRAINT ir_model_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_model ADD CONSTRAINT ir_model_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_model_access foreign keys

ALTER TABLE public.ir_model_access ADD CONSTRAINT ir_model_access_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_model_access ADD CONSTRAINT ir_model_access_group_id_fkey FOREIGN KEY (group_id) REFERENCES res_groups(id) ON DELETE CASCADE;
ALTER TABLE public.ir_model_access ADD CONSTRAINT ir_model_access_model_id_fkey FOREIGN KEY (model_id) REFERENCES ir_model(id) ON DELETE CASCADE;
ALTER TABLE public.ir_model_access ADD CONSTRAINT ir_model_access_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_model_constraint foreign keys

ALTER TABLE public.ir_model_constraint ADD CONSTRAINT ir_model_constraint_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_model_constraint ADD CONSTRAINT ir_model_constraint_model_fkey FOREIGN KEY (model) REFERENCES ir_model(id) ON DELETE CASCADE;
ALTER TABLE public.ir_model_constraint ADD CONSTRAINT ir_model_constraint_module_fkey FOREIGN KEY (module) REFERENCES ir_module_module(id) ON DELETE SET NULL;
ALTER TABLE public.ir_model_constraint ADD CONSTRAINT ir_model_constraint_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_model_data foreign keys

ALTER TABLE public.ir_model_data ADD CONSTRAINT ir_model_data_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_model_data ADD CONSTRAINT ir_model_data_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_model_fields foreign keys

ALTER TABLE public.ir_model_fields ADD CONSTRAINT ir_model_fields_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_model_fields ADD CONSTRAINT ir_model_fields_model_id_fkey FOREIGN KEY (model_id) REFERENCES ir_model(id) ON DELETE CASCADE;
ALTER TABLE public.ir_model_fields ADD CONSTRAINT ir_model_fields_related_field_id_fkey FOREIGN KEY (related_field_id) REFERENCES ir_model_fields(id) ON DELETE CASCADE;
ALTER TABLE public.ir_model_fields ADD CONSTRAINT ir_model_fields_relation_field_id_fkey FOREIGN KEY (relation_field_id) REFERENCES ir_model_fields(id) ON DELETE CASCADE;
ALTER TABLE public.ir_model_fields ADD CONSTRAINT ir_model_fields_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_model_fields_group_rel foreign keys

ALTER TABLE public.ir_model_fields_group_rel ADD CONSTRAINT ir_model_fields_group_rel_field_id_fkey FOREIGN KEY (field_id) REFERENCES ir_model_fields(id) ON DELETE CASCADE;
ALTER TABLE public.ir_model_fields_group_rel ADD CONSTRAINT ir_model_fields_group_rel_group_id_fkey FOREIGN KEY (group_id) REFERENCES res_groups(id) ON DELETE CASCADE;


-- public.ir_model_relation foreign keys

ALTER TABLE public.ir_model_relation ADD CONSTRAINT ir_model_relation_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_model_relation ADD CONSTRAINT ir_model_relation_model_fkey FOREIGN KEY (model) REFERENCES ir_model(id) ON DELETE SET NULL;
ALTER TABLE public.ir_model_relation ADD CONSTRAINT ir_model_relation_module_fkey FOREIGN KEY (module) REFERENCES ir_module_module(id) ON DELETE SET NULL;
ALTER TABLE public.ir_model_relation ADD CONSTRAINT ir_model_relation_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_module_category foreign keys

ALTER TABLE public.ir_module_category ADD CONSTRAINT ir_module_category_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_module_category ADD CONSTRAINT ir_module_category_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES ir_module_category(id) ON DELETE SET NULL;
ALTER TABLE public.ir_module_category ADD CONSTRAINT ir_module_category_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_module_module foreign keys

ALTER TABLE public.ir_module_module ADD CONSTRAINT ir_module_module_category_id_fkey FOREIGN KEY (category_id) REFERENCES ir_module_category(id) ON DELETE SET NULL;
ALTER TABLE public.ir_module_module ADD CONSTRAINT ir_module_module_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_module_module ADD CONSTRAINT ir_module_module_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_module_module_dependency foreign keys

ALTER TABLE public.ir_module_module_dependency ADD CONSTRAINT ir_module_module_dependency_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_module_module_dependency ADD CONSTRAINT ir_module_module_dependency_module_id_fkey FOREIGN KEY (module_id) REFERENCES ir_module_module(id) ON DELETE CASCADE;
ALTER TABLE public.ir_module_module_dependency ADD CONSTRAINT ir_module_module_dependency_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_module_module_exclusion foreign keys

ALTER TABLE public.ir_module_module_exclusion ADD CONSTRAINT ir_module_module_exclusion_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_module_module_exclusion ADD CONSTRAINT ir_module_module_exclusion_module_id_fkey FOREIGN KEY (module_id) REFERENCES ir_module_module(id) ON DELETE CASCADE;
ALTER TABLE public.ir_module_module_exclusion ADD CONSTRAINT ir_module_module_exclusion_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_property foreign keys

ALTER TABLE public.ir_property ADD CONSTRAINT ir_property_company_id_fkey FOREIGN KEY (company_id) REFERENCES res_company(id) ON DELETE SET NULL;
ALTER TABLE public.ir_property ADD CONSTRAINT ir_property_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_property ADD CONSTRAINT ir_property_fields_id_fkey FOREIGN KEY (fields_id) REFERENCES ir_model_fields(id) ON DELETE CASCADE;
ALTER TABLE public.ir_property ADD CONSTRAINT ir_property_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_rule foreign keys

ALTER TABLE public.ir_rule ADD CONSTRAINT ir_rule_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_rule ADD CONSTRAINT ir_rule_model_id_fkey FOREIGN KEY (model_id) REFERENCES ir_model(id) ON DELETE CASCADE;
ALTER TABLE public.ir_rule ADD CONSTRAINT ir_rule_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_sequence foreign keys

ALTER TABLE public.ir_sequence ADD CONSTRAINT ir_sequence_company_id_fkey FOREIGN KEY (company_id) REFERENCES res_company(id) ON DELETE SET NULL;
ALTER TABLE public.ir_sequence ADD CONSTRAINT ir_sequence_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_sequence ADD CONSTRAINT ir_sequence_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_sequence_date_range foreign keys

ALTER TABLE public.ir_sequence_date_range ADD CONSTRAINT ir_sequence_date_range_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_sequence_date_range ADD CONSTRAINT ir_sequence_date_range_sequence_id_fkey FOREIGN KEY (sequence_id) REFERENCES ir_sequence(id) ON DELETE CASCADE;
ALTER TABLE public.ir_sequence_date_range ADD CONSTRAINT ir_sequence_date_range_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_server_object_lines foreign keys

ALTER TABLE public.ir_server_object_lines ADD CONSTRAINT ir_server_object_lines_col1_fkey FOREIGN KEY (col1) REFERENCES ir_model_fields(id) ON DELETE SET NULL;
ALTER TABLE public.ir_server_object_lines ADD CONSTRAINT ir_server_object_lines_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_server_object_lines ADD CONSTRAINT ir_server_object_lines_server_id_fkey FOREIGN KEY (server_id) REFERENCES ir_act_server(id) ON DELETE CASCADE;
ALTER TABLE public.ir_server_object_lines ADD CONSTRAINT ir_server_object_lines_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_translation foreign keys

ALTER TABLE public.ir_translation ADD CONSTRAINT ir_translation_lang_fkey_res_lang FOREIGN KEY (lang) REFERENCES res_lang(code);


-- public.ir_ui_menu foreign keys

ALTER TABLE public.ir_ui_menu ADD CONSTRAINT ir_ui_menu_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_ui_menu ADD CONSTRAINT ir_ui_menu_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES ir_ui_menu(id) ON DELETE RESTRICT;
ALTER TABLE public.ir_ui_menu ADD CONSTRAINT ir_ui_menu_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_ui_menu_group_rel foreign keys

ALTER TABLE public.ir_ui_menu_group_rel ADD CONSTRAINT ir_ui_menu_group_rel_gid_fkey FOREIGN KEY (gid) REFERENCES res_groups(id) ON DELETE CASCADE;
ALTER TABLE public.ir_ui_menu_group_rel ADD CONSTRAINT ir_ui_menu_group_rel_menu_id_fkey FOREIGN KEY (menu_id) REFERENCES ir_ui_menu(id) ON DELETE CASCADE;


-- public.ir_ui_view foreign keys

ALTER TABLE public.ir_ui_view ADD CONSTRAINT ir_ui_view_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_ui_view ADD CONSTRAINT ir_ui_view_inherit_id_fkey FOREIGN KEY (inherit_id) REFERENCES ir_ui_view(id) ON DELETE RESTRICT;
ALTER TABLE public.ir_ui_view ADD CONSTRAINT ir_ui_view_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_ui_view_custom foreign keys

ALTER TABLE public.ir_ui_view_custom ADD CONSTRAINT ir_ui_view_custom_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.ir_ui_view_custom ADD CONSTRAINT ir_ui_view_custom_ref_id_fkey FOREIGN KEY (ref_id) REFERENCES ir_ui_view(id) ON DELETE CASCADE;
ALTER TABLE public.ir_ui_view_custom ADD CONSTRAINT ir_ui_view_custom_user_id_fkey FOREIGN KEY (user_id) REFERENCES res_users(id) ON DELETE CASCADE;
ALTER TABLE public.ir_ui_view_custom ADD CONSTRAINT ir_ui_view_custom_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.ir_ui_view_group_rel foreign keys

ALTER TABLE public.ir_ui_view_group_rel ADD CONSTRAINT ir_ui_view_group_rel_group_id_fkey FOREIGN KEY (group_id) REFERENCES res_groups(id) ON DELETE CASCADE;
ALTER TABLE public.ir_ui_view_group_rel ADD CONSTRAINT ir_ui_view_group_rel_view_id_fkey FOREIGN KEY (view_id) REFERENCES ir_ui_view(id) ON DELETE CASCADE;


-- public.lw_access_token foreign keys

ALTER TABLE public.lw_access_token ADD CONSTRAINT lw_access_token_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.lw_access_token ADD CONSTRAINT lw_access_token_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES res_partner(id) ON DELETE CASCADE;
ALTER TABLE public.lw_access_token ADD CONSTRAINT lw_access_token_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.lw_calo_history foreign keys

ALTER TABLE public.lw_calo_history ADD CONSTRAINT lw_calo_history_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.lw_calo_history ADD CONSTRAINT lw_calo_history_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES res_partner(id) ON DELETE CASCADE;
ALTER TABLE public.lw_calo_history ADD CONSTRAINT lw_calo_history_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.lw_diet foreign keys

ALTER TABLE public.lw_diet ADD CONSTRAINT lw_diet_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.lw_diet ADD CONSTRAINT lw_diet_lw_week_id_fkey FOREIGN KEY (lw_week_id) REFERENCES lw_week(id) ON DELETE SET NULL;
ALTER TABLE public.lw_diet ADD CONSTRAINT lw_diet_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES res_partner(id) ON DELETE SET NULL;
ALTER TABLE public.lw_diet ADD CONSTRAINT lw_diet_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.lw_ex_partner_week foreign keys

ALTER TABLE public.lw_ex_partner_week ADD CONSTRAINT lw_ex_partner_week_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.lw_ex_partner_week ADD CONSTRAINT lw_ex_partner_week_lw_exercise_partner_id_fkey FOREIGN KEY (lw_exercise_partner_id) REFERENCES lw_exercise_partner(id) ON DELETE SET NULL;
ALTER TABLE public.lw_ex_partner_week ADD CONSTRAINT lw_ex_partner_week_lw_week_id_fkey FOREIGN KEY (lw_week_id) REFERENCES lw_week(id) ON DELETE SET NULL;
ALTER TABLE public.lw_ex_partner_week ADD CONSTRAINT lw_ex_partner_week_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.lw_exercise foreign keys

ALTER TABLE public.lw_exercise ADD CONSTRAINT lw_exercise_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.lw_exercise ADD CONSTRAINT lw_exercise_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.lw_exercise_lw_weightloss_area_rel foreign keys

ALTER TABLE public.lw_exercise_lw_weightloss_area_rel ADD CONSTRAINT lw_exercise_lw_weightloss_area_rel_lw_exercise_id_fkey FOREIGN KEY (lw_exercise_id) REFERENCES lw_exercise(id) ON DELETE CASCADE;
ALTER TABLE public.lw_exercise_lw_weightloss_area_rel ADD CONSTRAINT lw_exercise_lw_weightloss_area_rel_lw_weightloss_area_id_fkey FOREIGN KEY (lw_weightloss_area_id) REFERENCES lw_weightloss_area(id) ON DELETE CASCADE;


-- public.lw_exercise_partner foreign keys

ALTER TABLE public.lw_exercise_partner ADD CONSTRAINT lw_exercise_partner_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.lw_exercise_partner ADD CONSTRAINT lw_exercise_partner_exercise_id_fkey FOREIGN KEY (exercise_id) REFERENCES lw_exercise(id) ON DELETE SET NULL;
ALTER TABLE public.lw_exercise_partner ADD CONSTRAINT lw_exercise_partner_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES res_partner(id) ON DELETE SET NULL;
ALTER TABLE public.lw_exercise_partner ADD CONSTRAINT lw_exercise_partner_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.lw_fcm_token foreign keys

ALTER TABLE public.lw_fcm_token ADD CONSTRAINT lw_fcm_token_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.lw_fcm_token ADD CONSTRAINT lw_fcm_token_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES res_partner(id) ON DELETE CASCADE;
ALTER TABLE public.lw_fcm_token ADD CONSTRAINT lw_fcm_token_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.lw_food foreign keys

ALTER TABLE public.lw_food ADD CONSTRAINT lw_food_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.lw_food ADD CONSTRAINT lw_food_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.lw_news foreign keys

ALTER TABLE public.lw_news ADD CONSTRAINT lw_news_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.lw_news ADD CONSTRAINT lw_news_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.lw_news_trace foreign keys

ALTER TABLE public.lw_news_trace ADD CONSTRAINT lw_news_trace_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.lw_news_trace ADD CONSTRAINT lw_news_trace_news_id_fkey FOREIGN KEY (news_id) REFERENCES lw_news(id) ON DELETE SET NULL;
ALTER TABLE public.lw_news_trace ADD CONSTRAINT lw_news_trace_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES res_partner(id) ON DELETE SET NULL;
ALTER TABLE public.lw_news_trace ADD CONSTRAINT lw_news_trace_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.lw_week foreign keys

ALTER TABLE public.lw_week ADD CONSTRAINT lw_week_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.lw_week ADD CONSTRAINT lw_week_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.lw_weightloss_area foreign keys

ALTER TABLE public.lw_weightloss_area ADD CONSTRAINT lw_weightloss_area_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.lw_weightloss_area ADD CONSTRAINT lw_weightloss_area_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.lw_weightloss_area_partner foreign keys

ALTER TABLE public.lw_weightloss_area_partner ADD CONSTRAINT lw_weightloss_area_partner_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.lw_weightloss_area_partner ADD CONSTRAINT lw_weightloss_area_partner_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES res_partner(id) ON DELETE CASCADE;
ALTER TABLE public.lw_weightloss_area_partner ADD CONSTRAINT lw_weightloss_area_partner_weightloss_area_id_fkey FOREIGN KEY (weightloss_area_id) REFERENCES lw_weightloss_area(id) ON DELETE CASCADE;
ALTER TABLE public.lw_weightloss_area_partner ADD CONSTRAINT lw_weightloss_area_partner_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.mail_activity foreign keys

ALTER TABLE public.mail_activity ADD CONSTRAINT mail_activity_activity_type_id_fkey FOREIGN KEY (activity_type_id) REFERENCES mail_activity_type(id) ON DELETE RESTRICT;
ALTER TABLE public.mail_activity ADD CONSTRAINT mail_activity_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.mail_activity ADD CONSTRAINT mail_activity_create_user_id_fkey FOREIGN KEY (create_user_id) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.mail_activity ADD CONSTRAINT mail_activity_previous_activity_type_id_fkey FOREIGN KEY (previous_activity_type_id) REFERENCES mail_activity_type(id) ON DELETE SET NULL;
ALTER TABLE public.mail_activity ADD CONSTRAINT mail_activity_recommended_activity_type_id_fkey FOREIGN KEY (recommended_activity_type_id) REFERENCES mail_activity_type(id) ON DELETE SET NULL;
ALTER TABLE public.mail_activity ADD CONSTRAINT mail_activity_res_model_id_fkey FOREIGN KEY (res_model_id) REFERENCES ir_model(id) ON DELETE CASCADE;
ALTER TABLE public.mail_activity ADD CONSTRAINT mail_activity_user_id_fkey FOREIGN KEY (user_id) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.mail_activity ADD CONSTRAINT mail_activity_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.mail_activity_rel foreign keys

ALTER TABLE public.mail_activity_rel ADD CONSTRAINT mail_activity_rel_activity_id_fkey FOREIGN KEY (activity_id) REFERENCES mail_activity_type(id) ON DELETE CASCADE;
ALTER TABLE public.mail_activity_rel ADD CONSTRAINT mail_activity_rel_recommended_id_fkey FOREIGN KEY (recommended_id) REFERENCES mail_activity_type(id) ON DELETE CASCADE;


-- public.mail_activity_type foreign keys

ALTER TABLE public.mail_activity_type ADD CONSTRAINT mail_activity_type_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.mail_activity_type ADD CONSTRAINT mail_activity_type_default_next_type_id_fkey FOREIGN KEY (default_next_type_id) REFERENCES mail_activity_type(id) ON DELETE SET NULL;
ALTER TABLE public.mail_activity_type ADD CONSTRAINT mail_activity_type_res_model_id_fkey FOREIGN KEY (res_model_id) REFERENCES ir_model(id) ON DELETE SET NULL;
ALTER TABLE public.mail_activity_type ADD CONSTRAINT mail_activity_type_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.mail_activity_type_mail_template_rel foreign keys

ALTER TABLE public.mail_activity_type_mail_template_rel ADD CONSTRAINT mail_activity_type_mail_template_rel_mail_activity_type_id_fkey FOREIGN KEY (mail_activity_type_id) REFERENCES mail_activity_type(id) ON DELETE CASCADE;
ALTER TABLE public.mail_activity_type_mail_template_rel ADD CONSTRAINT mail_activity_type_mail_template_rel_mail_template_id_fkey FOREIGN KEY (mail_template_id) REFERENCES mail_template(id) ON DELETE CASCADE;


-- public.mail_alias foreign keys

ALTER TABLE public.mail_alias ADD CONSTRAINT mail_alias_alias_model_id_fkey FOREIGN KEY (alias_model_id) REFERENCES ir_model(id) ON DELETE CASCADE;
ALTER TABLE public.mail_alias ADD CONSTRAINT mail_alias_alias_parent_model_id_fkey FOREIGN KEY (alias_parent_model_id) REFERENCES ir_model(id) ON DELETE SET NULL;
ALTER TABLE public.mail_alias ADD CONSTRAINT mail_alias_alias_user_id_fkey FOREIGN KEY (alias_user_id) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.mail_alias ADD CONSTRAINT mail_alias_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.mail_alias ADD CONSTRAINT mail_alias_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.mail_blacklist foreign keys

ALTER TABLE public.mail_blacklist ADD CONSTRAINT mail_blacklist_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.mail_blacklist ADD CONSTRAINT mail_blacklist_message_main_attachment_id_fkey FOREIGN KEY (message_main_attachment_id) REFERENCES ir_attachment(id) ON DELETE SET NULL;
ALTER TABLE public.mail_blacklist ADD CONSTRAINT mail_blacklist_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.mail_channel foreign keys

ALTER TABLE public.mail_channel ADD CONSTRAINT mail_channel_alias_id_fkey FOREIGN KEY (alias_id) REFERENCES mail_alias(id) ON DELETE RESTRICT;
ALTER TABLE public.mail_channel ADD CONSTRAINT mail_channel_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.mail_channel ADD CONSTRAINT mail_channel_group_public_id_fkey FOREIGN KEY (group_public_id) REFERENCES res_groups(id) ON DELETE SET NULL;
ALTER TABLE public.mail_channel ADD CONSTRAINT mail_channel_message_main_attachment_id_fkey FOREIGN KEY (message_main_attachment_id) REFERENCES ir_attachment(id) ON DELETE SET NULL;
ALTER TABLE public.mail_channel ADD CONSTRAINT mail_channel_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.mail_channel_mail_wizard_invite_rel foreign keys

ALTER TABLE public.mail_channel_mail_wizard_invite_rel ADD CONSTRAINT mail_channel_mail_wizard_invite_rel_mail_channel_id_fkey FOREIGN KEY (mail_channel_id) REFERENCES mail_channel(id) ON DELETE CASCADE;
ALTER TABLE public.mail_channel_mail_wizard_invite_rel ADD CONSTRAINT mail_channel_mail_wizard_invite_rel_mail_wizard_invite_id_fkey FOREIGN KEY (mail_wizard_invite_id) REFERENCES mail_wizard_invite(id) ON DELETE CASCADE;


-- public.mail_channel_moderator_rel foreign keys

ALTER TABLE public.mail_channel_moderator_rel ADD CONSTRAINT mail_channel_moderator_rel_mail_channel_id_fkey FOREIGN KEY (mail_channel_id) REFERENCES mail_channel(id) ON DELETE CASCADE;
ALTER TABLE public.mail_channel_moderator_rel ADD CONSTRAINT mail_channel_moderator_rel_res_users_id_fkey FOREIGN KEY (res_users_id) REFERENCES res_users(id) ON DELETE CASCADE;


-- public.mail_channel_partner foreign keys

ALTER TABLE public.mail_channel_partner ADD CONSTRAINT mail_channel_partner_channel_id_fkey FOREIGN KEY (channel_id) REFERENCES mail_channel(id) ON DELETE CASCADE;
ALTER TABLE public.mail_channel_partner ADD CONSTRAINT mail_channel_partner_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.mail_channel_partner ADD CONSTRAINT mail_channel_partner_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES res_partner(id) ON DELETE CASCADE;
ALTER TABLE public.mail_channel_partner ADD CONSTRAINT mail_channel_partner_seen_message_id_fkey FOREIGN KEY (seen_message_id) REFERENCES mail_message(id) ON DELETE SET NULL;
ALTER TABLE public.mail_channel_partner ADD CONSTRAINT mail_channel_partner_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.mail_channel_res_groups_rel foreign keys

ALTER TABLE public.mail_channel_res_groups_rel ADD CONSTRAINT mail_channel_res_groups_rel_mail_channel_id_fkey FOREIGN KEY (mail_channel_id) REFERENCES mail_channel(id) ON DELETE CASCADE;
ALTER TABLE public.mail_channel_res_groups_rel ADD CONSTRAINT mail_channel_res_groups_rel_res_groups_id_fkey FOREIGN KEY (res_groups_id) REFERENCES res_groups(id) ON DELETE CASCADE;


-- public.mail_compose_message foreign keys

ALTER TABLE public.mail_compose_message ADD CONSTRAINT mail_compose_message_author_id_fkey FOREIGN KEY (author_id) REFERENCES res_partner(id) ON DELETE SET NULL;
ALTER TABLE public.mail_compose_message ADD CONSTRAINT mail_compose_message_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.mail_compose_message ADD CONSTRAINT mail_compose_message_mail_activity_type_id_fkey FOREIGN KEY (mail_activity_type_id) REFERENCES mail_activity_type(id) ON DELETE SET NULL;
ALTER TABLE public.mail_compose_message ADD CONSTRAINT mail_compose_message_mail_server_id_fkey FOREIGN KEY (mail_server_id) REFERENCES ir_mail_server(id) ON DELETE SET NULL;
ALTER TABLE public.mail_compose_message ADD CONSTRAINT mail_compose_message_moderator_id_fkey FOREIGN KEY (moderator_id) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.mail_compose_message ADD CONSTRAINT mail_compose_message_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES mail_message(id) ON DELETE SET NULL;
ALTER TABLE public.mail_compose_message ADD CONSTRAINT mail_compose_message_subtype_id_fkey FOREIGN KEY (subtype_id) REFERENCES mail_message_subtype(id) ON DELETE SET NULL;
ALTER TABLE public.mail_compose_message ADD CONSTRAINT mail_compose_message_template_id_fkey FOREIGN KEY (template_id) REFERENCES mail_template(id) ON DELETE SET NULL;
ALTER TABLE public.mail_compose_message ADD CONSTRAINT mail_compose_message_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.mail_compose_message_ir_attachments_rel foreign keys

ALTER TABLE public.mail_compose_message_ir_attachments_rel ADD CONSTRAINT mail_compose_message_ir_attachments_rel_attachment_id_fkey FOREIGN KEY (attachment_id) REFERENCES ir_attachment(id) ON DELETE CASCADE;
ALTER TABLE public.mail_compose_message_ir_attachments_rel ADD CONSTRAINT mail_compose_message_ir_attachments_rel_wizard_id_fkey FOREIGN KEY (wizard_id) REFERENCES mail_compose_message(id) ON DELETE CASCADE;


-- public.mail_compose_message_res_partner_rel foreign keys

ALTER TABLE public.mail_compose_message_res_partner_rel ADD CONSTRAINT mail_compose_message_res_partner_rel_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES res_partner(id) ON DELETE CASCADE;
ALTER TABLE public.mail_compose_message_res_partner_rel ADD CONSTRAINT mail_compose_message_res_partner_rel_wizard_id_fkey FOREIGN KEY (wizard_id) REFERENCES mail_compose_message(id) ON DELETE CASCADE;


-- public.mail_followers foreign keys

ALTER TABLE public.mail_followers ADD CONSTRAINT mail_followers_channel_id_fkey FOREIGN KEY (channel_id) REFERENCES mail_channel(id) ON DELETE CASCADE;
ALTER TABLE public.mail_followers ADD CONSTRAINT mail_followers_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES res_partner(id) ON DELETE CASCADE;


-- public.mail_followers_mail_message_subtype_rel foreign keys

ALTER TABLE public.mail_followers_mail_message_subtype_rel ADD CONSTRAINT mail_followers_mail_message_subtyp_mail_message_subtype_id_fkey FOREIGN KEY (mail_message_subtype_id) REFERENCES mail_message_subtype(id) ON DELETE CASCADE;
ALTER TABLE public.mail_followers_mail_message_subtype_rel ADD CONSTRAINT mail_followers_mail_message_subtype_rel_mail_followers_id_fkey FOREIGN KEY (mail_followers_id) REFERENCES mail_followers(id) ON DELETE CASCADE;


-- public.mail_mail foreign keys

ALTER TABLE public.mail_mail ADD CONSTRAINT mail_mail_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.mail_mail ADD CONSTRAINT mail_mail_fetchmail_server_id_fkey FOREIGN KEY (fetchmail_server_id) REFERENCES fetchmail_server(id) ON DELETE SET NULL;
ALTER TABLE public.mail_mail ADD CONSTRAINT mail_mail_mail_message_id_fkey FOREIGN KEY (mail_message_id) REFERENCES mail_message(id) ON DELETE CASCADE;
ALTER TABLE public.mail_mail ADD CONSTRAINT mail_mail_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.mail_mail_res_partner_rel foreign keys

ALTER TABLE public.mail_mail_res_partner_rel ADD CONSTRAINT mail_mail_res_partner_rel_mail_mail_id_fkey FOREIGN KEY (mail_mail_id) REFERENCES mail_mail(id) ON DELETE CASCADE;
ALTER TABLE public.mail_mail_res_partner_rel ADD CONSTRAINT mail_mail_res_partner_rel_res_partner_id_fkey FOREIGN KEY (res_partner_id) REFERENCES res_partner(id) ON DELETE CASCADE;


-- public.mail_message foreign keys

ALTER TABLE public.mail_message ADD CONSTRAINT mail_message_author_id_fkey FOREIGN KEY (author_id) REFERENCES res_partner(id) ON DELETE SET NULL;
ALTER TABLE public.mail_message ADD CONSTRAINT mail_message_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.mail_message ADD CONSTRAINT mail_message_mail_activity_type_id_fkey FOREIGN KEY (mail_activity_type_id) REFERENCES mail_activity_type(id) ON DELETE SET NULL;
ALTER TABLE public.mail_message ADD CONSTRAINT mail_message_mail_server_id_fkey FOREIGN KEY (mail_server_id) REFERENCES ir_mail_server(id) ON DELETE SET NULL;
ALTER TABLE public.mail_message ADD CONSTRAINT mail_message_moderator_id_fkey FOREIGN KEY (moderator_id) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.mail_message ADD CONSTRAINT mail_message_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES mail_message(id) ON DELETE SET NULL;
ALTER TABLE public.mail_message ADD CONSTRAINT mail_message_subtype_id_fkey FOREIGN KEY (subtype_id) REFERENCES mail_message_subtype(id) ON DELETE SET NULL;
ALTER TABLE public.mail_message ADD CONSTRAINT mail_message_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.mail_message_mail_channel_rel foreign keys

ALTER TABLE public.mail_message_mail_channel_rel ADD CONSTRAINT mail_message_mail_channel_rel_mail_channel_id_fkey FOREIGN KEY (mail_channel_id) REFERENCES mail_channel(id) ON DELETE CASCADE;
ALTER TABLE public.mail_message_mail_channel_rel ADD CONSTRAINT mail_message_mail_channel_rel_mail_message_id_fkey FOREIGN KEY (mail_message_id) REFERENCES mail_message(id) ON DELETE CASCADE;


-- public.mail_message_res_partner_needaction_rel foreign keys

ALTER TABLE public.mail_message_res_partner_needaction_rel ADD CONSTRAINT mail_message_res_partner_needaction_rel_mail_id_fkey FOREIGN KEY (mail_id) REFERENCES mail_mail(id) ON DELETE SET NULL;
ALTER TABLE public.mail_message_res_partner_needaction_rel ADD CONSTRAINT mail_message_res_partner_needaction_rel_mail_message_id_fkey FOREIGN KEY (mail_message_id) REFERENCES mail_message(id) ON DELETE CASCADE;
ALTER TABLE public.mail_message_res_partner_needaction_rel ADD CONSTRAINT mail_message_res_partner_needaction_rel_res_partner_id_fkey FOREIGN KEY (res_partner_id) REFERENCES res_partner(id) ON DELETE CASCADE;


-- public.mail_message_res_partner_needaction_rel_mail_resend_message_rel foreign keys

ALTER TABLE public.mail_message_res_partner_needaction_rel_mail_resend_message_rel ADD CONSTRAINT mail_message_res_partner_need_mail_message_res_partner_nee_fkey FOREIGN KEY (mail_message_res_partner_needaction_rel_id) REFERENCES mail_message_res_partner_needaction_rel(id) ON DELETE CASCADE;
ALTER TABLE public.mail_message_res_partner_needaction_rel_mail_resend_message_rel ADD CONSTRAINT mail_message_res_partner_needaction_mail_resend_message_id_fkey FOREIGN KEY (mail_resend_message_id) REFERENCES mail_resend_message(id) ON DELETE CASCADE;


-- public.mail_message_res_partner_rel foreign keys

ALTER TABLE public.mail_message_res_partner_rel ADD CONSTRAINT mail_message_res_partner_rel_mail_message_id_fkey FOREIGN KEY (mail_message_id) REFERENCES mail_message(id) ON DELETE CASCADE;
ALTER TABLE public.mail_message_res_partner_rel ADD CONSTRAINT mail_message_res_partner_rel_res_partner_id_fkey FOREIGN KEY (res_partner_id) REFERENCES res_partner(id) ON DELETE CASCADE;


-- public.mail_message_res_partner_starred_rel foreign keys

ALTER TABLE public.mail_message_res_partner_starred_rel ADD CONSTRAINT mail_message_res_partner_starred_rel_mail_message_id_fkey FOREIGN KEY (mail_message_id) REFERENCES mail_message(id) ON DELETE CASCADE;
ALTER TABLE public.mail_message_res_partner_starred_rel ADD CONSTRAINT mail_message_res_partner_starred_rel_res_partner_id_fkey FOREIGN KEY (res_partner_id) REFERENCES res_partner(id) ON DELETE CASCADE;


-- public.mail_message_subtype foreign keys

ALTER TABLE public.mail_message_subtype ADD CONSTRAINT mail_message_subtype_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.mail_message_subtype ADD CONSTRAINT mail_message_subtype_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES mail_message_subtype(id) ON DELETE SET NULL;
ALTER TABLE public.mail_message_subtype ADD CONSTRAINT mail_message_subtype_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.mail_moderation foreign keys

ALTER TABLE public.mail_moderation ADD CONSTRAINT mail_moderation_channel_id_fkey FOREIGN KEY (channel_id) REFERENCES mail_channel(id) ON DELETE SET NULL;
ALTER TABLE public.mail_moderation ADD CONSTRAINT mail_moderation_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.mail_moderation ADD CONSTRAINT mail_moderation_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.mail_resend_cancel foreign keys

ALTER TABLE public.mail_resend_cancel ADD CONSTRAINT mail_resend_cancel_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.mail_resend_cancel ADD CONSTRAINT mail_resend_cancel_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.mail_resend_message foreign keys

ALTER TABLE public.mail_resend_message ADD CONSTRAINT mail_resend_message_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.mail_resend_message ADD CONSTRAINT mail_resend_message_mail_message_id_fkey FOREIGN KEY (mail_message_id) REFERENCES mail_message(id) ON DELETE SET NULL;
ALTER TABLE public.mail_resend_message ADD CONSTRAINT mail_resend_message_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.mail_resend_partner foreign keys

ALTER TABLE public.mail_resend_partner ADD CONSTRAINT mail_resend_partner_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.mail_resend_partner ADD CONSTRAINT mail_resend_partner_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES res_partner(id) ON DELETE CASCADE;
ALTER TABLE public.mail_resend_partner ADD CONSTRAINT mail_resend_partner_resend_wizard_id_fkey FOREIGN KEY (resend_wizard_id) REFERENCES mail_resend_message(id) ON DELETE SET NULL;
ALTER TABLE public.mail_resend_partner ADD CONSTRAINT mail_resend_partner_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.mail_shortcode foreign keys

ALTER TABLE public.mail_shortcode ADD CONSTRAINT mail_shortcode_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.mail_shortcode ADD CONSTRAINT mail_shortcode_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.mail_template foreign keys

ALTER TABLE public.mail_template ADD CONSTRAINT mail_template_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.mail_template ADD CONSTRAINT mail_template_mail_server_id_fkey FOREIGN KEY (mail_server_id) REFERENCES ir_mail_server(id) ON DELETE SET NULL;
ALTER TABLE public.mail_template ADD CONSTRAINT mail_template_model_id_fkey FOREIGN KEY (model_id) REFERENCES ir_model(id) ON DELETE SET NULL;
ALTER TABLE public.mail_template ADD CONSTRAINT mail_template_model_object_field_fkey FOREIGN KEY (model_object_field) REFERENCES ir_model_fields(id) ON DELETE SET NULL;
ALTER TABLE public.mail_template ADD CONSTRAINT mail_template_ref_ir_act_window_fkey FOREIGN KEY (ref_ir_act_window) REFERENCES ir_act_window(id) ON DELETE SET NULL;
ALTER TABLE public.mail_template ADD CONSTRAINT mail_template_report_template_fkey FOREIGN KEY (report_template) REFERENCES ir_act_report_xml(id) ON DELETE SET NULL;
ALTER TABLE public.mail_template ADD CONSTRAINT mail_template_sub_model_object_field_fkey FOREIGN KEY (sub_model_object_field) REFERENCES ir_model_fields(id) ON DELETE SET NULL;
ALTER TABLE public.mail_template ADD CONSTRAINT mail_template_sub_object_fkey FOREIGN KEY (sub_object) REFERENCES ir_model(id) ON DELETE SET NULL;
ALTER TABLE public.mail_template ADD CONSTRAINT mail_template_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.mail_tracking_value foreign keys

ALTER TABLE public.mail_tracking_value ADD CONSTRAINT mail_tracking_value_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.mail_tracking_value ADD CONSTRAINT mail_tracking_value_mail_message_id_fkey FOREIGN KEY (mail_message_id) REFERENCES mail_message(id) ON DELETE CASCADE;
ALTER TABLE public.mail_tracking_value ADD CONSTRAINT mail_tracking_value_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.mail_wizard_invite foreign keys

ALTER TABLE public.mail_wizard_invite ADD CONSTRAINT mail_wizard_invite_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.mail_wizard_invite ADD CONSTRAINT mail_wizard_invite_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.mail_wizard_invite_res_partner_rel foreign keys

ALTER TABLE public.mail_wizard_invite_res_partner_rel ADD CONSTRAINT mail_wizard_invite_res_partner_rel_mail_wizard_invite_id_fkey FOREIGN KEY (mail_wizard_invite_id) REFERENCES mail_wizard_invite(id) ON DELETE CASCADE;
ALTER TABLE public.mail_wizard_invite_res_partner_rel ADD CONSTRAINT mail_wizard_invite_res_partner_rel_res_partner_id_fkey FOREIGN KEY (res_partner_id) REFERENCES res_partner(id) ON DELETE CASCADE;


-- public.message_attachment_rel foreign keys

ALTER TABLE public.message_attachment_rel ADD CONSTRAINT message_attachment_rel_attachment_id_fkey FOREIGN KEY (attachment_id) REFERENCES ir_attachment(id) ON DELETE CASCADE;
ALTER TABLE public.message_attachment_rel ADD CONSTRAINT message_attachment_rel_message_id_fkey FOREIGN KEY (message_id) REFERENCES mail_message(id) ON DELETE CASCADE;


-- public.rel_modules_langexport foreign keys

ALTER TABLE public.rel_modules_langexport ADD CONSTRAINT rel_modules_langexport_module_id_fkey FOREIGN KEY (module_id) REFERENCES ir_module_module(id) ON DELETE CASCADE;
ALTER TABLE public.rel_modules_langexport ADD CONSTRAINT rel_modules_langexport_wiz_id_fkey FOREIGN KEY (wiz_id) REFERENCES base_language_export(id) ON DELETE CASCADE;


-- public.rel_server_actions foreign keys

ALTER TABLE public.rel_server_actions ADD CONSTRAINT rel_server_actions_action_id_fkey FOREIGN KEY (action_id) REFERENCES ir_act_server(id) ON DELETE CASCADE;
ALTER TABLE public.rel_server_actions ADD CONSTRAINT rel_server_actions_server_id_fkey FOREIGN KEY (server_id) REFERENCES ir_act_server(id) ON DELETE CASCADE;


-- public.report_layout foreign keys

ALTER TABLE public.report_layout ADD CONSTRAINT report_layout_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.report_layout ADD CONSTRAINT report_layout_view_id_fkey FOREIGN KEY (view_id) REFERENCES ir_ui_view(id) ON DELETE SET NULL;
ALTER TABLE public.report_layout ADD CONSTRAINT report_layout_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.report_paperformat foreign keys

ALTER TABLE public.report_paperformat ADD CONSTRAINT report_paperformat_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.report_paperformat ADD CONSTRAINT report_paperformat_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.res_bank foreign keys

ALTER TABLE public.res_bank ADD CONSTRAINT res_bank_country_fkey FOREIGN KEY (country) REFERENCES res_country(id) ON DELETE SET NULL;
ALTER TABLE public.res_bank ADD CONSTRAINT res_bank_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.res_bank ADD CONSTRAINT res_bank_state_fkey FOREIGN KEY (state) REFERENCES res_country_state(id) ON DELETE SET NULL;
ALTER TABLE public.res_bank ADD CONSTRAINT res_bank_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.res_company foreign keys

ALTER TABLE public.res_company ADD CONSTRAINT res_company_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.res_company ADD CONSTRAINT res_company_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES res_currency(id) ON DELETE SET NULL;
ALTER TABLE public.res_company ADD CONSTRAINT res_company_external_report_layout_id_fkey FOREIGN KEY (external_report_layout_id) REFERENCES ir_ui_view(id) ON DELETE SET NULL;
ALTER TABLE public.res_company ADD CONSTRAINT res_company_paperformat_id_fkey FOREIGN KEY (paperformat_id) REFERENCES report_paperformat(id) ON DELETE SET NULL;
ALTER TABLE public.res_company ADD CONSTRAINT res_company_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES res_company(id) ON DELETE SET NULL;
ALTER TABLE public.res_company ADD CONSTRAINT res_company_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES res_partner(id) ON DELETE SET NULL;
ALTER TABLE public.res_company ADD CONSTRAINT res_company_resource_calendar_id_fkey FOREIGN KEY (resource_calendar_id) REFERENCES resource_calendar(id) ON DELETE RESTRICT;
ALTER TABLE public.res_company ADD CONSTRAINT res_company_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.res_company_users_rel foreign keys

ALTER TABLE public.res_company_users_rel ADD CONSTRAINT res_company_users_rel_cid_fkey FOREIGN KEY (cid) REFERENCES res_company(id) ON DELETE CASCADE;
ALTER TABLE public.res_company_users_rel ADD CONSTRAINT res_company_users_rel_user_id_fkey FOREIGN KEY (user_id) REFERENCES res_users(id) ON DELETE CASCADE;


-- public.res_config foreign keys

ALTER TABLE public.res_config ADD CONSTRAINT res_config_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.res_config ADD CONSTRAINT res_config_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.res_config_installer foreign keys

ALTER TABLE public.res_config_installer ADD CONSTRAINT res_config_installer_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.res_config_installer ADD CONSTRAINT res_config_installer_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.res_config_settings foreign keys

ALTER TABLE public.res_config_settings ADD CONSTRAINT res_config_settings_auth_signup_template_user_id_fkey FOREIGN KEY (auth_signup_template_user_id) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.res_config_settings ADD CONSTRAINT res_config_settings_company_id_fkey FOREIGN KEY (company_id) REFERENCES res_company(id) ON DELETE SET NULL;
ALTER TABLE public.res_config_settings ADD CONSTRAINT res_config_settings_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.res_config_settings ADD CONSTRAINT res_config_settings_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.res_country foreign keys

ALTER TABLE public.res_country ADD CONSTRAINT res_country_address_view_id_fkey FOREIGN KEY (address_view_id) REFERENCES ir_ui_view(id) ON DELETE SET NULL;
ALTER TABLE public.res_country ADD CONSTRAINT res_country_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.res_country ADD CONSTRAINT res_country_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES res_currency(id) ON DELETE SET NULL;
ALTER TABLE public.res_country ADD CONSTRAINT res_country_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.res_country_group foreign keys

ALTER TABLE public.res_country_group ADD CONSTRAINT res_country_group_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.res_country_group ADD CONSTRAINT res_country_group_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.res_country_res_country_group_rel foreign keys

ALTER TABLE public.res_country_res_country_group_rel ADD CONSTRAINT res_country_res_country_group_rel_res_country_group_id_fkey FOREIGN KEY (res_country_group_id) REFERENCES res_country_group(id) ON DELETE CASCADE;
ALTER TABLE public.res_country_res_country_group_rel ADD CONSTRAINT res_country_res_country_group_rel_res_country_id_fkey FOREIGN KEY (res_country_id) REFERENCES res_country(id) ON DELETE CASCADE;


-- public.res_country_state foreign keys

ALTER TABLE public.res_country_state ADD CONSTRAINT res_country_state_country_id_fkey FOREIGN KEY (country_id) REFERENCES res_country(id) ON DELETE SET NULL;
ALTER TABLE public.res_country_state ADD CONSTRAINT res_country_state_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.res_country_state ADD CONSTRAINT res_country_state_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.res_currency foreign keys

ALTER TABLE public.res_currency ADD CONSTRAINT res_currency_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.res_currency ADD CONSTRAINT res_currency_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.res_currency_rate foreign keys

ALTER TABLE public.res_currency_rate ADD CONSTRAINT res_currency_rate_company_id_fkey FOREIGN KEY (company_id) REFERENCES res_company(id) ON DELETE SET NULL;
ALTER TABLE public.res_currency_rate ADD CONSTRAINT res_currency_rate_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.res_currency_rate ADD CONSTRAINT res_currency_rate_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES res_currency(id) ON DELETE SET NULL;
ALTER TABLE public.res_currency_rate ADD CONSTRAINT res_currency_rate_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.res_groups foreign keys

ALTER TABLE public.res_groups ADD CONSTRAINT res_groups_category_id_fkey FOREIGN KEY (category_id) REFERENCES ir_module_category(id) ON DELETE SET NULL;
ALTER TABLE public.res_groups ADD CONSTRAINT res_groups_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.res_groups ADD CONSTRAINT res_groups_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.res_groups_implied_rel foreign keys

ALTER TABLE public.res_groups_implied_rel ADD CONSTRAINT res_groups_implied_rel_gid_fkey FOREIGN KEY (gid) REFERENCES res_groups(id) ON DELETE CASCADE;
ALTER TABLE public.res_groups_implied_rel ADD CONSTRAINT res_groups_implied_rel_hid_fkey FOREIGN KEY (hid) REFERENCES res_groups(id) ON DELETE CASCADE;


-- public.res_groups_report_rel foreign keys

ALTER TABLE public.res_groups_report_rel ADD CONSTRAINT res_groups_report_rel_gid_fkey FOREIGN KEY (gid) REFERENCES res_groups(id) ON DELETE CASCADE;
ALTER TABLE public.res_groups_report_rel ADD CONSTRAINT res_groups_report_rel_uid_fkey FOREIGN KEY (uid) REFERENCES ir_act_report_xml(id) ON DELETE CASCADE;


-- public.res_groups_users_rel foreign keys

ALTER TABLE public.res_groups_users_rel ADD CONSTRAINT res_groups_users_rel_gid_fkey FOREIGN KEY (gid) REFERENCES res_groups(id) ON DELETE CASCADE;
ALTER TABLE public.res_groups_users_rel ADD CONSTRAINT res_groups_users_rel_uid_fkey FOREIGN KEY (uid) REFERENCES res_users(id) ON DELETE CASCADE;


-- public.res_lang foreign keys

ALTER TABLE public.res_lang ADD CONSTRAINT res_lang_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.res_lang ADD CONSTRAINT res_lang_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.res_partner foreign keys

ALTER TABLE public.res_partner ADD CONSTRAINT res_partner_commercial_partner_id_fkey FOREIGN KEY (commercial_partner_id) REFERENCES res_partner(id) ON DELETE SET NULL;
ALTER TABLE public.res_partner ADD CONSTRAINT res_partner_company_id_fkey FOREIGN KEY (company_id) REFERENCES res_company(id) ON DELETE SET NULL;
ALTER TABLE public.res_partner ADD CONSTRAINT res_partner_country_id_fkey FOREIGN KEY (country_id) REFERENCES res_country(id) ON DELETE RESTRICT;
ALTER TABLE public.res_partner ADD CONSTRAINT res_partner_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.res_partner ADD CONSTRAINT res_partner_industry_id_fkey FOREIGN KEY (industry_id) REFERENCES res_partner_industry(id) ON DELETE SET NULL;
ALTER TABLE public.res_partner ADD CONSTRAINT res_partner_message_main_attachment_id_fkey FOREIGN KEY (message_main_attachment_id) REFERENCES ir_attachment(id) ON DELETE SET NULL;
ALTER TABLE public.res_partner ADD CONSTRAINT res_partner_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES res_partner(id) ON DELETE SET NULL;
ALTER TABLE public.res_partner ADD CONSTRAINT res_partner_state_id_fkey FOREIGN KEY (state_id) REFERENCES res_country_state(id) ON DELETE RESTRICT;
ALTER TABLE public.res_partner ADD CONSTRAINT res_partner_title_fkey FOREIGN KEY (title) REFERENCES res_partner_title(id) ON DELETE SET NULL;
ALTER TABLE public.res_partner ADD CONSTRAINT res_partner_user_id_fkey FOREIGN KEY (user_id) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.res_partner ADD CONSTRAINT res_partner_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.res_partner_autocomplete_sync foreign keys

ALTER TABLE public.res_partner_autocomplete_sync ADD CONSTRAINT res_partner_autocomplete_sync_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.res_partner_autocomplete_sync ADD CONSTRAINT res_partner_autocomplete_sync_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES res_partner(id) ON DELETE CASCADE;
ALTER TABLE public.res_partner_autocomplete_sync ADD CONSTRAINT res_partner_autocomplete_sync_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.res_partner_bank foreign keys

ALTER TABLE public.res_partner_bank ADD CONSTRAINT res_partner_bank_bank_id_fkey FOREIGN KEY (bank_id) REFERENCES res_bank(id) ON DELETE SET NULL;
ALTER TABLE public.res_partner_bank ADD CONSTRAINT res_partner_bank_company_id_fkey FOREIGN KEY (company_id) REFERENCES res_company(id) ON DELETE CASCADE;
ALTER TABLE public.res_partner_bank ADD CONSTRAINT res_partner_bank_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.res_partner_bank ADD CONSTRAINT res_partner_bank_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES res_currency(id) ON DELETE SET NULL;
ALTER TABLE public.res_partner_bank ADD CONSTRAINT res_partner_bank_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES res_partner(id) ON DELETE CASCADE;
ALTER TABLE public.res_partner_bank ADD CONSTRAINT res_partner_bank_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.res_partner_category foreign keys

ALTER TABLE public.res_partner_category ADD CONSTRAINT res_partner_category_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.res_partner_category ADD CONSTRAINT res_partner_category_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES res_partner_category(id) ON DELETE CASCADE;
ALTER TABLE public.res_partner_category ADD CONSTRAINT res_partner_category_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.res_partner_industry foreign keys

ALTER TABLE public.res_partner_industry ADD CONSTRAINT res_partner_industry_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.res_partner_industry ADD CONSTRAINT res_partner_industry_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.res_partner_res_partner_category_rel foreign keys

ALTER TABLE public.res_partner_res_partner_category_rel ADD CONSTRAINT res_partner_res_partner_category_rel_category_id_fkey FOREIGN KEY (category_id) REFERENCES res_partner_category(id) ON DELETE CASCADE;
ALTER TABLE public.res_partner_res_partner_category_rel ADD CONSTRAINT res_partner_res_partner_category_rel_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES res_partner(id) ON DELETE CASCADE;


-- public.res_partner_title foreign keys

ALTER TABLE public.res_partner_title ADD CONSTRAINT res_partner_title_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.res_partner_title ADD CONSTRAINT res_partner_title_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.res_users foreign keys

ALTER TABLE public.res_users ADD CONSTRAINT res_users_alias_id_fkey FOREIGN KEY (alias_id) REFERENCES mail_alias(id) ON DELETE SET NULL;
ALTER TABLE public.res_users ADD CONSTRAINT res_users_company_id_fkey FOREIGN KEY (company_id) REFERENCES res_company(id) ON DELETE SET NULL;
ALTER TABLE public.res_users ADD CONSTRAINT res_users_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.res_users ADD CONSTRAINT res_users_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES res_partner(id) ON DELETE RESTRICT;
ALTER TABLE public.res_users ADD CONSTRAINT res_users_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.res_users_log foreign keys

ALTER TABLE public.res_users_log ADD CONSTRAINT res_users_log_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.res_users_log ADD CONSTRAINT res_users_log_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.resource_calendar foreign keys

ALTER TABLE public.resource_calendar ADD CONSTRAINT resource_calendar_company_id_fkey FOREIGN KEY (company_id) REFERENCES res_company(id) ON DELETE SET NULL;
ALTER TABLE public.resource_calendar ADD CONSTRAINT resource_calendar_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.resource_calendar ADD CONSTRAINT resource_calendar_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.resource_calendar_attendance foreign keys

ALTER TABLE public.resource_calendar_attendance ADD CONSTRAINT resource_calendar_attendance_calendar_id_fkey FOREIGN KEY (calendar_id) REFERENCES resource_calendar(id) ON DELETE CASCADE;
ALTER TABLE public.resource_calendar_attendance ADD CONSTRAINT resource_calendar_attendance_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.resource_calendar_attendance ADD CONSTRAINT resource_calendar_attendance_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.resource_calendar_leaves foreign keys

ALTER TABLE public.resource_calendar_leaves ADD CONSTRAINT resource_calendar_leaves_calendar_id_fkey FOREIGN KEY (calendar_id) REFERENCES resource_calendar(id) ON DELETE SET NULL;
ALTER TABLE public.resource_calendar_leaves ADD CONSTRAINT resource_calendar_leaves_company_id_fkey FOREIGN KEY (company_id) REFERENCES res_company(id) ON DELETE SET NULL;
ALTER TABLE public.resource_calendar_leaves ADD CONSTRAINT resource_calendar_leaves_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.resource_calendar_leaves ADD CONSTRAINT resource_calendar_leaves_resource_id_fkey FOREIGN KEY (resource_id) REFERENCES resource_resource(id) ON DELETE SET NULL;
ALTER TABLE public.resource_calendar_leaves ADD CONSTRAINT resource_calendar_leaves_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.resource_resource foreign keys

ALTER TABLE public.resource_resource ADD CONSTRAINT resource_resource_calendar_id_fkey FOREIGN KEY (calendar_id) REFERENCES resource_calendar(id) ON DELETE SET NULL;
ALTER TABLE public.resource_resource ADD CONSTRAINT resource_resource_company_id_fkey FOREIGN KEY (company_id) REFERENCES res_company(id) ON DELETE SET NULL;
ALTER TABLE public.resource_resource ADD CONSTRAINT resource_resource_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.resource_resource ADD CONSTRAINT resource_resource_user_id_fkey FOREIGN KEY (user_id) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.resource_resource ADD CONSTRAINT resource_resource_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.resource_test foreign keys

ALTER TABLE public.resource_test ADD CONSTRAINT resource_test_company_id_fkey FOREIGN KEY (company_id) REFERENCES res_company(id) ON DELETE SET NULL;
ALTER TABLE public.resource_test ADD CONSTRAINT resource_test_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.resource_test ADD CONSTRAINT resource_test_resource_calendar_id_fkey FOREIGN KEY (resource_calendar_id) REFERENCES resource_calendar(id) ON DELETE SET NULL;
ALTER TABLE public.resource_test ADD CONSTRAINT resource_test_resource_id_fkey FOREIGN KEY (resource_id) REFERENCES resource_resource(id) ON DELETE RESTRICT;
ALTER TABLE public.resource_test ADD CONSTRAINT resource_test_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.rule_group_rel foreign keys

ALTER TABLE public.rule_group_rel ADD CONSTRAINT rule_group_rel_group_id_fkey FOREIGN KEY (group_id) REFERENCES res_groups(id) ON DELETE CASCADE;
ALTER TABLE public.rule_group_rel ADD CONSTRAINT rule_group_rel_rule_group_id_fkey FOREIGN KEY (rule_group_id) REFERENCES ir_rule(id) ON DELETE CASCADE;


-- public.sms_send_sms foreign keys

ALTER TABLE public.sms_send_sms ADD CONSTRAINT sms_send_sms_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.sms_send_sms ADD CONSTRAINT sms_send_sms_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.snailmail_letter foreign keys

ALTER TABLE public.snailmail_letter ADD CONSTRAINT snailmail_letter_attachment_id_fkey FOREIGN KEY (attachment_id) REFERENCES ir_attachment(id) ON DELETE CASCADE;
ALTER TABLE public.snailmail_letter ADD CONSTRAINT snailmail_letter_company_id_fkey FOREIGN KEY (company_id) REFERENCES res_company(id) ON DELETE SET NULL;
ALTER TABLE public.snailmail_letter ADD CONSTRAINT snailmail_letter_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.snailmail_letter ADD CONSTRAINT snailmail_letter_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES res_partner(id) ON DELETE SET NULL;
ALTER TABLE public.snailmail_letter ADD CONSTRAINT snailmail_letter_report_template_fkey FOREIGN KEY (report_template) REFERENCES ir_act_report_xml(id) ON DELETE SET NULL;
ALTER TABLE public.snailmail_letter ADD CONSTRAINT snailmail_letter_user_id_fkey FOREIGN KEY (user_id) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.snailmail_letter ADD CONSTRAINT snailmail_letter_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.web_editor_converter_test foreign keys

ALTER TABLE public.web_editor_converter_test ADD CONSTRAINT web_editor_converter_test_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.web_editor_converter_test ADD CONSTRAINT web_editor_converter_test_many2one_fkey FOREIGN KEY (many2one) REFERENCES web_editor_converter_test_sub(id) ON DELETE SET NULL;
ALTER TABLE public.web_editor_converter_test ADD CONSTRAINT web_editor_converter_test_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.web_editor_converter_test_sub foreign keys

ALTER TABLE public.web_editor_converter_test_sub ADD CONSTRAINT web_editor_converter_test_sub_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.web_editor_converter_test_sub ADD CONSTRAINT web_editor_converter_test_sub_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.web_tour_tour foreign keys

ALTER TABLE public.web_tour_tour ADD CONSTRAINT web_tour_tour_user_id_fkey FOREIGN KEY (user_id) REFERENCES res_users(id) ON DELETE SET NULL;


-- public.wizard_ir_model_menu_create foreign keys

ALTER TABLE public.wizard_ir_model_menu_create ADD CONSTRAINT wizard_ir_model_menu_create_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES res_users(id) ON DELETE SET NULL;
ALTER TABLE public.wizard_ir_model_menu_create ADD CONSTRAINT wizard_ir_model_menu_create_menu_id_fkey FOREIGN KEY (menu_id) REFERENCES ir_ui_menu(id) ON DELETE CASCADE;
ALTER TABLE public.wizard_ir_model_menu_create ADD CONSTRAINT wizard_ir_model_menu_create_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES res_users(id) ON DELETE SET NULL;
