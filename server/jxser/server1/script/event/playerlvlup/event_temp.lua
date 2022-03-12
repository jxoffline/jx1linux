--========ÎÄ¼ş¶¨Òå==================================--
--ÎÄ¼şÃû£º/script/event/playerlvlup/event.lua
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-3-31
--×îºóĞŞ¸ÄÈÕÆÚ£º
--¹¦ÄÜĞğÊö£º
--	È«ÇøÈ«·şÉÁµç³å¼¶ĞĞ¶¯
--
--ÓÎÏ·½Å±¾¡¤½£ÏÀÇéÔµÍøÂç°æ
--½ğÉ½Èí¼ş¹É·İÓĞÏŞ¹«Ë¾£¬copyright 1992-2005
--==================================================--
if not EVENTHEAD_LUA then
	Include ("\\script\\event\\eventhead.lua")
end	

TKID_PLAYERLEVELUP = 1081	--ÈÎÎñ±äÁ¿±àºÅ£¬¼ÇÂ¼³å¼¶»î¶¯µÄ¸÷ÖÖ×´Ì¬
TKVAL_PLAYERLEVELUP_OPEN = 1 --²Î¼Ó³å¼¶»î¶¯

SKILLS_TEMP_90 = {
	{	{318,1},{319,1},{321,1}}, --ÉÙÁÖ
	{	{322,1},{323,1},{325,1}}, --ÌìÍõ
	{	{339,1},{302,1},{342,1},{351,0}}, --ÌÆÃÅ
	{	{353,1},{355,1},{390,0}}, --Îå¶¾
	{	{328,1},{380,1},{332,0}}, --¶ëáÒ
	{	{336,1},{337,1}}, --´äÑÌ
	{	{357,1},{359,1}}, --Ø¤°ï
	{	{361,1},{362,1},{391,0}}, --ÌìÈÌ
	{	{365,1},{368,1}}, --Îäµ±
	{	{372,1},{375,1},{394,0}}, --À¥ÂØ
}
function OnLevelUp_Temp()
	--¡°È«ÇøÉÁµç³å¼¶ĞĞ¶¯¡±»î¶¯£¬·²ÓĞÈÎÎñ¶¼¿ÉÒÔ×ÔÏ°µ½90¼¶¼¼ÄÜ£¬µ«²»ÄÜ»ñµÃ¾­Ñé·­±¶
	local flag = GetTask(TKID_PLAYERLEVELUP)
	if(flag ~= TKVAL_PLAYERLEVELUP_OPEN ) then
		return
	end
	
	local faction = GetLastFactionNumber()
	if(faction == -1) then
		return
	end
	
	local level = GetLevel()
	if ( level < 80) then
		return
	end
	
	local mark = 0
	for i=1,getn(SKILLS_TEMP_90[faction+1]) do
		if ( HaveMagic(SKILLS_TEMP_90[faction+1][i][1]) < SKILLS_TEMP_90[faction+1][i][2] ) then
			AddMagic(SKILLS_TEMP_90[faction+1][i][1],SKILLS_TEMP_90[faction+1][i][2])
			mark = mark + 1
		end
	end
	if (mark == 0) then
		return
	end
	Msg2Player("Chóc mõng b¹n lÇn nµy t¹i 'Ho¹t ®éng luyÖn cÊp' thµnh c«ng hoµn thµnh nhiÖm vô, ®ång thêi häc ®­îc kü n¨ng cÊp 90")
	return
end