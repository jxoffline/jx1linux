MONEY_CREATECHATROOM = 50000

function Checkup()
	if (GetCash() < MONEY_CREATECHATROOM) then
		Msg2Player(format("Hµnh trang kh«ng ®ñ  <color=yellow>%d<color> l­îng!", MONEY_CREATECHATROOM))
		return 0
	end
	return 1
end

function Consume()
	return Pay(MONEY_CREATECHATROOM)
end
