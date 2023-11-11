Include("\\script\\global\\login_head.lua")
Include("\\script\\global\\logout_head.lua")
Include("\\script\\missions\\maze\\maze.lua")
Include("\\script\\global\\playerlist.lua")

SCRIPT = "\\script\\missions\\maze\\loginout.lua"

function login(playerindex, exchange)
	if (exchange == 1) then
		return
	end
	local player = PlayerList:GetPlayer(playerindex)
	if (not player) then
		return
	end
	local maze = MazeList:Find(player)
	if (maze ~= nil) then
		maze:Login(player)
	end
end

function logout(playerindex)
	local player = PlayerList:GetPlayer(playerindex)
	if (not player) then
		return
	end
	local maze = MazeList:Find(player)
	if (maze ~= nil) then
		maze:Logout(player)
	end
end

AddLoginFileFunction(SCRIPT, "login")
AddLogoutFileFunction(SCRIPT, "logout")
