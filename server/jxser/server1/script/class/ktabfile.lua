--========文件定义==================================--
--文件名：ktabfile.lua
--作者：yfeng
--创建日期：2004-6-1
--最后修改日期：2005-1-29
--功能叙述：
--	该文件利用系统提供的TabFile相关脚本指令，实现了读取
--tabfile文件的各种操作，并对其进行了封装
--
--游戏脚本·剑侠情缘网络版
--金山软件股份有限公司，copyright 1992-2005
--==================================================--

if not KTABFILE_HEAD then
KTABFILE_HEAD = 1

Include("\\script\\lib\\mem.lua")
Include("\\script\\class\\lerror.lua")


IncludeLib("FILESYS")

--========类定义====================================--
--类名：KTabFile
--作者：yfeng
--创建日期：2004-6-1
--最后修改日期：2005-1-29
--功能叙述：
--	该类负责读取一个tabfile，并负责对其进行读操作。
--成员变量：
--	__key：tabfile的保留在系统的关键字
--成员函数：
--	:__new(filename,key)
--	构造函数，
--	:load(filename,key)
--	载入名为filename的tabfile，
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
--用例：
--	无
--==================================================--
KTabFile = inherit(LError,{

--========函数定义==================================--
--函数原形：:__new(filename,key)
--作者：yfeng
--创建日期：2004-6-1
--最后修改日期：2005-1-29
--功能叙述：
--	实例化时自动载入名为filename的tabfile，此filename
--是描述的路径是针对游戏路径/settings的。key为标记该
--tabfile的内存唯一标识
--参数：
--	filename：要载入的tabfile路径
--	key：唯一标识
--返回值：
--	无
--用例：
--	local myTabfile = new(KTabFile,"settings/npcs.txt","NPCS")
--	if(myTabfile:getLaseError()) then 
--		--失败了。
--	end
--==================================================--
	__new = function(self,arg)
		if(not arg) then return end
		self:load(arg[1],arg[2])
	end,

--========函数定义==================================--
--函数原形：:load(filename,key)
--作者：yfeng
--创建日期：2004-6-1
--最后修改日期：2005-1-29
--功能叙述：
--	载入名为filename的tabfile，，并用key标识其在内存
--中的关键字，一旦载入成功，所有地方都可以通过key访问
--该tabfile。
--参数：
--	filename：要载入的tabfile的路径名
--	key：标识关键字
--返回值：
--	nil表示执行失败．否则表示成功．
--用例：
--	local tabfile = new(KTabFile)
--	if(not tabfile:load("settings/npcs.txt")) then
--		print(tabfile:getLastError)
--	end
--==================================================--
	load = function(self,filename,key)
		self.__key = key
		if(TabFile_Load(filename,key) ==0) then
			self:__notify(100,"Жng nh藀"..filename.."xu蕋 hi謓 l鏸!")
			return nil
		end
		return 1
	end,

--========函数定义==================================--
--函数原形：:getCell(col,row) or :getCell(fieldName,row)
--作者：yfeng
--创建日期：2004-6-1
--最后修改日期：2005-1-29
--功能叙述：
--	读取tabfile第row行，第col列所对应的单元格的内容，如
--果col为字符串，则表示为字段名fieldName，则所对应的单元
--格为第row行，字段名为fieldName的内容。
--参数：
--	col/fieldName：当该参数为整数是，取意为列数，当该参
--数为字符串类型时，取意为tabfile的字段名。
--	row：tabfile中的行数。
--返回值：
--	则返回字符串型的单元内容。
--用例：
--	local tabfile = new(KTabFile,"settings/npcs.txt","NPCS")
--	local cell = tabfile:getCell(1,1)
--==================================================--
	getCell = function(self,col,row)
		return TabFile_GetCell(self.__key,row+1,col)
	end,

--========函数定义==================================--
--函数原形：:getRow()
--作者：yfeng
--创建日期：2005-1-29
--最后修改日期：2005-1-29
--功能叙述：
--	得到tabfile内容的行数，表头不包含在内
--参数：
--	无
--返回值：
--	行数
--用例：
--	无
--==================================================--
	getRow = function(self)
		return TabFile_GetRowCount(self.__key) -1
	end,
	
	release = function(self)
		TabFile_UnLoad(self.__key)
	end
})

end

