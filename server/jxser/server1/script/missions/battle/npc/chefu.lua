Include("\\script\\dailogsys\\dailogsay.lua")

function main()
	local nMode = GetTripMode()
	if nMode ~= 2 then
		NewWorld(20,3546,6226)
		return
	end
	local szTitle = "<npc>".."Ng­¬i muèn trë vÒ kh«ng?"
	local tbOpt = 
	{
		{"Muèn", TripS_Return, {}},
		{"Hñy bá "}
	}
	CreateNewSayEx(szTitle, tbOpt)
end