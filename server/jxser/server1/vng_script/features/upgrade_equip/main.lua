Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\vng_script\\features\\upgrade_equip\\head.lua")
Include("\\vng_script\\features\\upgrade_equip\\upgrade_equip.lua")


function tbVngUpgradeABDQ:main()
	local szMsg = format("<npc><color=yellow>Ng­¬i muèn ph©n gi¶i hay n©ng cÊp trang bÞ hoµng kim An bang hay §Þnh quèc, ta cã thÓ gióp ®ì!<color>\n")
	local tbOpt = {}
	
	tinsert(tbOpt, {format("Ph©n gi¶i trang bÞ An bang - §Þnh quèc"), self.ReleaseEquip_UI, {self}})
	tinsert(tbOpt, {format("N©ng cÊp trang bÞ An bang - §Þnh quèc"), self.UpgradeEquip_UI, {self}})	
	tinsert(tbOpt, {"Hñy bá "})
	CreateNewSayEx(szMsg, tbOpt)
end
function tbVngUpgradeABDQ:ReleaseEquip_UI()
	local strDesc = "ChØ ph©n gi¶i trang bÞ An bang - §Þnh quèc."	
	g_GiveItemUI("Ph©n gi¶i trang bÞ", strDesc, {self.ReleaseEquip, {self}}, nil, 1)
end

function tbVngUpgradeABDQ:UpgradeEquip_UI()	
	local strDesc = format("N©ng cÊp trang bÞ [Hoµn Mü] An bang cÇn: Trang bÞ an bang th­êng vµ c¸c nguyªn liÖu t­¬ng øng.<enter>")
	strDesc = strDesc..format("N©ng cÊp trang bÞ [Cùc phÈm] §Þnh quèc cÇn: Trang bÞ §Þnh quèc th­êng vµ c¸c nguyªn liÖu t­¬ng øng.<enter>")
	strDesc = strDesc.."* 1 An bang/§Þnh quèc hån th¹ch t¨ng : 1% tû lÖ thµnh c«ng. <enter>* 1 Thiªn Tinh Kho¸ng t¨ng : 10% Tû lÖ thµnh c«ng.<enter>Tû lÖ thµnh c«ng tèi ®a: 80%"
	g_GiveItemUI("N©ng cÊp trang bÞ", strDesc, {self.UpgradeEquip, {self}}, nil, 1)
end

EventSys:GetType("AddNpcOption"):Reg("B¸ch nghÖ nh©n","Liªn quan ®Õn trang bÞ An bang - §inh quèc", tbVngUpgradeABDQ.main,{tbVngUpgradeABDQ})


