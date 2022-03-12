Include("\\script\\maps\\newworldscript_head.lua")

function CheckMapEnter( )
	local nLevel = GetLevel()
	 local W,X,Y = GetWorldPos();
	 for i=1,getn(tbMapLimit) do
	 	if ( tbMapLimit[i].nMapID == W and nLevel < tbMapLimit[i].nMapLevel ) then
	 		return 0
	 	end
	 end
	 return 1
end