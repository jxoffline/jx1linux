--城市铁匠公共入口
--by 廖志山

if (not __H_CHAT_CITY_SMITH__) then
	__H_CHAT_CITY_SMITH__ = 1;


function main(sel)
	local tab_Content = {
		"Ta mu鑞 mua v礽 m鉵 binh kh�/tj_default_chat",		--原铁匠功能入口
		"Nh﹏ ti謓 gh� qua th玦/oncancel",
	};
	
	-- 如果活动时间,插入活动对话,以下举例
--	if (isEventDay() ==1) then
--		tinsert(tab_Content,1, "参加活动/onEventMain");
--	end;
	
	if (getn(tab_Content) > 2) then		--如果有活动插入对话

		Say("Th� r蘮: Kh竎h quan t譵 ta c� vi謈 g�?", getn(tab_Content), tab_Content);

	else					--没有活动直接进入原对话

		tj_default_chat();

	end;
end;

function oncancel()
end;

end; --// end of __H_CHAT_CITY_SMITH__;