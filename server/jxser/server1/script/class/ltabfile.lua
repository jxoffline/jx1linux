--========文件定义==================================--
--文件名：ltabfile.lua
--作者：yfeng
--创建日期：2004-6-1
--最后修改日期：2005-1-27
--功能叙述：
--	该文件包含了操作tabfile文件的一个lua模拟类，实现了
--对tabfile的读取，写入，以及对其元素的读取和修改
--
--游戏脚本·剑侠情缘网络版
--金山软件股份有限公司，copyright 1992-2005
--==================================================--
if not LTABFILE_HEAD then
LTABFILE_HEAD = 1

Include("\\script\\lib\\mem.lua")
Include("\\script\\lib\\string.lua")
Include("\\script\\class\\lerror.lua")


--========类定义====================================--
--类名：LTabFile
--作者：yfeng
--创建日期：2004-6-1
--最后修改日期：2005-1-24
--功能叙述：
--	该类负责读取一个tabfile，并负责对其进行读写操作，
--以及更新其内容．
--成员变量：
--	__flieds：tabfile的表头字段集合
--	__content：tabfile的内容
--	__errorNo：出错编号
--	__errorMsg：出错信息
--成员函数：
--	:__notify(errorNo,errorMsg)
--	出错通告，便于getLastError()查询
--	:__new(filename)
--	构造函数，
--	:load(filename)
--	载入名为filename的tabfile，
--	:writeto(filename)
--	把内容写入到文件filename中．
--	:release()
--	删除载入的tabfile内容，并释放存储空间．
--	:getFilds()
--	返回表头字段的数组．
--	:getField(col)
--	得到表头的某个字段名
--	:getRow()
--	得到tabfile内容的总行数
--	:getCol()
--	得到tabfile内容的总列数
--	:getCell(field,row) or :getCell(col,row)
--	获取tabfile某一单元的内容
--	:setCell(field,row,value) or :setCell(col,row,value))
--	改写某一单元的内容
--	:renameFieldName(oldFieldName,newFieldName) or :renameFieldName(col,newFieldName)
--	重命名字段名
--	:addField(fieldName)
--	创建一个新的字段．
--	:insertField(fieldName,before)
--	插入一个字段
--	:deleteField(fieldName) or :deleteField(col) 
--	删除一个字段
--	:addRow()
--	添加一行
--	:insertRow(before)
--	插入一行
--	:deleteRow(row)
--	删除一行
--	:getLastError()
--	得到最后一次出错的信息．
--用例：
--
--
--
--==================================================--
LTabFile=inherit(LError,{

--========函数定义==================================--
--函数原形：:__new(filename)
--作者：yfeng
--创建日期：2004-6-1
--最后修改日期：2005-1-24
--功能叙述：
--	实例化时自动载入名为filename的tabfile，如果载入失
--败．则可以用:getLastError()得到相关信息，如果filename
--为nil，则在内存创建一份空的tabfile格式．
--参数：
--	filename：要载入的tabfile路径
--返回值：
--	无
--用例：
--	local myTabfile = new(KTabFile,"settings/npcs.txt")
--	if(myTabfile:getLaseError()) then 
--		--失败了。
--	end
--==================================================--
	__new = function(self,arg)
		if(not arg) then
			return
		end
		self:load(arg[1],arg[2])
	end,

--========函数定义==================================--
--函数原形：:load(filename,key)
--作者：yfeng
--创建日期：2004-6-1
--最后修改日期：2005-1-24
--功能叙述：
--	载入名为filename的tabfile，如果载入失败，通过
--getLastError()可以得到相关信息．如果该对象已经成功
--载入过一次tabfile，则该函数会失败．
--参数：
--	filename：要载入的tabfile的路径名
--	key：兼容KTabfile
--返回值：
--	nil表示执行失败．否则表示成功．
--用例：
--	local tabfile = new(KTabFile,"key")
--	if(not tabfile:load("settings/npcs.txt") then
--		print(tabfile:getLastError)
--	end
--==================================================--
	load = function(self,filename,key)
		local fh = openfile(filename,"r")
		if(not fh) then
			self:__notify(200,"open file "..filename.."error for read.")
			return nil
		end
		local line = read(fh,"*l")
		if(not line) then
			self:__notify(300,"empty content of ."..filename)
			return nil
		end
		self.__fields = split(line,"\t") --读取表头信息
		local ln = 0
		line = read(fh,"*l")
		if(line) then --初始化content
			self.__content = {}
			local col = getn(self.__fields)
			while  line do  --读取表内容
				ln = ln + 1
				self.__content[ln] = split(line,"\t")
				--整理数据，将nil变更成""，防止输出长度不等
				--暂时取消，保持原有格式
				--local st = getn(self.__content[ln])
				--for i=st,col do
					--if(not self.__content[ln][i]) then
						--self.__content[ln][i] = ""
					--end
				--end
				line = read(fh,"*l")
			end
		end
		if(not closefile(fh)) then
			self:__notify(400,"close "..filename.." error.")
			return nil
		end
		return 1
	end,
	
--========函数定义==================================--
--函数原形：:writeto(filename)
--作者：yfeng
--创建日期：2005-1-24
--最后修改日期：2005-1-24
--功能叙述：
--	将内存中的tabfile格式写入到文件filename中去．
--参数：
--	filename：将要写入的文件的路径名．
--返回值：
--	nil表示失败，否则为成功．
--用例：
--	local tabfile = new(KTabFile,"settings/npcs.txt")
--	if(tabfile:getLastError() == 0) then
--		tabfile:writeto("settings/npcs2.txt")
--	end
--==================================================--
	writeto = function(self,filename)
		local fh = openfile(filename,"w")
		if(not fh) then
			self:__notify(600,"open file "..filename.." error for read.")
			return nil
		end
		if(not self.__fields) then --表头空，不可写
			self:__notify(100,"fields empty.")
			return nil
		end
		write(fh,join(self.__fields,"\t").."\n") --写表头,ms excel格式，最后是\n，不是\r
		if(self.__content) then -- 内容非空，写内容
			for i=1,getn(self.__content) do --写表的内容
				write(fh,join(self.__content[i],"\t").."\n")
			end
		end
		flush(fh)
		if(not closefile(fh)) then
			self:__notify(400,"close "..filename.." error.")
			return nil
		end
		return 1
	end,

--========函数定义==================================--
--函数原形：:release()
--作者：yfeng
--创建日期：2005-1-24
--最后修改日期：2005-1-24
--功能叙述：
--	释放tabfile的内存结构，释放之后的对象可以再次通过
--:local(filename)载入tabfile
--参数：
--	无
--返回值：
--	无
--用例：
--	无
--==================================================--
	release = function(self)
		self.__fields = nil
		self.__content = nil
		return
	end,

--========函数定义==================================--
--函数原形：:getFields()
--作者：yfeng
--创建日期：2005-1-24
--最后修改日期：2005-1-24
--功能叙述：
--	得到tabfile的表头字段集合。
--参数：
--	无
--返回值：
--	nil为失败，原因用:getLastError()获得，如果成功，
--则返回字段数组。
--用例：
--	local tabfile = new(KTabFile,"settings/npcs.txt")
--	local fields = tabfile:getFields()
--==================================================--
	getFields = function(self)
		if(not self.__fields) then
			self:__notify(100,"fields empty."	)
			return nil
		end
		return self.__fields
	end,

--========函数定义==================================--
--函数原形：:getField(col)
--作者：yfeng
--创建日期：2005-1-24
--最后修改日期：2005-1-24
--功能叙述：
--	得到第col列的表头字段名。
--参数：
--	col：列数
--返回值：
--	如果成功，则返回字符串型的字段名。失败返回nil，具
--体错误信息通过:getLastError()获得。
--用例：
--	local tabfile = new(KTabFile,"settings/npcs.txt")
--	for i=1,tabfile:getCol() do
--		print(tabfile:getField(i))
--	end
--==================================================--
	getField = function(self,col)
		if(not self.__fields) then
			self:__notify(100,"fields empty."	)
			return nil
		end
		if(col < 1 or col > getn(self.__fields)) then
			self:__notify(800,"invalidate column number.")
			return nil
		end
		return self.__fields[col]
	end,
	
--========函数定义==================================--
--函数原形：:getRow()
--作者：yfeng
--创建日期：2004-61
--最后修改日期：2005-1-25
--功能叙述：
--	获得tabfile的行数，该行数不包含表头的行
--参数：
--	无
--返回值：
--	返回tabfile的行数，没有为0。
--用例：
--	无
--==================================================--
	getRow = function(self)
		if(not self.__content) then
			return 0
		end
		return getn(self.__content)
	end,
	
--========函数定义==================================--
--函数原形：:getCol()
--作者：yfeng
--创建日期：2004-6-1
--最后修改日期：2005-1-24
--功能叙述：
--	得到tabfile的列数。
--参数：
--	无
--返回值：
--	tabfile的列数，没有则为0。
--用例：
--	无
--==================================================--
	getCol = function(self)
		if(not self.__fields) then
			return 0
		end
		return getn(self.__fields)
	end,
	
--========函数定义==================================--
--函数原形：:getCell(col,row) or :getCell(fieldName,row)
--作者：yfeng
--创建日期：2004-6-1
--最后修改日期：2005-1-24
--功能叙述：
--	读取tabfile第row行，第col列所对应的单元格的内容，如
--果col为字符串，则表示为字段名fieldName，则所对应的单元
--格为第row行，字段名为fieldName的内容。
--参数：
--	col/fieldName：当该参数为整数是，取意为列数，当该参
--数为字符串类型时，取意为tabfile的字段名。
--	row：tabfile中的行数。
--返回值：
--	如果失败，返回nil，了解具体情况，使用:getLastError()
--如果成功，则返回字符串型的单元内容。
--用例：
--	local tabfile = new(KTabFile,"settings/npcs.txt")
--	local cell = tabfile:getCell(1,1)
--==================================================--
	getCell = function(self,col,row)
		--保证效率，不除错
		if(type(col) == "string") then
			local len = getn(self.__fields)
			for i=1,len do
				if(self.__fields[i] == col) then
					col = i
					break
				end
			end
		end
		local data = self.__content[row][col]
		if not data then
			return ""
		end
		return tostring(data)
	end,
	
})

end

