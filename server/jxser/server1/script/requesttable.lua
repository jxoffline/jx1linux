tbProcess = {
	sevencity_war = {"\\script\\missions\\sevencity\\client_protocol.lua", "ClientProtocol:Process"},
}
function RequestTable(handle)
	local name = OB_PopString(handle)
	if (not name) then
		print("RequestTable fail: name is null)")
		return
	end
	local item = tbProcess[name]
	if (not item) then
		print(format("RequestTable fail: handle[%s] is null)", name))
		return
	end
	DynamicExecute(item[1], item[2], PlayerIndex, name)
end
