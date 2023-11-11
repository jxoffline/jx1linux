--增加汴京trap点
--

Include("\\script\\lib\\getrectangle_point.lua") --获得矩形点

function add_trap_bianjingximen()
	local tbpoint =
	{
		tbtoppoint={1583,2989},
		nleftstep = 6,
		nrightstep = 3,
	}
	local nMapID = 37 --汴京
	local szScriptfile = "\\script\\中原北区\\汴京\\汴京\\trap\\汴京西门.lua"
	local tballpoint = getRectanglePoint(tbpoint)
	for nx,tbp in tballpoint do
		AddMapTrap(nMapID,floor(tbp[1]*32),floor(tbp[2]*32),szScriptfile)
	end
end