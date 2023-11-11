--Î÷ÄÏ±±Çø ¶ëáÒÅÉ ÂôÒ©µÄµÜ×Ó¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(208) == 1 then
		allbrother_0801_FindNpcTaskDialog(208)
		return 0;
	end
	Uworld36 = GetByte(GetTask(36),1)
	if (GetFaction() == "emei") or (Uworld36 == 127) then
		Say("th¶o d­îc trªn nói Nga Mi rÊt nhiÒu, ®Ö tö bæn ph¸i dïng nh÷ng lo¹i th¶o d­îc nµy ®Ó lµm ra nhiÒu thÇn d­îc trŞ th­¬ng. ", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","Ch­ëng m«n cã lÖnh: D­îc phÈm m«n ph¸i chØ b¸n cho tû muéi ®ång m«n!")
	end
end;

function yes()
Sale(53)
end;

function no()
end;
