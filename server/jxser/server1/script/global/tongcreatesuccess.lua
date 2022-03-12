--帮会创建成功后调用的脚本(80级专用马)
--By Dan_Deng(2003-11-18)

function OnCreateTong()
	if (GetTask(97) < 1) then		-- 只有以前没买过马才行
		SetTask(97,1)
	end
end
