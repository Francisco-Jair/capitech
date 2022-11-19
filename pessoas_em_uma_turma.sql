SELECT mdl_user.id as user_id, mdl_user.username, mdl_user.firstname, mdl_user.lastname, 
mdl_role.name as role_name, mdl_role.shortname as role_shortname
FROM mdl_user
JOIN mdl_role_assignments ON mdl_role_assignments.userid = mdl_user.id
JOIN mdl_role ON mdl_role.id = mdl_role_assignments.roleid
GROUP BY mdl_user.id