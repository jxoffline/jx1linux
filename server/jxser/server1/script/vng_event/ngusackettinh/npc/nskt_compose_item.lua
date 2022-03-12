Include("\\script\\lib\\composeex.lua")
Include("\\script\\vng_event\\ngusackettinh\\head.lua")

if (not tbNSKT_ItemCompose) then
	tbNSKT_ItemCompose = {}
end

tbNSKT_ItemCompose.tbCrystalCompose = 
	{
		["KÕt Tinh Tam S¾c"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("Ho¹t ®éng Ngò Th¸i KÕt Tinh\t Hîp thµnh %s", "KÕt Tinh Tam S¾c"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "KÕt Tinh Méc", tbProp = {6,1,30070,1,0,0}, nCount = 1},
								{szName = "KÕt Tinh Háa", tbProp = {6,1,30072,1,0,0}, nCount = 1},
								{szName = "KÕt Tinh Thæ", tbProp = {6,1,30073,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "KÕt Tinh Tam S¾c", tbProp = {6,1,30077,1,0,0}, nExpiredTime = tbNSKT_head.nItemExpiredTime},
					},
					pCompos = nil;
			},
		["KÕt Tinh Tø S¾c"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("Ho¹t ®éng Ngò Th¸i KÕt Tinh\t Hîp thµnh %s", "KÕt Tinh Tø S¾c"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "KÕt Tinh Méc", tbProp = {6,1,30070,1,0,0}, nCount = 1},
								{szName = "KÕt Tinh Thñy", tbProp = {6,1,30071,1,0,0}, nCount = 1},
								{szName = "KÕt Tinh Háa", tbProp = {6,1,30072,1,0,0}, nCount = 1},
								{szName = "KÕt Tinh Thæ", tbProp = {6,1,30073,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "KÕt Tinh Tø S¾c", tbProp = {6,1,30076,1,0,0}, nExpiredTime = tbNSKT_head.nItemExpiredTime},
					},
					pCompos = nil;
			},
		["KÕt Tinh Ngò S¾c"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("Ho¹t ®éng Ngò Th¸i KÕt Tinh\t Hîp thµnh %s", "KÕt Tinh Ngò S¾c"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "KÕt Tinh Kim", tbProp = {6,1,30069,1,0,0}, nCount = 1},
								{szName = "KÕt Tinh Méc", tbProp = {6,1,30070,1,0,0}, nCount = 1},
								{szName = "KÕt Tinh Thñy", tbProp = {6,1,30071,1,0,0}, nCount = 1},
								{szName = "KÕt Tinh Háa", tbProp = {6,1,30072,1,0,0}, nCount = 1},
								{szName = "KÕt Tinh Thæ", tbProp = {6,1,30073,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "KÕt Tinh Ngò S¾c", tbProp = {6,1,30075,1,0,0}, nExpiredTime = tbNSKT_head.nItemExpiredTime},
					},
					pCompos = nil;
			},
		["Phiªn Vò"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("Ho¹t ®éng Ngò Th¸i KÕt Tinh\t §æi %s", "Phiªn Vò"),
						nWidth = 2,
						nHeight = 3,
						nFreeItemCellLimit = 1,
						tbMaterial = 
							{
								{szName = "LÖnh Bµi TriÖu Håi", tbProp = {6,1,30074,1,0,0}, nCount = 60},								
							},
						tbProduct = {szName = "Phiªn Vò", tbProp = {0,10,7,1,0,0},nCount=1,nExpiredTime=259200},
					},
					pCompos = nil;
			},
			["Phiªn Vò Kh«ng H¹n Sö Dông"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("Ho¹t ®éng Ngò Th¸i KÕt Tinh\t §æi %s", "Phiªn Vò Kh«ng H¹n Sö Dông"),
						nWidth = 2,
						nHeight = 3,
						nFreeItemCellLimit = 1,
						tbMaterial = 
							{
								{szName = "LÖnh Bµi TriÖu Håi", tbProp = {6,1,30074,1,0,0}, nCount = 200},								
							},
						tbProduct = {szName = "Phiªn Vò", tbProp = {0,10,7,1,0,0},nCount=1,},
					},
					pCompos = nil;
			},
		["Ng«i Sao"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("Ho¹t ®éng Ngò Th¸i KÕt Tinh\t §æi %s", "Ng«i Sao"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "Ng«i Sao May M¾n", tbProp = {6,1,30078,1,0,0}, nCount = 1},
								{szName = "C©y Th«ng", tbProp = {6,1,30082,1,0,0}, nCount = 1},								
							},
						tbProduct = 
							{
								{szName="Ng«i Sao H¹nh Phóc",tbProp={6,1,30080,1,0,0},nRate=80,nCount=1,nExpiredTime=tbNSKT_head.nItemExpiredTime},
								{szName="Ng«i Sao An Lµnh",tbProp={6,1,30079,1,0,0},nRate=15,nCount=1,nExpiredTime=tbNSKT_head.nItemExpiredTime},
								{szName="Ng«i Sao Tr¾ng",tbProp={6,1,30081,1,0,0},nRate=5,nCount=1,nExpiredTime=tbNSKT_head.nItemExpiredTime},
							},
					},
					pCompos = nil;
			}
	}
	
function tbNSKT_ItemCompose:compose(szItemName)
	local tbItem = self.tbCrystalCompose[szItemName];
	if (tbItem) then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, format("Hîp thµnh [%s]", szItemName));
		end
			tbItem.pCompos:ComposeDailog(1);
	end
end