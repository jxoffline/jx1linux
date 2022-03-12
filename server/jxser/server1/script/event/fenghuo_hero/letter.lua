IncludeLib("TONG")
Include("\\script\\tong\\tong_header.lua")

function main()
	local szTongName, nTongID = GetTongName();
	local GREADSEED_SEEDID_TASKID = 2310;
	local GREADSEED_TIME_TASKID = 2311;
	local nTime = GetCurrentTime();
	local nNpcIdx = GetLastDiagNpc();
	
	if (GetNpcParam(nNpcIdx, 4) == 1) then
		return
	end
	
	
	
	if (GetNpcParam(nNpcIdx, 2) == GetTask(GREADSEED_SEEDID_TASKID)) then
		if (nTime >= GetTask(GREADSEED_TIME_TASKID) + 60) then
			SetTask(GREADSEED_TIME_TASKID, 0);
			SetTask(GREADSEED_SEEDID_TASKID, 0);
			SetNpcParam(nNpcIdx, 4, 1)
			DelNpc(nNpcIdx);
			if (nTongID ~= 0 and TONG_GetTaskValue(nTongID, TONGTSK_HEROLING) >= 120) then
				AddEventItem(1121);
				Msg2Player("NhËn ®­îc 1 mËt th­");
				AddItem(6,1,1257,1,1,1);
				AddItem(6,1,1257,1,1,1);
				Msg2Player("NhËn ®­îc 2 tÊm lÖnh bµi vinh dù");
				Msg2SubWorld("<color=white>"..szTongName.."<color> bang héi - "..GetName().."nhËn ®­îc mËt th­.");
			else
				Talk(1, "", "Kh«ng t×m thÊy!! (phong mËt th­ cæ qu¸i Êy ®ét nhiªn bèc ch¸y, trong nh¸y m¾t chØ cßn l¹i n¾m tro tµn.)");
				Msg2Player("Phong Háa Anh Hïng LÖnh bang héi tİch lòy kh«ng ®ñ 120 c¸i, kh«ng thÓ tiÕp nhËn mËt th­.");
				Msg2SubWorld("<color=white>"..GetName().."<color>Bang héi kh«ng ®ñ ®iÒu kiÖn tham gia ho¹t ®éng mËt th­, mËt th­ bŞ tiªu hñy.");
			end;
		else	--Ê±¼äÃ»µ½60ÃëÖÓ;
			Msg2Player("B¹n ®· chän bøc mËt th­ nµy, "..(60 - (nTime - GetTask(GREADSEED_TIME_TASKID))) .." gi©y sau sÏ nhËn ®­îc!")
		end;
	else
		Msg2Player("B¹n ®· lùa chän mËt th­ nµy! 60 gi©y sau sÏ nhËn ®­îc.")
		SetTask(GREADSEED_TIME_TASKID, nTime);
		SetTask(GREADSEED_SEEDID_TASKID, GetNpcParam(nNpcIdx, 2));
	end;
end;