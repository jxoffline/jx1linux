Include([[\script\missions\springfestival\head.lua]]);
Include([[\script\missions\libfestival\signin.lua]]);

SZFILE = [[\settings\maps\]]..CO_MAPPOINTFLORDER..[[\player.txt]];

function signin_add()
	--½øĞĞ¼ÆÊı
	if (GetTask(TK_CO_PLAYTIMES) >= CO_MAXPLAYTIMES) then
		Say(CO_SIGNNPCNAME.."H«m nay ng­¬i ®· tham gia <color=yellow>"..CO_MAXPLAYTIMES.." lÇn<color> råi, cã lÏ ng­¬i còng mÖt råi, nªn ®i nghØ ®i!", 0);
		return 0;
	end;

	if (GetTask(TK_CO_TOTAL) >= 50) then
		Say(CO_SIGNNPCNAME.."Ng­¬i ®· tham gia ho¹t ®éng TÕt <color=yellow>50 lÇn<color> råi, xem ra còng ®· mÖt, cÇn ph¶i nghØ ng¬i!", 0);
		return 0;
	end;
	
	if (GetLevel() < CO_LEVELLIMIT) then
		Say(CO_SIGNNPCNAME.."§¼ng cÊp cña ng­¬i qu¸ thÊp, ta kh«ng muèn ng­¬i m¹o hiÓm, khi nµo ®¹t ®Õn cÊp <color=yellow>"..CO_LEVELLIMIT.."<color> h·y ®Õn t×m ta.", 0);
		return 0;
	end;
	
	if (IsCharged() == 0) then
		Say(CO_SIGNNPCNAME.."ChØ cã ng­êi ch¬i n¹p thÎ míi cã thÓ tham gia c¸c ho¹t ®éng TÕt.", 0);
		return 0;
	end;
		
	if (gb_GetTask(FESTIVAL_SHREWMOUSE, 1) ~= 1) then
		local nNowTime = tonumber(GetLocalDate("%H"));
		local bOn = 0;
		if ((nNowTime >= 12 and nNowTime < 14) or 
          (nNowTime >= 19 and nNowTime < 23) or 
          (nNowTime >= 1 and nNowTime < 3)) then
			    bOn = 1;
		end;
		if (bOn == 0) then
			Talk(1, "", CO_SIGNNPCNAME.."Ho¹t ®éng ¤ng ba m­¬i sÏ diÔn ra mçi ngµy, trong kho¶ng thêi gian <color=yellow>12: 00 ®Õn 14: 00 tr­a, 19: 00 ®Õn 23: 00 tèi vµ 1: 00 ®Õn 3: 00 s¸ng<color>. Mäi ng­êi h·y mau chãng tham gia.");
			return 0;
		else
			Talk(1, "", CO_SIGNNPCNAME.."Ng­¬i còng muèn tham gia ho¹t ®éng '§uæi «ng ba m­¬i' sao? ChØ tiÕc hiÖn t¹i ng­êi dÉn ®­êng ®· ®i mÊt. H¾n sÏ quay vÒ vµo thêi ®iÓm phót thø 0, phót thø 15, phót thø 30 vµ phót thø 45 mçi giê.");
			return 0;
		end;
	end;
	return 1;
end;

--	Íæ¼ÒÀë¿ªµÄ¸½¼ÓÉèÖÃ
function playerleave_add()
	SetCurCamp(GetCamp());
	tab_Itemlist = {981, 984, 1035, 1036, 1037, 1038, 1039, 1040, 1041, 1042, 1043, 1044, 1045, 1046, 1047, 1048, 978, 979, 980, 981, 982, 983, 984, 985, 986, 987, 988, 989, 990, 991, 992, 993, 994};
	
	for i = 1, getn(tab_Itemlist) do
        ConsumeItem( -1, 1000, 6, 1, tab_Itemlist[i], 1 );
    end;
end;

-- 	Íæ¼Ò½øÈë×¼±¸³¡µÄ¸½¼ÓÉèÖÃ
function playergetinprepare_add()
end;

--	Íæ¼Ò½øÈëÓÎÏ·³¡µÄ¸½¼ÓÉèÖÃ
function playergetingame_add()
	SetTask(TK_CO_PLAYTIMES, GetTask(TK_CO_PLAYTIMES) + 1);
	SetTask(TK_CO_TOTAL, GetTask(TK_CO_TOTAL) + 1);
	SetCurCamp(1);	--ÉèÖÃÁÙÊ±ÕóÓª
end;