--Creator:yfeng
--Date:2004-8-31
--Comm:Include函数模拟
function Include(path)
	local info = getinfo(1,"S")
	local source = info.source
	
	if(strfind(path,"\\")) then --绝对路径表示方法
		local pos = strfind(source,"\\script")
		if(pos) then
			local realpath = strsub(source,2,pos-1)..path
			if(DEBUG) then
				print(realpath)
			end
			return dofile(realpath)
		end
		return nil
	end
	local s,e = strfind(source,".*\\")
	if(not e or not s) then
		return nil
	end
	local realpath = strsub(source,2,e)..path
	if(DEBUG) then
		print(realpath)
	end
	return dofile(realpath)
end

