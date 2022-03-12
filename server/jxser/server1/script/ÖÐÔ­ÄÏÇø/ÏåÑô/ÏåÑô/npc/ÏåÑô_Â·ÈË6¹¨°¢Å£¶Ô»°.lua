--ÖĞÔ­ÄÏÇø ÏåÑô¸® Â·ÈË6¹¨°¢Å£¶Ô»°


Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")


function main(sel)

i = random(0,2)
	Uworld1051 = nt_getTask(1051)
	if ( Uworld1051 ~= 0 ) then
		branch_taokan()
	else
		if (i == 0) then
			Say("Ra khái thµnh, ®i vÒ h­íng B¾c kh«ng xa chİnh lµ Vâ §ang s¬n.",0)
		return
		end;
		
		if (i == 1) then
			Say("Nghe nãi Ch­ëng m«n Vâ §ang Ph¸i lµ 1 ch©n nh©n ®¾c ®¹o. Kh«ng biÕt cã ph¶i sau khi ®¾c ®¹o sÏ ®­îc tr­êng sinh bÊt l·o?",0)
		return
		end;
		
		if (i == 2) then
			Say("NÕu kh«ng ph¶i v× ta cßn mÑ giµ ®· 80 tuæi, ta ®· sím lªn Vâ §ang s¬n b¸i s­ häc vâ tõ l©u!",0)
		end;
	end
end;

