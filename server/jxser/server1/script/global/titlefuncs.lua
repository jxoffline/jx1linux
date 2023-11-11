IL("TITLE");
MAX_TITLE_PERPAGE = 5
TASK_ACTIVE_TITLE = 1122

function change_title()
	Say("B¹n muèn ta gióp viÖc g×?", 3,  "T×m xem hoÆc kİch ho¹t danh hiÖu ®· cã /#title_ShowTitleList(1)", "Kh«ng kİch ho¹t danh hiÖu hiÖn thêi/#title_choose(0)", "Kh«ng cÇn/OnCancel")
end

function title_ShowTitleList(nPage)
	local tab = Title_GetTitleTab()
	
	if (tab == nil or getn(tab) == 0) then
		Say("Tr­íc mÆt b¹n kh«ng cã danh hiÖu nµo hÕt!",0)
		return
	end
	
	local titletab = {};
	local iter = 1
	--·ÇµÚÒ»Ò³ÔòÏÔÊ¾ÉÏÒ»Ò³
	if (nPage > 1) then
		titletab[iter] = "Trang tr­íc/#title_ShowTitleList("..(nPage - 1)..")"
		iter = iter + 1
	end
	
	--Èç¹ûÒ³ÊıÓÃÍêµÄ»°
	if (getn(tab) <= MAX_TITLE_PERPAGE * nPage) then
		for i = MAX_TITLE_PERPAGE * (nPage - 1) + 1, getn(tab) do 
			titletab[iter] = Title_GetTitleName(tab[i]).."/#title_choose("..tab[i]..")";
			iter = iter + 1
		end
	else
		for i = 1, MAX_TITLE_PERPAGE do 
			tabiter = i + (nPage - 1)*MAX_TITLE_PERPAGE 
			titletab[iter] = Title_GetTitleName(tab[tabiter]).."/#title_choose("..tab[tabiter]..")";
			iter = iter + 1
		end
		titletab[iter] = "Trang kÕ /#title_ShowTitleList("..(nPage + 1)..")"
		iter = iter + 1
	end
	
	titletab[iter] = "Gi÷ l¹i ban ®Çu/OnCancel"
	iter = iter + 1
	Say("Tr­íc m¾t b¹n ®ang nhËn danh hiÖu lµ "..getn(tab)..", b¹n muèn kİch ho¹t danh hiÖu nµo?", getn(titletab), titletab);
end

function title_choose(titleid)
	Title_ActiveTitle(titleid)
	SetTask(TASK_ACTIVE_TITLE,titleid)
end

function title_loginactive()
	Title_ActiveTitle(GetTask(TASK_ACTIVE_TITLE))
end;