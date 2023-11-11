
function main(sel)
if (GetTask(169) == 51) then
Talk(2,"nv5xHS","Hoµng Thóc: µi... Th¸ng ngµy cµng khã kh¨n råi.")
elseif (GetTask(169) > 51) and (GetTask(169) < 57) then
Talk(1,"","Hoµng Thóc: µi... Th¸ng ngµy cµng khã kh¨n råi.")
elseif (GetTask(169) == 57) and (HaveCommonItem(6,1,3951)>0) then
Talk(2,"nv5xHS2","Hoµng Thóc: a, ®©y kh«ng ph¶i lµ tµi s¶n cña ta sao, ®a t¹, ®a t¹!")
else
Say("TrÊn cña chóng ta n»m c¹nh Hoa S¬n, th­êng cã nh©n sÜ vâ l©m qua l¹i, muèn häc vâ c«ng còng kh«ng khã.",0)
end
end;

function nv5xHS()  
	SetTask(169,52)
end; 

function nv5xHS2()  
	ConsumeEquiproomItem(1,6,1,3951,-1)
	SetTask(169,58)
end; 