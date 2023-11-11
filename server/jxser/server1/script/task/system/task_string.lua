
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonline ¶Ô»°×Ö·û´®´¦ÀíÎÄ¼ş
-- Edited by peres
-- 2005/09/01 PM 16:40

-- Ö»ÓĞËûºÍËıÁ½¸öÈË
-- ËûÃÇÏà°®
-- Ëı¼ÇµÃ
-- ËûµÄÊÖ¸§Ä¦ÔÚËıµÄÆ¤·ôÉÏµÄÎÂÇé
-- ËûµÄÇ×ÎÇÏñÄñÈºÔÚÌì¿ÕÂÓ¹ı
-- ËûÔÚËıÉíÌåÀïÃæµÄ±©ìåºÍ·Å×İ
-- ËûÈëË¯Ê±ºòµÄÑù×Ó³äÂú´¿Õæ
-- Ëı¼ÇµÃ£¬Çå³¿ËıĞÑ¹ıÀ´µÄÒ»¿Ì£¬ËûÔÚËıµÄÉí±ß
-- ËıÕö×ÅÑÛ¾¦£¬¿´Êï¹âÍ¸¹ı´°Á±Ò»µãÒ»µãµØÕÕÉä½øÀ´
-- ËıµÄĞÄÀïÒòÎªĞÒ¸£¶øÌÛÍ´

-- ======================================================


-- ×Ö·û´®´¦Àí¹¦ÄÜ¿â
Include("\\script\\lib\\string.lua");

-- Í¬°éÏµÍ³µÄÖ§³Ö
IncludeLib("PARTNER");

function TaskSay(caption, option)
	local str = caption;
	local strGenKey = strsub(str, 1, 5);
	if strGenKey=="<dec>" then
		str = strsub(str, 6, strlen(str));
		str = SetTaskSayColor(str);  -- ×ª»¯¹Ø¼ü×Ö
		Describe(str, getn(option), option)
	else
		str = SetTaskSayColor(str);  -- ×ª»¯¹Ø¼ü×Ö
		Say(str, getn(option), option)
	end;
end;

function TaskSayList(caption, ...)
	TaskSay(caption, arg)
end

-- ÓÃ´«½øÀ´µÄÎÄ×Ö¹¹ÔìÒ»¶Î¶Ô»°Êı×é²¢Ö´ĞĞ
function CreateTaskSay(tb)
	local option = {}
	for i = 2, getn(tb) do
		tinsert(option, tb[i])
	end
	TaskSay(tb[1], option)
end;

KEY_TASKSAY = {
	key_left 	= "{{",					-- "<color=yellow>" ¼ò»¯±êÊ¶
	key_right	= "}}",					-- "<color>" ¼ò»¯±êÊ¶
	key_sex		= "<sex>",				-- ĞÔ±ğ±êÊ¶
	key_pan		= "<pan>",				-- Í¬°éÍ¼ÏñÁ¬½Ó±êÊ¶
	key_npc		= "<npc>",				-- ¶Ô»°ÈËÎï NPC µÄÍ¼ÏñºÍĞÕÃûÁ¬½Ó±êÊ¶
	txt_left	= "<color=yellow>",
	txt_right	= "<color>"
}

-- ÓÃÓÚ´¦ÀíÎÄ±¾ÄÚµÄ¹Ø¼ü×Ö£¬Èç£ºĞÔ±ğ±êÊ¶¡¢Í¬°éÍ¼ÏñÁ¬½Ó±êÊ¶¡¢ÖØµãÑÕÉ«±êÊ¶µÈ¡£
function SetTaskSayColor(str)
	local strPan = CreatePartnerStringLink()
	local strNpc = CreateNpcStringLink()
	local strSex = GetPlayerSex();
				
	PushString(str)
	-- ´¦ÀíÖØµã±êÊ¶ÑÕÉ«
	ReplaceString(KEY_TASKSAY.key_left, KEY_TASKSAY.txt_left)
	ReplaceString(KEY_TASKSAY.key_right, KEY_TASKSAY.txt_right)	
	
	-- ´¦ÀíĞÔ±ğ±êÊ¶
	ReplaceString(KEY_TASKSAY.key_sex, strSex)
	
	-- ´¦ÀíÍ¬°é±êÊ¶
	ReplaceString(KEY_TASKSAY.key_pan, strPan)
	
	-- ´¦Àí NPC Ãû×Ö±êÊ¶
	ReplaceString(KEY_TASKSAY.key_npc, strNpc)

	return PopString()
end;


-- ÓÃÓÚ´¦ÀíÒ»¶ÑÑ¡ÏîµÄ¶Ô»°º¯Êı Say(""...);
function SelectSay(strSay)
	if (getn(strSay) < 2) then
		return
	end
	local caption = SetTaskSayColor(strSay[1])
	local option = {}
	for i = 2, getn(strSay) do
		tinsert(option, strSay[i])
	end
	Say(caption, getn(option), option)
end;


-- ÓÃÓÚ´¦ÀíÒ»¶ÑÑ¡ÏîµÄ Describe º¯Êı
function SelectDescribe(strSay)
	if (getn(strSay) < 2) then
		return
	end
	local caption = SetTaskSayColor(strSay[1])
	local option = {}
	for i = 2, getn(strSay) do
		tinsert(option, strSay[i])
	end
	Describe(caption, getn(option), option)
end


-- ×Óº¯Êı£¬ÓÃÓÚÀ©Õ¹¶Ô»° TALK º¯ÊıµÄ¹¦ÄÜ
function TalkEx(fun,szMsg)

	local num = getn(szMsg);
	local szmsg = "";
	PushString(szmsg)
	for i=1,num-1 do
		-- szmsg = szmsg..format("%q",szMsg[i])..",";
		AppendString(format("%q",szMsg[i]))
		AppendString(",")
	end;
	szmsg = PopString()
	szmsg = szmsg .. format("%q",SetTaskSayColor(szMsg[num]));
	szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")";
	dostring(szmsg);
	
end;


-- ¹¹ÔìÓÃÒÔ Describe Ãæ°æÏÔÊ¾µÄÍ¬°éÁ¬½ÓÍ¼Ïñ
function CreatePartnerStringLink()

local partnerindex,partnerstate = PARTNER_GetCurPartner()       -- »ñµÃÕÙ»½³öÍ¬°éµÄindex,Í¬°é×´Ì¬ÎªÕÙ³ö»òÎª²»ÕÙ³ö
local nSettingIdx = PARTNER_GetSettingIdx(partnerindex)         -- »ñÈ¡Í¬°éµÄÉèÖÃ ID

local strLink = "<#><link=image[0,8]:#npcspr:?NPCSID="..tostring(nSettingIdx).."?ACTION="..tostring(0)..">";

	if partnerindex<1 or partnerstate==0 then
		return "";
	end;

	-- ×îºó·µ»Ø´øÍ¬°éĞÕÃûµÄÍ¼ÏñÁ¬½Ó×Ö·û´®
	return strLink..PARTNER_GetName(partnerindex).."<link>: ";

end;


-- ¹¹ÔìÓÃÒÔ Describe Ãæ°æÏÔÊ¾µÄ NPC Á¬½ÓÍ¼Ïñ
function CreateNpcStringLink()

local nNpcIndex = GetLastDiagNpc();  -- µÃµ½×îºó¶Ô»°µÄ NPC INDEX

local nSettingIdx = GetNpcSettingIdx(nNpcIndex);  -- µÃµ½¸Ã NPC INDEX µÄ NPCS SETTINGS

local NpcName = GetNpcName(nNpcIndex);  -- µÃµ½´Ë NPC µÄĞÕÃû

local strLink = "<#><link=image[0,8]:#npcspr:?NPCSID="..tostring(nSettingIdx).."?ACTION="..tostring(0)..">";


	if nNpcIndex==0 or nNpcIndex==nil then
		return "";
	end;
	
	return strLink.."<<"..NpcName..">><link>: ";

end;


-- ×Óº¯Êı£¬ÓÃÒÔ»ñÈ¡Íæ¼ÒµÄĞÔ±ğ£¬Ö±½Ó·µ»Ø×Ö·û´®
function GetPlayerSex()

local mySex -- ÓÃÒÔÏÔÊ¾ÈËÎïĞÔ±ğµÄ×Ö·û

	if (GetSex() == 0) then
		mySex = "C«ng tö ";
	elseif (GetSex() == 1) then
		mySex = "N÷ hiÖp";
	end
	
	return mySex;
	
end;
