-------------------------------------------------------------------------
-- FileName		:	task_shenzhaoyuan1.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-31 18:02:14
-- Desc			:	ÉòÕÑÔ¶µÄÊÖ¸åÒ»ÂÒÆğÎ÷·½
-------------------------------------------------------------------------

DescLink_ShenZhaoYuan ="<#><link=image:\\spr\\item\\questkey\\taskobj075.spr>Bİ quyÕt lµm b¸nh cña ThÈm ThiÖu ViÔn<link>"

function main()
	Describe(DescLink_ShenZhaoYuan.."<#>: Th¸ng 5 n¨m ThiÖu H­ng thø 30, Tèng Kim t¹m nghŞ hßa, 2 bªn ®Òu lui binh ®Ó nghØ ng¬i. D©n chóng n¨m Êy ®­îc mïa, gia ®×nh ®oµn tô. th«n th«n trÊn trÊn ®Òu lµm lÔ t¹ ¬n trêi ®Êt. Tôc thi lµm b¸nh còng tõ ®ã mµ cã.<enter>"
	.."Ng­¬i cã nghe nãi vª ThiÕt Méc Ch©n ch­a? §ã lµ 1 ®¹i anh hïng cña M«ng Cæ, ®· tõng thèng lÜnh binh M«ng Cæ lµm chÊn ®éng ch©u ¢u vµ th«ng tİnh gÇn hÕt Trung Nguyªn <enter>"
	.."Trung Nguuyªn lµ mét vïng ®Êt mµu mì v× vËy lu«n ph¶i ®èi ®Çu víi bao cuéc x©m l­îc.<enter>"
	.."  ThÈm ThiÖu ViÔn",1,"KÕt thóc ®èi tho¹i/no")
	return 1
end

function no()
end