Include("\\script\\lib\\common.lua")
function fireworks_bless_anywhere(szParam)
	--OutputMsg(szParam)
	GlobalExecute(format("dw doBlessFireWorks([[%s]])", szParam))
end

function xuehua_bless_anywhere(szParam)
	GlobalExecute(format("dwf \\script\\item\\xuehua_callback.lua doXueHuaWorks([[%s]])", szParam))
end

function colork_bless_anywhere(szParam)
	--OutputMsg(szParam)
	GlobalExecute(format("dw Msg2SubWorld([[%s]])", szParam))
end

function valentine_bless_anywhere(szParam)
	--OutputMsg(szParam)
	GlobalExecute(format("dw doBlessValentine([[%s]])", szParam))
end