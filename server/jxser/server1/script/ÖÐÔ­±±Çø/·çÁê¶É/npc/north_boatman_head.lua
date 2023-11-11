-- ·çÁê¶É±±°¶´¬·ò
Include("\\script\\event\\jiefang_jieri\\200904\\shuizei\\shuizei.lua");
Include("\\script\\lib\\common.lua");

local tbNorth_Boatman_Info	=
{
	[1]	= {szNpcname = "ThuyÒn phu Gi¸p", tbMap = {336, 1165, 3043}},
	[2]	= {szNpcname = "ThuyÒn phu Êt", tbMap = {336, 1299, 2933}},
	[3]	= {szNpcname = "ThuyÒn phu Bİnh", tbMap = {336, 1555, 2829}},
};

function north_boatman_main(nId)
	local szNpcname = %tbNorth_Boatman_Info[nId].szNpcname;
	tbBoatmanDialog	= {format("§­îc th«i! §i nµo!/#tosouth(%d)", nId), "T¹m thêi ch­a ®i!/no"};
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= jf0904_act_dateS) then
		tinsert(tbBoatmanDialog, 2, "Ta ®Õn giao nhiÖm vô tiªu diÖt thñy tÆc/fullfill_shuizei_act");
	end
	Say(format("%s: Ng­¬i muèn ngåi thuyÒn ®Õn bê nam Phong L¨ng §é? §­a ta 200 l¹ng b¹c lµ ®­îc.", szNpcname), getn(tbBoatmanDialog), unpack(tbBoatmanDialog));
end

function tosouth(nId)
	local tbMap 	= %tbNorth_Boatman_Info[nId].tbMap;
	local szNpcname	= %tbNorth_Boatman_Info[nId].szNpcname;
	
	if( GetCash() >= 200 ) then
		NewWorld(unpack(tbMap));
		Pay( 200 );
		DisabledUseTownP(0);
	else
		Talk(1,"",format("%s: Kh«ng cã tiÒn sao ngåi thuyÒn ®­îc nhØ?", szNpcname));
	end
end

function no()
end