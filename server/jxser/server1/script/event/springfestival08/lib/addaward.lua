function springfestival08_lib_GiveRandomAward(tbList, szActName)
	
	if tbList == nil then
		return 0
	end
	local rtotal = 10000000
	local rcur=random(1,rtotal);
	local rstep=0;
	for i=1,getn(tbList) do
		rstep=rstep+floor(tbList[i].nRate*rtotal/100);
		if(rcur <= rstep) then
			springfestival08_lib_AddAward(tbList[i], szActName)
			return 0;
		end
	end
end
function springfestival08_lib_AddAward(tbItemList, szActName)
	local tbItemProp	= tbItemList.tbProp
	local szItemName	= tbItemList.szName
	local nExp			= tbItemList.nExp
	if tbItemProp and szItemName then
		local nPropCount = getn(tbItemProp)
		if nPropCount == 6 then
			AddItem(tbItemProp[1],tbItemProp[2],tbItemProp[3],tbItemProp[4],tbItemProp[5],tbItemProp[6]);
		elseif nPropCount == 2 then
			AddGoldItem(tbItemProp[1],tbItemProp[2])
		end
		Msg2Player(format("NhËn ®­îc 1 c¸i %s",szItemName))
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tget a item %s.",szActName,
	            GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),szItemName ))
	end
	if nExp then
		AddOwnExp(nExp)
		Msg2Player(format("NhËn d­¬c %d kinh nghiÖm.", nExp))
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tget exp %d.",szActName,
	            GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(), nExp ))
	end
end