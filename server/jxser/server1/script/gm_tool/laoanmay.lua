Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\GM_Tool\\dispose_item.lua");
Include("\\script\\GM_Tool\\exp_recall.lua");
function main()
	local tbOpp = {}
	local str = "<#> Mïa ®«ng l¹nh gi¸, Ta mét m×nh thËt c« ®¬n !";
	tinsert(tbOpp,"Ta ®ang cÇn 1 con sè may m¾n, ®¹i hiÖp cã thÓ cho ta kh«ng?/DisposeItem_main");
	tinsert(tbOpp, "<#>Tho¸t/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end

function OnCancel()
end