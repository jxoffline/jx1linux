--Î÷ÄÏ±±Çø ½­½ò´å ËµÊéÏÈÉúÂŞÏşÒô

function main(sel)

Say("L­u l¹c giang hå c¶ nöa ®êi, cuèi cïng chØ lµ mét kÎ bÇn hµn mµ th«i!", 2, "Nghe mét ®o¹n s¸ch /yes", "Kh«ng nghe /no");

end;


function yes()
	i=random(0,2);
	if(i == 0)then
		PlayMusic("\\Music\\Music901.mp3")
	elseif(i == 1)then
		PlayMusic("\\Music\\Music902.mp3")
	else
		PlayMusic("\\Music\\Music903.mp3")
	end;
end;


function no()
end;
