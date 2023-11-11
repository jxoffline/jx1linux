Include("\\script\\missions\\fengling_ferry\\fld_head.lua");
Include("\\script\\event\\jiefang_jieri\\200904\\shuizei\\shuizei.lua");
Include("\\script\\lib\\common.lua");
local tbNpcname	= {"ThuyÒn phu Gi¸p", "ThuyÒn phu Êt", "ThuyÒn phu Bİnh"};

function south_boatman_main(BOATID)
	local MapId = boatMAPS[ BOATID ]
	if (MapId > 0) then
		local idx = SubWorldID2Idx(MapId)
		if (idx < 0) then
			Say("Xin lçi! Phİa tr­íc ®ang cã nguy hiÓm! T¹m thêi ch­a thÓ lªn thuyÒn!.",0)
			local SignMapId = SubWorldIdx2ID(SubWorld);
			print("ERROR !!!BoatMap[%d] and SignMap[%d] Must In Same Server!", MapId, SignMapId); 
			return
		end
		local orgworld = SubWorld
		SubWorld = idx

		boatstate = GetMissionV(MS_STATE)

		nowtime = GetMissionV(MS_TIMEACC_1MIN)

		SubWorld = orgworld

		local szNpcname = %tbNpcname[BOATID];
		if (boatstate == 1) then
			remaintime = 10 - nowtime
			if (remaintime > 0) then
				local nDate = tonumber(GetLocalDate("%Y%m%d"));
				tbBoatmanDialog	= {format("Lªn thuyÒn/#fld_wanttakeboat(%d)", BOATID), "L¸t n÷a sÏ quay l¹i/fld_cancel"};
				if (nDate >= jf0904_act_dateS) then
					tinsert(tbBoatmanDialog, 2, "Ta ®Õn tham gia ho¹t ®éng 'Tiªu diÖt thñy tÆc'/join_shuizei_act");
				end
				Say(format("%s: Lªn thuyÒn thİch thËt ®ã! Cßn %d lµ thuyÒn b¾t ®Çu ch¹y råi.", szNpcname, remaintime), getn(tbBoatmanDialog), unpack(tbBoatmanDialog));
			else
				Say(format("%s: ThËt kh«ng may, thuyÒn ®· xuÊt ph¸t råi, ngåi ®îi chuyÕn sau vËy nhĞ.", szNpcname), 0)
			end
		else
			Say(format("%s: Thêi gian ®ît thuyÒn nµy vÉn ch­a ®Õn, h·y ®îi thªm tİ n÷a hoÆc ®i bÕn kh¸c thö xem.", szNpcname), 0)
		end
		SubWorld = orgworld
	end
end



