-- ÍØ°Ï»³´¨¶Ô»°½Å±¾

Include("\\script\\task\\newtask\\branch\\xiepai\\branch_xiepaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include([[\script\global\yuenan_feiyunrenwu.lua]]);	--by liaozhishan 11/15/2006

function main()
	local tab_Content = {
		"Ta ®Õn lµm nhiÖm vô phô tuyÕn/branch_liuyungu", "Nh©n tiÖn ghĞ qua th«i/no"
	};
	if (v_fy_is_active() == 1) then
		tinsert(tab_Content, "NhËn phÇn th­ëng cÊp 100/v_fy_100_entrance")
		Say("Ta cã thÓ gióp g×?", getn(tab_Content), tab_Content);
		return
	end;	
	branch_liuyungu();
end