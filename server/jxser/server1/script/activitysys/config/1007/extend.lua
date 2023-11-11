------------------------------------------------------------------------------------------------
--Author: NgaVN
--Des: Event Phô N÷ ViÖt Nam
--Date: 2012-10-10
------------------------------------------------------------------------------------------------
Include("\\script\\activitysys\\config\\1007\\head.lua")
Include("\\script\\activitysys\\config\\1007\\awardlist.lua");
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\1007\\variables.lua")

function pActivity:Use_Box_Limit(nTask)
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(nTask) == 1 then
		Talk(1, "", "Sö dông vËt phÈm ®· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông thªm")
		return nil
	end
	return 1
end

function pActivity:Use_Big_Box()
	local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbBig_Box_Use_Limit);
	if %tbLogUse_Big_Box[nTaskVal]  then --phÇn th­ëng ®¹t mèc lín
		tbAwardTemplet:Give(%tbAward_A["AwardSpecial"], 1, {"EVENT_PHUNU", format("AwardSpecialUseBigBox",nTaskVal)})	
		if %tbUse_Big_Box_AdditionalAward[nTaskVal] then --PhÇn th­ëng dµnh cho c¶ server old vµ new
			local tbTempAward = %tbUse_Big_Box_AdditionalAward[nTaskVal]
			tbAwardTemplet:Give(tbTempAward, 1, {"EVENT_PHUNU", format("SuDung%dLanHopBanhLon", nTaskVal)})
			--Msg2Player(format("<color=green>Chóc mõng b¹n sö dông vËt phÈm %s %d lÇn, nhËn ®­îc %s<color>", "Hép B¸nh Lín", nTaskVal, tbTempAward.szName))
		end
	elseif mod(nTaskVal,30) == 0 then --PhÇn th­ëng ®¹t mèc 30..
		tbAwardTemplet:Give(%tbAward_A["AwardMocNho"], 1, {"EVENT_PHUNU", "AwardMocNhoUseBigBox"})	
	else--PhÇn th­ëng th­êng
		tbAwardTemplet:Give(%tbAward_A["AwardNomal"], 1, {"EVENT_PHUNU", "AwardNomalUseBigBox"})	
	end
end	
