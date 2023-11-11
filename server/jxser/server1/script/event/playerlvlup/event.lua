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

SKILLS = {
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

--========Àà¶¨Òå====================================--
--ÀàÃû£ºEPlayerLevelUp
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-3-21
--×îºóĞŞ¸ÄÈÕÆÚ£º
--¹¦ÄÜĞğÊö£º
--	È«ÇøÈ«·şÍæ¼ÒÉÁµç³å¼¶»î¶¯µÄ¾ßÌå¹¦ÄÜ
--³ÉÔ±±äÁ¿£º
--³ÉÔ±º¯Êı£º
--.GiveTask()
--.PlayerLevelUp()
--==================================================--
EPlayerLevelUp = {
--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£º.GiveTask()
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-3-21
--×îºóĞŞ¸ÄÈÕÆÚ£º
--¹¦ÄÜĞğÊö£º
--	¸øÍæ¼Ò·¢ÉÁµç³å¼¶ÈÎÎñ
--==================================================--
	GiveTask = function()
		if not validateDate(DATESPLAYERLEVELUP,DATEEPLAYERLEVELUP) then
			Talk(1,"","Xin lçi! Thêi gian ho¹t ®éng ®· hÕt råi!")
			return
		end
		local flag = GetTask(TKID_PLAYERLEVELUP)
		if (flag == TKVAL_PLAYERLEVELUP_OPEN) then
			Talk(1,"","Cã ph¶i ng­¬i ®· b¸o danh tham gia 'Ho¹t ®éng luyÖn cÊp' kh«ng? Sao l¹i cßn ®Õn ®©y?")
			return
		end
		local level = GetLevel()
		if(	level > 49 and level < 71 ) then
			SetTask(TKID_PLAYERLEVELUP,TKVAL_PLAYERLEVELUP_OPEN)
			Talk(1,"","Ng­¬i ®· b¸o danh tham gia ho¹t ®éng luyÖn cÊp. Cè g¾ng th¨ng cÊp ®Õn cÊp 80 ®i!")
			Msg2Player("B¹n ®· tiÕp nhËn nhiÖm vô luyÖn cÊp, h·y mau ®i luyÖn c«ng!")
			return
		end
		Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n kh«ng phï hîp tham gia 'Ho¹t ®éng luyÖn cÊp'!")
		return
	end,
--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£ºEPlayerLevelUp.OnLevelUp()
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-3-21
--×îºóĞŞ¸ÄÈÕÆÚ£º
--¹¦ÄÜĞğÊö£º
--	²Î¼Ó»î¶¯µÄÍæ¼Ò£¬Ã¿ÉıÒ»¼¶£¬µÃµ½2Ğ¡Ê±¾­Ñé·­±¶
--==================================================--
	OnLevelUp = function ()
		if not validateDate(DATESPLAYERLEVELUP,DATEEPLAYERLEVELUP) then
			return
		end
		local level = GetLevel()
		local flag = GetTask(TKID_PLAYERLEVELUP)
		if(flag == TKVAL_PLAYERLEVELUP_OPEN) then
			if(level < 80 and level > 49 ) then
				EPlayerLevelUp.payDoubleExp()
				return	
			elseif(level == 80) then
				EPlayerLevelUp.payAdvSkills()
			end
		end
	end,
	
	payDoubleExp = function()
		AddSkillState(531,10,1,2*60*60*18)
		AddSkillState(461,1, 1,2*60*60*18)
		Msg2Player("Chóc mõng b¹n trong ch­¬ng tr×nh 'Ho¹t ®éng luyÖn cÊp' ®· ®­îc th¨ng cÊp, phÇn th­ëng hÖ thèng tÆng cho b¹n lµ t¨ng ®«i ®iÓm kinh nghiÖm trong 2 giê.")
	end,
	
	payAdvSkills = function()
		local faction = GetLastFactionNumber()
		if(faction ~= -1) then
			for i=1,getn(SKILLS[faction+1]) do
				AddMagic(SKILLS[faction+1][i][1],SKILLS[faction+1][i][2])
			end
			Msg2Player("Chóc mõng b¹n lÇn nµy t¹i 'Ho¹t ®éng luyÖn cÊp' thµnh c«ng hoµn thµnh nhiÖm vô, ®ång thêi häc ®­îc kü n¨ng cÊp 90")
			AddGlobalNews("Mäi ng­êi cïng nhau chóc mõng"..GetName().."Trong ch­¬ng tr×nh 'Ho¹t ®éng luyÖn cÊp' ®· thµnh c«ng hoµn thµnh nhiÖm vô, ®ång thêi l·nh ngé ®­îc kü n¨ng cÊp 90")
			return
		end
		Msg2Player("Chóc mõng b¹n trong ch­¬ng tr×nh 'Ho¹t ®éng luyÖn cÊp' thµnh c«ng hoµn thµnh nhiÖm vô.")
	end,
}

--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£ºPlayerLevelUp
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-3-21
--×îºóĞŞ¸ÄÈÕÆÚ£º
--¹¦ÄÜĞğÊö£º
--	Àñ¹Ù¿ªÆô»î¶¯µÄ¶Ô»°
--²ÎÊı£º
--·µ»ØÖµ£º
--ÓÃÀı£º
--==================================================--
function BTNPlayerLevelUp()
	local msg = "Hoan nghªnh tham gia 'Ho¹t ®éng luyÖn cÊp'. Ng­êi ch¬i cÊp 50 ®Õn cÊp 70 ®Òu cã thÓ b¸o danh tham gia, chØ cÇn trong thêi gian ho¹t ®éng ®¼ng cÊp t¨ng ®Õn cÊp 80, th× lËp tøc häc ®­îc c¸c kü n¨ng cÊp 90"
	local btns = {
		"Ta muèn b¸o danh tham gia/JoinPlayerLevelUp",
		"Ta muèn t×m hiÓu râ h¬n/AboutPlayerLevelUp"
	}
	Describe(LIGUAN_TAG(msg),getn(btns),btns)
end

--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£ºJoinPlayerLevelUp
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-3-21
--×îºóĞŞ¸ÄÈÕÆÚ£º
--¹¦ÄÜĞğÊö£º
--	±¨Ãû²Î¼Ó»î¶¯
--==================================================--
function JoinPlayerLevelUp()
	EPlayerLevelUp.GiveTask()
end

--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£ºAboutPlayerLevelUp()
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-3-21
--×îºóĞŞ¸ÄÈÕÆÚ£º
--¹¦ÄÜĞğÊö£º
--	¹ØÓÚ³å»÷»î¶¯µÄ½éÉÜ
--==================================================--
function AboutPlayerLevelUp()
	local msg = ": §¼ng cÊp tõ 50 ®Õn 70 (Bao gåm c¶ cÊp 50 vµ 70) cã thÓ ®Õn LÔ Quan b¸o danh tham gia 'Ho¹t ®éng luyÖn cÊp'. LÔ Quan sÏ h­íng dÉn môc tiªu c¸c nhiÖm vô 80. Trong thêi gian b¸o danh tham gia ®¼ng cÊp ng­êi ch¬i mçi khi lªn mét cÊp, cã thÓ nhËn t¨ng ®«i ®iÓm kinh nghiÖm trong 2 giê (Sau khi chÕt, sÏ mÊt ®i hiÖu qu¶ nh©n ®«i) , ®Õn khi ®¹t ®¼ng cÊp 80, sau khi ®· ®¹t ®­îc môc tiªu luyÖn cÊp, ng­êi ch¬i sÏ häc ®­îc kü n¨ng cÊp 90 (Trõ tªn mµu tr¾ng ra) ."
	local btns ={
		"Trë l¹i/BTNPlayerLevelUp",
		"§ãng/Quit",
	}
	Describe(LIGUAN_TAG(msg),getn(btns),btns)
end

