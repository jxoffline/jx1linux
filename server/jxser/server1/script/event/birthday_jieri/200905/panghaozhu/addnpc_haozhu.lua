-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÔ½ÄÏ°æ - Ë¢ÐÂÅÖºÀÖí
-- ÎÄ¼þÃû¡¡£ºaddnpc_haozhu.lua
-- ´´½¨Õß¡¡£º×Ó·Çô~
-- ´´½¨Ê±¼ä£º2009-05-31 09:31:39

-- ======================================================

Include("\\script\\missions\\basemission\\lib.lua");
Include("\\script\\lib\\file.lua");

local tbBD0905_haozhu_pos = {
	{nMapID = 1, szMapName = "Ph­îng T­êng Phñ ", szPosPath = "\\settings\\maps\\city_out\\1.txt"},
	{nMapID = 11, szMapName = "Thµnh §« Phñ ", szPosPath = "\\settings\\maps\\city_out\\11.txt"},
	{nMapID = 37, szMapName = "BiÖn Kinh Phñ ", szPosPath = "\\settings\\maps\\city_out\\37.txt"},
	{nMapID = 78, szMapName = "T­¬ng D­¬ng Phñ ", szPosPath = "\\settings\\maps\\city_out\\78.txt"},
	{nMapID = 80, szMapName = "D­¬ng Ch©u Phñ ", szPosPath = "\\settings\\maps\\city_out\\80.txt"},
	{nMapID = 162, szMapName = "§¹i Lý", szPosPath = "\\settings\\maps\\city_out\\162.txt"},
	{nMapID = 176, szMapName = "L©m An Phñ ", szPosPath = "\\settings\\maps\\city_out\\176.txt"},
	{nMapID = 174, szMapName = "Long TuyÒn th«n", szPosPath = "\\settings\\maps\\village_out\\174.txt"},
	{nMapID = 121, szMapName = "Long M«n trÊn", szPosPath = "\\settings\\maps\\village_out\\121.txt"},
	{nMapID = 153, szMapName = "Th¹ch Cæ trÊn", szPosPath = "\\settings\\maps\\village_out\\153.txt"},
	{nMapID = 101, szMapName = "§¹o H­¬ng th«n", szPosPath = "\\settings\\maps\\village_out\\101.txt"},
	{nMapID = 99, szMapName = "VÜnh L¹c trÊn", szPosPath = "\\settings\\maps\\village_out\\99.txt"},
	{nMapID = 100, szMapName = "Chu Tiªn trÊn", szPosPath = "\\settings\\maps\\village_out\\100.txt"},
	{nMapID = 20, szMapName = "Giang T©n Th«n", szPosPath = "\\settings\\maps\\village_out\\20.txt"},
	{nMapID = 53, szMapName = "Ba L¨ng huyÖn", szPosPath = "\\settings\\maps\\village_out\\53.txt"},
}

-- ²ÎÊý£ºË¢ÐÂµØÍ¼ID£¬Ë¢ÐÂ¸öÊý
function birthday0905_addnpc_haozhu(n_count)
	local n_mapid = 0;
	local n_worldidx = SubWorldID2Idx(n_mapid);
	
	if (n_count > 0) then
		
		local tbNpc = {nNpcId = 1431, nLevel = 30, szName = "NhÝm bÐo ph×", nIsboss = 1,
						szDeathScript = "\\script\\event\\birthday_jieri\\200905\\panghaozhu\\haozhu_death.lua",
						szScriptPath = "\\script\\event\\birthday_jieri\\200905\\panghaozhu\\haozhu_death.lua"};
		
		for i = 1, getn(%tbBD0905_haozhu_pos) do
			
			local n_mapid = %tbBD0905_haozhu_pos[i].nMapID;
			local n_worldidx = SubWorldID2Idx(n_mapid);
			if (n_worldidx >= 0) then
				ClearMapNpcWithName(n_mapid, "NhÝm bÐo ph×");
			
				for k = 1, n_count do
					local nPosX, nPosY = GetRandomAData(%tbBD0905_haozhu_pos[i].szPosPath);
					WriteLog(date().."	"..n_mapid..","..nPosX..","..nPosY);
					basemission_CallNpc(tbNpc, n_mapid, (nPosX * 32 + (32-k*2)), (nPosY * 32 + (k*2-32)) );
				end
			end
			
		end
	else
		print("birthday0905_addnpc_haozhu Error! Fail Param!!")
	end
		
end

