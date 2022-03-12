--Creator:yfeng
--Date:2004-8-27


--基本函数库

--以下代码模拟面向对象的new,利用lua提供的table模拟面向对象功能
if not MEM_HEAD then
MEM_HEAD = 1

function __clone (org,des) --生成一个新的内存空间，并保证与模板class形势相同
	local i,j
	for i,j in org do
		if(type(j)=="table") then
			des[i]={}
			__clone(j,des[i])
		else
			des[i]=j
		end
	end
end

function __cclone(org,des)
	local i,j
	for i,j in org do
		if(type(j)=="table") then
			if(not des[i]) then
				des[i]={}
				__cclone(j,des[i])
			end
		else
			if(not des[i]) then
				des[i]=j
			end
		end
	end
end
		

function new(class,...) --模拟new,复制一个新的实例,并执行伪构造函数:new(...)
	local obj={}
	__clone(class,obj)
	if(type(obj.__new)=="function") then
--		if(DEBUG) then
--			print("call function new")
--			print("arg num:"..getn(arg))
--			for i=1,getn(arg) do
--				print("\targ["..i.."]："..arg[i])
--			end
--		end
		obj:__new(arg)
	end
	return obj
end

function inherit(base,class) --与new的区别是，class已有的成员，不再从base复制
	__cclone(base,class)
	return class
end


end