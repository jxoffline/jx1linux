-- ÖĞÇï»î¶¯¶Ò»»ÔÂ±ı²ÄÁÏ¶¨Ê±Æ÷

-- INTERVAL_TIME   = 30	    -- Ã¿°ë¸öĞ¡Ê±´¥·¢
-- VARV_BASEINDEX  = 100    -- Ê¹ÓÃµÄÆğÊ¼È«¾Ö±äÁ¿
-- DELAY_TIME      = 15     -- ÑÓ³Ù¶Ò»»Ê±¼ä

-- INTERVAL_TIME   = 30    -- Ã¿°ë¸öĞ¡Ê±´¥·¢
INTERVAL_TIME   = 5    -- Ã¿°ë¸öĞ¡Ê±´¥·¢
VARV_LASTCITY   = 100   -- ÉÏ´Î¶Ò»»²ÄÁÏµÄ³ÇÊĞ
VARV_BASEINDEX  = 101   -- Ê¹ÓÃµÄÆğÊ¼È«¾Ö±äÁ¿
-- DELAY_MIN_TIME  = 15    -- ÑÓ³Ù¶Ò»»Ê±¼ä£¨·ÖÖÓ£©
DELAY_MIN_TIME  = 2    -- ÑÓ³Ù¶Ò»»Ê±¼ä£¨·ÖÖÓ£©
START_HOUR_TIME = 9     -- ¶Ò»»ÆğÊ¼Ê±¼ä£¨Ğ¡Ê±£©


function IncMinute(hour, minute, inc)
	hour = mod(hour + floor(inc/60), 24)
	minute = mod(minute + mod(inc,60), 60)
    return hour, minute
end

-- function GetNextTime()
--     -- ÏÂÒ»¸ö°ëµã´¥·¢¶¨Ê±Æ÷
--     local hour = tonumber(date("%H"))
--     local minute = tonumber(date("%M"))
--     if (minute >= 0 and minute < 30) then
--         return hour, 30
--     else
--         return IncHour(hour, 1), 0
--     end
-- end

function GetNextTime()
    -- ÏÂÒ»¸ö°ëµã´¥·¢¶¨Ê±Æ÷
    local hour = tonumber(date("%H"))
    local minute = tonumber(date("%M"))
    return IncMinute(hour, minute, 1)
end

-- ¶Ò»»²ÄÁÏµÄ³ÇÊĞ
tbl_cities = {
    {1,     "Ph­îng T­êng"},
    {11,    "Thµnh §«"},
    {37,    "BiÖn Kinh"},
    {78,    "T­¬ng D­¬ng"},
    {80,    "D­¬ng Ch©u"},
    {162,   "§¹i Lı"},
    {176,   "L©m An"}, 
};

-- ¿É¶Ò»»µÄ²ÄÁÏ{Ã¿´Î¿É¶Ò»»ÊıÄ¿, Ã¿Ìì¿É¶Ò»»´ÎÊı}
tbl_material = {
    {1000, 12},     -- µ°
    {100, 6},       -- ĞÓÈÊ
    {50, 6},        -- »¨Éú
    {10, 6},        -- Ò¬Ë¿
};

-- ²ÄÁÏÃû×Ö
tbl_material_names = {
    "Trøng ",
    "H¹nh nh©n ",
    "§Ëu phéng ",
    "C¬m dõa",
};

-- ³õÊ¼»¯¿É¶Ò»»²ÄÁÏµÄÃ¿Ìì¿É¶Ò»»´ÎÊı
function InitMaterial()
    for i = 1, getn(tbl_material) do
        SetGblInt(VARV_BASEINDEX + i, tbl_material[i][2])
    end
end

-- »ñÈ¡¿É¶Ò»»²ÄÁÏÊıÄ¿
function GetMaterialCount(typeid)
    return tbl_material[typeid][1];
end

-- Ñ¡Ôñ±¾´ÎÒª¶Ò»»µÄ²ÄÁÏ
function SelectMaterial()
    local index = random(1, getn(tbl_material))
    local count = GetGblInt(VARV_BASEINDEX + index)
    if (count ~= 0) then
        SetGblInt(VARV_BASEINDEX + index, count - 1)
        return index
    end
    
    for i = 1, getn(tbl_material) do
        if (i ~= index) then
            count = GetGblInt(VARV_BASEINDEX + i)
            if (count ~= 0) then
                SetGblInt(VARV_BASEINDEX + i, count - 1)
                return i
            end
        end
    end
    return nil
end

function TaskShedule()
	TaskName("Ho¹t ®éng Trung thu ®æi vËt liÖu lµm b¸nh ");	

	-- ÉèÖÃ¼ä¸ôÊ±¼ä
	TaskInterval(INTERVAL_TIME);

	-- ÉèÖÃ´¥·¢Ê±¼ä
	local h, m = GetNextTime();
	TaskTime(h, m);
	OutputMsg(format("Ho¹t ®éng Trung thu ®æi vËt liÖu lµm b¸nh, ®ång hå ®Şnh giê khëi ®éng lµ %d:%d...", h, m));

	-- Ö´ĞĞ30´Î
	TaskCountLimit(0);
	
	-- ³õÊ¼»¯
	InitMaterial()
end

-- ´òÓ¡²ÄÁÏÊıÁ¿
function PrintMaterialCount()
    for i = 1, getn(tbl_material_names) do
        OutputMsg(format("%s: %d left",
            tbl_material_names[i],
            GetGblInt(VARV_BASEINDEX + i)))
    end
end

-- ¹Ø±ÕÉÏ´ÎµÄ¶Ò»»²ÄÁÏ»î¶¯
function CloseLastExchange()
    -- ¹Ø±Õ¶Ò»»²ÄÁÏ
    local lastcity = GetGblInt(VARV_LASTCITY)
    if (lastcity ~= nil and lastcity ~= 0) then
        local mapid = tbl_cities[lastcity][1]
        local cityname = tbl_cities[lastcity][2]
    	OutputMsg(format("Ho¹t ®éng Trung thu ®æi vËt liÖu lµm b¸nh % ®· ®ãng...", cityname))
        -- ´¥·¢GameServerÉÏµÄ½Å±¾
        local cmd = format("dw ExchangeMoonCakeMaterial(%d,0,0,0)", mapid)
        GlobalExecute(cmd); 
        DelGblInt(VARV_LASTCITY)
    end
end

-- ±£´æÉÏ´ÎµÄ¶Ò»»²ÄÁÏ»î¶¯
function SaveLastExchange(lastcity)
   SetGblInt(VARV_LASTCITY, lastcity)
end

function TaskContent()
    local hour = tonumber(date("%H"))
    local minute = tonumber(date("%M"))
    
    -- Ã¿ÌìÒ»´Î³õÊ¼»¯²ÄÁÏ¿É¶Ò»»´ÎÊı
    if (hour == START_HOUR_TIME and minute < 30) then
        InitMaterial()
    end
    
    if (hour >= START_HOUR_TIME) then
        local typeid = SelectMaterial()             -- ²ÄÁÏÀà±ğ
        local city = random(1, getn(tbl_cities))    -- Ëæ»úÑ¡Ôñ³ÇÊĞ
        local minute = random(1, DELAY_MIN_TIME)    -- ÑÓ³Ù¶Ò»»Ê±¼ä£¨·ÖÖÓ£©
        local mapid = tbl_cities[city][1]
        local cityname = tbl_cities[city][2]

        if (typeid == nil) then
        	OutputMsg("Ho¹t ®éng Trung thu ®æi vËt liÖu lµm b¸nh bŞ lçi...")
        else
    	    -- ´¥·¢GameServerÉÏµÄ½Å±¾
            CloseLastExchange()
            SaveLastExchange(city)

     	    local cmd = format("dw ExchangeMoonCakeMaterial(%d,%d,%d,%d)",
                mapid,                      -- ËùÔÚµØÍ¼
                minute,                     -- ÑÓ³Ù¶Ò»»Ê±¼ä
                typeid,                     -- ²ÄÁÏÀà±ğ
                GetMaterialCount(typeid));  -- Ã¿´Î¿É¶Ò»»ÊıÄ¿
            GlobalExecute(cmd)
        	OutputMsg(format("Ho¹t ®éng Trung thu ®æi vËt liÖu lµm b¸nh % ®· b¾t ®Çu...", cityname));
            
            OutputMsg(cmd);
            PrintMaterialCount()
        end
  	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
