
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonline Ò°ÛÅÕÙ»½µÀ¾ß ¡ª¡ª¡ª Å®¶ùºì
-- Edited by peres
-- 2006/12/26 PM 15:39

-- æÌÊ¦½ãÎªÎÒ´©ÉÏÒÂ·şÊ±Í»È»Ğ¦×ÅËµµÀ£¬ÃÃÃÃ³öÂäµÃÔ½À´Ô½Ë®ÁéÁË¡£
-- ²»¶®ÕâÏÉÅ®°ãµÄÓñÌåÒÔºó»áÍĞ¸¶¸øÄÄ¸öÄĞÈËÄØ¡£
-- Å®×Ó³¤´óÒÔºóÒ»¶¨»á½«Éí×ÓÍĞ¸¶¸øÄĞÈËÂğ£¿ÎÒµÄÁ³Î¢Î¢ÕÇºìÁËÒ»ÏÂ¡£
-- æÌÊ¦½ãÍäÏÂÑü°ïÎÒ°ÑÈ¹´øÊøºÃ£¬ËıËµ£¬ÊÇµÄ¡£
-- ÒòÎª£¬ÕâÊÇÅ®×ÓÒ»ÉúµÄËŞÃü¡£

-- ======================================================

-- ÈÎÎñÏµÍ³¿âÖ§³Ö
IncludeLib("TASKSYS");

Include("\\script\\global\\forbidmap.lua");

function main()

	local subworld, x, y = GetWorldPos();
	local mapindex = SubWorldID2Idx(subworld);
	local mapname = SubWorldName(mapindex);	
		
	-- ·ÇÕ½¶·×´Ì¬²»ÄÜÊ¹ÓÃ
	if GetFightState()==0 then
		Say("VËt phÈm nµy chØ cã thÓ sö dông ë c¸c khu vùc luyÖn c«ng vµ chiÕn ®Êu!", 0);
		return 1;
	end;
	
	if CheckAllMaps(subworld)==1 then
		Say("VËt phÈm nµy chØ cã thÓ sö dông ë c¸c khu vùc luyÖn c«ng vµ chiÕn ®Êu!", 0);
		return 1;
	end;
	
	-- Ò°ÛÅµÄÀàĞÍ£¬1ÎªÆÕÍ¨µÄ£¬2Îª½ÏÇ¿µÄ
	local nBossType = random(1,2);	
	
	-- Ò°ÛÅµÄÍ·ÏÎ
	local aryBossTitle = {
		[1] = {"nghØ ng¬i",
			   "l¬ ®·ng",
			   "l­êi biÕng",},
			   
		[2] = {"phÉn né",
			   "hung ¸c",
			   "linh ho¹t",},	
	}
	
	local nBossIndex  = {
			[1]=1237,
			[2]=1238,
		}

	local nNpcIndex	 = AddNpcEx(nBossIndex[nBossType],
					95,
					random(0,4),
					mapindex,
					x*32, -- ¼ÆËã X Æ«ÒÆ
					y*32, -- ¼ÆËã Y Æ«ÒÆ
					1,
					" ("..aryBossTitle[nBossType][random(1,getn(aryBossTitle[nBossType]))]..") D· TÈu",
					1);
		
		SetNpcScript(nNpcIndex, "\\script\\global\\seasonnpc_death.lua");
		
		Msg2SubWorld("Ng­êi ch¬i <color=yellow>"..GetName().."<color> ®ang <color=green>"..mapname.."<color> cïng D· TÈu thao luyÖn vâ nghÖ!");
		
		return 0;
end;

