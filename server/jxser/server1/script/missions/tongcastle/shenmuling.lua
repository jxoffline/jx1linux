
local tbPoint = {
	[3205] = 10,
	[3206] = 100,
	[3207] = 1000,
}

function main(nItemIndex)
	local _, _, nP = GetItemProp(nItemIndex)
	local nValue = %tbPoint[nP] + GetTask(3399)
	SetTask(3399, nValue)
	Msg2Player(format("<color=yellow>Ng≠¨i nhÀn Æ≠Óc %d Æi”m th«n mÈc<color>", %tbPoint[nP]))
end