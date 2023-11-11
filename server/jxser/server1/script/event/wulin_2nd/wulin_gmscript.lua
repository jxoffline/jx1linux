function wulin_gm_say(rolename, szMsg)
	local n_playeridx = SearchPlayer(rolename)
	if (n_playeridx > 0) then
		local n_old = PlayerIndex 
		PlayerIndex = n_playeridx
		Say(szMsg, 0)
		PlayerIndex = n_old
	end
end