Include("\\script\\global\\login_head.lua")

function offlive_login()
	SetTask(2534,0)
end

--加上一个if判断，可以避免加载脚本时的报错（其实，即使报错也不会发生错误）
if login_add then login_add(offlive_login, 0) end
