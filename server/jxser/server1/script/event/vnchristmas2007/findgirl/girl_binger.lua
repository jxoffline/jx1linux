Include("\\script\\event\\vnchristmas2007\\head.lua")
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\event\\mid_autumn\\autumn_portal.lua")
function main()
	local arytalk = 
	{
		[1]="<dec><npc>Gi¸ng sinh vui vÎ! ta lµ thiÕu n÷ gi¸ng sinh B¨ng Nhi, c¸ch ®©y vµi h«m trong lóc ph¸t quµ gi¸ng sinh, ba tû muéi ®i cïng víi ta lµ §«ng Nhi, B¹ch Nhi, TuyÕt Nhi ®· bŞ thÊt l¹c. NÕu nh­ ®¹i hiÖp cã thÓ t×m thÊy hä, ta nhÊt ®Şnh sÏ cã lÔ vËt ®¸p t¹.",
		[2]="Ta muèn t×m thiÕu n÷ gi¸ng sinh/xmas2007_binger_join",
		[3]="T×m hiÓu ho¹t ®éng thiÕu n÷ Gi¸ng sinh/xmas2007_binger_about",
		[4]="§i Minh NguyÖt trÊn/autumn_enter",
		[5]="Tho¸t ra/NoChoice",
	}
	CreateTaskSay(arytalk)
	
	
end
function xmas2007_binger_about()
local arytalk = 
	{
		[1]="<dec><npc>Tõ <color=red>08-12-2007 ®Õn 13-01-2008<color>, mçi ngµy trong thêi gian <color=red>8:00-9:00, 15:00-16:00, 22:00-23:00<color>, thiÕu n÷ gi¸ng sinh sÏ ngÉu nhiªn xuÊt hiÖn t¹i <color=yellow>ThÊt ®¹i thµnh thŞ hoÆc Tr­êng B¹ch S¬n Nam, Tr­êng B¹ch S¬n B¾c<color>. Sau khi hÖ thèng c«ng bè, vâ l©m nh©n sü cã thÓ ®Õn gÆp <color=yellow>B¨ng Nhi<color> ®Ó b¸o danh tham gia, vµ lÇn l­ît t×m c¸c thiÕu n÷ gi¸ng sinh <color=yellow>§«ng Nhi, B¹ch Nhi, TuyÕt Nhi<color>. Ba vŞ ®¹i hiÖp ®Çu tiªn t×m ®­îc hä cã thÓ ®Õn <color=yellow>TuyÕt Nhi<color> ®Ó nhËn th­ëng.",
		[2]="Ha ha, ta hiÓu råi/main"
	}	
	CreateTaskSay(arytalk)
end
function xmas2007_binger_join()
	if xmas2007_findgirl_checktime() == 0 or GetGlbValue(xmas2007_findgirl_gblvalue_taskID)~=1 then
		CreateTaskSay({"<dec><npc>Ho¹t ®éng vÉn ch­a b¾t ®Çu, lóc kh¸c h·y ®Õn vËy!","Tho¸t ra/NoChoice"})
		return
	end
	
	local ntaskdate = GetTask(xmas2007_findgirl_limit_taskID)
	local ndate = xmas2007_findgirl_returndate()
	if ntaskdate ~= ndate then
		SetTask(xmas2007_findgirl_limit_taskID,ndate)
		SetTask(xmas2007_findgirl_taskID,0)
	end
	if GetTask(xmas2007_findgirl_taskID) == 4 then
		CreateTaskSay({"<dec><npc>Xin ®a t¹, c¸c tû muéi ®· ®«ng ®ñ ë ®©y råi, hÑn gÆp lÇn sau nhĞ!","Tho¸t ra/NoChoice"})
		return		
	end
	if GetTask(xmas2007_findgirl_taskID) ~= 0 then
		CreateTaskSay({"<dec><npc>H·y mau ®i t×m thiÕu n÷ thÇn bİ.","Tho¸t ra/NoChoice"})
		return
	end
		SetTask(xmas2007_findgirl_taskID,1)
		CreateTaskSay({"<dec><npc>H·y gióp ta t×m §«ng Nhi vÒ ®©y!","Tho¸t ra/NoChoice"})
end

function xmas2007_findgirl_checktime()
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	if ndate < 07120800 or ndate > 08011324 then
		return 0
	end	
	
	local nhm = tonumber(GetLocalDate("%H%M"))
	if nhm >= 800 and nhm < 920 then
		return 1
	elseif nhm >= 1500 and nhm < 1620 then
		return 1
	elseif nhm >= 2200 and nhm < 2320 then
		return 1
	else
		return 0
	end
end
