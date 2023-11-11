--×¨ÓÃÍÐ¹Ü·þÎñÆ÷
--ÔÊÐí·þÎñÆ÷ÈËÊýÔÚ750ÒÔÏÂ½øÐÐÍÐ¹Ü
--ÓÉ³ÇÊÐ³µ·ò´¦½øÈë£¨½ö³äÖµÓÃ»§£©

Include("\\script\\task\\partner\\train\\partner_addtrainnpc.lua")
tbAnonymValeMap = {835,836,837,838,839,840};

function GotoAnonymVale()
	if( GetExtPoint( 0 ) >= 1 ) then
		local filehigh = pt_GetTabFileHeight( jindienter_pos_file )
		local row = random(filehigh)
		local posx = pt_GetTabFileData(jindienter_pos_file, row + 1, 1)
		local posy = pt_GetTabFileData(jindienter_pos_file, row + 1, 2)
		local nmap = tbAnonymValeMap[random(getn(tbAnonymValeMap))];
		
		if (posx > 0 and posy > 0) then
			NewWorld(nmap, posx, posy)
			SetFightState(0)
		else
			print("jindienter_pos_file error row = "..row)
		end
	else
		Talk(1,"","Xin lçi! Quý kh¸ch cÇn ph¶i n¹p thÎ míi cã thÓ vµo <color=yellow>V« Danh Cèc<color>")
	end;
end;

function AnonymVale_auto()
	local oldSubWorld = SubWorld;
	for k = 1, getn(tbAnonymValeMap) do
		local nmap = tbAnonymValeMap[k];
		local nworld = SubWorldID2Idx(nmap);
		
		if (nworld >= 0) then
			SubWorld = nworld;
			
			--³µ·ò¼Óµ½×ø±ê£¨1637,3277)£¬(1780,3354)£¬(1736,3462)£¬(1622,3658£©£¬£¨1798,3636)
			for i = 1, getn(tb_jitan_pos) do
				local npcindex = AddNpc(393, 1, nworld, tb_jitan_pos[i][1] * 32, tb_jitan_pos[i][2] * 32, 1, "Xa phu")
				if (npcindex > 0) then
					SetNpcScript(npcindex, "\\script\\missions\\newcitydefence\\npc\\chefu.lua")
				end
			end
			
			--³ö¿ÚµÄtrap
			for i = 1, pt_GetTabFileHeight(jindiexit_trap_file) do
				local x = pt_GetTabFileData(jindiexit_trap_file, i + 1, 1);
				local y = pt_GetTabFileData(jindiexit_trap_file, i + 1, 2);
				AddMapTrap(nmap, x,y, "\\script\\task\\partner\\trap\\trap_jindichukou.lua");
			end
		end;
	end;
	SubWorld = oldSubWorld;
end;