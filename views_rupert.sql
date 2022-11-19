DROP VIEW IF EXISTS alunos;
create view alunos AS
SELECT DISTINCT /*mdl_role.id, mdl_role_assignments.id, */

mdl_user.id, mdl_user.username, mdl_user.phone1, mdl_user.phone2, mdl_user.institution, mdl_user.password, mdl_user.firstname, mdl_user.lastname, concat(mdl_user.firstname, ' ',mdl_user.lastname) as nome, mdl_user.email,
DATE_FORMAT(FROM_UNIXTIME(mdl_user.timecreated),'%Y-%m-%d') AS created_at, 
DATE_FORMAT(FROM_UNIXTIME(mdl_user.timemodified),'%Y-%m-%d') AS updated_at,
mdl_role.name, mdl_role.archetype, mdl_role.id as role_id

FROM mdl_user

INNER JOIN mdl_role_assignments
	ON mdl_role_assignments.userid = mdl_user.id

INNER JOIN mdl_role
	ON mdl_role.id = mdl_role_assignments.roleid
	AND mdl_role.archetype = 'student'
	WHERE mdl_user.deleted = 0;




DROP VIEW IF EXISTS matriculas;
create view matriculas AS

SELECT DISTINCT mdl_user.id AS user_id, mdl_user.firstname, mdl_user.lastname, mdl_user.username, concat(mdl_user.firstname, ' ',mdl_user.lastname) as nome, mdl_user.email, mdl_user.phone1, mdl_user.phone2, mdl_user.institution,
DATE_FORMAT(FROM_UNIXTIME(mdl_user.timecreated),'%Y-%m-%d') AS created_at,
DATE_FORMAT(FROM_UNIXTIME(mdl_user.timemodified),'%Y-%m-%d') AS updated_at,

mdl_course.id AS course_id, mdl_course.fullname as course,
mdl_role.shortname as role, mdl_role.name as role_name, mdl_role.id as role_id, mdl_role.archetype

FROM mdl_user
JOIN mdl_user_enrolments ON mdl_user_enrolments.userid = mdl_user.id
JOIN mdl_enrol ON mdl_enrol.id = mdl_user_enrolments.enrolid
JOIN mdl_role_assignments ON mdl_role_assignments.userid = mdl_user.id
JOIN mdl_context ON mdl_context.id = mdl_role_assignments.contextid AND mdl_context.contextlevel = 50
JOIN mdl_course ON mdl_course.id = mdl_context.instanceid AND mdl_enrol.courseid = mdl_course.id
JOIN mdl_role ON mdl_role.id = mdl_role_assignments.roleid

#AND mdl_role.shortname = 'student'
#AND mdl_role.shortname like 'turma%caxias2016'

WHERE mdl_enrol.status = 0
AND mdl_user.suspended = 0
AND mdl_user.deleted = 0
AND (
	mdl_user_enrolments.timeend = 0 OR mdl_user_enrolments.timeend > NOW()
	)
AND mdl_user_enrolments.status = 0
order by mdl_course.id, mdl_user.id;







DROP VIEW IF EXISTS professores;
create view professores AS
SELECT DISTINCT /*mdl_role.id, mdl_role_assignments.id, */

mdl_user.id, mdl_user.username, mdl_user.phone1, mdl_user.phone2, mdl_user.password, mdl_user.firstname, mdl_user.lastname, concat(mdl_user.firstname, ' ',mdl_user.lastname) as nome, mdl_user.email,
DATE_FORMAT(FROM_UNIXTIME(mdl_user.timecreated),'%Y-%m-%d') AS created_at,
DATE_FORMAT(FROM_UNIXTIME(mdl_user.timemodified),'%Y-%m-%d') AS updated_at,
mdl_role.name, mdl_role.archetype

FROM mdl_user

INNER JOIN mdl_role_assignments
	ON mdl_role_assignments.userid = mdl_user.id

INNER JOIN mdl_role
	ON mdl_role.id = mdl_role_assignments.roleid
	AND mdl_role.archetype != 'student';