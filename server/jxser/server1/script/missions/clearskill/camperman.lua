function main()
	Say("B¹n muèn t¹m thêi theo phe nµo?", 4, "Phe chÝnh nghÜa /ChangeCamp", "Phe tµ ¸c /ChangeCamp", "Phe s¸t thñ /ChangeCamp", "T¹m thêi kh«ng ®æi /OnCancel");
end;

function ChangeCamp(nSel)
	SetFightState(1)
	if (nSel == 0) then 
		SetCurCamp(1)
	elseif (nSel == 1) then 
		SetCurCamp(2)
	else
		SetCurCamp(4)
	end;
end;

function OnCancel()
end;