-- FILE_LEVEL = "\\settings\\npc\\player\\level_exp.txt"
Include("\\script\\lib\\gb_modulefuncs.lua")
Include("\\script\\task\\task_addplayerexp.lua")  --¸øÍæ¼ÒÀÛ¼Ó¾­ÑéµÄ¹«¹²º¯Êý
Include("\\script\\lib\\file.lua")

TV_LAST_APPLY_TIME = 1571 -- ÉÏ´ÎÉêÇë´«¹¦Ê±¼ä
TV_CHUANGONG_TIMES = 1572 -- ÒÑ´«¹¦µÄ´ÎÊý
TV_CHUANGONG_EAT = 1573 --Ê¹ÓÃ´«¹¦µ¤µÄ´ÎÊý

IncludeLib("FILESYS")
IncludeLib("LEAGUE")
IncludeLib("SETTING")
tabLevelRate = 
{
{100,119,95},--100ÖÁ120¼¶£¬´«¹¦¾­ÑéÎª95%
{120,149,90},
{150,160,80},
}


function GetDesc(nItem)
	local nEndLevel = GetItemParam(nItem, 1);
	local nP2 = GetItemParam(nItem,2);
	local nP3 = GetItemParam(nItem,3);
	local nP4 = GetItemParam(nItem,4);
	local nRestExp = nP4
	nRestExp = SetByte(nRestExp, 3, GetByte(nP3,1))
	nRestExp = SetByte(nRestExp, 4, GetByte(nP3,2))
	nLevelFullExp = tl_getUpLevelExp(nEndLevel+ 1)
	local fPerc = format("%.2f", (nEndLevel)+(nRestExp/nLevelFullExp) )
	local str = "§¼ng cÊp Tiªn ®¬n:"..fPerc.."\n §©y lµ mét vÞ cao thñ cÊp <color=yellow>"..nEndLevel.." <color> víi toµn bé vâ c«ng m×nh hãa th©n thµnh tiªn d­îc, nh÷ng ng­êi d­íi cÊp 10 sau khi dïng sÏ t¨ng nhiÒu ®iÓm kinh nghiÖm! ";
	return str ..client_main(nEndLevel, nRestExp)
end

function main(nItem)
	if (gb_GetModule("TruyÒn c«ng") ~= 1) then
		Say("Xin lçi! Chøc n¨ng truyÒn c«ng ®· ®ãng l¹i, thêi gian më l¹i xem trang chñ ®Ó biÕt thªm th«ng tin!", 0)
		return 1
	end
	if (ST_IsTransLife() == 1 and GetLevel() < 80) then
		Say("Sau khi häc <B¾c §Èu Tr­êng Sinh ThuËt - T©m Ph¸p Thiªn> th× kh«ng thÓ sö dông Nguyªn ThÇn §¬n.", 0);
		return 1
	end;
	local nEndLevel = GetItemParam(nItem, 1);
	local nP2 = GetItemParam(nItem,2);
	local nNameId = GetItemParam(nItem,5)
	if (GetLevel() > 10 or GetLastFactionNumber() ~= -1) then
		Say("Xin lçi! B¹n ®· v­ît qu¸ cÊp 10 hoÆc ®· gia nhËp m«n ph¸i kh«ng thÓ sö dông Nguyªn ThÇn ®¬n!",0) 
		return 1
	elseif (LG_GetLeagueObjByRole(1,GetName())  ~= 0) then
		Say("Xin lçi! Ng­êi ch¬i cã quan hÖ s­ ®å kh«ng thÓ sö dông Nguyªn ThÇn ®¬n!",0)
		return 1
	end
	local nowday = tonumber(date("%y%m%d"))
	WriteLog(" [TruyÒn c«ng]:"..nowday.." Acc:"..GetAccount().."Role:"..GetName().." Sö dông thµnh c«ng Nguyªn ThÇn ®¬n! Item: Level:"..nEndLevel.." Exp:"..nP2.." ItemParam5:"..nNameId)
	server_main(nEndLevel, nP2)
end
--Itemparam1 Ô´Íæ¼Ò½µ¼¶Ç°µÄµÈ¼¶
--ItemParam2 Ô´Íæ¼Ò½µ¼¶Ç°µÄ¾­Ñé
--ItemParam3 Ô´Íæ¼Ò½µ¼¶Ç°µÄÊ£ÓÚ¾­Ñé¸ßWord
--ItemParam4 Ô´Íæ¼Ò½µ¼¶Ç°µÄÊ£ÓÚ¾­ÑéµÍWord

function client_main(nEndLevel, nRestExp)
	if (nEndLevel < 80 or nEndLevel > 200) then
		return 
	end
	if (nRestExp < 0) then
		nRestExp = 0
	end
	
	local str = ""
	local testlevel = 10;
	local testexp = 0;
	if (GetLevel() <= 10) then
		testlevel = GetLevel();
		testexp = GetExp();
		level, restexp = exp_clt_levelup(nEndLevel, GetLevel(), GetExp(), nRestExp)
		local fullexp = tl_getUpLevelExp(level+1) --±¾µÈ¼¶Éý¼¶ÐèÒªµÄ¾­Ñé×î´óÖµ
		local nPerc = floor((restexp/fullexp)*100)
		str = "\n<color=yellow>Sau khi sö dông cã thÓ th¨ng"..level.."cÊp vµ d­ "..nPerc.."%®iÓm kinh nghiÖm<color>";
	else
		level, restexp = exp_clt_levelup(nEndLevel, 10, 0, nRestExp)
		local fullexp = tl_getUpLevelExp(level+1) --±¾µÈ¼¶Éý¼¶ÐèÒªµÄ¾­Ñé×î´óÖµ
		local nPerc = floor((restexp/fullexp)*100)
		str = "\n<color=yellow> Nh©n vËt cÊp 10 cã thÓ th¨ng ®Õn"..level.."cÊp vµ d­ "..nPerc.."%®iÓm kinh nghiÖm<color> ";
	end
	return str
end

function gw_item(level,restexp)
	
	nIt = AddItem(6,1,12,1,0,0,0)
	SetItemMagicLevel(nIt, 1, level)
	SetItemMagicLevel(nIt, 2, restexp)

	m1 = GetByte(restexp, 3)
	m2 = GetByte(restexp, 4)
	m = m1
	m = SetByte(m1, 2, m2)
	
	n1 = SetByte(restexp, 3,0)
	n =  SetByte(n1, 4, 0)

	SetItemMagicLevel(nIt, 3, m)
	SetItemMagicLevel(nIt, 4, n)
	print(m,n)
	SyncItem(nIt)
end

function server_main(level,exp)
	exp_svr_levelup(level,exp)
end

function exp_getRate(endlevel)
	local nRate = 0
	for j = 1, getn(tabLevelRate) do 
		if (endlevel >= tabLevelRate[j][1] and endlevel <= tabLevelRate[j][2] ) then
			nRate = tabLevelRate[j][3]
			return nRate
		end
	end
	return nRate
end

function exp_clt_levelup(endlevel, nowlevel, nowrestexp, restexp)
	if (endlevel > 200) then
		return
	end
	
	local lExp = 0;
	local nRate = exp_getRate(endlevel)
	
	if (nRate == 0) then
		return
	end
	-- LLG_ALLINONE_TODO_20070802
	local nleveladd = 80
	for j = 1, getn(tabLevelRate) do 
		if (endlevel >= tabLevelRate[j][1]) then
			nRate = tabLevelRate[j][3]
			local nlevelend = tabLevelRate[j][2]
			
			if ( tabLevelRate[j][2] >= (endlevel - 1) ) then
				nlevelend = endlevel - 1
			else
				nlevelend = tabLevelRate[j][2]
			end
			
			for i = nleveladd, nlevelend  do 
				--print("-----:add level:["..i.."->"..(i+1).."] exp:"..tonumber(GetTabFileData(FILE_LEVEL, i + 1, 2)).." nRate:"..nRate)
				lExp = floor(tl_getUpLevelExp(i + 1) * nRate / 100)
				nowlevel, nowrestexp = exp_addexp(nowrestexp, lExp, nowlevel)	
			end
			nleveladd = nlevelend + 1
		else
			break
		end
	end
	
	nowlevel, nowrestexp = exp_addexp(nowrestexp, restexp * nRate / 100, nowlevel)		
	return nowlevel, nowrestexp
end

function exp_svr_levelup(endlevel, restexp)
	if (endlevel > 200) then
		return
	end

	local lExp = 0;
	
	local nRate = exp_getRate(endlevel)
	if (nRate == 0) then
		return
	end
	-- LLG_ALLINONE_TODO_20070802
	local nleveladd = 80
	for j = 1, getn(tabLevelRate) do 
		if (endlevel >= tabLevelRate[j][1]) then
			nRate = tabLevelRate[j][3]
			local nlevelend = tabLevelRate[j][2]
			
			if ( tabLevelRate[j][2] >= (endlevel - 1) ) then
				nlevelend = endlevel - 1
			else
				nlevelend = tabLevelRate[j][2]
			end
			
			for i = nleveladd, nlevelend  do 
				--print("-----:add level:["..i.."->"..(i+1).."] exp:"..tonumber(GetTabFileData(FILE_LEVEL, i + 1, 2)).." nRate:"..nRate)
				lExp = floor(tl_getUpLevelExp(i + 1, 2)* nRate / 100)
				nowlevel, nowrestexp = exp_svr_addexp(lExp)	
			end
			nleveladd = nlevelend + 1
		else
			break
		end
	end
	
	exp_svr_addexp(restexp * nRate / 100)
	
	return nowlevel, nowrestexp
end

function exp_addexp(curexp, n_exp, curlel)--µ±Ç°×¼±¸Éý¼¶µÄÍæ¼ÒµÄ¾­Ñé¡¢ÐèÒªÔö¼ÓµÄ¾­Ñé¡¢µ±Ç°µÄµÈ¼¶;·µ»ØÖµÎªÉýµ½µÄµÈ¼¶¡¢²»¹»ÉýÏÂÒ»¼¶ËùÊ£µÄ¾­Ñé
	--print("addexp "..curexp..":"..n_exp)
	
	while( n_exp > 0 ) do
		local fullexp = tl_getUpLevelExp(curlel+1) --±¾µÈ¼¶Éý¼¶ÐèÒªµÄ¾­Ñé×î´óÖµ
		
		local needexp = fullexp - curexp --Êµ¼ÊÐèÒªµÄ¾­ÑéÖµ
	--	print(curexp .."/"..fullexp..":+"..n_exp)
		
		if (needexp <= n_exp) then --Èç¹û×ã¹»Éý±¾¼¶
			curlel= curlel + 1           --Éý¼¶
			n_exp = n_exp - needexp	    --¼ÆËã»¹Ê£¶àÉÙ¾­Ñé
			curexp = 0
	--		print("levelup:"..curlel)
		else
		   	return curlel , curexp + n_exp
		end
	end

	return curlel , curexp + n_exp 
	
end

function exp_svr_addexp(n_exp)
	tl_addPlayerExp(n_exp)
end