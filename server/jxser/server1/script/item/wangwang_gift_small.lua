
-- ====================== 文件信息 ======================

-- 剑侠情缘online 旺旺大礼包脚本（小）
-- Edited by peres
-- 2006/08/01 AM 09:52

-- I hope you still feel small when you stand beside the ocean,
-- Whenever one door closes I hope one more opens,
-- Promise me that youll give faith a fighting chance,
-- And when you get the choice to sit it out or dance.

-- ======================================================

Include("\\script\\lib\\randomitem.lua");

tabRandomItem = new(KTabFileEx, "\\settings\\event\\wangwanglibao\\gift_pack.txt", "tabRandomItem");

function main()
	openRandomItem(tabRandomItem, "T骾 may m緉");
end;