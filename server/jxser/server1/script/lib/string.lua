--========ÎÄ¼ş¶¨Òå==================================--
--ÎÄ¼şÃû£ºstring.lua
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2004-6-1
--×îºóĞŞ¸ÄÈÕÆÚ£º2005-1-24
--¹¦ÄÜĞğÊö£º
--	À©Õ¹luaÎ´Ìá¹©µÄ×Ö·û´®´¦Àíº¯Êı
--
--ÓÎÏ·½Å±¾¡¤½£ÏÀÇéÔµÍøÂç°æ
--½ğÉ½Èí¼ş¹É·İÓĞÏŞ¹«Ë¾£¬copyright 1992-2005
--==================================================--

if not STRING_HEAD then
STRING_HEAD = 1


--ÒÔÏÂÈı¸öº¯Êı£¨replace()¡¢split()¡¢join()£©´æÔÚÒ»Ğ©±×¶Ë£¬¹Êcommon.luaÖĞÖØĞÂ¶¨ÒåÁËÈı¸öÍ¬Ãûº¯Êı
--ÎªÁË±ÜÃâ±¾ÎÄ¼ş½«common.luaÖĞµÄº¯Êı¸²¸Çµô£¬¼ÓÉÏÁË´ËÌõ¼şÅĞ¶Ï
--by fanzai	2005-12-28 20:46
-- if (not COMMON_HEAD) then
if (1) then

--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£ºreplace(str,pattern,s)
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-1-27
--×îºóĞŞ¸ÄÈÕÆÚ£º2005-1-27
--¹¦ÄÜĞğÊö£º
--	ÓÃ×Ö·û´®sÌæ»»×Ö·û´®strÖĞµÄpattern
--²ÎÊı£º
--	str£ºÔ´×Ö·û´®n
--	pattern£ºÒªÌæ»»µÄ×Ö·û´®
--	s£ºÌæ»»patternµÄ×Ö·û´®
--·µ»ØÖµ£º
--	Ìæ»»ºóµÄ×Ö·û´®¡£
--ÓÃÀı£º
--	ÎŞ
--==================================================--
function replace(str,pattern,s)
	/*
	local startS,endS = strfind(str,pattern)
	while(startS) do
		str = strsub(str,1,startS-1)..s..strsub(str,endS+1,strlen(str))
		startS,endS = strfind(str,pattern)
	end
	return str
	*/
	PushString(str)
	ReplaceString(pattern, s)
	return PopString()
end
--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£ºsplit(str,splitor)
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2004-6-1
--×îºóĞŞ¸ÄÈÕÆÚ£º2004-6-1
--¹¦ÄÜĞğÊö£º
--	°Ñ×Ö·û´®strÓÃ·ÖÁÑ·ûsplitor·ÖÁÑ³ÉÊı×éĞÎÊ½
--²ÎÊı£º
--	str£º±»·ÖÁÑµÄ×Ö·û´®
--	splitor£º·ÖÁÑ·û,Èç¹û¸Ã²ÎÊıÃ»ÓĞ£¬Ä¬ÈÏÎª£¢,£¢
--·µ»ØÖµ£º
--	±»·ÖÁÑµÄÊı×é£®Èç¹û×Ö·û´®strÖĞÃ»ÓĞ°üº¬·ÖÁÑ·ûsplitor£¬
--Ôò·µ»ØµÄÊı×éÖ»ÓĞ£±¸öÔªËØ£¬ÔªËØÄÚÈİ¾ÍÊÇstr±¾Éí£®
--ÓÃÀı£º
--	local s = "aaa,bbb,ccc,ddd"
--	local arr = splite(s,",")
--	Ôò£¬arrµÄÄÚÈİÎª£º
--	arr[1]£ºaaa
--	arr[2]£ºbbb
--	arr[3]£ºccc
--	arr[4]£ºddd
--==================================================--
function split(str,splitor)
	if(splitor==nil) then
		splitor=","
	end
	local strArray={}
	local strStart=1
	local splitorLen = strlen(splitor)
	local index=strfind(str,splitor,strStart)
	if(index==nil) then
		strArray[1]=str
		return strArray
	end
	local i=1
	while index do
		strArray[i]=strsub(str,strStart,index-1)
		i=i+1
		strStart=index+splitorLen
		index = strfind(str,splitor,strStart)
	end
	strArray[i]=strsub(str,strStart,strlen(str))
	return strArray
end

--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£ºjoin(arr,insertor)
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2004-6-1
--×îºóĞŞ¸ÄÈÕÆÚ£º2005-1-24
--¹¦ÄÜĞğÊö£º
--	°ÑÒ»Î¬Êı×éarrÄÚµÄÔªËØÄÚÈİÓÃinsertorÁ¬½ÓÆğÀ´£¬arrµÄ
--ÔªËØ×îºÃÎª×Ö·û´®ÀàĞÍ£¬Êı×ÖÀàĞÍÒ²¿ÉÒÔ£®
--²ÎÊı£º
--	arr£º±»Á¬½ÓµÄÊı×é
--	insertor£º²åÈë·û£¬¸Ã²ÎÊıÃ»ÓĞ£¬Ä¬ÈÏ²åÈë·ûÎª£¢,£¢
--·µ»ØÖµ£º
--	·µ»ØÁ¬½ÓÖ®ºóµÄ×Ö·û´®£®Èç¹ûarrÃ»ÓĞÈÎºÎÔªËØ£¬Ôò·µ»Ø
--nil£®
--ÓÃÀı£º
--	local sarr = {"a","b","c","d"}
--	local s = join(sarr,",")
--	Ôò£ºsµÄ½á¹ûÎª
--	s£º"a,b,c,d"
--==================================================--
function join(tb, str_sep)
	if (not str_sep) then
		str_sep = ","
	end
	local str = ""
	if (getn(tb) > 0) then
		PushString(tb[1])
		for i = 2, getn(tb) do
			AppendString(str_sep)
			AppendString(tb[i])
		end
		str = PopString()
	end
	return str
end

end	--if (not COMMON_HEAD) then

--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£ºtrim(str)
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2004-6-1
--×îºóĞŞ¸ÄÈÕÆÚ£º2005-1-24
--¹¦ÄÜĞğÊö£º
--	É¾³ı×Ö·û´®strÁ½¶ËµÄ¿Õ°×·ûºÅ£¬Èç¹ûÃ»ÓĞ¿Õ°×·ûºÅ£¬Ôò
--²»É¾³ı£®
--²ÎÊı£º
--	str£º±»É¾³ı¿Õ°×·ûºÅµÄ×Ö·û´®
--·µ»ØÖµ£º
--	±»É¾³ıÁË¿Õ°×·ûµÄ×Ö·û´®
--ÓÃÀı£º
--	local s = "   dddd     "
--	s = trim(s)
--	Ôò£¬sµÄ½á¹ûÎª£º
--	s£º"dddd"
--==================================================--
function trim(str)
	/*
	local start,last = strfind(str,"%S+.*%S+")
	print(tostring(start).."|"..tostring(last))
	if(start==nil or last==nil) then
		return str
	end
	return strsub(str,start,last)
	*/
	PushString(str)
	TrimString()
	return PopString()
end

---RGBÊı×Ö×ª»»³É16½øÖÆ±íÊ¾µÄ×Ö·û´®
function toColor(r,g,b)
	if(not tonumber(r)) then r=0 end
	if(not tonumber(g)) then g=0 end
	if(not tonumber(b)) then b=0 end
	if(r<0) then r=0 end
	if(g<0) then g=0 end
	if(b<0) then g=0 end
	if(r>255) then r=255 end
	if(g>255) then g=255 end
	if(b>255) then b=255 end
	return r*65536+g*256+b
end
-------------------------------------

---½«ÎåĞĞÊıÖµ×ª»»³É²ÊÉ«ÎåĞĞºº×Ö
SERIESWORD = {
	{ "Kim",	"metal"	},
	{ "Méc",	"wood"	},
	{ "Thñy ",	"water"	},
	{ "Háa",	"fire"	},
	{ "Thæ ",	"earth"	}
}

function toSeriesColorText(text, sno)
	if (sno < 0 or sno >= getn(SERIESWORD)) then
		return text;
	else
		return "<color="..SERIESWORD[sno+1][2]..">"..text.."<color>";
	end
end

function toSeries(sno, bUnColorful)
	if(not tonumber(sno)) then return "error" end
	if(sno < 0 or sno > 4) then return "V« hÖ " end
	if (bUnColorful == 1) then
		return SERIESWORD[sno+1][1];
	else
		return toSeriesColorText(SERIESWORD[sno+1][1], sno);
	end
end
------------------------------

---½«µÈ¼¶Êı×Ö×ª»»³É²ÊÉ«µÈ¼¶ºº×Ö
LEVELWORD = {
	"<color="..toColor(200,200,200).."> cÊp1 <color>",
	"<color="..toColor(0,200,0).."> cÊp2 <color>",
	"<color="..toColor(200,0,0).."> cÊp3 <color>",
	"<color="..toColor(200,0,200).."> cÊp4 <color>",
	"<color="..toColor(200,200,0).."> cÊp5 <color>",
	"<color="..toColor(0,0,255).."> cÊp6 <color>",
	"<color="..toColor(0,255,0).."> cÊp7 <color>",
	"<color="..toColor(255,0,0).."> cÊp8 <color>",
	"<color="..toColor(255,0,255).."> cÊp9 <color>",
	"<color="..toColor(255,255,0).."> cÊp10 <color>",	
}

function toLevel(lvl)
	if(not tonumber(lvl)) then return "error" end
	if(lvl < 0 or lvl > 10) then return "Ch­a biÕt" end
	return LEVELWORD[lvl]
end
---------------------------------

function transferDigit2CnNum(nDigit)
	local tbModelUnit = {
		[1]	= "",
		[2]	= " v¹n",
		[3] = " tr¨m triÖu", 	
	};
	
	local nDigitTmp = nDigit;	-- ÁÙÊ±±äÁ¿,
	local n4LenNum	= 0;		-- Ã¿Ò»´Î¶ÔnDigitÈ¡4Î»²Ù×÷,n4LenNum±íÊ¾È¡³öÀ´µÄÊıµÄÖµ
	local nPreNum	= 0;		-- ¼ÇÂ¼Ç°Ò»´Î½øĞĞÈ¡4Î»²Ù×÷µÄn4LenNumµÄÖµ
	local szCnNum	= "";		-- ¾ÍÊÇËùÒªÇóµÄ½á¹û
	local szNumTmp	= "";		-- ÁÙÊ±±äÁ¿,Ã¿È¡ËÄÎ»µÄ²Ù×÷ÖĞµÃµ½µÄÖĞÎÄÊı×Ö
	
	if (nDigit == 0) then
		szCnNum = "0";
		return szCnNum;
	end

	if (nDigit < 0) then
		nDigitTmp = -nDigit;
	end
	
	-- ·Ö±ğ´Ó¸ö,Íò,ÒÚÈı¶Î¿¼ÂÇ,ÒòÎªnDigitµÄÖµĞ¡ÓÚ1ÍòÒÚ,ËùÒÔÃ¿Ò»¶Î¶¼²»³¬¹ı4Î»
	for i = 1, getn(tbModelUnit) do
		szNumTmp	= "";
		n4LenNum	= mod(nDigitTmp , 10000);
		if (n4LenNum ~= 0) then
			--szNumTmp = transfer4LenDigit2CnNum(n4LenNum);					-- µÃµ½¸ÃËÄÎ»µÄÖĞÎÄ±í´ïÊ½
			szNumTmp = n4LenNum
			szNumTmp = szNumTmp..tbModelUnit[i];								-- ¼ÓÉÏµ¥Î»
		end
		szCnNum	= szNumTmp..szCnNum;
		
		nPreNum	= n4LenNum;
		nDigitTmp = floor(nDigitTmp / 10000);
		if (nDigitTmp == 0) then
			break;
		end
	end
	if (nDigit < 0) then
		szCnNum = "-"..szCnNum;
	end
	return szCnNum;
end

end
