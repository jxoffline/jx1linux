Include("\\script\\tong\\tong_header.lua")
Include("\\script\\missions\\citywar_global\\infocenter_head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\event\\vng\\MergeServer201105\\head.lua")

tbItemBonus_TongCityWar = 
{
	{szName = "§iÓm kinh nghiÖm", nExp_tl = 20000000},
	{szName ="C«ng Thµnh ChiÕn LÔ Bao",tbProp={6,1,2377,1,0,0},nExpiredTime=14400, nCount = 2},
	{szName ="HuyÕt ChiÕn LÖnh Kú",tbProp={6,1,2212,1,0,0},nExpiredTime=14400, nCount = 2},
	{szName ="ThÇn Hµnh Phï",tbProp={6,1,1266,1,0,0},nExpiredTime=10080, nCount = 1},
}
function GetBonus_CityTongWar()
do return end
	if checkBangHuiLimit() == 0 then
			Say("Xin lçi! §¹i hiÖp ch­a gia nhËp bang héi nµo c¶!",0);
			return
	end
	if (MergerSV_TongGetBonusCitywar_Time() ~= 1) then
		Say("Xin lçi! HiÖn t¹i kh«ng thİch hîp ®Ó nhËn phÇn th­ëng nµy",0);
		return
	end
	if (Check_PlayerObj() ~= 1) then
		Say("Xin lçi! §¼ng cÊp ®¹i hiÖp kh«ng thİch hîp nhËn phÇn th­ëng nµy  !",0);
		return
	end
	if (PlayerFunLib:CheckTaskDaily(Task_TongCityWar_Date,1,"Xin lçi ®¹i hiÖp, PhÇn th­ëng nµy mçi tuÇn chØ cã thÓ nhËn 1 lÇn !","<") ~= 1) then
		return
	end
	if (GetJoinTongTime() < 60*24) then
		Talk(1,"","§¹i hiÖp lµ ng­êi míi gia nh¹p vµo bang nªn kh«ng thÓ nhËn th­ëng !")
		return
	end
	if (GetTask(Task_TongCityWar_Bonus) >=  4) then
		Say("Xin lçi! PhÇn th­ëng nµy chØ nhËn tèi ®a 4 lÇn !",0);
		return
	end
	if (CalcFreeItemCellCount() <10) then
		Say("Xin lçi! Hµnh trang ®¹i hiÖp kh«ng ®ñ 10 « trèng !",0);
		return
	end
	if (Check_CityTongWar() ==1) then
		PlayerFunLib:AddTaskDaily(Task_TongCityWar_Date,1)
		SetTask(Task_TongCityWar_Bonus, GetTask(Task_TongCityWar_Bonus) + 1)
		tbAwardTemplet:GiveAwardByList(tbItemBonus_TongCityWar, "MergerSV_201010");
	else
		Say("Xin lçi! bang cña ®¹i hiÖp kh«ng cã chiÕm thµnh nµo c¶ !",0);
		return
	end
end

function MergerSV_TongGetBonusCitywar_Date()
		local nDate = tonumber(GetLocalDate("%Y%m%d"))
		if (nDate > End_TongGetCityWarBonus_Date) then
			return 0
		end
		return 1
end