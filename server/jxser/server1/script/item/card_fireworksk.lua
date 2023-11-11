IL("LEAGUE");
Include("\\script\\lib\\gb_modulefuncs.lua")
ITEM_GENRE = 6
ITEM_DETAIL = 1
ITEM_PARTI = 1054
function main()
	if (gb_GetModule("Phóc duyªn ph¸o hoa") == 1) then
		Say("ThiÖp ph¸o hoa nµy cã thÓ b¾n ph¸o hoa xung quanh ng­êi m×nh chóc phóc.", 2, "B¾t ®Çu chóc phóc/want2fireworks", "Hñy bá /OnCancel")
	end
	return 1
end

function OnCancel()
end

function want2fireworks()
	AskClientForString("PlayerSelect", "", 1, 16, "Xin nhËp tªn ®èi ph­¬ng");
end

function PlayerSelect(rolename)
	QueryWiseManForSB("BlessPlayerOnline", "BlessPlayerOffline", 1000, rolename);
end

function BlessPlayerOffline(TargetName)
	Say("Xin lçi! "..TargetName.."HiÖn t¹i kh«ng cã trªn m¹ng.",0)
end;

function BlessPlayerOnline(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank, nSubWorldID, nFightMode, bTargetProtect)
	if (CalcEquiproomItemCount(ITEM_GENRE,ITEM_DETAIL,ITEM_PARTI,-1) >= 1) then
		ConsumeEquiproomItem(1, ITEM_GENRE, ITEM_DETAIL, ITEM_PARTI, -1)
		local nposx = nPosX * 32
		local nposy = nPosY * 32
		local szParam = TargetName.." "..nSubWorldID.." "..nPosX.." "..nPosY.." "..GetName()
		LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "fireworks_bless_anywhere", szParam, "", "")
		Msg2Player("Lêi chóc phóc cña b¹n ®· gëi ®i thµnh c«ng!")
	else
		Say("Kh«ng t×m ®­îc thÎ! Xin thö l¹i 1 lÇn!.", 0)
	end
end

