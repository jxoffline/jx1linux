--Edit by Youtube PGaming--


Include("\\script\\task\\task_addplayerexp.lua");
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\battles\\seizegrain\\head.lua")
IncludeLib("ITEM")


function main()
if (GetTask(169) == 62)  then
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3953,0,0,0}, nBindState=-2}, "test", 1);
AddNote("NhËn ®­îc lêi nh¾n #thø nhÊt.") 
Msg2Player("NhËn ®­îc lêi nh¾n #thø nhÊt.") 
AddNote("§i hæ trî Ên KiÕm Thu tu söa thÇn kiÕm cña bæn ph¸i.") 
Msg2Player("§i hæ trî Ên KiÕm Thu tu söa thÇn kiÕm cña bæn ph¸i.") 
SetTask(169,63)
elseif (GetTask(169) > 62) and (GetTask(169) < 66)then
Msg2Player("Thêi c¬ ch­a ®Õn kh«ng thÓ më ra xem tr­íc") 
return 1
--------------------------------xem lai nv nay--------------------------------------------
elseif (GetTask(169) == 66)  then
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3954,0,0,0}, nBindState=-2}, "test", 1);
AddNote("NhËn ®­îc lêi nh¾n #thø 2.") 
Msg2Player("NhËn ®­îc lêi nh¾n #thø 2.") 
AddNote("H·y ®Õn thung lòng (184/177) ®Ó tŞnh t©m.") 
Msg2Player("H·y ®Õn thung lòng (184/177) ®Ó tŞnh t©m.") 
SetTask(169,67)
elseif (GetTask(169) > 66) and (GetTask(169) < 68)then
Msg2Player("Thêi c¬ ch­a ®Õn kh«ng thÓ më ra xem tr­íc") 
return 1
------------------------------------------------------------------------------------------------------
elseif (GetTask(169) == 68)  then
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3955,0,0,0}, nBindState=-2}, "test", 1);
AddNote("NhËn ®­îc lêi nh¾n #thø 3.") 
Msg2Player("NhËn ®­îc lêi nh¾n #thø 3.") 
AddNote("§Õn KiÕm C¸c T©y Nam (430/227) tiªu diÖt Khóc V« H×nh.") 
Msg2Player("§Õn KiÕm C¸c T©y Nam (430/227) tiªu diÖt Khóc V« H×nh.") 
SetTask(169,69)
elseif (GetTask(169) > 68) and (GetTask(169) < 70)then
Msg2Player("VËt phÈm nµy ®· thÊt b¹i.")
DelCommonItem(6,1,3952)
elseif (GetTask(169) == 70)  then
Msg2Player("VËt phÈm nµy ®· thÊt b¹i.")
DelCommonItem(6,1,3952)
end
if P == 3952 then 
	end
	return 1
end
