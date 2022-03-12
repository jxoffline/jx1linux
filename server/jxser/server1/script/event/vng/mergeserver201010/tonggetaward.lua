--Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\event\\vng\\MergeServer201010\\head.lua")
--Include("\\script\\tong\\tong_header.lua")
--Include("\\script\\missions\\citywar_global\\head.lua");
Include("\\script\\missions\\citywar_global\\infocenter_head.lua")

function MergeSV_TongGetBonus()
	if checkBangHuiLimit() == 0 then
			Say("Xin lçi! §¹i hiÖp ch­a gia nhËp bang héi nµo c¶!",0);
			return 0;
	end
	local szTongName, nTongID = GetTongName();
	local figure = TONGM_GetFigure(nTongID, GetName())
	if (figure ~= TONG_MASTER) then
		Say("ThËt ®¸ng tiÕc, chØ cã bang chñ míi cã thÓ nhËn phÇn th­ëng.", 0)
		return
	end
	local IsTongGetItem = TONG_GetTaskValue(nTongID, Task_TongGet_Award) 
	if (IsTongGetItem ~= 0) then
		Say("PhÇn th­ëng nµy mçi bang héi chØ nhËn 1 lÇn.", 0)
		return
	end
	checkCreatLG(szTongName);
	checkJoinLG(szTongName);
	TONG_ApplySetTaskValue(nTongID, Task_TongGet_Award, 1)
	local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
	LG_ApplyAppendMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName, szTongName, LGTSK_TIAOZHANLING_COUNT, 10000, "", "");
	Msg2Player("§¹i hiÖp nép thµnh c«ng 10000 Khiªu ChiÕn LÖnh cho Bang Héi !")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Event Merge Server 2001010"..GetAccount().."\t"..GetName().."\t".."Nép thµnh c«ng 10000 KCL cho Bang Héi")
end