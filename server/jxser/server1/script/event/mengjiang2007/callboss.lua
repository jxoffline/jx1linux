
--zero 20070712 ÕÙ»½boss

IncludeLib("NPCINFO")
IncludeLib("TASKSYS");
Include("\\script\\global\\forbidmap.lua");


--ÒÔÏÂµØÍ¼½ûÓÃ
ForbiddenMap = {44, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 326, 327, 328, 329, 330, 331, 334, 335, 337, 338, 339, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374}

--Boss	{ID,Name,Level,Series}
mengjiangBoss ={{562, "V« Danh §¹o Nh©n",95,4},--1 ÓñÅÆ
	{565, "V« Danh L·o Nh©n",95,3},--2
	{741, "V« Danh S¸t Thñ",95,1},--3
	{744, "V« Danh Mü Nh©n",95,2},--4
	{1284, "Kim Quang T­íng Qu©n",95,-1},--5 ½ğÅÆ
	{511, "Tr­¬ng T«ng Chİnh",95,4},--6 ÒøÅÆ
	{513, "DiÖu Nh­ ",95,2},--7
	{523, "LiÔu Thanh Thanh",95,1},--8
	{725,"Thñy tÆc ®Çu lÜnh",85,-1},--9 Í­ÅÆ
	{851, "Bé Hiªu TrÇn",20,-1},--10 ÒÔÏÂÊÇÄ¾ÅÆ
	{852, "KiÒu §Ønh Thiªn",30,-1},--11
	{853, "§iªu DŞch §ao",40,-1},--12
	{854, "T©y M«n V« Giíi",50,-1},--13
	{855, "HËu  KhÊt KiÕm",60,-1},--14
	{856, "øng  Tiªu Phong",70,-1},--15
	{857, "Viªn NiÖm TŞch",80,-1},--16
	{858, "Trö Thiªn MÉn",90,-1}--17
}

function CallBoss( lingpai  )
	local W,X,Y = GetWorldPos();
	local nMapId = W;
	if ( GetFightState() == 0 ) then	--·ÇÕ½¶·Çø½ûÓÃ
		Msg2Player("Kh«ng ë trong tr¹ng th¸i chiÕn ®Êu th× kh«ng thÓ sö dông");
		return 1
	end
	for i = 249, 318 do	--Ï´ËèµºÉ½¶´
		if ( i == nMapId ) then
			Msg2Player("N¬i ®©y kh«ng thÓ sö dông vËt phÈm nµy ");
			return 1
		end
	end	
	for i = 375, 415 do	--ĞÂÔöËÎ½ğÕ½³¡µØÍ¼ ËÍĞÅÈÎÎñµØÍ¼ ±ÈÎä´ó»áµØÍ¼
		if ( i == nMapId ) then
			Msg2Player("N¬i ®©y kh«ng thÓ sö dông vËt phÈm nµy ");
			return 1
		end
	end	
	for i = 1, getn( ForbiddenMap ) do		--ÌØÊâµØÍ¼½ûÓÃ
		if( ForbiddenMap[i] == nMapId ) then
			Msg2Player("N¬i ®©y kh«ng thÓ sö dông vËt phÈm nµy ");
			return 1
		end
	end
	
	if (CheckAllMaps(nMapId) == 1) then
		Msg2Player("TriÖu håi lÖnh bµi kh«ng thÓ sö dông t¹i khu vùc ®Æc thï nµy.");
		return 1
	end;
	if(lingpai == 1) then -- Ä¾ÅÆ
		i = random(10,17);	
		summonBoss(i);
		WriteLog(format("[TriÖu håi m·nh t­íng]\t%s\tAccount:%s\tName:%s\t%s sö dông thµnh c«ng",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"Méc Bµi"));
	 elseif(lingpai == 2 ) then--Í­ÅÆ
		summonBoss(9)
		WriteLog(format("[TriÖu håi m·nh t­íng]\t%s\tAccount:%s\tName:%s\t%s sö dông thµnh c«ng",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"§ång Bµi"));
	elseif(lingpai == 3 ) then --ÒøÅÆ
		i= random(6,8);
		summonBoss(i);
		WriteLog(format("[TriÖu håi m·nh t­íng]\t%s\tAccount:%s\tName:%s\t%s sö dông thµnh c«ng",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"Ng©n Bµi"));
	elseif(lingpai == 4) then --½ğÅÆ
		summonBoss(5);
		WriteLog(format("[TriÖu håi m·nh t­íng]\t%s\tAccount:%s\tName:%s\t%s sö dông thµnh c«ng",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"Kim Bµi"));
	elseif(lingpai == 5) then --ÓñÅÆ
		if( CalcFreeItemCellCount() < 10) then
			Say("Hµnh trang ®· ®Çy! H·y s¾p xÕp l¹i hµnh trang ®Ó cã tèi thiÓu 10 « trèng.",0);
			return 1;
		end
		local equit_index=random(159,167);--Ëæ»ú¶¨¹ú°²°î
		AddGoldItem(0,equit_index);
		for i=1,5 do
			summonBoss(i);
		end
		Msg2SubWorld(format("Ng­êi ch¬i %s t¹i %s(%d,%d) ®· sö dông %s, lµm cho Kim Quang T­íng Qu©n xuÊt hiÖn.",GetName(),SubWorldName(SubWorld),floor(X/8),floor((Y+5)/16),"Ngäc Bµi"));
		WriteLog(format("[TriÖu håi m·nh t­íng]\t%s\tAccount:%s\tName:%s\t%s sö dông thµnh c«ng",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"Ngäc Bµi"));
	end
	return 0;
end
function summonBoss(mengjiang_index)
	local W,X,Y = GetWorldPos();
	BossId = mengjiangBoss[mengjiang_index][1];
	BossName = mengjiangBoss[mengjiang_index][2];
	BossLevel = mengjiangBoss[mengjiang_index][3];
	BossSeries = mengjiangBoss[mengjiang_index][4];
	if(BossSeries == -1) then BossSeries = random(0,4) end;
	AddNpcEx( BossId,BossLevel ,BossSeries, SubWorldID2Idx(W), X * 32, (Y +  5) * 32, 1,BossName, 1 );
	Msg2Player(format("B¹n ®· triÖu håi ®­îc %s",BossName));
end
