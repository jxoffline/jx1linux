Include("\\RelaySetting\\Task\\congthanhchien\\citywar_head.lua")
function TaskShedule()
	TaskName("Phng Tng- b竜 danh b総 u");
	TaskInterval(1440);	
	TaskTime(18, 0);	
	TaskCountLimit(0);
	OutputMsg("=======================================================")
	OutputMsg("                THAT THANH DAI CHIEN BAT DAU BAO DANH")
	OutputMsg("          Vao Luc: 18h:00 - Ket Thuc Bao Danh Vao Luc: 19h:00")
	OutputMsg("   Bat Dau Tham Gia Vao Luc 20h:00 - Ket Thuc Vao Luc 21h:30 Thu 6 Hang Tuan")

end

function TaskContent()
	-- 凤翔编号为1,必须跟citywar.ini中指定的一致
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(1,1) == 1) then
			StartSignUp(1);
		end;
	else
		cw_startsignup_fun(3,1);
	end;
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
