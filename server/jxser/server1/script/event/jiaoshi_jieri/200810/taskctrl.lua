Include("\\script\\event\\jiaoshi_jieri\\200810\\timectrl.lua")
--1897	教师节活动占用
--1898	教师节活动占用
--1899	教师节活动占用
--1900	教师节活动占用
--1901	教师节活动占用
--1902	教师节活动占用

jiaoshi0810_TSK_Version = 1897
jiaoshi0810_TSK_ExpLimit = 1898


jiaoshi0810_MaxExpLimit = 8e8

function jiaoshi0810_ResetTask()
	if jiaoshi0810_IsActTime() == 1 then
		if GetTask(jiaoshi0810_TSK_Version) ~= jiaoshi0810_StartTime then
			SetTask(jiaoshi0810_TSK_Version, jiaoshi0810_StartTime)
			SetTask(jiaoshi0810_TSK_ExpLimit, 0)

		end
	end
end