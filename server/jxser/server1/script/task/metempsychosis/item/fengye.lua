--·âÒ³µÀ¾ß
Include("\\script\\task\\metempsychosis\\translife_7_config.lua")
Include("\\script\\task\\metempsychosis\\translife_7.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

g_szTittle = "H·y lùa chän: "

g_tbSelection = 
{
	"<#> ph­¬ng ph¸p thu thËp bÝ quyÕt Trïng sinh 7/composite_method",
	"<#> hîp thµnh bÝ quyÕt Trïng sinh 7/begin_composite",
	"<#> tiÕp tôc nç lùc/on_cancel",
}

g_szComposeMethod = TL7_CONFIG.tbLang[8]

function main(nItemIndex)
	Say(g_szTittle, getn(g_tbSelection), g_tbSelection);
	return 1
end


function composite_method()
	--Say(g_szComposeMethod, 0);
	CreateNewSayEx(g_szComposeMethod, {})
end

function begin_composite()
	local nHaveItemFlag = check_compose_item()
	if nHaveItemFlag == 0 then
		Say(TL7_CONFIG.tbLang[9], 0)
		return 
	end
	
	local nTotalNeedRoom = 1
	if %PlayerFunLib:CheckFreeBagCell(nTotalNeedRoom, "default") ~= 1 then
		Say(format(TL7_CONFIG.tbLang[4], nTotalNeedRoom), 0 );
		return 
	end
	
	local nDelCode = del_compose_item()
	if nDelCode ~= 1 then
		Say(TL7_CONFIG.tbLang[10], 0)
		return 
	end
	
	AddItem(unpack(TL7_CONFIG.tbTaskItem))
	SetTL7TaskValue(TL7_CONFIG.TSK_BIT_COMPOSE_TASK_ITEM, 1)
	Say(TL7_CONFIG.tbLang[20], 0)
end

function on_cancel()

end

function check_compose_item()
	local nHaveItemFlag = 1
	local tbComposeNeedItem = TL7_CONFIG.tbComposeNeedItem
	for nIndex, tbNeedItemParam in tbComposeNeedItem do
		local nGenre, nDetail, nParticular, nNeedNum  = unpack(tbNeedItemParam)
		if CalcEquiproomItemCount(nGenre, nDetail, nParticular, 1) == 0 then
			nHaveItemFlag = 0
		end
	end
	return nHaveItemFlag
end

function del_compose_item()
	local tbComposeNeedItem = TL7_CONFIG.tbComposeNeedItem
	local nRetCode = 1
	for nIndex, tbNeedItemParam in tbComposeNeedItem do
		local nGenre, nDetail, nParticular, nLevel = tbNeedItemParam[1], tbNeedItemParam[2], tbNeedItemParam[3], 1
		local nDelCode = ConsumeEquiproomItem(1, nGenre, nDetail, nParticular, nLevel)
		if nDelCode ~= 1 then
			nRetCode = 0
		end
	end
	return nRetCode
end
