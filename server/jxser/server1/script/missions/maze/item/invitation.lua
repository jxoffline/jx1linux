-- îÚÁúÓ¢ĞÛÌûÊ¹ÓÃ½Å±¾
Include("\\script\\global\\playerlist.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\missions\\maze\\head.lua")

function main(nItemIndex)
	local player = PlayerList:GetPlayer(PlayerIndex)
	if (not player) then
		return 1
	end
	if (player:GetTask(TASK_MAZEINVITATION) ~= 0) then
		player:Say("Ngäc Long Anh Hïng ThiÕp mçi ng­êi chØ ®­îc sö dông mét lÇn")
	elseif (player:GetLevel() < 120) then
		player:Say("CÊp 120 trë lªn míi cã thÓ sö dông Ngäc Long Anh Hïng ThiÕp")
	else
		player:SetTask(TASK_MAZEINVITATION, 1)
		player:Say("Ngäc Long S¬n Trang xin mêi c¸c h¹ ghĞ th¨m Thİ KiÕm Cèc, Chu Qu©n lµ Thiªn Xu Hé KiÕm Sø sÏ ë Thİ KiÕm Cèc cung nghªnh c¸c h¹ ®¹i gi¸ quang l©m, cã thÓ th«ng qua c¸c Xa Phu ë c¸c thµnh thŞ ®Ó ®i ®Õn Thİ KiÕm Cèc.")
		return 0
	end
	return 1
end
