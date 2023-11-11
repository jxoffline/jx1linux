Include("\\script\\event\\beidoulingpai\\itemlist.lua")
Include("\\script\\event\\beidoulingpai\\lang.lua")
tbBDTaskList = 
{
	[1] = {nTaskType = 1, szShow = "§Õn §­êng M«n t×m §­êng KhuyÕt",szNpcName="§­êng KhuyÕt ", },
	[2] = {nTaskType = 1, szShow = "§Õn §­êng M«n t×m Qu¶n Gia",szNpcName="Qu¶n Gia", },
	[3] = {nTaskType = 1, szShow = "§Õn L©m An t×m Töu B¶o",szNpcName="Töu B¶o ", },
	[4] = {nTaskType = 1, szShow = "§Õn Ngò §éc Gi¸o t×m B¹ch Doanh Doanh",szNpcName="B¹ch Doanh Doanh", },
	[5] = {nTaskType = 1, szShow = "§Õn Thóy Yªn M«n t×m [H¶i §­êng Sø Gi¶] LÖ Thu Thñy",szNpcName="H¶i §­êng sø gi¶ LÖ Thu Thuû ", },
	[6] = {nTaskType = 1, szShow = "§Õn ph¸i C«n Lu©n t×m §ång TÞch Nhan",szNpcName="§ång TÞch Nhan", },
	[7] = {nTaskType = 1, szShow = "§Õn ph¸i Vâ §ang t×m Chu V©n TuyÒn",szNpcName="Chu V©n TuyÒn", },
	[8] = {nTaskType = 1, szShow = "§Õn Cæ D­¬ng §éng t×m Th­¬ng Bu«n",szNpcName="Th­¬ng Bu«n", },
	[9] = {nTaskType = 1, szShow = "§Õn T­¬ng D­¬ng t×m §µo §µo",szNpcName="§µo §µo", },
	[10] = {nTaskType = 1, szShow = "§Õn T­¬ng D­¬ng t×m Tiªu §Çu",szNpcName="Tiªu ®Çu", },
	[11] = {nTaskType = 1, szShow = "§Õn Thµnh §« t×m H¹ Lan Chi",szNpcName="H¹ Lan Chi", },
	[12] = {nTaskType = 1, szShow = "§Õn Thµnh §« t×m Tõ TÈu",szNpcName="Tõ TÈu", },
	[13] = {nTaskType = 1, szShow = "§Õn §¹i Lý t×m §ao Liªn Anh",szNpcName="§ao Liªn Anh ", },
	[14] = {nTaskType = 1, szShow = "§Õn Ph­îng T­êng t×m §Ëu §Ëu",szNpcName="§Ëu §Ëu ", },
	[15] = {nTaskType = 1, szShow = "§Õn Ph­îng T­êng t×m «ng chñ tiÖm trµ",szNpcName="Chñ tiÖm trµ ", },
	[16] = {nTaskType = 1, szShow = "§Õn BiÖn Kinh t×m Ph­¬ng L·o Th¸i",szNpcName="Ph­¬ng L·o Th¸i ", },
	[17] = {nTaskType = 1, szShow = "§Õn BiÖn Kinh t×m §Ëu Tö Lý ",szNpcName="§Ëu Tö Lý ", },
	[18] = {nTaskType = 1, szShow = "§Õn L©m An t×m Th­ Sinh",szNpcName="Th­ sinh", },
	[19] = {nTaskType = 1, szShow = "§Õn D­¬ng Ch©u t×m Trµ B¸c SÜ",szNpcName="Trµ b¸c sÜ ", },
	[20] = {nTaskType = 1, szShow = "§Õn D­¬ng Ch©u t×m LiÔu §¹i Gia",szNpcName="LiÔu ®¹i gia", },
	[21] = {nTaskType = 1, szShow = "§Õn D­¬ng Ch©u t×m NhËm Thiªn Nhai",szNpcName="NhiÖm Thiªn Nhai", },
	[22] = {nTaskType = 1, szShow = "§Õn Giang T©n th«n t×m Thiªn Thiªn",szNpcName="Thiªn Thiªn ", },
	[23] = {nTaskType = 1, szShow = "§Õn Th¹ch Cæ trÊn t×m A Nguyªn",szNpcName="A Nguyªn ", },
	[24] = {nTaskType = 1, szShow = "§Õn VÜnh L¹c trÊn t×m Cóc N÷u",szNpcName="Cóc N÷u ", },
	[25] = {nTaskType = 1, szShow = "§Õn Long M«n trÊn t×m Mai H­¬ng",szNpcName="Mai H­¬ng ", },
	[26] = {nTaskType = 1, szShow = "§Õn Ba L¨ng huyÖn t×m Du Cöu Ch©u",szNpcName="Du Cöu Ch©u", },
	[27] = {nTaskType = 1, szShow = "§Õn Nam Nh¹c trÊn t×m A Phóc",szNpcName="A Phóc ", },
	[28] = {nTaskType = 1, szShow = "§Õn Chu Tiªn trÊn t×m L·o M·",szNpcName="L·o M· ", },
	[29] = {nTaskType = 1, szShow = "§Õn Long TuyÒn th«n t×m Bµnh Phãng",szNpcName="Bµnh Phãng", },
	[30] = {nTaskType = 1, szShow = "§Õn §¹o H­¬ng th«n t×m V­¬ng Hæ",szNpcName="V­¬ng Hæ ", },
	[31] = {nTaskType = 1, szShow = "§Õn Thiªn V­¬ng Bang t×m H÷u Sø D­¬ng Hå",szNpcName="H÷u Sø D­¬ng Hå ", },
	[32] = {nTaskType = 1, szShow = "§Õn C¸i Bang t×m Lý T­",szNpcName="Lý T­ ", },
}

for i=1, getn(tbBD_ItemList) do
	local taskOpt = {}
	if i>= 129 then 
		taskOpt.nTaskType = 2 
	else
		taskOpt.nTaskType = 0
	end
	taskOpt.szShow = format(MSG_TASK_SHOW, tbBD_ItemList[i].nCount, tbBD_ItemList[i].szName )
	taskOpt.nItemListIndex = i
	tinsert(tbBDTaskList, taskOpt)
end
