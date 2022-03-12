greatseed_configtab = {
	{37, 2, 50, "\\settings\\maps\\great_night\\ãê¾©ÄÏÃÅ.txt",}, --ãê¾©ÄÏÃÅ;
	{162, 3, 50, "\\settings\\maps\\great_night\\´óÀí±±ÃÅ.txt"},	--´óÀí±±ÃÅ
	{80, 3, 50, "\\settings\\maps\\great_night\\ÑïÖÝ¶«ÃÅ.txt"},	--ÑïÖÝ¶«ÃÅ;
	{1, 1, 50, "\\settings\\maps\\great_night\\·ïÏèÄÏÃÅ.txt"},	--·ïÏèÄÏÃÅ;
	{176, 2, 50, "\\settings\\maps\\great_night\\ÁÙ°²ÄÏÃÅ.txt"},	--ÁÙ°²ÄÏÃÅ;
	{11, 2, 50, "\\settings\\maps\\great_night\\³É¶¼±±ÃÅ.txt"},	--³É¶¼±±ÃÅ;
	{78, 3, 50, "\\settings\\maps\\great_night\\ÏåÑôÎ÷ÃÅ.txt"},	--ÏåÑôÎ÷ÃÅ;
};

function TaskShedule()
	--ÉèÖÃ·½°¸Ãû³Æ
	TaskName("LÔ Vu Lan")
	
	local nHour = tonumber(date("%H"))
	local nMin = tonumber(date("%M"));
	nMin = nMin + 2;
	if (nMin >= 60) then
		nMin = nMin - 60;
		nHour = nHour + 1;
	end;
	
	if (nHour >= 24) then
		nHour = 0;
	end;
	TaskTime(nHour, nMin);
	
	--ÉèÖÃ¼ä¸ôÊ±¼ä£¬µ¥Î»Îª·ÖÖÓ
	TaskInterval(1)
	
	--ÉèÖÃ´¥·¢´ÎÊý£¬0±íÊ¾ÎÞÏÞ´ÎÊý
	TaskCountLimit(0)
	OutputMsg("==================LÔ Vu Lan"..nHour..":"..nMin.."B¾t ®Çu===================");
end

function TaskContent()
	--ÔÚ19:30µ½20:01·ÖÖÐ¼ä²ÅÄÜ´¥·¢
	local START_TIME = 1930;
	local END_TIME = 2000;
	
	local nNowTime = tonumber(date("%H%M"));
	local nDate = tonumber(date("%y%m%d"));
	
	if (nDate >= 60808 and nDate <= 60815) then
		if (nNowTime >= 800 and nNowTime <= 2400)  then
			GlobalExecute("dw ShowFlower()"); --Ô½ÄÏÓÛÀ¼½ÚÖÖ»¨
			OutputMsg("=================LÔ Vu Lan===================");
		end;
	end;
end;
