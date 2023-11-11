Include("\\script\\lib\\awardtemplet.lua")

tbAwardLamBangTinh 		=  {szName = "§iÓm kinh nghiÖm", nExp = 3e6}

tbAwardHoangBangTinh 	= {szName = "§iÓm kinh nghiÖm", nExp = 2e6}

tbAwardTuBangTinh 	=
{
	[1] = 
	{
		{szName="§iÓm kinh nghiÖm", nExp=5000000, pFun = function(self, nItemCount, szLogTitle) SetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH, GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) + self.nExp/1e6) end, nRate=67},	
		{szName="§iÓm kinh nghiÖm", nExp=6000000, pFun = function(self, nItemCount, szLogTitle) SetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH, GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) + self.nExp/1e6) end, nRate=20},	
		{szName="§iÓm kinh nghiÖm", nExp=8000000, pFun = function(self, nItemCount, szLogTitle) SetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH, GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) + self.nExp/1e6) end, nRate=10},	
		{szName="§iÓm kinh nghiÖm", nExp=10000000, pFun = function(self, nItemCount, szLogTitle) SetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH, GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) + self.nExp/1e6) end, nRate=2},	
		{szName="§iÓm kinh nghiÖm", nExp=20000000, pFun = function(self, nItemCount, szLogTitle) SetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH, GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) + self.nExp/1e6) end, nRate=1},	
	},
	[2] =
	{
		{szName="HuyÒn Viªn Trİ TuÖ Ch©u LiÖm", tbProp={0,1595}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Trİ TuÖ T¨ng M·o", tbProp={0,1596}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Trİ TuÖ Th­îng Giíi", tbProp={0,1597}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Trİ TuÖ Hé UyÓn", tbProp={0,1598}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Trİ TuÖ Yªu §¸i", tbProp={0,1599}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Trİ TuÖ Cµ Sa", tbProp={0,1600}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Trİ TuÖ TriÒn Thñ", tbProp={0,1601}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Trİ TuÖ T¨ng Hµi", tbProp={0,1602}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Trİ TuÖ Yªu Trôy", tbProp={0,1603}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Trİ TuÖ H¹ Giíi", tbProp={0,1604}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Viªn M·n PhËt Ch©u", tbProp={0,1605}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Viªn M·n T¨ng M·o", tbProp={0,1606}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Viªn M·n Th­îng Giíi", tbProp={0,1607}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Viªn M·n Hé UyÓn", tbProp={0,1608}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Viªn M·n Yªu §¸i", tbProp={0,1609}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Viªn M·n Cµ Sa", tbProp={0,1610}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Viªn M·n T¨ng C«n", tbProp={0,1611}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Viªn M·n T¨ng Hµi", tbProp={0,1612}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Viªn M·n Yªu Trôy", tbProp={0,1613}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Viªn M·n H¹ Giíi", tbProp={0,1614}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn PhËt T©m H¹ng LiÖm", tbProp={0,1615}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn PhËt T©m T¨ng M·o", tbProp={0,1616}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn PhËt T©m Th­îng Giíi", tbProp={0,1617}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn PhËt T©m Hé UyÓn", tbProp={0,1618}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn PhËt T©m Yªu §¸i", tbProp={0,1619}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn PhËt T©m Cµ Sa", tbProp={0,1620}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn PhËt T©m Giíi §ao", tbProp={0,1621}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn PhËt T©m T¨ng Hµi", tbProp={0,1622}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn PhËt T©m Yªu Trôy", tbProp={0,1623}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn PhËt T©m H¹ Giíi", tbProp={0,1624}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Xung Thiªn H¹ng LiÖm", tbProp={0,1625}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Xung Thiªn Kh«i", tbProp={0,1626}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Xung Thiªn Th­îng Giíi", tbProp={0,1627}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Xung Thiªn Thóc UyÓn", tbProp={0,1628}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Xung Thiªn Yªu §¸i", tbProp={0,1629}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Xung Thiªn Kh¶i", tbProp={0,1630}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Xung Thiªn Chïy", tbProp={0,1631}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Xung Thiªn Ngoa", tbProp={0,1632}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Xung Thiªn Béi", tbProp={0,1633}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Xung Thiªn H¹ Giíi", tbProp={0,1634}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Phi V©n H¹ng LiÖm", tbProp={0,1635}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Phi V©n Kh«i", tbProp={0,1636}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Phi V©n Th­îng Giíi", tbProp={0,1637}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Phi V©n Thóc UyÓn", tbProp={0,1638}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Phi V©n Yªu §¸i", tbProp={0,1639}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Phi V©n Kh¶i", tbProp={0,1640}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Phi V©n Th­¬ng", tbProp={0,1641}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Phi V©n Ngoa", tbProp={0,1642}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Phi V©n Yªu Trôy", tbProp={0,1643}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Anh Dòng H¹ Giíi", tbProp={0,1644}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Anh Dòng H¹ng LiÖm", tbProp={0,1645}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Anh Dòng Kh«i", tbProp={0,1646}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Anh Dòng Th­îng Giíi", tbProp={0,1647}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Anh Dòng Thóc UyÓn", tbProp={0,1648}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Anh Dòng Yªu §¸i", tbProp={0,1649}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Anh Dòng Kh¶i", tbProp={0,1650}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Anh Dòng B¶o §ao", tbProp={0,1651}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Anh Dòng Ngoa", tbProp={0,1652}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Anh Dòng Yªu Trôy", tbProp={0,1653}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Anh Dòng H¹ Giíi", tbProp={0,1654}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn TŞnh ¢m Ch©u LiÖm", tbProp={0,1655}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn TŞnh ¢m Ph¸t §¸i", tbProp={0,1656}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn TŞnh ¢m Th­îng Giíi", tbProp={0,1657}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn TŞnh ¢m Hé UyÓn", tbProp={0,1658}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn TŞnh ¢m Thóc Yªu", tbProp={0,1659}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn TŞnh ¢m Sa Y", tbProp={0,1660}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn TŞnh ¢m KiÕm", tbProp={0,1661}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn TŞnh ¢m Hµi", tbProp={0,1662}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn TŞnh ¢m H­¬ng Nang", tbProp={0,1663}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn TŞnh ¢m H¹ Giíi", tbProp={0,1664}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Hµn B¨ng Ch©u LiÖm", tbProp={0,1665}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Hµn B¨ng Ph¸t §¸i", tbProp={0,1666}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Hµn B¨ng Th­îng Giíi", tbProp={0,1667}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Hµn B¨ng Hé UyÓn", tbProp={0,1668}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Hµn B¨ng Thóc Yªu", tbProp={0,1669}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Hµn B¨ng Sam", tbProp={0,1670}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Hµn B¨ng TriÒn Thñ", tbProp={0,1671}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Hµn B¨ng Hµi", tbProp={0,1672}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Hµn B¨ng H­¬ng Nang", tbProp={0,1673}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Hµn B¨ng H¹ Giíi", tbProp={0,1674}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn NguyÖt Hoa Ch©u LiÖm", tbProp={0,1675}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn NguyÖt Hoa Tr©m", tbProp={0,1676}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn NguyÖt Hoa Th­îng Giíi", tbProp={0,1677}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn NguyÖt Hoa Tô", tbProp={0,1678}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn NguyÖt Hoa Thóc Yªu", tbProp={0,1679}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn NguyÖt Hoa Sam", tbProp={0,1680}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn NguyÖt Hoa §ao", tbProp={0,1681}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn NguyÖt Hoa Ngoa", tbProp={0,1682}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn NguyÖt Hoa H­¬ng Nang", tbProp={0,1683}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn NguyÖt Hoa H¹ Giíi", tbProp={0,1684}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Phån Hoa Ch©u LiÖm", tbProp={0,1685}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Phån Hoa Tr©m", tbProp={0,1686}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Phån Hoa Th­îng Giíi", tbProp={0,1687}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Phån Hoa Tô", tbProp={0,1688}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Phån Hoa Yªu §¸i", tbProp={0,1689}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Phån Hoa Sam", tbProp={0,1690}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Phån Hoa Uyªn ¦¬ng §ao", tbProp={0,1691}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Phån Hoa Ngoa", tbProp={0,1692}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Phån Hoa H­¬ng Nang", tbProp={0,1693}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Phån Hoa H¹ Giíi", tbProp={0,1694}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn §o¹n Tr­êng H¹ng LiÖm", tbProp={0,1695}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn §o¹n Tr­êng Ph¸t §¸i", tbProp={0,1696}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn §o¹n Tr­êng Th­îng Giíi", tbProp={0,1697}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn §o¹n Tr­êng Hé UyÓn", tbProp={0,1698}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn §o¹n Tr­êng Yªu §¸i", tbProp={0,1699}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn §o¹n Tr­êng Bİ Trang", tbProp={0,1700}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn §o¹n Tr­êng TriÒn Thñ", tbProp={0,1701}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn §o¹n Tr­êng Ngoa", tbProp={0,1702}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn §o¹n Tr­êng Yªu Trôy", tbProp={0,1703}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn §o¹n Tr­êng H¹ Giíi", tbProp={0,1704}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn HuyÕt S¸t H¹ng LiÖm", tbProp={0,1705}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn HuyÕt S¸t Ph¸t §¸i", tbProp={0,1706}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn HuyÕt S¸t Th­îng Giíi", tbProp={0,1707}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn HuyÕt S¸t Hé UyÓn", tbProp={0,1708}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn HuyÕt S¸t Yªu §¸i", tbProp={0,1709}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn HuyÕt S¸t Bİ Trang", tbProp={0,1710}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn HuyÕt S¸t §ao", tbProp={0,1711}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn HuyÕt S¸t Ngoa", tbProp={0,1712}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn HuyÕt S¸t Yªu Trôy", tbProp={0,1713}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn HuyÕt S¸t H¹ Giíi", tbProp={0,1714}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn L·nh T©m H¹ng LiÖm", tbProp={0,1715}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn L·nh T©m Qu¸n", tbProp={0,1716}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn L·nh T©m Th­îng Giíi", tbProp={0,1717}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn L·nh T©m Hé UyÓn", tbProp={0,1718}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn L·nh T©m TriÒn Yªu", tbProp={0,1719}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn L·nh T©m Gi¸p Y", tbProp={0,1720}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn L·nh T©m Phi §ao", tbProp={0,1721}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn L·nh T©m Lı", tbProp={0,1722}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn L·nh T©m Trôy", tbProp={0,1723}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn L·nh T©m H¹ Giíi", tbProp={0,1724}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn V« T×nh H¹ng LiÖm", tbProp={0,1725}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn V« T×nh Qu¸n", tbProp={0,1726}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn V« T×nh Th­îng Giíi", tbProp={0,1727}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn V« T×nh Hé UyÓn", tbProp={0,1728}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn V« T×nh Thóc Yªu", tbProp={0,1729}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn V« T×nh Gi¸p", tbProp={0,1730}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn V« T×nh TôTiÔn", tbProp={0,1731}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn V« T×nh Lı", tbProp={0,1732}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn V« T×nh Yªu Trôy", tbProp={0,1733}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn V« T×nh H¹ Giíi", tbProp={0,1734}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Hµn Quang LiÖm", tbProp={0,1735}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Hµn Quang Ph¸t Qu¸n", tbProp={0,1736}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Hµn Quang Th­îng Giíi", tbProp={0,1737}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Hµn Quang Hé UyÓn", tbProp={0,1738}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Hµn Quang Thóc Yªu", tbProp={0,1739}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Hµn Quang Gi¸p Y", tbProp={0,1740}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Hµn Quang Tiªu", tbProp={0,1741}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Hµn Quang Lı", tbProp={0,1742}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Hµn Quang Trôy", tbProp={0,1743}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn Hµn Quang H¹ Giíi", tbProp={0,1744}, nRate=0.004, nQuality=1},	
		{szName="HuyÒn Viªn D­¬ng C­¬ng H¹ng LiÖm", tbProp={0,1745}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn D­¬ng C­¬ng §Çu Hoµn", tbProp={0,1746}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn D­¬ng C­¬ng Th­îng Giíi", tbProp={0,1747}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn D­¬ng C­¬ng Hé UyÓn", tbProp={0,1748}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn D­¬ng C­¬ng Thóc Yªu", tbProp={0,1749}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn D­¬ng C­¬ng C¸i Y", tbProp={0,1750}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn D­¬ng C­¬ng TriÒn Thñ", tbProp={0,1751}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn D­¬ng C­¬ng Ngoa", tbProp={0,1752}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn D­¬ng C­¬ng Yªu Trôy", tbProp={0,1753}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn D­¬ng C­¬ng H¹ Giíi", tbProp={0,1754}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn ChiÕn Long H¹ng LiÖm", tbProp={0,1755}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn ChiÕn Long §Çu Hoµn", tbProp={0,1756}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn ChiÕn Long Th­îng Giíi", tbProp={0,1757}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn ChiÕn Long Hé UyÓn", tbProp={0,1758}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn ChiÕn Long Thóc Yªu", tbProp={0,1759}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn ChiÕn Long C¸i Y", tbProp={0,1760}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn ChiÕn Long Tr­îng", tbProp={0,1761}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn ChiÕn Long Ngoa", tbProp={0,1762}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn ChiÕn Long Yªu Trôy", tbProp={0,1763}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn ChiÕn Long H¹ Giíi", tbProp={0,1764}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn L¹c Hån H¹ng Khuyªn", tbProp={0,1765}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn L¹c Hån Kh«i", tbProp={0,1766}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn L¹c Hån Th­îng Giíi", tbProp={0,1767}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn L¹c Hån Hé UyÓn", tbProp={0,1768}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn L¹c Hån Yªu §¸i", tbProp={0,1769}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn L¹c Hån Gi¸p Y", tbProp={0,1770}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn L¹c Hån Th­¬ng", tbProp={0,1771}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn L¹c Hån Ngoa", tbProp={0,1772}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn L¹c Hån Béi", tbProp={0,1773}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn L¹c Hån H¹ Giíi", tbProp={0,1774}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Ch­íc T×nh H¹ng LiÖm", tbProp={0,1775}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Ch­íc T×nh Qu¸n MiÖn", tbProp={0,1776}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Ch­íc T×nh Th­îng Giíi", tbProp={0,1777}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Ch­íc T×nh Hé UyÓn", tbProp={0,1778}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Ch­íc T×nh Yªu §¸i", tbProp={0,1779}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Ch­íc T×nh Gi¸p Y", tbProp={0,1780}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Ch­íc T×nh §ao", tbProp={0,1781}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Ch­íc T×nh Ngoa", tbProp={0,1782}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Ch­íc T×nh Béi", tbProp={0,1783}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Ch­íc T×nh H¹ Giíi", tbProp={0,1784}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Tam Phong Phï", tbProp={0,1785}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Tam Phong Qu¸n", tbProp={0,1786}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Tam Phong Th­îng Giíi", tbProp={0,1787}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Tam Phong Tô", tbProp={0,1788}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Tam Phong Ph¸p §¸i", tbProp={0,1789}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Tam Phong §¹o Bµo", tbProp={0,1790}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Tam Phong KiÕm", tbProp={0,1791}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Tam Phong Lı", tbProp={0,1792}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Tam Phong Ngäc Béi", tbProp={0,1793}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Tam Phong H¹ Giíi", tbProp={0,1794}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Tu T©m Phï", tbProp={0,1795}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Tu T©m Qu¸n", tbProp={0,1796}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Tu T©m Th­îng Giíi", tbProp={0,1797}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Tu T©m Tô", tbProp={0,1798}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Tu T©m Ph¸p §¸i", tbProp={0,1799}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Tu T©m §¹o Bµo", tbProp={0,1800}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Tu T©m KiÕm", tbProp={0,1801}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Tu T©m Lı", tbProp={0,1802}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Tu T©m Ngäc Béi", tbProp={0,1803}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Tu T©m H¹ Giíi", tbProp={0,1804}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Xuyªn V©n H¹ng LiÖm", tbProp={0,1805}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Xuyªn V©n §¹o Qu¸n", tbProp={0,1806}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Xuyªn V©n Th­îng Giíi", tbProp={0,1807}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Xuyªn V©n Hé UyÓn", tbProp={0,1808}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Xuyªn V©n Yªu §¸i", tbProp={0,1809}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Xuyªn V©n §¹o Bµo", tbProp={0,1810}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Xuyªn V©n NhÉn", tbProp={0,1811}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Xuyªn V©n Ngoa", tbProp={0,1812}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Xuyªn V©n Béi", tbProp={0,1813}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Xuyªn V©n H¹ Giíi", tbProp={0,1814}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Ph¸ B¨ng Phï", tbProp={0,1815}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Ph¸ B¨ng §¹o Qu¸n", tbProp={0,1816}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Ph¸ B¨ng Th­îng Giíi", tbProp={0,1817}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Ph¸ B¨ng Thñ", tbProp={0,1818}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Ph¸ B¨ng Yªu §¸i", tbProp={0,1819}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Ph¸ B¨ng §¹o Bµo", tbProp={0,1820}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Ph¸ B¨ng Tr­êng KiÕm", tbProp={0,1821}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Ph¸ B¨ng Ngoa", tbProp={0,1822}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Ph¸ B¨ng Béi", tbProp={0,1823}, nRate=0.005, nQuality=1},	
		{szName="HuyÒn Viªn Ph¸ B¨ng H¹ Giíi", tbProp={0,1824}, nRate=0.005, nQuality=1},	
		{szName="Th­¬ng Lang LÖnh", tbProp={6,1,2352,1,0,0}, nRate=1},	
		{szName="V©n Léc LÖnh", tbProp={6,1,2353,1,0,0}, nRate=1},	
		{szName="Ngäc Qu¸n", tbProp={6,1,2311,1,0,0}, nRate=5, nExpiredTime=20101118},	
		{szName="HuyÒn Thiªn CÈm Nang", tbProp={6,1,2355,1,0,0}, nRate=2},	
		{szName="Long HuyÕt Hoµn", tbProp={6,1,2117,1,0,0}, nRate=2, nExpiredTime=20101118},	
		{szName="H¶i Long Ch©u", tbProp={6,1,2115,1,0,0}, nRate=2, nExpiredTime=20101118},	
		{szName="§¹i Lùc hoµn LÔ bao", tbProp={6,1,2517,1,0,0}, nRate=3},	
		{szName="Phi tèc hoµn LÔ bao", tbProp={6,1,2520,1,0,0}, nRate=3},	
		{szName="B¸ch Niªn Tr©n Lé", tbProp={6,1,2266,1,0,0}, nRate=5},	
		{szName="Thiªn Niªn Tr©n Lé", tbProp={6,1,2267,1,0,0}, nRate=2},	
		{szName="V¹n Niªn Tr©n Lé", tbProp={6,1,2268,1,0,0}, nRate=1},	
		{szName="Bµo Tèc hoµn", tbProp={6,1,219,1,0,0}, nRate=3, nExpiredTime=10080},	
		{szName="Phæ C«ng hoµn", tbProp={6,1,229,1,0,0}, nRate=3, nExpiredTime=10080},	
		{szName="§éc C«ng hoµn", tbProp={6,1,230,1,0,0}, nRate=3, nExpiredTime=10080},	
		{szName="B¨ng C«ng hoµn", tbProp={6,1,231,1,0,0}, nRate=3, nExpiredTime=10080},	
		{szName="Háa C«ng hoµn", tbProp={6,1,232,1,0,0}, nRate=3, nExpiredTime=10080},	
		{szName="L«i C«ng hoµn", tbProp={6,1,233,1,0,0}, nRate=3, nExpiredTime=10080},	
		{szName="Tiªn Th¶o Lé (§Æc BiÖt)", tbProp={6,1,1765,1,0,0}, nRate=4},	
		{szName="Hång Bao An Khang", tbProp={6,1,2105,1,0,0}, nRate=0.2},	
		{szName="Phó Quı CÈm H¹p", tbProp={6,1,2402,1,0,0}, nRate=5, nExpiredTime=20101118},	
		{szName="B¹ch Cèt LÖnh", tbProp={6,1,2255,1,0,0}, nRate=5, nExpiredTime=20101118},	
		{szName="M¶nh b¶n ®å S¬n Hµ X· T¾c (1000 m¶nh)", tbProp={6,1,2514,1,0,0}, nRate=2, nExpiredTime=20101118},	
		{szName="M¹c B¾c TruyÒn Tèng LÖnh", tbProp={6,1,1448,1,0,0}, nRate=2, nExpiredTime=20101118},	
		{szName="Ngò Hµnh Kú Th¹ch", tbProp={6,1,2125,1,0,0}, nRate=7.1},	
		{szName="Linh D­îc Thµnh §«", tbProp={6,1,30062,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="Linh D­îc §¹i Lı", tbProp={6,1,30063,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="Linh D­îc Ph­îng T­êng", tbProp={6,1,30064,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="Linh D­îc T­¬ng D­¬ng", tbProp={6,1,30065,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="Linh D­îc BiÖn Kinh", tbProp={6,1,30066,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="Linh D­îc L©m An", tbProp={6,1,30067,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="Linh D­îc D­¬ng Ch©u", tbProp={6,1,30068,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="Ng©n l­îng", nRate =5, nJxb=1000000},	
		{szName="Ng©n l­îng", nRate =2, nJxb=2000000},	
		{szName="Ng©n l­îng", nRate =0.5, nJxb=5000000},	
		{szName="Ng©n l­îng", nRate =0.2, nJxb=10000000},	
	},
}

TASK_LIMIT_USE_LAMBANGTINH 					= 2772
TASK_LIMIT_USE_HOANG_TU_BANGTINH		= 2773

function main(nItemIndex)

	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then
		Msg2Player("VËt phÈm qu¸ h¹n sö dông, tù ®éng mÊt ®i.")
		return 0;
	end
	
	if (GetLevel() < 50) then
		Say("CÊp 50 trë lªn míi cã thÓ sö dông vËt phÈm nµy!",0)
		return 1
	end

	if CountFreeRoomByWH(2,3,1) < 1 then
		Talk(1, "", "Hµnh trang §¹i hiÖp kh«ng ®ñ 2x3 « trèng!.");
		return 1
	end
	
	local G,D,P,nLevel = GetItemProp(nItemIndex);
	
	if (P == 30059) then -- lam bang tinh
		if (GetTask(TASK_LIMIT_USE_LAMBANGTINH) >= 1000) then
			Say("§¹i hiÖp ®· ®¹t tèi ®a sè lÇn sö dông Lam B¨ng Tinh!",0)
			return 1
		end
		SetTask(TASK_LIMIT_USE_LAMBANGTINH, GetTask(TASK_LIMIT_USE_LAMBANGTINH)+1)
		tbAwardTemplet:GiveAwardByList(tbAwardLamBangTinh, "Sö dông Lam B¨ng Tinh");
		return 0
	end
	
	if (P == 30060) then -- hoang bang tinh
		if (GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) >= 6000) then
			Say("§¹i hiÖp ®· ®¹t tèi ®a sè lÇn sö dông vËt phÈm nµy!",0)
			return 1
		end
		SetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH, GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH)+2)
		tbAwardTemplet:GiveAwardByList(tbAwardHoangBangTinh, "Sö dông Hoµng B¨ng Tinh");
		return 0
	end
	
	if (P == 30061) then -- tu bang tinh
		if (GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) >= 6000) then
			Say("§¹i hiÖp ®· ®¹t tèi ®a sè lÇn sö dông vËt phÈm nµy!",0)
			return 1
		end
		tbAwardTemplet:GiveAwardByList(tbAwardTuBangTinh, "Sö dông Tö B¨ng Tinh ");
		return 0
	end
	
	Say("VËt phÈm kh«ng thÓ x¸c ®Şnh!",0)
	return 1
end