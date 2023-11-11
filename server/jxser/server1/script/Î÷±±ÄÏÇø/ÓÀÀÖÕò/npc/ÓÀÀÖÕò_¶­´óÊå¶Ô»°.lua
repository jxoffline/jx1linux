
function main(sel)
if (GetTask(169) == 52) then
Talk(2,"nv5xHS","§æng §¹i Thóc: S¬n PhØ ®¸ng ghĞt, ta nhÊt ®Şnh ph¶i th­îng c¸o quan phñ!")
elseif (GetTask(169) > 52) and (GetTask(169) < 58) then
Talk(1,"","§æng §¹i Thóc: S¬n PhØ ®¸ng ghĞt, ta nhÊt ®Şnh ph¶i th­îng c¸o quan phñ!")
elseif (GetTask(169) == 58) and (HaveCommonItem(6,1,3951)>0) then
Talk(2,"nv5xHS2","§æng §¹i Thóc: «i, ®©y chİnh lµ vËt phÈm ®· bŞ c­íp cña chóng t«i, xin ®a t¹, ®a t¹!")
else
Say("Lµm ng­êi ®­îc mÊy lÇn say, nªn lóc hå ®å th× cø hå ®å!",0)
end
end;

function nv5xHS()  
	SetTask(169,53)
end; 

function nv5xHS2()  
	ConsumeEquiproomItem(1,6,1,3951,-1)
	SetTask(169,59)
end; 