--========文件定义==================================--
--文件名：lerror.lua
--作者：yfeng
--创建日期：2005-1-24
--最后修改日期：2005-1-29
--功能叙述：
--	描述错误信息的相关功能类
--
--游戏脚本·剑侠情缘网络版
--金山软件股份有限公司，copyright 1992-2005
--==================================================--
if not LERROR_HEAD then
LERROR_HEAD = 1

--========类定义====================================--
--类名：LError
--作者：yfeng
--创建日期：2005-1-24
--最后修改日期：2005-1-26
--功能叙述：
--	描述出错信息的功能类，其他类可以通过继承该类，而
--具有错误描述功能。
--成员变量：
--	__errorCode：错误代码
--	__errorMsg：错误信息
--成员函数：
--	:__notify：通告一个错误
--	:getLastError：得到最后的出错信息
--用例：
--	无
--==================================================--

LError = {
--========函数定义==================================--
--函数原形：:__notify(errorCode,errorMsg)
--作者：yfeng
--创建日期：2005-1-24
--最后修改日期：2005-1-24
--功能叙述：
--	通告出错信息，便于用:getLastError()的到出错信息．
--参数：
--	errorCode：错误编号
--	errorMsg：错误文字信息
--返回值：
--	无
--用例：
--	无
--==================================================--
	__notify = function(self,errorCode,errorMsg)
		self.__errorCode = errorCode
		self.__errorMsg = errorMsg
		if(DEBUG) then
			print("error["..self.__errorCode.."]:"..self.__errorMsg)
		end
	end,

--========函数定义==================================--
--函数原形：:getLastError()
--作者：yfeng
--创建日期：2005-1-24
--最后修改日期：2005-1-24
--功能叙述：
--	得到最后一次出错的信息
--参数：
--	无
--返回值：
--	第一个返回值error：表示错误编号，如果为nil，表示没有错误
--	第二个返回值errmsg：表示错误的文字信息。
--用例：
--	无
--==================================================--
	getLastError = function(self)
		local en = self.__errorCode;local em = self.__errorMsg
		self.__errorCode = nil;self.__errorMsg = nil
		return en,em
	end,

}

end

