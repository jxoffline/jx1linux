--中秋节任务变量的管理

Include("\\script\\event\\zhongqiu_jieri\\200808\\timectrl.lua")
Include("\\script\\lib\\pay.lua")

zhongqiu0808_TSK_Version = 1921
zhongqiu0808_TSK_Wangyue = 1922
zhongqiu0808_TSK_jiansanyue = 1923
zhongqiu0808_TSK_mingyuejiu = 1924
zhongqiu0808_TSK_TaskState = 1925
zhongqiu0808_TSK_ZhangGongExp = 1926

zhongqiu0808_TSKV_Wangyue = 200000000
zhongqiu0808_TSKV_jiansanyue = 1500
zhongqiu0808_TSKV_ZhangGongMaxExp = 400000000
function zhongqiu0808_PlayerLimit()
	
	if GetLevel() < 50 or IsCharged() ~= 1 then
		return nil
	end
	return 1
end




function zhongqiu0808_ResetTask()
	if zhongqiu0808_IsActDate() == 1 then
		if GetTask(zhongqiu0808_TSK_Version) ~= zhongqiu0808_StartTime then
			SetTask(zhongqiu0808_TSK_Version, zhongqiu0808_StartTime)
			SetTask(zhongqiu0808_TSK_Wangyue, 0)
			SetTask(zhongqiu0808_TSK_jiansanyue, 0)
			SetTask(zhongqiu0808_TSK_mingyuejiu, 0)
			SetTask(zhongqiu0808_TSK_TaskState, 0)
			SetTask(zhongqiu0808_TSK_ZhangGongExp, 0)
		end
	end
	
end