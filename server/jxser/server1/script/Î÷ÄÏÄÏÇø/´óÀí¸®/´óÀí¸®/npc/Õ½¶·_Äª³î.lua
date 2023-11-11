--Äª³îÅ®
--by xiaoyang (2004\12\15)
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
Uworld1001 = nt_getTask(1001)
	if (Uworld1001 == 30) then
		Talk(1,"Uworld1001_give","§õng t­ëng ng­¬i ®¸nh ngÊt ®­îc ta, nÕu ta kh«ng tróng ®éc th× ng­¬i ®©u ph¶i lµ ®èi thñ. VÒ thµnh råi nãi chuyÖn!")
	end
end

function newtask1()
	AddOwnExp(20000)
	Msg2Player("M¹c SÇu b¶o b¹n vÒ thµnh nãi chuyÖn")

end

function Uworld1001_give()

	SetMemberTask(1001,30,40,newtask1) --»·½Ú3end
	
end
		
