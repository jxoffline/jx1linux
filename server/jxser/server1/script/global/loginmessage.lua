Include("\\script\\global\\login_head.lua")
Include("\\script\\task\\task_addplayerexp.lua");
Include("\\script\\lib\\awardtemplet.lua");

function LoginMessage()
	local nLevel = GetLevel();
	if (nLevel >= 1) then		
		Msg2Player("Chµo mõng b¹n ®Õn víi <color=yellow>              Vâ L©m TruyÒn Kú Offline<color=yellow><enter>- <color=Red>https://fb.com/groups/volamquan <color><enter>- Edit tæng hîp By <color=Green>Eurofun<color>")
	end
end

if login_add then login_add(LoginMessage, 1) end