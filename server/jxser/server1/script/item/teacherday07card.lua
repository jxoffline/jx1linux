Include("\\script\\event\\teacher_day_200711\\head.lua");
Include("\\script\\event\\teacher_day_200711\\card.lua");
TeacherDay200711_IntervalTime = 60*10;--Ê®·ÖÖÓ

function main(nItemIndex)
	if (GetTask(TSK_TeacherDay200711_CardUseTime) + TeacherDay200711_IntervalTime > GetCurServerTime()) then
		Say("Mçi lÇn sö dông thiÖp chóc ph¶i ®îi 10 phót míi cã thÓ sö dông tiÕp.",0)
		return 1;
	end
	local _, _, nParti = GetItemProp(nItemIndex);
	TeacherDay200711_card_main(nParti);
	return 1
end