Include("\\script\\global\\systemconfig.lua") -- œµÕ≥≈‰÷√

IncludeForRegionVer("\\script\\global\\", "extpointfunc_proc.lua")

function OnExtPointChange(nExtPointIndex, nChangeValue)
	return OnExtPointChange_Proc(nExtPointIndex, nChangeValue);
end
