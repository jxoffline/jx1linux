IL("SETTING")
IL("LEAGUE")
Include("\\script\\lib\\gb_modulefuncs.lua")

COLOR_BLESS = {
	{"Tr¾ng","color=White"},	--°×É«
	{"§á","color=Red"},		--ºìÉ«
	{"Xanh l¸ c©y","color=Green"},	--ÂÌÉ«
	{"Xanh biÓn","color=Water"},		--À¶É«
	{"Mµu vµng kim","color=Orange"},	--½ðGold
	{"Cam","color=0xff5040"},	--³ÈÉ«
	{"Mµu tÝm","color=Pink"},		--×Ïºì
	{"TÝm ®Ëm","color=Violet"},	--×Ï
	{"§á s¸ng","bclr=Red><color=Yellow"},		--ÁÁºìÉ«
	{"Xanh s¸ng","bclr=Blue><color=White"},		--ÁÁÀ¶É«
	{"§á ®Ëm s¸ng","bclr=Pink><color=Yellow"},	--ÁÁÌÒºì
}

TB_FORBIDWORD = {
	"<item=",
	"<link=",
	"<pic=",
	"<color=",
	"<bclr=",
	"<enter",
}

STSK_OTHERNAME = 1
STST_COLOR = 2
ITEM_GENRE = 6
ITEM_DETAIL = 1
ITEM_PARTI = 1053

function main()
	if (gb_GetModule("ThiÖp th«ng b¸o chóc mõng mµu") == 1) then
		Say("§©y lµ tÊm thiÖp mµu thÓ hiÖn nh÷ng lêi chóc gëi ®i. Mêi b¹n nhËp tªn ng­êi cÇn chóc, sau ®ã chän mµu cho nÒn ch÷ cÇn chóc", 
			2, 
			"B¾t ®Çu chóc phóc/want2bless",
			"L¸t n÷a míi gëi/OnCancel")
	end
	return 1
end
function want2bless(nIndex)
	AskClientForString("PlayerSelect", "", 1, 16, "Xin nhËp tªn ®èi ph­¬ng");
end

function PlayerSelect(rolename)
	if (ST_CheckTextFilter(rolename) ~= 1) then
		Say("Xin lçi! Tªn b¹n nhËp vµo cã ch÷ kh«ng hîp lÖ, h·y thö l¹i lÇn n÷a!", 0)
		return
	end
	
	for i = 1, getn(TB_FORBIDWORD) do
		local bp = strfind(rolename, TB_FORBIDWORD[i])
		if (bp ~= nil) then
			Say("Xin lçi! Tªn b¹n nhËp vµo cã ch÷ kh«ng hîp lÖ, h·y thö l¹i lÇn n÷a!", 0)
			return
		end
	end
	
	SetStringTask(STSK_OTHERNAME,rolename)
	local tbOpp = {}
	for i = 1, getn(COLOR_BLESS) do
		tbOpp[i] = COLOR_BLESS[i][1].."/ColorSelect"
	end
	tbOpp[ getn(tbOpp) + 1 ] = "Hñy bá /OnCancel"
	Say("Mêi b¹n chän mµu ch÷ chóc phóc:", getn(tbOpp), tbOpp )
end

function ColorSelect(nSel)
	local stcolor = nSel + 1
	SetStringTask(STST_COLOR,COLOR_BLESS[stcolor][2])
	AskClientForString("BlessPlayer", "", 1, 100, "Xin nhËp lêi chóc phóc vµo");
end

function BlessPlayer(szBless)
	if (ST_CheckTextFilter(szBless) ~= 1) then
		Say("Xin lçi! Lêi chóc phóc cña b¹n cã ch÷ kh«ng hîp lÖ, h·y thö l¹i lÇn n÷a!", 0)
		return
	end
	
	for i = 1, getn(TB_FORBIDWORD) do
		local bp = strfind(szBless, TB_FORBIDWORD[i])
		if (bp ~= nil) then
			Say("Xin lçi! Tªn b¹n nhËp vµo cã ch÷ kh«ng hîp lÖ, h·y thö l¹i lÇn n÷a!", 0)
			return
		end
	end

	if (GetStringTask(STSK_OTHERNAME) == nil or GetStringTask(STSK_OTHERNAME) == "" or GetStringTask(STST_COLOR) == nil or GetStringTask(STST_COLOR) == "") then
		return
	end
	if (CalcEquiproomItemCount(ITEM_GENRE,ITEM_DETAIL,ITEM_PARTI,-1) >= 1) then
		ConsumeEquiproomItem(1, ITEM_GENRE, ITEM_DETAIL, ITEM_PARTI, -1)
		local szMsg = ""
		szMsg = "<color=yellow>"..GetName().."<color><#> nãi víi <color=yellow>"..GetStringTask(STSK_OTHERNAME).."<color><#>:<"..GetStringTask(STST_COLOR)..">"..szBless
		--AddGlobalCountNews(szMsg,2);
		LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "colork_bless_anywhere", szMsg, "", "")
	else
		Say("Kh«ng t×m ®­îc thÎ! Xin thö l¹i 1 lÇn!.", 0)
	end
end

function OnCancel()
end