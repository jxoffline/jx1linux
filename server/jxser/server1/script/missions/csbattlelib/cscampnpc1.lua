--CheckCondition() ĞèÒª¸Ãº¯ÊıÓÃÓÚ¼ì²éÊÇ·ñ·ûºÏ¼ÓÈëÌõ¼ş
Include("\\script\\missions\\csbattlelib\\csbattlehead.lua");

function main()

	if (GetMissionV(1) == 1) then 
			--Î´½øÈëÕ½³¡ÅÔ¹Û
			if (GetTaskTemp(JOINSTATE) == 0) then
				Say("B¹n muèn tham gia phe Vµng hay phe Tİm?", 4, "ta muèn gia nhËp vµo phe vµng /ChooseCamp", "ta muèn gia nhËp vµo phe tİm /ChooseCamp", "Ta muèn quan s¸t tr­íc ®·, sÏ nãi chuyÖn sau! /ChooseCamp", "§Ó ta nghÜ l¹i xem /OnCancel");
				return
			--ÕıÔÚÅÔ¹Û
			else
				if (GetCurCamp() == 0) then 
					Say("B¹n muèn tham gia phe Vµng hay phe Tİm?", 4, "ta muèn gia nhËp vµo phe vµng /ChooseCamp", "ta muèn gia nhËp vµo phe tİm /ChooseCamp", "§Ó ta nghÜ l¹i xem /OnCancel", "Ta muèn rêi khái chiÕn tr­êng. /ChooseLeave");
					return
				else
					Say("Ng­¬i muèn rêi khái chiÕn tr­êng ­?", 2, "V©ng, Ta muèn ra /ChooseLeave", "Ta vÉn ch­a ®¸nh xong, ch­a muèn ra. /OnCancel");	
					return
				end
			end
	else
		Say("HiÖn vÉn ch­a ®Õn thêi gian chiÕn ®Êu!",0);
		return
	end;
end;

function ChooseCamp(nSel)
	
	if (CheckCondition() == 0) then
		return 
	end;
	
	if (nSel == 0) then
		JoinCamp(1)	
	elseif (nSel == 1) then
		JoinCamp(2)
	else 
		SetTaskTemp(JOINSTATE, 1);
		SetPos(CS_CampPos0[2], CS_CampPos0[3]);
	end;
end;

function OnCancel()

end;

function ChooseLeave()
	LeaveGame(0)	
end;

