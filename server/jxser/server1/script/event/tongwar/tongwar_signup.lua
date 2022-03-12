
function tongwar_want2signup()
	local tongname, mytongid = GetTongName();
	if (FALSE(tongname)) then
		CreateTaskSay({"<dec><npc>Ch­a gia nhËp bang, kh«ng thÓ ®i vµo Khu vùc chuÈn bÞ!", "KÕt thóc ®èi tho¹i/OnCancel"});
		return
	end
	local n_lid = LG_GetLeagueObjByRole(TONGWAR_LGTYPE, tongname)
	if (FALSE(n_lid)) then
		CreateTaskSay({"<dec><npc>Bang <color=red>"..tongname.."<color> kh«ng cã liªn minh víi c¸c bang héi chiÕm thµnh, kh«ng thÓ ®i vµo §Êu tr­êng chuÈn bÞ.", "KÕt thóc ®èi tho¹i/OnCancel"})
		return
	end
	--VLDNB 13- ®iÒu kiÖn tham gia: ®· vµo bang tr­íc 0h ngµy 6/4 - Modified By DinhHQ - 20130401
	local nTongJoinTime = GetJoinTongTime()*60
	local nCurSvTime = GetCurServerTime()
	local nMinTime = Tm2Time(2013, 4, 6, 0, 0)
	if (nCurSvTime - nTongJoinTime) > nMinTime then
		Say("Thêi gian gia nhËp bang yªu cÇu <color=red>tr­íc 0h ngµy 6/4/2013<color>míi ®­îc phÐp vµo ®Êu tr­êng.", 0)
		return
	end
	--VLDNB 10 kiÓm tra c¸c lo¹i mÆt n¹ t¨ng ®iÓm TK - Modified By DinhHQ - 20111013	
	local tbEquip = GetAllEquipment()
	for i=1, getn(tbEquip) do
		local nG, nD, nP = GetItemProp(tbEquip[i])
		if nP == 447 or nP == 450 or nP == 482 then
			CreateTaskSay({format("<dec><npc>Kh«ng ®­îc phÐp mang vËt phÈm <color=red>[%s]<color> vµo ®Êu tr­êng!", GetItemName(tbEquip[i])), "KÕt thóc ®èi tho¹i/OnCancel"});
			return
		end
	end
	
	local cityname = LG_GetLeagueInfo(n_lid)
	local matchmap = LG_GetLeagueTask(n_lid, TONGWAR_LGTASK_MAP)
	local matchcamp = LG_GetLeagueTask(n_lid, TONGWAR_LGTASK_CAMP)
	
	if (LG_GetLeagueTask(n_lid, TONGWAR_LGTASK_TONGID) == 0) then
		LG_ApplySetLeagueTask(TONGWAR_LGTYPE, cityname, TONGWAR_LGTASK_TONGID, mytongid);
	end;
	
	if (FALSE(matchmap) or GetGlbValue(850) ~= 1) then
		CreateTaskSay({"<dec><npc>"..cityname.."Ch­a ®Õn thêi ®iÓm vµo ®Êu tr­êng, h·y ®îi trong gi©y l¸t.", "KÕt thóc ®èi tho¹i/OnCancel"});
		return
	end
	if (FALSE(matchcamp)) then
		print("error the city"..cityname.." no camp!!!!!")
		return
	end
	local signmap, posx, posy = tongwar_getsignpos(matchmap, matchcamp)
	if (FALSE(signmap)) then
		print("error the city "..cityname.." matchmap"..matchcamp.." have no signmap")
		return
	end
	Msg2Player("B¹n ®· vµo"..cityname.." khu vùc chuÈn bÞ")
	NewWorld(signmap, posx, posy)
end

tbTONGWAR_SIGNMAP_POS = {
					{ 1582,3174 },
					{ 1588,3160 },
					{ 1604,3147 },
				}
	
tbTONGWARMAP = {
									{605, 608, 609},
									{606, 610, 611},
									{607, 612, 613},
							}
							
function tongwar_getsignpos(matchmap, camp)
	for i = 1, getn(tbTONGWARMAP) do
		if (matchmap == tbTONGWARMAP[i][1]) then
			signmap = tbTONGWARMAP[i][camp + 1]
			break
		end
	end
	local ranm = random(getn(tbTONGWAR_SIGNMAP_POS))
	return signmap, tbTONGWAR_SIGNMAP_POS[ranm][1], tbTONGWAR_SIGNMAP_POS[ranm][2]
end