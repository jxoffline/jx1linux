--Creator:yfeng
--Date:2004-8-31
--Comm:模拟系统函数用于在非游戏环境下调试

--Say函数
function Say(content,num,...)
	local input
	print(content)
	if(arg==nil) then
		return
	end
	--处理数组形式	
	if(type(arg[1])=="table") then
		for i=1,num do
			print(format("[%s]",arg[1][i]))
		end
		flush()
		input=tonumber(read())
		if(not input) then
			return
		end
		return select(arg[1],input)
	end
	--处理变长参数形式
	for i=1,num do
		print(format("[%s]",arg[i]))
	end
	flush()
	input=tonumber(read())
	if(not input) then
		return
	end
	return select(arg,input)
end
---Say命令的选择回调
function select(buttons,index)
	local run,sp,ep
	if(index < 1 or index > getn(buttons)) then
		if(DEBUG) then
			print("select button index error.")
		end
		return
	end
	sp,ep = strfind(buttons[index],"/#")
	if(ep) then
		run = strsub(buttons[index],ep+1,strlen(buttons[index]))
		if(DEBUG) then
			print(run)
			print("dostring...")
		end
		return dostring(run)
	end
	sp,ep = strfind(buttons[index],"/")
	if(ep) then
		run = strsub(buttons[index],ep+1,strlen(buttons[index])).."()"
		if(DEBUG) then
			print(run)
			print("dostring...")
		end
		return dostring(run)
	end
	return
end
	
--两个内存镜像变量组
__memTempTask={}
__memTask={}

--设置/得到临时任务变量
function SetTempTask(index,value)
	if(value==nil) then value = 0 end
	__memTempTask[index] = value
	if(DEBUG) then
		print(index,value)
	end
	return
end

function GetTempTask(index)
	local r = __memTempTask[index]
	if(r==nil) then return 0 end
	if(DEBUG) then print(r) end
	return r
end

