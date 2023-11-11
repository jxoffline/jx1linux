--ÖĞÔ­ÄÏÇø ÏåÑô¸® Â·ÈË9·¶¶ş´º¶Ô»°
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")

function main(sel)
	if allbrother_0801_CheckIsDialog(184) == 1 then
		allbrother_0801_FindNpcTaskDialog(184)
		return 0;
	end
i = random(0,1)

if (i == 0) then
Say("Nhµ §Æng tÈu qu¸ khã kh¨n! §îi l¸t n÷a ta sÏ cho bµ mét bao g¹o, nhanh lªn!",0)
return
end;

if (i == 1) then
Say("Mäi ng­êi ®Òu lµ t×nh lµng nghÜa xãm, gióp ®ì nhau lµ chuyÖn ph¶i lµm!",0)
end;

end;

