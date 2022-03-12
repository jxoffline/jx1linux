Include("\\script\\baoruongthanbi\\head.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
tbAWard=
{
	[1]=
	{
		{szName = "§iÓm kinh nghiÖm", nExp_tl=1000000000},
	},
	[2]=
	{
		{szName = "§iÓm kinh nghiÖm", nExp_tl=100000000},
	},
	[3]=
	{
		{szName = "§iÓm kinh nghiÖm", nExp_tl=20000000},
	},
	[4]=
	{
		{szName = "§iÓm kinh nghiÖm", nExp_tl=6000000},
	},
	
}
tbAwardItem = 
{
	{szName = "HuyÒn Viªn Trİ TuÖ Ch©u LiÖm", tbProp = {0, 1595}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Trİ TuÖ T¨ng M·o", tbProp = {0, 1596}, nQuality = 1, nRate = 1.6},
{szName = "HuyÒn Viªn Trİ TuÖ Th­îng Giíi", tbProp = {0, 1597}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Trİ TuÖ Hé UyÓn", tbProp = {0, 1598}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Trİ TuÖ Yªu §¸i", tbProp = {0, 1599}, nQuality = 1, nRate = 1.5},
{szName = "HuyÒn Viªn Trİ TuÖ Cµ Sa", tbProp = {0, 1600}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Trİ TuÖ TriÒn Thñ", tbProp = {0, 1601}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Trİ TuÖ T¨ng Hµi", tbProp = {0, 1602}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Trİ TuÖ Yªu Trôy", tbProp = {0, 1603}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Trİ TuÖ H¹ Giíi", tbProp = {0, 1604}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Viªn M·n PhËt Ch©u", tbProp = {0, 1605}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Viªn M·n T¨ng M·o", tbProp = {0, 1606}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Viªn M·n Th­îng Giíi", tbProp = {0, 1607}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Viªn M·n Hé UyÓn", tbProp = {0, 1608}, nQuality = 1, nRate = 1.6},
{szName = "HuyÒn Viªn Viªn M·n Yªu §¸i", tbProp = {0, 1609}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Viªn M·n Cµ Sa", tbProp = {0, 1610}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Viªn M·n T¨ng C«n", tbProp = {0, 1611}, nQuality = 1, nRate = 1.5},
{szName = "HuyÒn Viªn Viªn M·n T¨ng Hµi", tbProp = {0, 1612}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Viªn M·n Yªu Trôy", tbProp = {0, 1613}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Viªn M·n H¹ Giíi", tbProp = {0, 1614}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn PhËt T©m H¹ng LiÖm", tbProp = {0, 1615}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn PhËt T©m T¨ng M·o", tbProp = {0, 1616}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn PhËt T©m Th­îng Giíi", tbProp = {0, 1617}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn PhËt T©m Hé UyÓn", tbProp = {0, 1618}, nQuality = 1, nRate = 1.5},
{szName = "HuyÒn Viªn PhËt T©m Yªu §¸i", tbProp = {0, 1619}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn PhËt T©m Cµ Sa", tbProp = {0, 1620}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn PhËt T©m Giíi §ao", tbProp = {0, 1621}, nQuality = 1, nRate = 1.6},
{szName = "HuyÒn Viªn PhËt T©m T¨ng Hµi", tbProp = {0, 1622}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn PhËt T©m Yªu Trôy", tbProp = {0, 1623}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn PhËt T©m H¹ Giíi", tbProp = {0, 1624}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Xung Thiªn H¹ng LiÖm", tbProp = {0, 1625}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Xung Thiªn Kh«i", tbProp = {0, 1626}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Xung Thiªn Th­îng Giíi", tbProp = {0, 1627}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Xung Thiªn Thóc UyÓn", tbProp = {0, 1628}, nQuality = 1, nRate = 1.5},
{szName = "HuyÒn Viªn Xung Thiªn Yªu §¸i", tbProp = {0, 1629}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Xung Thiªn Kh¶i", tbProp = {0, 1630}, nQuality = 1, nRate = 1.6},
{szName = "HuyÒn Viªn Xung Thiªn Chïy", tbProp = {0, 1631}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Xung Thiªn Ngoa", tbProp = {0, 1632}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Xung Thiªn Béi", tbProp = {0, 1633}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Xung Thiªn H¹ Giíi", tbProp = {0, 1634}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Phi V©n H¹ng LiÖm", tbProp = {0, 1635}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Phi V©n Kh«i", tbProp = {0, 1636}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Phi V©n Th­îng Giíi", tbProp = {0, 1637}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Phi V©n Thóc UyÓn", tbProp = {0, 1638}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Phi V©n Yªu §¸i", tbProp = {0, 1639}, nQuality = 1, nRate = 1.5},
{szName = "HuyÒn Viªn Phi V©n Kh¶i", tbProp = {0, 1640}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Phi V©n Th­¬ng", tbProp = {0, 1641}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Phi V©n Ngoa", tbProp = {0, 1642}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Phi V©n Yªu Trôy", tbProp = {0, 1643}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Anh Dòng H¹ Giíi", tbProp = {0, 1644}, nQuality = 1, nRate = 1.6},
{szName = "HuyÒn Viªn Anh Dòng H¹ng LiÖm", tbProp = {0, 1645}, nQuality = 1, nRate = 1.6},
{szName = "HuyÒn Viªn Anh Dòng Kh«i", tbProp = {0, 1646}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Anh Dòng Th­îng Giíi", tbProp = {0, 1647}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Anh Dòng Thóc UyÓn", tbProp = {0, 1648}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Anh Dòng Yªu §¸i", tbProp = {0, 1649}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Anh Dòng Kh¶i", tbProp = {0, 1650}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Anh Dòng B¶o §ao", tbProp = {0, 1651}, nQuality = 1, nRate = 1.5},
{szName = "HuyÒn Viªn Anh Dòng Ngoa", tbProp = {0, 1652}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Anh Dòng Yªu Trôy", tbProp = {0, 1653}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Anh Dòng H¹ Giíi", tbProp = {0, 1654}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn TŞnh ¢m Ch©u LiÖm", tbProp = {0, 1655}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn TŞnh ¢m Ph¸t §¸i", tbProp = {0, 1656}, nQuality = 1, nRate = 1.6},
{szName = "HuyÒn Viªn TŞnh ¢m Th­îng Giíi", tbProp = {0, 1657}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn TŞnh ¢m Hé UyÓn", tbProp = {0, 1658}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn TŞnh ¢m Thóc Yªu", tbProp = {0, 1659}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn TŞnh ¢m Sa Y", tbProp = {0, 1660}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn TŞnh ¢m KiÕm", tbProp = {0, 1661}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn TŞnh ¢m Hµi", tbProp = {0, 1662}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn TŞnh ¢m H­¬ng Nang", tbProp = {0, 1663}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn TŞnh ¢m H¹ Giíi", tbProp = {0, 1664}, nQuality = 1, nRate = 1.5},
{szName = "HuyÒn Viªn Hµn B¨ng Ch©u LiÖm", tbProp = {0, 1665}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Hµn B¨ng Ph¸t §¸i", tbProp = {0, 1666}, nQuality = 1, nRate = 1.6},
{szName = "HuyÒn Viªn Hµn B¨ng Th­îng Giíi", tbProp = {0, 1667}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Hµn B¨ng Hé UyÓn", tbProp = {0, 1668}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Hµn B¨ng Thóc Yªu", tbProp = {0, 1669}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Hµn B¨ng Sam", tbProp = {0, 1670}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Hµn B¨ng TriÒn Thñ", tbProp = {0, 1671}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Hµn B¨ng Hµi", tbProp = {0, 1672}, nQuality = 1, nRate = 1.5},
{szName = "HuyÒn Viªn Hµn B¨ng H­¬ng Nang", tbProp = {0, 1673}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Hµn B¨ng H¹ Giíi", tbProp = {0, 1674}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn NguyÖt Hoa Ch©u LiÖm", tbProp = {0, 1675}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn NguyÖt Hoa Tr©m", tbProp = {0, 1676}, nQuality = 1, nRate = 1.8},
{szName = "HuyÒn Viªn NguyÖt Hoa Th­îng Giíi", tbProp = {0, 1677}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn NguyÖt Hoa Tô", tbProp = {0, 1678}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn NguyÖt Hoa Thóc Yªu", tbProp = {0, 1679}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn NguyÖt Hoa Sam", tbProp = {0, 1680}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn NguyÖt Hoa §ao", tbProp = {0, 1681}, nQuality = 1, nRate = 1.9},
{szName = "HuyÒn Viªn NguyÖt Hoa Ngoa", tbProp = {0, 1682}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn NguyÖt Hoa H­¬ng Nang", tbProp = {0, 1683}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn NguyÖt Hoa H¹ Giíi", tbProp = {0, 1684}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Phån Hoa Ch©u LiÖm", tbProp = {0, 1685}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Phån Hoa Tr©m", tbProp = {0, 1686}, nQuality = 1, nRate = 1.8},
{szName = "HuyÒn Viªn Phån Hoa Th­îng Giíi", tbProp = {0, 1687}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Phån Hoa Tô", tbProp = {0, 1688}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Phån Hoa Yªu §¸i", tbProp = {0, 1689}, nQuality = 1, nRate = 1.8},
{szName = "HuyÒn Viªn Phån Hoa Sam", tbProp = {0, 1690}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Phån Hoa Uyªn ¦¬ng §ao", tbProp = {0, 1691}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Phån Hoa Ngoa", tbProp = {0, 1692}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Phån Hoa H­¬ng Nang", tbProp = {0, 1693}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Phån Hoa H¹ Giíi", tbProp = {0, 1694}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn §o¹n Tr­êng H¹ng LiÖm", tbProp = {0, 1695}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn §o¹n Tr­êng Ph¸t §¸i", tbProp = {0, 1696}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn §o¹n Tr­êng Th­îng Giíi", tbProp = {0, 1697}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn §o¹n Tr­êng Hé UyÓn", tbProp = {0, 1698}, nQuality = 1, nRate = 1.5},
{szName = "HuyÒn Viªn §o¹n Tr­êng Yªu §¸i", tbProp = {0, 1699}, nQuality = 1, nRate = 1.6},
{szName = "HuyÒn Viªn §o¹n Tr­êng Bİ Trang", tbProp = {0, 1700}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn §o¹n Tr­êng TriÒn Thñ", tbProp = {0, 1701}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn §o¹n Tr­êng Ngoa", tbProp = {0, 1702}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn §o¹n Tr­êng Yªu Trôy", tbProp = {0, 1703}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn §o¹n Tr­êng H¹ Giíi", tbProp = {0, 1704}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn HuyÕt S¸t H¹ng LiÖm", tbProp = {0, 1705}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn HuyÕt S¸t Ph¸t §¸i", tbProp = {0, 1706}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn HuyÕt S¸t Th­îng Giíi", tbProp = {0, 1707}, nQuality = 1, nRate = 1.6},
{szName = "HuyÒn Viªn HuyÕt S¸t Hé UyÓn", tbProp = {0, 1708}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn HuyÕt S¸t Yªu §¸i", tbProp = {0, 1709}, nQuality = 1, nRate = 1.5},
{szName = "HuyÒn Viªn HuyÕt S¸t Bİ Trang", tbProp = {0, 1710}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn HuyÕt S¸t §ao", tbProp = {0, 1711}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn HuyÕt S¸t Ngoa", tbProp = {0, 1712}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn HuyÕt S¸t Yªu Trôy", tbProp = {0, 1713}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn HuyÕt S¸t H¹ Giíi", tbProp = {0, 1714}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn L·nh T©m H¹ng LiÖm", tbProp = {0, 1715}, nQuality = 1, nRate = 1.5},
{szName = "HuyÒn Viªn L·nh T©m Qu¸n", tbProp = {0, 1716}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn L·nh T©m Th­îng Giíi", tbProp = {0, 1717}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn L·nh T©m Hé UyÓn", tbProp = {0, 1718}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn L·nh T©m TriÒn Yªu", tbProp = {0, 1719}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn L·nh T©m Gi¸p Y", tbProp = {0, 1720}, nQuality = 1, nRate = 1.6},
{szName = "HuyÒn Viªn L·nh T©m Phi §ao", tbProp = {0, 1721}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn L·nh T©m Lı", tbProp = {0, 1722}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn L·nh T©m Trôy", tbProp = {0, 1723}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn L·nh T©m H¹ Giíi", tbProp = {0, 1724}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn V« T×nh H¹ng LiÖm", tbProp = {0, 1725}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn V« T×nh Qu¸n", tbProp = {0, 1726}, nQuality = 1, nRate = 1.6},
{szName = "HuyÒn Viªn V« T×nh Th­îng Giíi", tbProp = {0, 1727}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn V« T×nh Hé UyÓn", tbProp = {0, 1728}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn V« T×nh Thóc Yªu", tbProp = {0, 1729}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn V« T×nh Gi¸p", tbProp = {0, 1730}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn V« T×nh TôTiÔn", tbProp = {0, 1731}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn V« T×nh Lı", tbProp = {0, 1732}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn V« T×nh Yªu Trôy", tbProp = {0, 1733}, nQuality = 1, nRate = 1.5},
{szName = "HuyÒn Viªn V« T×nh H¹ Giíi", tbProp = {0, 1734}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Hµn Quang LiÖm", tbProp = {0, 1735}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Hµn Quang Ph¸t Qu¸n", tbProp = {0, 1736}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Hµn Quang Th­îng Giíi", tbProp = {0, 1737}, nQuality = 1, nRate = 1.6},
{szName = "HuyÒn Viªn Hµn Quang Hé UyÓn", tbProp = {0, 1738}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Hµn Quang Thóc Yªu", tbProp = {0, 1739}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Hµn Quang Gi¸p Y", tbProp = {0, 1740}, nQuality = 1, nRate = 1.5},
{szName = "HuyÒn Viªn Hµn Quang Tiªu", tbProp = {0, 1741}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Hµn Quang Lı", tbProp = {0, 1742}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Hµn Quang Trôy", tbProp = {0, 1743}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Hµn Quang H¹ Giíi", tbProp = {0, 1744}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn D­¬ng C­¬ng H¹ng LiÖm", tbProp = {0, 1745}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn D­¬ng C­¬ng §Çu Hoµn", tbProp = {0, 1746}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn D­¬ng C­¬ng Th­îng Giíi", tbProp = {0, 1747}, nQuality = 1, nRate = 1.5},
{szName = "HuyÒn Viªn D­¬ng C­¬ng Hé UyÓn", tbProp = {0, 1748}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn D­¬ng C­¬ng Thóc Yªu", tbProp = {0, 1749}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn D­¬ng C­¬ng C¸i Y", tbProp = {0, 1750}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn D­¬ng C­¬ng TriÒn Thñ", tbProp = {0, 1751}, nQuality = 1, nRate = 1.6},
{szName = "HuyÒn Viªn D­¬ng C­¬ng Ngoa", tbProp = {0, 1752}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn D­¬ng C­¬ng Yªu Trôy", tbProp = {0, 1753}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn D­¬ng C­¬ng H¹ Giíi", tbProp = {0, 1754}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn ChiÕn Long H¹ng LiÖm", tbProp = {0, 1755}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn ChiÕn Long §Çu Hoµn", tbProp = {0, 1756}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn ChiÕn Long Th­îng Giíi", tbProp = {0, 1757}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn ChiÕn Long Hé UyÓn", tbProp = {0, 1758}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn ChiÕn Long Thóc Yªu", tbProp = {0, 1759}, nQuality = 1, nRate = 1.6},
{szName = "HuyÒn Viªn ChiÕn Long C¸i Y", tbProp = {0, 1760}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn ChiÕn Long Tr­îng", tbProp = {0, 1761}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn ChiÕn Long Ngoa", tbProp = {0, 1762}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn ChiÕn Long Yªu Trôy", tbProp = {0, 1763}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn ChiÕn Long H¹ Giíi", tbProp = {0, 1764}, nQuality = 1, nRate = 1.5},
{szName = "HuyÒn Viªn L¹c Hån H¹ng Khuyªn", tbProp = {0, 1765}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn L¹c Hån Kh«i", tbProp = {0, 1766}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn L¹c Hån Th­îng Giíi", tbProp = {0, 1767}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn L¹c Hån Hé UyÓn", tbProp = {0, 1768}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn L¹c Hån Yªu §¸i", tbProp = {0, 1769}, nQuality = 1, nRate = 1.5},
{szName = "HuyÒn Viªn L¹c Hån Gi¸p Y", tbProp = {0, 1770}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn L¹c Hån Th­¬ng", tbProp = {0, 1771}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn L¹c Hån Ngoa", tbProp = {0, 1772}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn L¹c Hån Béi", tbProp = {0, 1773}, nQuality = 1, nRate = 1.6},
{szName = "HuyÒn Viªn L¹c Hån H¹ Giíi", tbProp = {0, 1774}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Ch­íc T×nh H¹ng LiÖm", tbProp = {0, 1775}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Ch­íc T×nh Qu¸n MiÖn", tbProp = {0, 1776}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Ch­íc T×nh Th­îng Giíi", tbProp = {0, 1777}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Ch­íc T×nh Hé UyÓn", tbProp = {0, 1778}, nQuality = 1, nRate = 1.5},
{szName = "HuyÒn Viªn Ch­íc T×nh Yªu §¸i", tbProp = {0, 1779}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Ch­íc T×nh Gi¸p Y", tbProp = {0, 1780}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Ch­íc T×nh §ao", tbProp = {0, 1781}, nQuality = 1, nRate = 1.6},
{szName = "HuyÒn Viªn Ch­íc T×nh Ngoa", tbProp = {0, 1782}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Ch­íc T×nh Béi", tbProp = {0, 1783}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Ch­íc T×nh H¹ Giíi", tbProp = {0, 1784}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Tam Phong Phï", tbProp = {0, 1785}, nQuality = 1, nRate = 1.5},
{szName = "HuyÒn Viªn Tam Phong Qu¸n", tbProp = {0, 1786}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Tam Phong Th­îng Giíi", tbProp = {0, 1787}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Tam Phong Tô", tbProp = {0, 1788}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Tam Phong Ph¸p §¸i", tbProp = {0, 1789}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Tam Phong §¹o Bµo", tbProp = {0, 1790}, nQuality = 1, nRate = 1.6},
{szName = "HuyÒn Viªn Tam Phong KiÕm", tbProp = {0, 1791}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Tam Phong Lı", tbProp = {0, 1792}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Tam Phong Ngäc Béi", tbProp = {0, 1793}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Tam Phong H¹ Giíi", tbProp = {0, 1794}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Tu T©m Phï", tbProp = {0, 1795}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Tu T©m Qu¸n", tbProp = {0, 1796}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Tu T©m Th­îng Giíi", tbProp = {0, 1797}, nQuality = 1, nRate = 1.6},
{szName = "HuyÒn Viªn Tu T©m Tô", tbProp = {0, 1798}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Tu T©m Ph¸p §¸i", tbProp = {0, 1799}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Tu T©m §¹o Bµo", tbProp = {0, 1800}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Tu T©m KiÕm", tbProp = {0, 1801}, nQuality = 1, nRate = 1.5},
{szName = "HuyÒn Viªn Tu T©m Lı", tbProp = {0, 1802}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Tu T©m Ngäc Béi", tbProp = {0, 1803}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Tu T©m H¹ Giíi", tbProp = {0, 1804}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Xuyªn V©n H¹ng LiÖm", tbProp = {0, 1805}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Xuyªn V©n §¹o Qu¸n", tbProp = {0, 1806}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Xuyªn V©n Th­îng Giíi", tbProp = {0, 1807}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Xuyªn V©n Hé UyÓn", tbProp = {0, 1808}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Xuyªn V©n Yªu §¸i", tbProp = {0, 1809}, nQuality = 1, nRate = 1.5},
{szName = "HuyÒn Viªn Xuyªn V©n §¹o Bµo", tbProp = {0, 1810}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Xuyªn V©n NhÉn", tbProp = {0, 1811}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Xuyªn V©n Ngoa", tbProp = {0, 1812}, nQuality = 1, nRate = 1.6},
{szName = "HuyÒn Viªn Xuyªn V©n Béi", tbProp = {0, 1813}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Xuyªn V©n H¹ Giíi", tbProp = {0, 1814}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Ph¸ B¨ng Phï", tbProp = {0, 1815}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Ph¸ B¨ng §¹o Qu¸n", tbProp = {0, 1816}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Ph¸ B¨ng Th­îng Giíi", tbProp = {0, 1817}, nQuality = 1, nRate = 1.5},
{szName = "HuyÒn Viªn Ph¸ B¨ng Thñ", tbProp = {0, 1818}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Ph¸ B¨ng Yªu §¸i", tbProp = {0, 1819}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Ph¸ B¨ng §¹o Bµo", tbProp = {0, 1820}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Ph¸ B¨ng Tr­êng KiÕm", tbProp = {0, 1821}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Ph¸ B¨ng Ngoa", tbProp = {0, 1822}, nQuality = 1, nRate = 1.6},
{szName = "HuyÒn Viªn Ph¸ B¨ng Béi", tbProp = {0, 1823}, nQuality = 1, nRate = 0.15},
{szName = "HuyÒn Viªn Ph¸ B¨ng H¹ Giíi", tbProp = {0, 1824}, nQuality = 1, nRate = 0.15},

}
function OpenBox_main()
	GiveItemUI("Më B¶o R­¬ng", "Më b¶o r­¬ng cÇn 1 b¶o r­¬ng vµ 1 ch×a khãa v¹n n¨ng", "ConfirmOpenBox", "OnCancel");
end

function ConfirmOpenBox(nCount)
	local nBoxValue, nKeyValue = 0
	if (nCount ~= 2) then 
		Talk(1, "", "Më b¶o r­¬ng chØ cÇn 1 B¶o r­¬ng thÇn bİ vµ 1 Ch×a khãa v¹n n¨ng cã cïng m· sè !");
		return
	end
	local lag1, lag2, nBoxIndex,nKeyIndex = 0
	
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)	
		local itemgenre, detailtype, parttype = GetItemProp(nItemIndex)
		if (parttype == 30036) then--box
			lag1 = 1
			nBoxIndex = nItemIndex
		end
		if (parttype == 30037) then--key
			lag2 = 1
			nKeyIndex = nItemIndex
		end
	end--for
	if (lag1 == 1 and lag2 ==1) then
		nBoxValue = GetBoxValue(nBoxIndex)
		nKeyValue = GetKeyValue(nKeyIndex)
		if (nKeyValue >= 10000) then--if user in put key 5 so thi bat buoc phai trung giai nhat
			if ( ConpareValue(nBoxValue, nKeyValue, nKeyIndex) ~= 1) then
				Talk(1, "", "§¹i hiÖp xin h·y kiÓm tra l¹i m· sè trªn R­¬ng vµ Ch×a Khãa !");
				return
			end
		end
	else
		Talk(1, "", "§¹i hiÖp xin h·y bá vµo ®óng vËt phÈm !");
		return
	end
	local result = ConpareValue(nBoxValue, nKeyValue, nKeyIndex)
	if (result==0) then
		Talk(1, "", "B¶o r­¬ng thÇn bİ nµy muèn më ra ph¶i t×m 1 Ch×a khãa v¹n n¨ng İt nhÊt cã 2 m· sè ®Çu trïng nhau !");
		return 0
	end
	 if (result == 1) then
	--giai nhat
		--Say("<#> §¹i hiÖp ®· t×m ra m· sè më tÊt c¶ c¸c ng¨n trong B¶o r­¬ng, ®¹i hiÖp muèn nhËn vËt phÈm trong r­¬ng chø ?", 2,
				--"Ta muèn nhËn/# GetBonusOpenBox(1,"..nBoxIndex..", "..nKeyIndex..")",
				--"Hñy bá /OnCancel")
				GetBonusOpenBox(1,nBoxIndex, nKeyIndex)
	end
	if (result == 2) then
	--giai nhi
--		Say("<#> §¹i hiÖp ®· t×m ra m· sè më ng¨n thø ba trong B¶o r­¬ng, ®¹i hiÖp muèn nhËn vËt phÈm trong r­¬ng chø ?", 2,
--				"Ta muèn nhËn/# GetBonusOpenBox(2,"..nBoxIndex..", "..nKeyIndex..")",
--				"Hñy bá /OnCancel")
				GetBonusOpenBox(2,nBoxIndex, nKeyIndex)
	end
	if (result == 3) then
	--giai 3
--		Say("<#> §¹i hiÖp ®· t×m ra m· sè më ng¨n thø nh× trong B¶o r­¬ng, ®¹i hiÖp muèn nhËn vËt phÈm trong r­¬ng chø ?", 2,
--				"Ta muèn nhËn/# GetBonusOpenBox(3,"..nBoxIndex..", "..nKeyIndex..")",
--				"Hñy bá /OnCancel")
				GetBonusOpenBox(3,nBoxIndex, nKeyIndex)
	end
	if (result == 4) then
--		Say("<#> §¹i hiÖp ®· t×m ra m· sè më ng¨n thø nhÊt trong B¶o r­¬ng, ®¹i hiÖp muèn nhËn vËt phÈm trong r­¬ng chø ?", 2,
--				"Ta muèn nhËn/# GetBonusOpenBox(4,"..nBoxIndex..", "..nKeyIndex..")",
--				"Hñy bá /OnCancel")
				GetBonusOpenBox(4,nBoxIndex, nKeyIndex)
	end
	
	
	
end

function GetBonusOpenBox(nValue, nBoxIndex, nKeyIndex)
	if (nValue==1) then
		if (PlayerFunLib:CheckTaskDaily(Task_Daily_OpenBox1,1,"Mçi ngµy chØ cã thÓ më 1 B¶o R­¬ng ThÇn Bİ lo¹i 5 sè","<") ~= 1) then
			return
		end
		if (CalcFreeItemCellCount() <10) then
			Talk(1,"","Hµnh trang kh«ng ®ñ 10 « trèng !")
			return
		end
		PlayerFunLib:AddTaskDaily(Task_Daily_OpenBox1,1)
		RemoveItemByIndex(nBoxIndex)
		RemoveItemByIndex(nKeyIndex)
		
		tbAwardTemplet:GiveAwardByList(tbAWard[nValue], "NhËn th­ëng B¶o R­¬ng ThÇn Bİ h¹ng 1");
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "NhËn th­ëng Item B¶o R­¬ng ThÇn Bİ h¹ng 1");
		AddEnergy(1000)
		Msg2Player("Chóc mõng ®¹i hiÖp võa nhËn ®­îc vËt phÈm më b¶o r­¬ng")
	end
	if (nValue==2) then
		if (PlayerFunLib:CheckTaskDaily(Task_Daily_OpenBox2,2,"Mçi ngµy chØ cã thÓ më 2 B¶o R­¬ng ThÇn Bİ lo¹i 4 sè","<") ~= 1) then
			return
		end
		if (CalcFreeItemCellCount() <10) then
			Talk(1,"","Hµnh trang kh«ng ®ñ 10 « trèng !")
			return
		end
		PlayerFunLib:AddTaskDaily(Task_Daily_OpenBox2,1)
		RemoveItemByIndex(nBoxIndex)
		RemoveItemByIndex(nKeyIndex)
		tbAwardTemplet:GiveAwardByList(tbAWard[nValue], "NhËn th­ëng B¶o R­¬ng ThÇn Bİ h¹ng 2");
		AddEnergy(500)
		Msg2Player("Chóc mõng ®¹i hiÖp võa nhËn ®­îc vËt phÈm më b¶o r­¬ng")
	end
	if (nValue==3) then
		if (PlayerFunLib:CheckTaskDaily(Task_Daily_OpenBox3,5,"Mçi ngµy chØ cã thÓ më 5 B¶o R­¬ng ThÇn Bİ lo¹i 3 sè","<") ~= 1) then
			return
		end
		if (CalcFreeItemCellCount() <10) then
			Talk(1,"","Hµnh trang kh«ng ®ñ 10 « trèng !")
			return
		end
		PlayerFunLib:AddTaskDaily(Task_Daily_OpenBox3,1)
		RemoveItemByIndex(nBoxIndex)
		RemoveItemByIndex(nKeyIndex)
		tbAwardTemplet:GiveAwardByList(tbAWard[nValue], "NhËn th­ëng B¶o R­¬ng ThÇn Bİ h¹ng 3");
		AddEnergy(100)
		Msg2Player("Chóc mõng ®¹i hiÖp võa nhËn ®­îc vËt phÈm më b¶o r­¬ng")
	end
	if (nValue==4) then
		if (PlayerFunLib:CheckTaskDaily(Task_Daily_OpenBox4,20,"Mçi ngµy chØ cã thÓ më 20 B¶o R­¬ng ThÇn Bİ lo¹i 2 sè","<") ~= 1) then
			return
		end
		if (CalcFreeItemCellCount() <10) then
			Talk(1,"","Hµnh trang kh«ng ®ñ 10 « trèng !")
			return
		end
		PlayerFunLib:AddTaskDaily(Task_Daily_OpenBox4,1)
		RemoveItemByIndex(nBoxIndex)
		RemoveItemByIndex(nKeyIndex)
		tbAwardTemplet:GiveAwardByList(tbAWard[nValue], "NhËn th­ëng B¶o R­¬ng ThÇn Bİ h¹ng 4");
		AddEnergy(20)
		Msg2Player("Chóc mõng ®¹i hiÖp võa nhËn ®­îc vËt phÈm më b¶o r­¬ng")
	end
end

function OnCancel()
end