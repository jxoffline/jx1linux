-- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com - 
-- script viet hoa By http://tranhba.com  FileName : newaccount.lua 
-- script viet hoa By http://tranhba.com  Author : lailigao 
-- script viet hoa By http://tranhba.com  CreateTime : 2005-06-06 22:15:37 
-- script viet hoa By http://tranhba.com  Desc : tay míi phæ biÕn réng r·i sè tr­¬ng môc 
-- script viet hoa By http://tranhba.com  Include("\\script\\misc\\spreader\\neaccount.lua")
-- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com - 

Include("\\script\\misc\\spreader\\head.lua")

-- script viet hoa By http://tranhba.com  cã hay kh«ng cã tay míi phæ biÕn réng r·i 
function gsp_haveprize_newaccount() 
local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT); 
-- script viet hoa By http://tranhba.com if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER or nValue == GSP_ACCOUNT_TYPE_SPREADERSYS) then 
if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER) then 
return 1; 
end; 

return 0; 
end 

function gsp_newaccount_gift() 
local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT); 
-- script viet hoa By http://tranhba.com if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER or nValue == GSP_ACCOUNT_TYPE_SPREADERSYS) then 
if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER) then 
Say("Tay míi më tr­¬ng môc t¹p #<color=red> t©y s¬n c­ m­êi chu niªn kh¸nh ®iÓn th«ng dông giã lèc <color>, ngµi mÊu chèt lÊy tay míi më tr­¬ng môc t¹p ®Ých tÆng phÈm sao ? ", 3,"§óng vËy , ta mÊu chèt lÊy /gsp_newaccount_gift_core","Chê mét l¸t n÷a dÉn /gs_newaccount_cancel", " liªn quan tíi tay míi më tr­¬ng môc t¹p .../gs_newaccount_about"); 
elseif (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER_PAY) then 
Talk(1, "","Tay míi më tr­¬ng môc t¹p # ngµi ®Ých tÆng phÈm ®· nhËn lÊy . mét sè tr­¬ng môc chØ cã thÓ dÉn mét lÇn . "); 
else 
Talk(1, "","Tay míi më tr­¬ng môc t¹p # ngµi ®Ých sè tr­¬ng môc kh«ng ph¶i lµ tay míi më tr­¬ng môc t¹p sè tr­¬ng môc , kh«ng thÓ nhËn lÊy tÆng phÈm . "); 
end 
end 

-- script viet hoa By http://tranhba.com  tÆng mét 
function gsp_newaccount_gift_core() 
local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT); 
-- script viet hoa By http://tranhba.com if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER or nValue == GSP_ACCOUNT_TYPE_SPREADERSYS) then 
if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER) then 
AddExtPoint(GSP_ACCOUNT_EXTPOINT, 1); -- script viet hoa By http://tranhba.com  söa ®æi ph¸t triÓn ®iÓm ®· nhËn lÊy dÊu hiÖu 

AddItem(0,10,2,1,random(0,4),0,0); -- script viet hoa By http://tranhba.com  b¹ch m· 
Earn(10000); -- script viet hoa By http://tranhba.com  1w hai 
Msg2Player("Ngµi thu ®­îc liÖt b¹ch m· mét thÊt cïng b¹c 1 v¹n l­îng "); 
--Talk(1, "","Tay míi më tr­¬ng môc t¹p # ngµi ®¹t ®­îc liÖt b¹ch m· mét thÊt cïng b¹c 1 v¹n l­îng , chóc ngµi ë kiÕm hiÖp t×nh duyªn in tê nÕt b¶n trung vui vÎ ®Þa trß ch¬i "); 
Talk(1, "","Chµo mõng ng­êi ch¬i míi ! Ta tÆng ng­¬i <color= Green>1 LiÖt b¹ch m· <color>vµ <color= Yellow> 1 v¹n l­îng <color> , chóc ng­¬i hµnh tÈu giang hå vui vÎ "); 

return 1; 
end 
end 

function gs_newaccount_cancel() 
end 

function gs_newaccount_about() 
Talk(1, "","Tay míi më tr­¬ng môc t¹p # nÕu ngµi sö dông <color=red> t©y s¬n c­ m­êi chu niªn kh¸nh ®iÓn th«ng dông giã lèc <color> ph¸t ra tay míi më tr­¬ng môc t¹p sè tr­¬ng môc ( mét lo¹i lÊy KS më ®Çu ) , nh­ng ë lÔ quan chç nhËn lÊy mét phÇn lÔ vËt , gióp ngµi b­íc ra x«ng x¸o giang hå ®Ých b­íc ®Çu tiªn . "); 
end 
