--	¼ÓÔØ°ï»ánpcµÄ½Å±¾
--	lixin	2005.12.22
--	Include by tong_mix.lua
--  ¸Ã½Å±¾GSºÍrelayµÄ¾ùÐëÍ¬²½¸üÐÂ£¡
aTongNpcPos = {}
function GenPos(szPos)
	local index = strfind(szPos, ',', 1)
	return {x=tonumber(strsub(szPos, 1, index-1)), y=tonumber(strsub(szPos, index+1, strlen(szPos)-1))}
end

if (MODEL_GAMESERVER == 1) then
	IncludeLib("FILESYS")
	function LoadPosSetting()
		if TabFile_Load("\\settings\\tong\\npcpos.txt", "table_npcpos") ~= 1 then
			print("§äc tËp tin ®iÒu phè täa ®é npc thÊt b¹i!")
			return
		end
		local nRowCount = TabFile_GetRowCount("table_npcpos")
		for y = 2, nRowCount do
			aTongNpcPos[y-1] = {}
			for x = 2, 100 do 
				local szHead = tonumber(TabFile_GetCell("table_npcpos", 1, x))
				if szHead then	
					aTongNpcPos[y-1][szHead]=GenPos(TabFile_GetCell("table_npcpos", y, x))
				else
					break	
				end		
			end	
		end	
		--TabFile_UnLoad("table_npcpos")
	end
	LoadPosSetting()
end

--¹«¹²µØÍ¼
aPublicMap = {
	586,
	595,
	596,
	597,
}

--¶¯Ì¬µØÍ¼Ä£°å
aDynMapCopy = {
	587,
	588,
	589,
	590,
	591,
	593,
	594,
}
--¶¯Ì¬µØÍ¼Ä£°åÃû
aDynMapCopyName = {
	[587]="S¬n Thµnh",
	[588]="Miªu C­¬ng",
	[589]="Sa M¹c",
	[590]="Kinh S­",
	[591]="Biªn ¶i",
	[593]="Giang Nam",
	[594]="TuyÕt LÜnh",				
}

aRevPos = {x=1660,y=3257}
aMapEnterPosDef = {x=1718,y=3313}	--Ä¬ÈÏ½øÈëµã
aMapEnterPos = {[591] = {x=1712,y=3330} } --½øÈëµã
function GetMapEnterPos(nMapCopy)
	if (aMapEnterPos[nMapCopy])then
		return aMapEnterPos[nMapCopy]
	end
	return aMapEnterPosDef
end

citymap = {586,587,588,589,590,591,593,594,595,596,597};
--µÚ¶þÁÐ±íÊ¾×ø±êÔÚ±íÖÐµÄÎ»ÖÃ
citytong_npc={
{198,1,"\\script\\tong\\npc\\bingjia_zongguan.lua","Tæng qu¶n Binh gi¸p ph­êng"},
{200,2,"\\script\\tong\\npc\\tiangong_zongguan.lua","Tæng qu¶n Thiªn c«ng ph­êng"},
{375,3,"\\script\\tong\\npc\\mianju_zongguan.lua","Tæng qu¶n DÞ dung ph­êng"},
{455,4,"\\script\\tong\\npc\\tianyi_zongguan.lua","Tæng qu¶n Thiªn ý ph­êng"},
{769,5,"\\script\\tong\\npc\\shilian_zongguan.lua","Tæng qu¶n ThÝ luyÖn ph­êng"},
{377,6,"\\script\\tong\\npc\\liwu_zongguan.lua","Tæng qu¶n LÔ phÈm ph­êng"},
{308,7,"\\script\\tong\\npc\\huodong_zongguan.lua","Tæng qu¶n Ho¹t ®éng ph­êng"},
{235,8,"\\script\\tong\\npc\\tong_chefu.lua","Xa phu"},
{625,9,"\\script\\tong\\npc\\tong_chuwuxiang.lua","R­¬ng chøa ®å"},
{329,10,"\\script\\tong\\npc\\jitan.lua","TÕ Töu"},
{649,18,"\\script\\tong\\npc\\zhandouqu_zongguan.lua","Tæng qu¶n khu chiÕn ®Êu"},
{649,19,"\\script\\tong\\npc\\zhandouqu_zongguan.lua","Tæng qu¶n khu chiÕn ®Êu"},
}

buildingmap = {586,595,596,597};
--Ë÷Òý±íÊ¾×÷·»ÀàÐÍ
--µÚ¶þÁÐ±íÊ¾×ø±êÔÚ±íÖÐµÄÎ»ÖÃ
building ={
[1] = {1151,11,"\\script\\tong\\npc\\bingjia_zongguan.lua","Khu Binh gi¸p "},
[2] = {1156,12,"\\script\\tong\\npc\\tiangong_zongguan.lua","Khu Thiªn C«ng "},
[3] = {1165,13,"\\script\\tong\\npc\\mianju_zongguan.lua","Khu MÆt n¹ "},
[4] = {1170,15,"\\script\\tong\\npc\\shilian_zongguan.lua","Khu LuyÖn tËp"},
[5] = {1175,14,"\\script\\tong\\npc\\tianyi_zongguan.lua","Khu Thiªn ý "},
[6] = {1180,16,"\\script\\tong\\npc\\liwu_zongguan.lua","Khu LÔ vËt "},
[7] = {1185,17,"\\script\\tong\\npc\\huodong_zongguan.lua","Khu ho¹t ®éng "},
}

--×÷·»µÄ¸÷¼¶npcÄ£°å
building_figure ={
[1] = {1151,1151,1151,1152,1152,1152,1153,1153,1154,1155},
[2] = {1156,1156,1156,1157,1157,1157,1162,1162,1163,1164},
[3] = {1165,1165,1165,1166,1166,1166,1167,1167,1168,1169},
[4] = {1170,1170,1170,1171,1171,1171,1172,1172,1173,1174},
[5] = {1175,1175,1175,1176,1176,1176,1177,1177,1178,1179},
[6] = {1180,1180,1180,1181,1181,1181,1182,1182,1183,1184},
[7] = {1185,1185,1185,1186,1186,1186,1187,1187,1188,1189},
}

jijiumap = {586,595,596,597};
jijiu={
{329,1672,3256,"\\script\\tong\\npc\\jitan.lua","TÕ Töu"},
{329,1682,3249,"\\script\\tong\\npc\\jitan.lua","TÕ Töu"},
}
jijiu_city={
{329,1,1562,3252,"\\script\\tong\\npc\\jitan.lua","TÕ Töu"},
{329,11,3096,5025,"\\script\\tong\\npc\\jitan.lua","TÕ Töu"},
{329,37,1697,3117,"\\script\\tong\\npc\\jitan.lua","TÕ Töu"},
{329,78,1580,3204,"\\script\\tong\\npc\\jitan.lua","TÕ Töu"},
{329,80,1693,3066,"\\script\\tong\\npc\\jitan.lua","TÕ Töu"},
{329,162,1520,3159,"\\script\\tong\\npc\\jitan.lua","TÕ Töu"},
{329,176,1561,2942,"\\script\\tong\\npc\\jitan.lua","TÕ Töu"},
}


function add_tongnpc()
	if (GetProductRegion() == "cn_ib") then
		-- ¼Ó³ÇÊÐ¼À¾Æ
		for i = 1, getn(jijiu_city) do
			local SId = SubWorldID2Idx(jijiu_city[i][2]);
			if (SId >= 0) then
				local npcindex = AddNpc(jijiu_city[i][1], 1, SId, jijiu_city[i][3]*32, jijiu_city[i][4]*32, 1, jijiu_city[i][6]);
				SetNpcScript(npcindex, jijiu_city[i][5]);
			end
		end
		-- ¼Ó°ï»áÄ£°åµØÍ¼½¨Öþ
		for i = 1, getn(aDynMapCopy) do
			local SId = SubWorldID2Idx(aDynMapCopy[i]);
			if (SId >= 0) then
				add_one_citytong_npc(SId, aDynMapCopy[i]);
				add_one_allbuilding(SId, aDynMapCopy[i]);
			end
		end
		return
	end;
	
	add_citytong_npc();	--¼Ó°ï»á¹«¹²µØÍ¼¡¢Ä£°åµØÍ¼npc
	add_tongbuilding();	--¼Ó°ï»á¹«¹²µØÍ¼½¨Öþ
	add_jijiu();
end


function add_one_citytong_npc(SId, mapcopy)
	for j=1,getn(citytong_npc) do
		local pos = aTongNpcPos[citytong_npc[j][2]][mapcopy]
		if pos then
			local npcindex = AddNpc(citytong_npc[j][1],1,SId,pos.x*32,pos.y*32,1,citytong_npc[j][4]);
			SetNpcScript(npcindex, citytong_npc[j][3]);						
		else
			print("addtongnpc Error: pos is nil!, mapcopy:"..mapcopy)	
		end	
	end
end

function add_citytong_npc()	
	for i=1,getn(citymap) do
		local SId = SubWorldID2Idx(citymap[i]);
		if (SId >= 0) then
			add_one_citytong_npc(SId, citymap[i])
		end	
	end	
end;

-- add_one_building(µØÍ¼id£¬µØÍ¼Ä£°å£¬×÷·»ÀàÐÍ£¬×÷·»µÈ¼¶)
function add_one_building(map_index, map_copy, nType, nLevel)
	local pos = aTongNpcPos[building[nType][2]][map_copy]
	local npcindex
	if pos then
		npcindex = AddNpc(building_figure[nType][nLevel],1,map_index,pos.x*32,
			pos.y*32,1,building[nType][4]);
		SetNpcScript(npcindex, building[nType][3]);
	else
		print("addtongnpc Error: pos is nil!, mapcopy:"..map_copy)	
	end	
	return npcindex
end

function add_one_allbuilding(SId, mapcopy)
	for j = 1, getn(building) do
		add_one_building(SId, mapcopy, j, 10);
	end
end

function add_one_citybuildings(SId, mapcopy)
	for j=1,getn(building) do
		add_one_building(SId, mapcopy, j, 1)
	end;
end

function add_tongbuilding()
	for i=1,getn(buildingmap) do
		local SId = SubWorldID2Idx(buildingmap[i]);
		if (SId >= 0) then
			add_one_citybuildings(SId, buildingmap[i])
		end
	end	
end

function add_jijiu()
	for i=1,getn(jijiumap) do
		SId = SubWorldID2Idx(jijiumap[i]);
		if (SId >= 0) then
			for j=1,getn(jijiu) do
				npcindex = AddNpc(jijiu[j][1],1,SId,jijiu[j][2]*32,jijiu[j][3]*32,1,jijiu[j][5]);
				SetNpcScript(npcindex, jijiu[j][4]);
			end;
		end;
	end	
end
