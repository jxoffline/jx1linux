MONEY_ADDLIFETIME = 1000000

function main()
	Say("ThÎ cho phßng t¸n gÉu"..",".."Xin ®Æt tªn ".."!", 2, "§­îc th«i! §Ó ta nhËp vµo/pay_chatroom_enter","KÕt thóc ®èi tho¹i/OnCancel");
	return 1;
end

function pay_chatroom_enter()
	AskClientForString("pay_chatroom_time", "", 1, 20, "Xin ®Æt tªn "); 
end

function pay_chatroom_time(roomname)

	-- ÁÄÌìÊÒ³äÖµ²»ĞèÒª½»·Ñ
	if (ChatRoom_FindRoom(roomname) == 0) then
		Msg2Player("<#>tªn " .. roomname .. "nµy kh«ng tån t¹i")
	else
		ChatRoom_AddTime(roomname)
	end
end


function OnCancel()
end
