--×Ô¶¨ÒåÍ­Ç®ÊýÁ¿µÄºì°ü
IncludeLib("ITEM")

function main(nItemIdx)		
	local nMoney = GetItemParam(nItemIdx,1)
	AddStackItem(nMoney,4,417,1,1,0,0,0)
	Msg2Player("B¹n ®¹t ®­îc "..nMoney.."TiÒn ®ång")
end

function GetDesc(nItemIdx)
	local nMoney = GetItemParam(nItemIdx, 1)
	--local szDesc = ""
	local szDesc = "\nTrong bao l× x× cã <color=yellow>"..nMoney.."<color=> tiÒn ®ång"
	return szDesc;
end