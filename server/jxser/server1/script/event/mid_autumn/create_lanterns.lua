IncludeLib("FILESYS")
tbLANTERNS_NPC = {
		{ 2, 36, 280, 560,		"\\settings\\event\\zhongqiuhuodong\\huashan_lantern.txt",		"\\script\\event\\mid_autumn\\lantern.lua", "Hoa S¬n" },
		{ 21, 37, 550, 1100,	"\\settings\\event\\zhongqiuhuodong\\qingcheng_lantern.txt",	"\\script\\event\\mid_autumn\\lantern.lua", "Thanh Thµnh S¬n" },
		{ 167, 38, 330, 660,	"\\settings\\event\\zhongqiuhuodong\\diancang_lantern.txt",		"\\script\\event\\mid_autumn\\lantern.lua", "§iÓm Th­¬ng s¬n" },
		{ 193, 39, 340, 680,	"\\settings\\event\\zhongqiuhuodong\\wuyi_lantern.txt",			"\\script\\event\\mid_autumn\\lantern.lua", "Vò Di s¬n" },
}
LANTERN_OPEN_DATE = 05091618
LANTERN_END_DATE = 05091824
--NPCID:1077, 1, 
-- Éú³ÉµÆÁýNPC
function create_lanterns()
	OldSubWorld = SubWorld
	for i = 1, getn(tbLANTERNS_NPC) do
		local addcount = 0
		local world = SubWorldID2Idx(tbLANTERNS_NPC[i][1])
		if (world >= 0) then
			lantern_count = GetGlbValue( tbLANTERNS_NPC[i][2] )
			lantern_addent = tbLANTERNS_NPC[i][3]
			if ( lantern_count + lantern_addent > tbLANTERNS_NPC[i][4] ) then
				lantern_addent = tbLANTERNS_NPC[i][4] - lantern_count
			end
			if ( lantern_addent > 0 ) then
				SubWorld = world
				addcount = add_rand_lanterns( tbLANTERNS_NPC[i][5], tbLANTERNS_NPC[i][6], 1077, lantern_addent )
				SetGlbValue( tbLANTERNS_NPC[i][2], (GetGlbValue( tbLANTERNS_NPC[i][2] ) + addcount) )
				SubWorld = OldSubWorld
			end
		end
	end
end

function add_rand_lanterns( npcfile, scriptfile, npcid, count )
	TabFile_Load(npcfile, npcfile)
	local addcount = 0
	local filehigh = TabFile_GetRowCount(npcfile) - 1
	local num = 0
	local tbrow = {}
	while ( num < count ) do	--Ëæ»úÑ¡Ôñ×ø±ê±íµÄ²»ÖØ¸´µÄÐÐ£¬×÷ÎªnpcµÄÖØÉúµã
		rannum = random( filehigh )
		flag, tbrow = cd_insertcell( tbrow, rannum )
		if ( flag == 1 ) then
			num = num + 1
		end
	end
	for i = 1, getn(tbrow) do
		xpos = TabFile_GetCell(npcfile, tbrow[i] + 1, 1)
		ypos = TabFile_GetCell(npcfile, tbrow[i] + 1, 2)
		npcidx = AddNpc(npcid, 1, SubWorld, xpos, ypos);
		if ( npcidx > 0 ) then
			SetNpcScript(npcidx, scriptfile)
			SetNpcParam(npcidx,4,1)
			addcount = addcount + 1
		end
	end
	return addcount
end

function cd_insertcell( tbnum, cell )
	local flag = 0
	
	if( getn( tbnum ) == 0 ) then
		tbnum[ 1 ] = cell
		return 1, tbnum
	end
	
	for i = 1, getn( tbnum ) do
		if ( tbnum[i] == cell ) then
			flag = -1
			break
		end
	end
	
	if ( flag ~= -1 ) then
		tbnum[ getn( tbnum ) + 1 ] = cell
		return 1, tbnum
	end
	return 0, tbnum
end

function lantern_addexp_inmap()
	local oldSubWorld = SubWorld
	local mapid = 0
	local sidx = 0
	for i = 1, getn(tbLANTERNS_NPC) do
		mapid = tbLANTERNS_NPC[i][1]
		sidx = SubWorldID2Idx(mapid)
		if ( sidx >= 0 ) then
			SubWorld = sidx
			AddExpInMap(600, 50, 200)
			SubWorld = oldSubWorld
		end
	end
	
	for i = 520, 526 do
		mapid = i
		sidx = SubWorldID2Idx(mapid)
		if ( sidx >= 0 ) then
			SubWorld = sidx
			AddExpInMap(100, 50, 200)
			SubWorld = oldSubWorld
		end
	end
end