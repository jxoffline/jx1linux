-- Î÷É½´å ²»ĞÑÈËÊ¿ ¶Ô»°½Å±¾
-- ÀîĞÀ 2005-01-25

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\xishancun\\xishancun_head.lua")

COUNT_SHENMI_JUANZHOU = 100;

function main()
--	Uworld1064 = nt_getTask(1064) --Î÷É½´åÎ÷É½ÓìÈÎÎñ
--	
--	if ( GetLevel() >= 100) then
--	
--		if ( Uworld1064 == 0 ) then	-- ½ÓÈÎÎñÇ°¶Ô»°
--			Describe(DescLink_BuXingRenShi.."<#>£ºÌÇºùÂ«£¬ºÃ³ÔµÄÌÇºùÂ«À²£¡±ãÒËÓÖºÃ³ÔµÄÌÇºùÂ«À²£¬ÕâÎ»¿Í¹Ù£¬¿´ÄãºÜÃæÉú£¬²»ÊÇÎÒÃÇÎ÷É½´åµÄÈË°É£¡À´´®ÌÇºùÂ«°É£¿<enter>",
--			2,"ÏòËû´òÌ½Î÷É½ÓìµÄÃØÃÜ/task002","»¹ÊÇÀ´´®ÌÇºùÂ«°É/task001");
--		elseif ( Uworld1064 == 1 ) then	--½ÓÈÎÎñºó¶Ô»°
--			Describe(DescLink_BuXingRenShi..format("<#>£º%d¸öÉñÃØ¾íÖáÄãÒÑ¾­ÊÕ¼¯ÆëÁËÂğ£¿<enter>", COUNT_SHENMI_JUANZHOU),
--			2,"½«ÉñÃØ¾íÖá½»¸ø²»ĞÑÈËÊ¿/task004","ÎÒ»¹ÊÇ¹ıÕó×ÓÔÙÀ´ÕÒÄã/no")
--		elseif ( Uworld1064 >= 2 ) then  --ÒÑ¾­Íê³ÉÈÎÎñ
--			Say("²»ĞÑÈËÊ¿£ºÄãÈ¥Î÷É½Óìºó£¬Ò»¶¨Òª´¦´¦ÁôĞÄÑ½¡£",0)
--		end;
--		
--	else
		Describe(DescLink_BuXingRenShi.."<#>: Hå l« ngät rÎ ®©y! VŞ kh¸ch quan nµy nh×n l¹ mÆt nhØ? Ch¾c kh«ng ph¶i ng­êi th«n T©y S¬n chóng ta. Mua mét x©u hå l« ®i!<enter>",
		1,"Mua kÑo hå l« /task001");
--	end

end;

function task001()
	local name = GetName()
	Talk(1,"",name..": X©u kÑo hå l« nµy ngon qu¸ ®i!")
end;
function task002()
	local name = GetName()
	Describe(DescLink_BuXingRenShi.."<#>: Ng­¬i t×m ta cã viÖc g× kh«ng vËy?<enter>"
				..name..format("<#>: GÇn ®©y ta nghe nãi cã ng­¬i cã biÕt ®Õn vŞ trİ cña T©y S¬n §¶o. Cã thÓ chØ ta c¸ch ®i Vi S¬n §¶o ®­îc kh«ng?<enter>BÊt  TØnh Nh©n Sü: LÏ nµo ng­êi trong th«n nhiÒu ng­êi biÕt thÕ sao, xem ra chuyÖn nµy ®· bŞ lé ra ngoµi giang hå råi. ChØ cã ®iÒu ®©y lµ viÖc cña hµng chôc n¨m tr­íc, ®¹i hiÖp ph¶i thu thËp ®ñ %d mËt ®å thÇn bİ cho ta th× ta míi nhí l¹i ®­îc<enter>", COUNT_SHENMI_JUANZHOU),
				2,"§­îc! Ta sÏ ®i t×m ngay/task003","Ta kh«ng høng thó tİ nµo/no")
end;

function	task003()
	Uworld1064 = nt_getTask(1064)
	nt_setTask(1064,1)
end;

-- ÉñÃØ¾íÖá½»¸¶½çÃæ
function	task004()
GiveItemUI( "Giao diÖn giao MËt ®å", format("BÊt TØnh Nh©n Sü: Ng­¬i h·y bá %d mËt ®å thÇn bİ vµo « trèng bªn d­íi. Chó ı: NÕu nh­ bá nhiÒu hay İt h¬n sè l­îng %d mËt ®å thÇn bİ ta sÏ kh«ng nhËn ®©u.", COUNT_SHENMI_JUANZHOU,COUNT_SHENMI_JUANZHOU), "juanzhou", "no" );
end;

-- È·¶¨ÉñÃØ¾íÖáÊıÁ¿º¯Êı
function juanzhou(ncount)
	Uworld1064 = nt_getTask(1064)
	local scrollarray = {}
	local scrollcount = 0
	local scrollidx = {}
	local y = 0
	for i=1, ncount do
		local nItemIdx = GetGiveItemUnit(i);
		itemgenre, detailtype, parttype = GetItemProp(nItemIdx)
		if (itemgenre == 6 and detailtype == 1 and parttype ==196) then	
			y = y + 1
			scrollidx[y] = nItemIdx;
			scrollarray[i] = GetItemStackCount(nItemIdx)
			scrollcount = scrollcount + scrollarray[i]
		end
	end
	if (y ~= ncount) then
		Say("MËt ®å thÇn bİ ch­a ®ñ, ng­¬i h·y kiÓm tra l¹i xem!", 2, "µ! Th× ra ®Æt nhÇm ®Ó ta thö l¹i./task004", "§Ó ta kiÓm tra xem sao/no")
		return
	end
	if (scrollcount > COUNT_SHENMI_JUANZHOU) then
		Say(format("Ta chØ cÇn %d MËt §å ThÇn Bİ, ng­¬i ®õng ®­a cho ta nhiÒu nh­ vËy.", COUNT_SHENMI_JUANZHOU), 2, "µ! Th× ra ®Æt nhÇm ®Ó ta thö l¹i./task004", "§Ó ta kiÓm tra xem sao/no")
		return
	end
	if (scrollcount < COUNT_SHENMI_JUANZHOU) then
		Say("MËt ®å thÇn bİ ng­¬i giao cho ta kh«ng ®ñ th× ph¶i, kiÓm tra l¹i xem!", 2, "µ! Th× ra ®Æt nhÇm ®Ó ta thö l¹i./task004", "§Ó ta kiÓm tra xem sao/no")
		return
	end
	if (scrollcount == COUNT_SHENMI_JUANZHOU) then
		for i = 1, y do
			RemoveItemByIndex(scrollidx[i])
		end
		nt_setTask(1064,2)
		task005()
	end;		
end;
	
function task005()
	local name = GetName()
	Describe(DescLink_BuXingRenShi..format("<#>: ThËt kh«ng ngê ng­êi ®· thu thËp %d mËt ®å thÇn bİ, ta cø ®inh ninh lµ ng­¬i thÊy khã vµ bá ®i råi chø. T©y S¬n §¶o nguy hiÓm kh«n cïng, ng­¬i kh«ng ®i th× tèt h¬n.<enter>",COUNT_SHENMI_JUANZHOU)
	..name..format("<#>: Ng­¬i ®õng lo l¾ng cho ta, ta ®· t×m ®ñ %d mËt ®å thÇn bİ råi, ta ®­êng ®­êng lµ mét ®¹i tr­îng phu sao l¹i ®i sî c¸i Vi S¬n §¶o bĞ tİ ®ã ®­îc. Ng­¬i cø chØ cho ta c¸ch ®i Vi S¬n §¶o ®i.<enter>BÊt TØnh Nh©n Sü: Xem ra ta kh«ng khuyªn gi¶i ®­îc ng­¬i. Ng­¬i cã thÓ t×m TiÓu NhŞ ë T©y S¬n (214, 195) trong th«n nµy vµ nãi h¾n lµ ta b¶o ng­êi ®i, h¾n sÏ biÕt nªn lµm thÕ nµo.  Nhí lµ ph¶i hÕt søc cÈn thËn nhĞ!<enter>",COUNT_SHENMI_JUANZHOU),
	1,"KÕt thóc ®èi tho¹i/no")
	end;

function no()
end;
