#sql("findByUserNameAndStatusUsed")
  SELECT
    DISTINCT	a.*
  FROM
    sys_res a,
    sys_role b,
    sys_role_res c,
    sys_user d,
    sys_user_role e
  WHERE
    a.id = c.res_id
    AND b.id = c.role_id
    AND d.id = e.user_id
    and e.role_id = b.id
    AND a.`status` = ?
    AND b.`status` = ?
    and d.`username` = ?
#end

#sql("findTopMenuByUserName")
SELECT
  a.*
FROM
  sys_res a,
  sys_role b,
  sys_role_res c,
  sys_user d,
  sys_user_role e
WHERE
  a.id = c.res_id
  AND b.id = c.role_id
  AND d.id = e.user_id
  and e.role_id = b.id
  AND a.`status` = ?
  AND b.`status` = ?
  and a.pid = ?
  and d.`username` = ?
ORDER BY a.pid asc, a.seq asc
#end

#sql("findLeftMenuByUserNameAndPid")
SELECT
  a.*
FROM
  sys_res a,
  sys_role b,
  sys_role_res c,
  sys_user d,
  sys_user_role e
WHERE
  a.id = c.res_id
  AND b.id = c.role_id
  AND d.id = e.user_id
  and e.role_id = b.id
  AND a.`status` = ?
  AND b.`status` = ?
  AND FIND_IN_SET(a.id, querySysRes(?))
  AND d.`username` = ?
ORDER BY a.pid asc, a.seq asc
#end

#sql("findByRoleIdAndStatusUsed")
SELECT
  res.*
FROM
  sys_res res,
  sys_role_res role_res,
  sys_role role
WHERE
  role_res.res_id = res.id
  AND role.id = role_res.role_id
  AND res. STATUS = ?
  AND role. STATUS = ?
  AND ROLE.id = ?
  AND res.url IS NOT NULL
ORDER BY res.pid asc, res.seq asc
#end

#sql("findMenuByUserId")
SELECT
	a.*
FROM
	sys_res a,
	sys_user_res b
WHERE
	b.res_id=a.id
	AND b.user_id=?
	AND a.status=1
ORDER BY a.pid asc,a.seq asc
#end

#sql("findMenuByUserName")
SELECT
	a.*
FROM
	sys_res a,
	sys_user_res b,
  sys_user u
WHERE
	b.res_id=a.id
	AND u.id=b.user_id
	AND u.username=?
	AND a.status=1
ORDER BY a.pid asc,a.seq asc
#end
