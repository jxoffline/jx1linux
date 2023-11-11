Include("\\script\\missions\\newcitydefence\\headinfo.lua")

--ÅÅÃû½±Àø±í
TSKID_PLAYER_GETAWARD = 1880 --ÁìÈ¡±êÖ¾
tb_cdPaiMingAward = 
{
	[1] = {nGuangHuan=187,szGuanghuan="§Þnh Quèc Nguyªn So¸i",tbManMask={0,11,418},tbMaleMask={0,11,417}},
	[2] = {nGuangHuan=186,szGuanghuan="An Bang §¹i T­íng Qu©n",},
	[3] = {nGuangHuan=185,szGuanghuan="Phiªu m· ®¹i t­íng qu©n",},
	[4] = {nGuangHuan=184,szGuanghuan="Vò L©m Trung Lang T­íng",},
	[5] = {nGuangHuan=183,szGuanghuan="Chiªu Vâ HiÖu óy",},
}
function cd_getFengHuoLianCheng()
	if tonumber(GetLocalDate("%w")) == FIRE_OPENDAY_SUNDAY then
		Say("Kh«ng thÓ nhËn th­ëng vµo Chñ nhËt.",0)
		return
	end
	local szMsg = "<dec><npc>B¶ng xÕp h¹ng Phong Háa Liªn Thµnh tuÇn nµy: \n"
	for i = 1, 5 do
		name , value = Ladder_GetLadderInfo(LADDER_ID_FANIEL, i)
		if name == 0 or name =="" or name == nil then
			break
		end
		szMsg = format("%s - H¹ng <color=red>%s<color>: <color=red>%s<color>\t\t\t §iÓm chiÕn c«ng: <color=red>%s<color>\n",szMsg,i,name,value)
	end
	local tbAryTalk ={}
	tbAryTalk[1] = szMsg
	tinsert(tbAryTalk,"NhËn phÇn th­ëng xÕp h¹ng mçi tuÇn/cd_doGetPaiMingAward")
	tinsert(tbAryTalk,"Tho¸t ra/NoChoice")
	CreateTaskSay(tbAryTalk)
end

function cd_doGetPaiMingAward()
	if tonumber(GetLocalDate("%w")) == FIRE_OPENDAY_SUNDAY then
		Say("Kh«ng thÓ nhËn th­ëng vµo Chñ nhËt.",0)
		return
	end
	local nladder = 0;
	for i = 1, 5 do
		name , value = Ladder_GetLadderInfo(LADDER_ID_FANIEL, i)
		if name == GetName() then
			nladder = i
			break
		end
	end	
	if nladder == 0 then
		Say("Kh«ng cã tªn trong b¶ng xÕp h¹ng, tuÇn sau tiÕp tôc cè g¾ng h¬n.",0)
		return
	end
	if GetTask(TSKID_PLAYER_GETAWARD) == tonumber(GetLocalDate("%W")) then
		Say("§· nhËn th­ëng råi, cßn ®Õn t×m ta lµm g×!",0)
		return
	end
	SetTask(TSKID_PLAYER_GETAWARD,tonumber(GetLocalDate("%W")))
	local nweek = tonumber(GetLocalDate("%w"));
	local nhour = tonumber(GetLocalDate("%H"));
	local nmint = tonumber(GetLocalDate("%M"));
	local ntime = (7-nweek) * 24 * 60 * 60 + (24 - nhour) * 60 *60 + (-nmint) * 60;
	local nDate = mod(FormatTime2Number(GetCurServerTime() + ntime), 100000000);
--	Title_AddTitle(tb_cdPaiMingAward[nladder].nGuangHuan, 2, nDate);
--	Title_ActiveTitle(tb_cdPaiMingAward[nladder].nGuangHuan);
	SetTask(1122,tb_cdPaiMingAward[nladder].nGuangHuan)
	if nladder == 1 then
		local nG = 0
		local nD = 0
		local nP = 0
		if GetSex() == 0 then
			nG = tb_cdPaiMingAward[nladder].tbManMask[1]
			nD = tb_cdPaiMingAward[nladder].tbManMask[2]
			nP = tb_cdPaiMingAward[nladder].tbManMask[3]
		else
			nG = tb_cdPaiMingAward[nladder].tbMaleMask[1]
			nD = tb_cdPaiMingAward[nladder].tbMaleMask[2]
			nP = tb_cdPaiMingAward[nladder].tbMaleMask[3]			
		end
		local nIdx = AddItem(nG,nD,nP,1,0,0)
		SetItemBindState(nIdx, -2)
		Msg2Player(format("Chóc mõng b¹n ®· nhËn ®­îc 1 <color=yellow>%s<color>",GetItemName(nIdx)))
		WriteLog(format("[PhÇn th­ëng xÕp h¹ng Phong Háa Liªn Thµnh]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nIdx)));
	end
	Msg2Player(format("Chóc mõng b¹n ®· nhËn ®­îc danh hiÖu <color=yellow>%s<color>",tb_cdPaiMingAward[nladder].szGuanghuan))
	WriteLog(format("[PhÇn th­ëng xÕp h¹ng Phong Háa Liªn Thµnh]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),tb_cdPaiMingAward[nladder].szGuanghuan));
end