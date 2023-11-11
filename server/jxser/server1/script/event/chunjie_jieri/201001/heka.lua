Include("\\script\\activitysys\\playerfunlib.lua");
Include("\\script\\misc\\taskmanager.lua");
IncludeLib("LEAGUE")

tbColor = 
{
	"green", 
	"cyan", 
	"pink", 
	"violet", 
	"orange", 
	"gold", 
	"white",
}

tbBless = 
{
	"An Khang ThÞnh V­îng", 
	"NiÒm Vui BÊt TËn", 
	"Tµi Léc gÆt hoµi kh«ng hÕt", 
	"Thä d÷ thiªn tÒ ", 
	"V¹n sù nh­ ý", 
	"B¸ch sù §¹i C¸t", 
	"N¹p Phóc Nghªnh §­êng",
	"Kh«ng cßn kÎ say, chØ cßn ng­êi ngay, lóc nµo còng may",
	"Quµ c¸p bao la, c¶ nhµ no ®ñ",
	"Vµng b¹c ®Çy tñ, gia chñ ph¸t tµi",
	"Giµ trÎ g¸i trai, vui vÇy sum häp",
	"TiÒn nhiÒu nh­ kÑo, t×nh chÆt nh­ keo",
	"Tù tin, kiªn nhÉn, can ®¶m hßa quyÖn vµo b¹n",
	"QuyÕt ®o¸n, l¹c quan, hµi h­íc lu«n lu«n kÒ bªn",
	"Xui xÎo, ®¾ng cay tr¸nh xa h»ng c©y sè",
	"Cã ®­îc vò trô t×nh th­¬ng, ®¹i d­¬ng t×nh c¶m",
	"§iÖp khóc t×nh yªu, ng­êi yªu lý t­ëng",
	"Vµng x©y tæ Êm vµ l¾m con ngoan",
}

TSK_HECA_COUNT = TaskManager:GetTaskId(1, 8);

function main()

	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= 20100322) then
		Msg2Player("VËt phÈm nµy ®· qu¸ h¹n.");
		return 0;
	end
	
	local nTeamSize = GetTeamSize();
	if (nTeamSize ~= 2) then
		lib:ShowMessage("Kh«ng tháa m·n ®iÒu kiÖn cña tæ ®éi!");
		return 1;
	end
	
	for i=1,nTeamSize do
		local nLv = doFunByPlayer(GetTeamMember(i), GetLevel);
		local nExPoint = doFunByPlayer(GetTeamMember(i), GetExtPoint, 0);
		
		if (nLv < 50 or nExPoint < 1) then
			lib:ShowMessage(format("%s%s","Thµnh viªn tæ ®éi tÊt c¶ ph¶i lµ", format("CÊp <color=green>%d<color> trë lªn vµ ®· nép thÎ míi cã thÓ %s",50,"Sö dông ")));
			return 1;
		end
	end
	
	for i=1,nTeamSize do
		local nIdx = GetTeamMember(i);
		
		if (doFunByPlayer(nIdx, PlayerFunLib.CheckTask, PlayerFunLib,TSK_HECA_COUNT,"6000",format("Th«ng qua sö dông [%s] nhiÒu nhÊt chØ ®­îc %s kinh nghiÖm","ThiÖp chóc xu©n","<color=green>600000000<color=green>"),"<") == 1) then
			doFunByPlayer(nIdx, PlayerFunLib.AddExp, PlayerFunLib, 5000000, 0, format("%s phÇn th­ëng","ThiÖp chóc xu©n"));
			doFunByPlayer(nIdx, PlayerFunLib.AddTask, PlayerFunLib, TSK_HECA_COUNT, 50);
		end
		
		if (nIdx ~= PlayerIndex) then
			local szMsg = format("<color=yellow>%s <color> chóc <color=yellow>%s<color> <color=%s>%s<color>",GetName(), doFunByPlayer(nIdx, GetName), tbColor[random(1,getn(tbColor))], tbBless[random(1,getn(tbBless))]);
			LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szMsg , "", "");
		end
	end

	return 0;
end