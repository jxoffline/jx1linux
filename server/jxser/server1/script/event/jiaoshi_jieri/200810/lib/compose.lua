
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")
if not jiaoshi0810_ComposeClass then
	
jiaoshi0810_ComposeClass = {}

function jiaoshi0810_ComposeClass:CheckMaterial(tbMaterial)
	local i
	local flag = 1
	local tbCount  = {}
	local tbMaxSetCount = {}
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		if tbItem.tbProp then
			tbItem.nCount = tbItem.nCount or 1
			if tbItem.nCount > 0 then
				local tbProp = tbItem.tbProp
				tbProp[4] = tbProp[4] or -1		
				local nCurCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4])
				tbCount[i] = nCurCount
				tbMaxSetCount[i] = floor(nCurCount / tbItem.nCount)
				if nCurCount < tbItem.nCount then
					flag =  0;
				end	
			end			
		elseif tbItem.nJxb then
			local nCash = GetCash()
			tbCount[i] = nCash
			tbMaxSetCount[i] = floor(nCash / tbItem.nJxb)
			if nCash < tbItem.nJxb then
				flag = 0
			end
		end
	end
	return flag, tbCount, tbMaxSetCount;
end

function jiaoshi0810_ComposeClass:CanMakeMaxCount(tbMaterial)
	local _, _, tbMaxCount = self:CheckMaterial(tbMaterial)
	local nMinCount = tbMaxCount[1]
	for i=2, getn(tbMaxCount) do
		if nMinCount > tbMaxCount[i] then
			nMinCount = tbMaxCount[i]
		end
	end
	return nMinCount;
end

function jiaoshi0810_ComposeClass:ConsumeMaterial(tbMaterial)
	local i
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		if tbItem.tbProp then				
			tbItem.nCount = tbItem.nCount or 1
			if tbItem.nCount > 0 then
				local tbProp = tbItem.tbProp
				tbProp[4] = tbProp[4] or -1
				--print(tbProp[1], tbProp[2], tbProp[3], tbProp[4])
				if ConsumeEquiproomItem(tbItem.nCount, tbProp[1], tbProp[2], tbProp[3], tbProp[4]) ~= 1 then
					return 0;
				end	
			end
		elseif tbItem.nJxb then
			if Pay(tbItem.nJxb) == 0 then
				return 0;
			else
				Msg2Player(format("CÇn <color=yellow>%d<color> l­îng",tbItem.nJxb))
			end
		end
	end
	return 1;
end
function jiaoshi0810_ComposeClass:GetMaterialList(tbMaterial)
	local szList = format("%-20s  %s","vËt phÈm ","Sè l­îng")
	local _, tbCount, tbMaxCount = self:CheckMaterial(tbMaterial)
	local i;
	for i=1,getn(tbMaterial) do
		
		local szColor = "<color=green>"
		if tbMaxCount[i] < 1 then
			szColor = "<color=red>"
		end
		local tbItem = tbMaterial[i]
		if tbItem.tbProp then
			szList = format("%s<enter><color=yellow>%-20s<color>  %s(%d/%d)<color>",szList,tbMaterial[i].szName, szColor, tbCount[i], tbMaterial[i].nCount)
		elseif tbItem.nJxb then
			szList = format("%s<enter><color=yellow>%-20s<color>  %s(%d/%d)<color>",szList,"Ng©n l­îng", szColor, tbCount[i], tbMaterial[i].nJxb)
		end
	end
	return szList
end




function jiaoshi0810_ComposeClass:Compose(tbFormula, szLogTitle, pFun, ...)
	
	
	local tbMaterial	= tbFormula.tbMaterial
	local tbProduct		= tbFormula.tbProduct
	
	
	if self:CheckMaterial(tbMaterial) ~=1 then
		local szMsg = "<dec><color=red>Nguyªn liÖu mang theo kh«ng ®ñ<color>."
		CreateTaskSay(
			{
				szMsg,
				"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./OnCancel",
				
			}
		)
		return 0;
	end

	if self:ConsumeMaterial(tbMaterial) ~= 1 then
		--Say("ÖÆ×÷Ê§°Ü£¬²¿·ÖÎïÆ·¶ªÊ§¡£",0)
		Msg2Player("ChÕ t¹o thÊt b¹i, mÊt ®i mét sè nguyªn liÖu.")
		return 0;
	end
	if type(tbProduct) == "table" then
		tbAwardTemplet:GiveAwardByList(tbProduct, szLogTitle )
	end
	
	if type(pFun) == "function" then
		call(pFun, arg)
	end 
	return 1;
end

end