Include("\\script\\lib\\common.lua")
if not tbBaseClass then

local t = newtag()
local  Tgettable = function(t, k)

	if rawget(t,k) == nil then
		return rawget(t,"_tbBase")[k]
	else
		return rawget(t,k)
	end
end

local Tsettable = function(t, k, v)
	rawset(t,k,v)
end

local t = newtag()

tbBaseClass = {}
function tbBaseClass:new(...)
	local tb = 
	{
		_tbBase = self
	}
	settag(tb,%t)
	
	local isOk
	if (tb._init) then
		isOk = tb:_init(unpack(arg));
	end;
	return tb,isOk;

end
function tbBaseClass:NewClass(tbClass, ...)
	local tb = 
	{
		_tbBase = tbClass,
		new = self.new
	}
	settag(tb,%t)
	
	local isOk
	if (tb._init) then
		tinsert(arg,1,tb)
		isOk = call(tb._init,arg);
	end;
	return tb,isOk;

end
settagmethod(t,"gettable",Tgettable)
settagmethod(t,"settable",Tsettable)

end
