-- 16.	îÚÁúÒ½ÏÉÁøÒ©Ê¦£ºÃ¿¸öÈË¶Ô»°ºó»ñµÃÒ»ÕÅ×ÖÌõ£¬¸ù¾Ý×ÖÌõµÄÃÕÃæ²É¼¯µØÉÏµÄÒ©²Ä£¨20¸öÏä×Ó£¬Ã¿¸öÏä×Ó´ú±íÒ»ÖÖÒ©²Ä£©£¬
-- È»ºó°Ñ×ÖÌõºÍÒ©²Ä½»»¹£¬ÒªÇóËùÓÐÈË¶¼»Ø´ðÕýÈ·1Ìâ²ÅÄÜ¹ý¹Ø£¬ÈçÓÐ´íÎóÔò¼ÌÐø»Ø´ð£¬Èç¹û´ð¶Ô¾Í²»ÄÜÔÙ¼ÌÐø¶Ô»°ÁË¡£
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

tbTASK16_RIDDLE = {
	{"Cè H­¬ng", 		"Thôc §Þa"},
	{"DÞ Quèc", 		"Sinh §Þa"},
	{"L·o Thùc Trung HËu", 	"Hau Ph¸c"},
	{"bÖnh nhËp cao hoang ",	"M«i D­îc"},
	{"Vâ Tßng S¸t TÈu",	"Xuyªn T©m Liªn"},
	{"Hµi nhi tham kiÕn phô v­¬ng","Th¸i Tö Tham"},
	{"§¾ng cay chua ngät nh¹t",	"Ngò VÞ Tö"},
	{"L·o B¹ng Sinh Ch©u",	"Bèi Méu"},
	{"Lôc L©m H¶o H¸n", 	"Th¶o KhÊu "},
	{"Tam TØnh Ng« Th©n", 	"Phßng DÜ"},
	{"Cöu Quy NhÊt", 	"B¸ch Hîp"},
	{"Khæ Ng¹o Tam Cöu", 	"nhÉn ®«ng "},
	{"Cèt Khoa Y Sanh",	"tôc ®o¹n "},
	{"M­u Sü Nan §­¬ng", 	"Khæ Tham"},
	{"Hång S¾c Cè VÊn", 	"§¬n Tham"},
	{"Thiªn Phñ Chi B¶o",	"Xuyªn Bèi"},
	{"Gi¶ Kú Chi Hoµn",	"§­¬ng Quy "},
	{"L·ng PhÝ TiÒn Tµi",	"Kim Ng©n Hoa"},
	{"H¾c S¾c Hoµn Tö",	"¤ D­îc"},
	{"Hång TrÇn", 		"Chu Sa "},
}

pTask = Task:New(16)

function pTask:OnStart()
	local mapid = self:GetMapId()
	local pos_npc = self:GetPosition().t16_npc
	local pos_box = self:GetPosition().t16_box
	self.m_NpcIndex = DlgNpcManager:AddNpc("LiÔu D­îc S­", 1718, mapid, pos_npc.x, pos_npc.y, self, 0)
	self.m_Box = {}
	for i = 1, 20 do
		local nNpcIndex = DlgNpcManager:AddNpc(tbTASK16_RIDDLE[i][2], 1698, mapid, pos_box[i].x, pos_box[i].y, self, i)
		tinsert(self.m_Box, nNpcIndex)
	end
end

function pTask:OnDestroy()
	if (self.m_NpcIndex > 0) then
		DlgNpcManager:DelNpc(self.m_NpcIndex)
		self.m_NpcIndex = 0
	end
	if (self.m_Box) then
		for i = 1, getn(self.m_Box) do
			DlgNpcManager:DelNpc(self.m_Box[i])
		end
		self.m_Box = nil
	end
end

function pTask:Say(player, index)
	if (index == 0) then
		local caption = "Xin c¸c ch­ vÞ h·y ®Õn chç cña l·o phu nhËn mét §¬n D­îc, c¨n cø theo lêi bÝ Èn trªn §¬n D­îc lÊy mét lo¹i D­îc LiÖu, sau ®ã c¸c ch­ vÞ h·y h·y lÊy §¬n D­îc vµ D­îc LiÖu thÝch hîp giao cho ta, nÕu nh­ mçi ng­êi ®Òu t×m ®óng D­îc LiÖu th× cã thÓ qua ¶i, t×m sai th× h·y ®o¸n l¹i"
		-- TODO: local options = {""}
	end
end
