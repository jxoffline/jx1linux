function PickUp( nItemIndex, nPlayerIndex )
	local oldPlyIdx = PlayerIndex;
	local size = GetTeamSize();
	local mySex = GetSex();
	if(size < 2) then
		Msg2Player("Ng­êi c« ®¬n nhÆt hoa hång t×nh yªu kh«ng ®em l¹i hiÖu qu¶. ");
		return 0;
	elseif(size > 2) then
		Msg2Player("ChØ cã mét nam mét n÷ lËp ®éi nhÆt hoa hång t×nh yªu míi nhËn ®­îc phÇn th­ëng.");
		return 0;
	else
		for i = 1, size do
			PlayerIndex = GetTeamMember(i);
			if( mySex ~= GetSex() ) then
				GiveExp(oldPlyIdx,size);
				return 0;
			end
		end
		PlayerIndex = oldPlyIdx;
		Msg2Player("ChØ cã mét nam mét n÷ lËp ®éi nhÆt hoa hång t×nh yªu míi nhËn ®­îc phÇn th­ëng.");
		return 0;
	end
end

function GiveExp(oldPlyIdx,size)
	local levelexp = {70,160,280,400,520,590,770,850,1000,1200,1500};
	for j = 1, size do
		PlayerIndex = GetTeamMember(j);
		SetTask(1562, GetTask(1562)+1);
		if(GetTask(1562) >= 99 ) then
			AddItem(6,1,833,1,0,0);
			SetTask(1562, 0);
			Msg2Player("B¹n ®· nhÆt ®­îc 99 ®ãa hoa hång t×nh yªu, nhËn ®­îc mét S«c«la, sè l­îng nhÆt ®­îc trë vÒ 0.");
		end		
		Msg2Player("B¹n ®· nhÆt ®­îc"..GetTask(1562).."®ãa hoa hång t×nh yªu");
		local level = GetLevel();
		local exp_level = floor(level / 10) + 1;
		if(exp_level > 11) then
			exp_level = 11;
		end
		AddOwnExp(levelexp[exp_level]);
	end
	PlayerIndex = oldPlyIdx;
end