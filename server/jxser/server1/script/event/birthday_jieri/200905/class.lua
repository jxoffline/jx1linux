IncludeLib("SETTING")
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\lib\\pay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\birthday_jieri\\200905\\taskctrl.lua");


if not tbBirthday0905 then
	tbBirthday0905 = tbBaseClass:new()
end

local tbActData = 
{
	nStartDate			= 20090619,--20090619,
	nEndDate			= 20090719,
	nComposeEndDate		= 20090719,
	
	nMinLevel	= 50,
	bIsCharged	= 1,
	szClassName = "tbBirthday0905",
	
	ntonggu_cost = 50000,
	
	
	expbase = 1000,
	nxinbangu_addexp	= 15e5,
	tbxinbanqi_addexp	= {
		{2e6, 20},
		{3e6, 65},
		{4e6, 5},
		{5e6, 4},
		{6e6, 3},
		{8e6, 2},
		{10e6, 1},
	},
	
	tbTask	= tbBirthday0905_tbTasktCtrl,
}

function tbBirthday0905:_init(tbActData)
	for i,j in tbActData do
		self[i] = j
	end
	if self.tbTask then
		self.tbTask:_init(self.nStartDate, self.nEndDate)
	end
	
end

function tbBirthday0905:IsActDate()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	return self.nStartDate <= nCurDate and nCurDate <= self.nEndDate
end



function tbBirthday0905:IsPlayerEligible()
	
	if self.nMinLevel and (GetLevel() < self.nMinLevel and ST_IsTransLife() ~= 1) then
		return nil, format("C p t›ch lÚy kh´ng ÆÒ %d.", self.nMinLevel)
	end
	
	if self.nMaxLevel and (GetLevel() > self.nMaxLevel and ST_IsTransLife() ~= 1) then
		return nil, format("C p t›ch lÚy v≠Ót qu∏ %d.", self.nMaxLevel)
	end
	
	if self.bIsCharged and self.bIsCharged == 1 and IsCharged() ~= 1 then
		return nil, "ßπi hi÷p v…n ch≠a nπp thŒ µ!"
	end
	return 1
end


function tbBirthday0905:IsMainCity()
	
	local n_mapid = SubWorldIdx2ID(SubWorld);
	
	if (n_mapid == 1 or n_mapid == 11 or n_mapid == 37 or n_mapid == 78 or n_mapid == 80 or n_mapid == 162 or n_mapid == 176) then
		return 1;
	else
		return 0;
	end
	
end

function tbBirthday0905:buy_tougu()
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"));
	if (self:IsActDate()) then
		if GetCash() < self.ntonggu_cost then
			Say(format("B∏n rong: Hµng trang kh´ng ÆÒ ti“n, ta c«n %d l≠Óng.", self.ntonggu_cost),0)
			return
		end
		Pay(self.ntonggu_cost)
		local n_itemidx = AddItem(6,1,2067,1,0,0);
		ITEM_SetExpiredTime(n_itemidx, self.tbTask.item_expiredtime1);
		SyncItem(n_itemidx);
		local szstr = format("ChÛc mıng Æπi hi÷p nhÀn Æ≠Óc %s", "ßÂng CÊ")
		Msg2Player(szstr)
		
	end
end


tbBirthday0905:_init(tbActData)
