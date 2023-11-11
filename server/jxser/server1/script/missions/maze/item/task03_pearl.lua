Include("\\script\\missions\\maze\\maze.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")
IL("ITEM")

function main()
	local player = PlayerList:GetPlayer(PlayerIndex)
	if (player) then
		if (player:CalcEquiproomItemCount(6, 1, 2634, 1, 0, 0) < 10) then
			player:Say("C«n ph∂i <color=red>10<color> Hπt Tuy’t Linh Ch©u mÌi c„ th” hÓp thµnh mÈt c∏i Tuy’t Linh Ch©u HÂn.")
		elseif (player:ConsumeEquiproomItem(10, 6, 1, 2634, 1) ~= 1) then
			player:Msg2Player("HÓp thµnh Tuy’t Linh Ch©u HÂn th t bπi.")
		else
			local nItemIndex = player:AddItem(6, 1, 2635, 1, 0, 0)
			if (nItemIndex <= 0) then
				player:Msg2Player("HÓp thµnh Tuy’t Linh Ch©u HÂn th t bπi.")
			else
				ITEM_SetExpiredTime(nItemIndex, 30)
				player:SyncItem(nItemIndex)
				player:Msg2Player("Thµnh c´ng hÓp thµnh mÈt c∏i Tuy’t Linh Ch©u HÂn.")
			end
		end
	end
	return 1
end
