if(not MEM_HEAD) then
	Include ("\\script\\lib\\mem.lua")
end

if(not KBONUS_HEAD) then
	Include ("\\script\\class\\kbonus.lua")
end

Include ("\\script\\shitu\\shitu_head.lua")

LilianMasterExpBonus = inherit(KBonus,{
	[CONST_LLITEM_JOINPARTY] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={100000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"∞›»Î“ª∏ˆ√≈≈…",
	[CONST_LLITEM_SKILL10UP5] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={100000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"±æ√≈10º∂Œ‰π¶Ã·…˝µΩ5º∂“‘…œ",
	[CONST_LLITEM_ZHENGPAI20] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={200000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"ÕÍ≥…’˝≈…20º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_ZHONGLI20] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={200000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"ÕÍ≥…÷–¡¢20º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_XIEPAI20] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={200000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"ÕÍ≥…–∞≈…20º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_SKILL10UP15] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={200000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"±æ√≈10º∂Œ‰π¶Ã·…˝µΩ15º∂“‘…œ",
	[CONST_LLITEM_GETSKILL30] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={300000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"œ∞µ√±æ√≈30º∂Œ‰π¶",
	[CONST_LLITEM_YESOUTASK] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={500000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"¡¨–¯≥…π¶ÕÍ≥…10¥Œ“‘…œ“∞€≈»ŒŒÒ",
	[CONST_LLITEM_ZHENGPAI30] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={300000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"ÕÍ≥…’˝≈…30º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_ZHONGLI30] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={300000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"ÕÍ≥…÷–¡¢30º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_XIEPAI30] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={300000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"ÕÍ≥…–∞≈…30º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_GETSKILL40] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={500000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"œ∞µ√±æ√≈40º∂Œ‰π¶",
	[CONST_LLITEM_ZHENGPAI40] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={500000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"ÕÍ≥…’˝≈…40º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_ZHONGLI40] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={500000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"ÕÍ≥…÷–¡¢40º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_XIEPAI40] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={500000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"ÕÍ≥…–∞≈…40º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_GETSKILL50] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={800000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"œ∞µ√±æ√≈50º∂Œ‰π¶",
	[CONST_LLITEM_ZHENGPAI50] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={800000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"ÕÍ≥…’˝≈…50º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_ZHONGLI50] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={800000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"ÕÍ≥…÷–¡¢50º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_XIEPAI50] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={800000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"ÕÍ≥…–∞≈…50º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_GETSKILL60] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1200000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"œ∞µ√±æ√≈60º∂Œ‰π¶",
	[CONST_LLITEM_ZHENGPAI60] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1200000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"ÕÍ≥…’˝≈…60º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_ZHONGLI60] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1200000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"ÕÍ≥…÷–¡¢60º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_XIEPAI60] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1200000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"ÕÍ≥…–∞≈…60º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_SONGJIN] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1500000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"ªÒµ√1000∑÷“‘…œÀŒΩª˝∑÷",
	[CONST_LLITEM_SHENGWANG] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1500000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"ªÒµ√200µ„“‘…œµƒ…˘Õ˚",
	[CONST_LLITEM_SHANHESHEJI] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1500000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"ªÒµ√500∏ˆ“‘…œµƒ…Ω∫”…Á¢Õº≤–∆¨",
	[CONST_LLITEM_JOINTONG] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1000000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"º”»ÎµΩ“ª∏ˆ∞Ô≈…",
	[CONST_LLITEM_SKILL60UP3] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1500000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"60º∂Œ‰π¶3º∂“‘…œ"
	[CONST_LLITEM_LEVEL65] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1500000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"µ»º∂Ã·…˝÷¡65º∂“‘…œ",
	[CONST_LLITEM_LEVEL70] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1000000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"µ»º∂Ã·…˝÷¡70º∂“‘…œ",
	[CONST_LLITEM_LEVEL75] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1000000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"µ»º∂Ã·…˝÷¡75º∂“‘…œ",
	[CONST_LLITEM_LEVEL76] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1000000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"µ»º∂Ã·…˝÷¡76º∂“‘…œ",
	[CONST_LLITEM_LEVEL77] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1000000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"µ»º∂Ã·…˝÷¡77º∂“‘…œ",
	[CONST_LLITEM_LEVEL78] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1000000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"µ»º∂Ã·…˝÷¡78º∂“‘…œ",
	[CONST_LLITEM_LEVEL79] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1000000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"µ»º∂Ã·…˝÷¡79º∂“‘…œ",
	[CONST_LLITEM_LEVEL80] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1000000},[CONST_ITEM_NAME]="kinh nghi÷m <name> Æi”m"},--"µ»º∂Ã·…˝÷¡80º∂“‘…œ",
})

LilianMasterItemBonus = inherit(KBonus,{
	[CONST_LLITEM_JOINPARTY] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,2},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 2"},--"∞›»Î“ª∏ˆ√≈≈…",
	[CONST_LLITEM_SKILL10UP5] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,2},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 2"},--"±æ√≈10º∂Œ‰π¶Ã·…˝µΩ5º∂“‘…œ",
	[CONST_LLITEM_ZHENGPAI20] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,2},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 2"},--"ÕÍ≥…’˝≈…20º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_ZHONGLI20] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,2},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 2"},--"ÕÍ≥…÷–¡¢20º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_XIEPAI20] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,2},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 2"},--"ÕÍ≥…–∞≈…20º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_SKILL10UP15] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,2},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 2"},--"±æ√≈10º∂Œ‰π¶Ã·…˝µΩ15º∂“‘…œ",
	[CONST_LLITEM_GETSKILL30] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 3"},--"œ∞µ√±æ√≈30º∂Œ‰π¶",
	[CONST_LLITEM_YESOUTASK] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 3"},--"¡¨–¯≥…π¶ÕÍ≥…10¥Œ“‘…œ“∞€≈»ŒŒÒ",
	[CONST_LLITEM_ZHENGPAI30] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 3"},--"ÕÍ≥…’˝≈…30º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_ZHONGLI30] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 3"},--"ÕÍ≥…÷–¡¢30º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_XIEPAI30] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 3"},--"ÕÍ≥…–∞≈…30º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_GETSKILL40] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 3"},--"œ∞µ√±æ√≈40º∂Œ‰π¶",
	[CONST_LLITEM_ZHENGPAI40] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 3"},--"ÕÍ≥…’˝≈…40º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_ZHONGLI40] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 3"},--"ÕÍ≥…÷–¡¢40º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_XIEPAI40] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 3"},--"ÕÍ≥…–∞≈…40º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_GETSKILL50] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 3"},--"œ∞µ√±æ√≈50º∂Œ‰π¶",
	[CONST_LLITEM_ZHENGPAI50] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 3"},--"ÕÍ≥…’˝≈…50º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_ZHONGLI50] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 3"},--"ÕÍ≥…÷–¡¢50º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_XIEPAI50] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 3"},--"ÕÍ≥…–∞≈…50º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_GETSKILL60] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,4},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 4"},--"œ∞µ√±æ√≈60º∂Œ‰π¶",
	[CONST_LLITEM_ZHENGPAI60] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,4},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 4"},--"ÕÍ≥…’˝≈…60º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_ZHONGLI60] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,4},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 4"},--"ÕÍ≥…÷–¡¢60º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_XIEPAI60] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,4},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 4"},--"ÕÍ≥…–∞≈…60º∂÷˜œﬂ»ŒŒÒ",
	[CONST_LLITEM_SONGJIN] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,4},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 4"},--"ªÒµ√1000∑÷“‘…œÀŒΩª˝∑÷",
	[CONST_LLITEM_SHENGWANG] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,4},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 4"},--"ªÒµ√200µ„“‘…œµƒ…˘Õ˚",
	[CONST_LLITEM_SHANHESHEJI] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,4},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 4"},--"ªÒµ√500∏ˆ“‘…œµƒ…Ω∫”…Á¢Õº≤–∆¨",
	[CONST_LLITEM_JOINTONG] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,5},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 5"},--"º”»ÎµΩ“ª∏ˆ∞Ô≈…",
	[CONST_LLITEM_SKILL60UP3] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,4},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 4"},--"60º∂Œ‰π¶3º∂“‘…œ"
	[CONST_LLITEM_LEVEL65] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,5},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 5"},--"µ»º∂Ã·…˝÷¡65º∂“‘…œ",
	[CONST_LLITEM_LEVEL70] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,5},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 5"},--"µ»º∂Ã·…˝÷¡70º∂“‘…œ",
	[CONST_LLITEM_LEVEL75] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,5},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 5"},--"µ»º∂Ã·…˝÷¡75º∂“‘…œ",
	[CONST_LLITEM_LEVEL76] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,5},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 5"},--"µ»º∂Ã·…˝÷¡76º∂“‘…œ",
	[CONST_LLITEM_LEVEL77] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,5},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 5"},--"µ»º∂Ã·…˝÷¡77º∂“‘…œ",
	[CONST_LLITEM_LEVEL78] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,5},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 5"},--"µ»º∂Ã·…˝÷¡78º∂“‘…œ",
	[CONST_LLITEM_LEVEL79] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,5},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 5"},--"µ»º∂Ã·…˝÷¡79º∂“‘…œ",
	[CONST_LLITEM_LEVEL80] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,6},[CONST_ITEM_NAME]="1 Huy“n Tinh Kho∏ng Thπch c p 6"},--"µ»º∂Ã·…˝÷¡80º∂“‘…œ",
})

function PayMasterBonus(appIdx, masterIdx,bonusIdx)
	LilianMasterExpBonus:payBonus(masterIdx,bonusIdx)
	
	-- ‘Ωƒœ∞Ê–ﬁ∏ƒ»•µÙŒÔ∆∑Ω±¿¯ by Peres 2006/04/25
	-- LilianMasterItemBonus:payBonus(masterIdx,bonusIdx)
	
	-- ª∆ΩÕΩµ‹µƒ ¶∏∏£¨‘ŸªÒµ√∂ÓÕ‚µƒΩ±¿¯(20%)
	if (callPlayerFunction(appIdx, GetTask, TKID_GOLD_APPRENTICE) > 0) then
		callPlayerFunction(masterIdx, Msg2Player, "Bπn Æ∑ sˆ dÙng Hoµng Kim S≠ ÆÂ thi’p, nhÀn Æ≠Óc 20% ph«n th≠Îng kinh nghi÷m")
		LilianMasterExpBonus:payBonusEx(masterIdx,bonusIdx, 0.2)
	end	
end
