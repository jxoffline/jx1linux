function GetDesc(nItemIndex)
	local _,_,_,nLevel = GetItemProp(nItemIndex)
	return format("BÊt cø tÇng kinh m¹ch %d khi xung %d tÇng thÊt b¹i sÏ kh«ng bŞ h¹ cÊp", nLevel + 5, nLevel + 6)
end