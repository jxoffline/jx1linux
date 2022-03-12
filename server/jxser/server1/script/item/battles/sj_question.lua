IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\item\\battles\\addmarshalpoint.lua")

function add462()
		level = random(2,10);
		AddSkillState(462, level, 0, 12 )	--Ôö¼ÓÍæ¼ÒÑªÁ¿
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> håi phôc sinh lùc trong nöa gi©y"..(level*500).."<#> ®iÓm")	
end


function add463()
		level = random(2,10);
		AddSkillState(463, level, 0, 12 )	--Ôö¼ÓÍæ¼ÒÄÚÁ¦
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> håi phôc néi lùc trong nöa gi©y"..(level*500).."<#> ®iÓm")	
end

function add464()
		level = random(1,10);
		AddSkillState(464, level, 0, 540 )	--Ôö¼ÓÍæ¼ÒÑªÁ¿³ÖĞø»Ö¸´
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> 30 gi©y håi phôc sinh lùc, håi phôc mçi nöa gi©y"..(level*100).."<#> ®iÓm")	
end

function add465()
		level = random(1,10);
		AddSkillState(465, level, 0, 540 )	--Ôö¼ÓÍæ¼ÒÄÚÁ¦³ÖĞø»Ø¸´
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> 30 gi©y håi phôc néi lùc, håi phôc mçi nöa gi©y"..(level*100).."<#> ®iÓm")	
end

function add466()
		level = random(1,4);
		AddSkillState(466, level, 0, 1080 )
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> 1 phót gi¶m thä th­¬ng"..(level*10).."<#> %")	
end

function add467()
		level = random(1,4);
		AddSkillState(467, level, 0, 1080 )	--Íæ¼Ò»ñµÃÖĞ¶¾Ê±¼ä¼õÉÙ
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> 1 phót gi¶m thêi gian tróng ®éc:"..(level*10).."<#> %")	
end

function add468()
		level = random(1,4);
		AddSkillState(468, level, 0, 1080 )
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> 1 phót gi¶m thêi gian lµm chËm:"..(level*10).."<#> %")	
end

function add469()
		level = random(1,4);
		AddSkillState(469, level, 0, 1080 )	--Íæ¼Ò»ñµÃÑ£ÔÎÊ±¼ä¼õÉÙ
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> 1 phót gi¶m thêi gian bŞ cho¸ng:"..(level*10).."<#> %")	
end

function add471()
		level = random(2,10);
		AddSkillState(471, level, 0, 12 )	--Ôö¼ÓÍæ¼ÒÑªÁ¿ºÍÄÚÁ¦
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> håi phôc sinh lùc trong nöa gi©y"..(level*500).."<#> ®iÓm vµ håi phôc néi lùc trong nöa gi©y"..(level*500).."<#> ®iÓm")	
end

function add472()
		level = random(1,10);
		AddSkillState(472, level, 0, 540 )	--Ôö¼ÓÍæ¼ÒÑªÁ¿ºÍÄÚÁ¦³ÖĞø»Ö¸´
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> 30 gi©y håi phôc sinh lùc, håi phôc mçi nöa gi©y"..(level*100).."<#> ®iÓm vµ 30 gi©y håi phôc néi lùc, håi phôc mçi nöa gi©y"..(level*100).."<#> ®iÓm")	
end

function add473()
		level = random(1,7);
		AddSkillState(473, level, 0, 1080 )	--Ôö¼ÓÍæ¼ÒÆÕ·À
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> t¨ng phßng phæ trong 1 phót"..(level*10).."<#> %")	
end

function add474()
		level = random(1,7);
		AddSkillState(474, level, 0, 1080 )	--Ôö¼ÓÍæ¼Ò¶¾·À
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> t¨ng phßng ®éc trong 1 phót"..(level*10).."<#> %")	
end

function add475()
		level = random(1,7);
		AddSkillState(475, level, 0, 1080 )	--Ôö¼ÓÍæ¼Ò±ù·À
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> t¨ng phßng b¨ng trong 1 phót"..(level*10).."<#> %")	
end

function add476()
		level = random(1,7);
		AddSkillState(476, level, 0, 1080 )	--Ôö¼ÓÍæ¼Ò»ğ·À
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> t¨ng phßng háa trong 1 phót"..(level*10).."<#> %")	
end

function add477()
		level = random(1,7);
		AddSkillState(477, level, 0, 1080 )	--Ôö¼ÓÍæ¼ÒÀ×·À
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> t¨ng phßng l«i trong 1 phót"..(level*10).."<#> %")	
end

function add478()
		level = random(1,4);
		AddSkillState(478, level, 0, 1080 )	--Ôö¼ÓÍæ¼ÒÈ«¿¹
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> t¨ng kh¸ng tİnh trong 1 phót"..(level*10).."<#> %")	
end

function add479()
		level = random(10,20);
		AddSkillState(479, level, 0, 1080 )	--Ôö¼ÓÍæ¼ÒÄÚÆÕÉËº¦
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> s¸t th­¬ng vËt lı néi c«ng trong 1 phót t¨ng:"..(level*10).."<#> ®iÓm")	
end

function add480()
		level = random(1,5);
		AddSkillState(480, level, 0, 1080 )	--Ôö¼ÓÍæ¼ÒÄÚ¶¾ÉËº¦
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> §éc s¸t néi c«ng trong 1 phót t¨ng:"..(level*10).."<#> ®iÓm")	
end

function add481()
		level = random(10,20);
		AddSkillState(481, level, 0, 1080 )	--Ôö¼ÓÍæ¼ÒÄÚ±ùÉËº¦
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> B¨ng s¸t néi c«ng trong 1 phót t¨ng:"..(level*10).."<#> ®iÓm")	
end

function add482()
		level = random(10,20);
		AddSkillState(482, level, 0, 1080 )	--Ôö¼ÓÍæ¼ÒÄÚ»ğÉËº¦
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> Ho¶ s¸t néi c«ng trong 1 phót t¨ng:"..(level*10).."<#> ®iÓm")	
end

function add483()
		level = random(10,20);
		AddSkillState(483, level, 0, 1080 )	--Ôö¼ÓÍæ¼ÒÄÚÀ×ÉËº¦
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> L«i s¸t néi c«ng trong 1 phót t¨ng:"..(level*10).."<#> ®iÓm")	
end

function add485()
		level = random(1,5);
		AddSkillState(485, level, 0, 1080 )	--Ôö¼ÓÍæ¼ÒÍâ¶¾ÉËº¦
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> §éc s¸t ngo¹i c«ng trong 1 phót t¨ng:"..(level*10).."<#> ®iÓm")	
end

function add486()
		level = random(1,4);
		AddSkillState(486, level, 0, 1080 )	--Ôö¼ÓÍæ¼ÒÍâ±ùÉËº¦
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> B¨ng s¸t ngo¹i c«ng trong 1 phót t¨ng:"..(level*10).."<#> ®iÓm")	
end

function add487()
		level = random(5,10);
		AddSkillState(487, level, 0, 1080 )	--Ôö¼ÓÍæ¼ÒÍâÆÕÉËº¦°Ù·Ö±È
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> s¸t th­¬ng vËt lı ngo¹i c«ng trong 1 phót t¨ng "..(level*10).."<#> %")	
end

function add488()
		level = random(10,20);
		AddSkillState(488, level, 0, 1080 )	--Ôö¼ÓÍæ¼ÒÑªÁ¿ÉÏÏŞ
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7>møc sinh lùc trong 1 phót t¨ng:"..(level*100).."<#> ®iÓm")	
end

function add489()
		level = random(10,20);
		AddSkillState(489, level, 0, 1080 )	--Ôö¼ÓÍæ¼ÒÄÚÁ¦ÉÏÏŞ
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7>møc néi lùc trong 1 phót t¨ng:"..(level*100).."<#> ®iÓm")	
end

function add490()
		level = random(10,20);
		AddSkillState(490, level, 0, 540 )	--Ôö¼ÓÍæ¼ÒÑªÁ¿ºÍÄÚÁ¦ÉÏÏŞ
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> 30 gi©y møc néi lùc t¨ng::"..(level*100).."<#> ®iÓm vµ trong 30 gi©y møc néi lùc t¨ng:"..(level*100).."<#> ®iÓm")	
end

function add493()
		level = random(1,3);
		AddSkillState(493, level, 0, 1080 )	--Íæ¼Ò»ñµÃÔö¼ÓÅÜËÙ
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> t¨ng tèc ®é di chuyÓn trong 1 phót"..(level*10).."<#> %")	
end

function add495()
		level = random(10,20);
		AddSkillState(495, level, 0, 1080 )	--Íæ¼Ò»ñµÃÔö¼ÓÅÜËÙ
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> t¨ng søc m¹nh tÊn c«ng trong 1 phót"..(level*10).."<#> %")	
end

function add496()
		level = random(1,2);
		AddSkillState(496, level, 0, 1080 )	--Íæ¼Ò»ñµÃÔö¼ÓÅÜËÙ
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> t¨ng ®éng t¸c xuÊt chiªu trong 1 phót"..(level*10).."<#> %")	
end

Tab={add462,add463,add464,add465,add466,add467,add468,add469,add471,add472,add473,add474,add475,add476,add477,add478,add479,add480,add481,add482,add483,add485,add486,add487,add488,add489,add490,add493,add495,add496}

function IsPickable( nItemIndex, nPlayerIndex )
	return 1;
end

function PickUp( nItemIndex, nPlayerIndex )
	if( IsMyItem( nItemIndex ) ) then
		i = random(getn(Tab))
		Tab[i]();
		BT_SetData(PL_GETITEM, BT_GetData(PL_GETITEM) + 1);
		bt_addtotalpoint(BT_GetTypeBonus(PL_GETITEM, GetCurCamp()))
		checkbattlerule(BT_GetTypeBonus(PL_GETITEM, GetCurCamp()))
		BT_SortLadder();
		BT_BroadSelf();
		return 0;	-- É¾³ıÎïÆ·
	end
end

