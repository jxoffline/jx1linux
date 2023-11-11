Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")

--local tbFormula = 
--{
--	szName = "B¹ch Hæ Kim Bµi",
--	tbMaterial = {{szName="Hµnh HiÖp LÖnh",tbProp={6,1,2566,1,0,0},nCount = 1000,},},
--	tbProduct = {szName="B¹ch Hæ Kim Bµi",tbProp={6,1,3183,1,0,0},},
--	nWidth = 1,
--	nHeight = 1,
--	nFreeItemCellLimit = 1,
--}
--local tbCompose_XinXiaLing2BaiHuJinPai = tbActivityCompose:new(tbFormula, "xingxialin2baihujinpai")
--
--
--pEventType:Reg("Hµng rong", "Mua B¹ch Hæ Kim Bµi", tbCompose_XinXiaLing2BaiHuJinPai.ComposeDailog, {tbCompose_XinXiaLing2BaiHuJinPai})

--Dïng Phong V©n Th¹ch ®æi B¹ch Hæ LÖnh - Modified By DinhHQ - 20120612
local tbFormula2 = 
{
	szName = "B¹ch Hæ LÖnh",
	tbMaterial = {{szName="Phong V©n Th¹ch",tbProp={6,1,30224,1,0,0},nCount = 10,},},
	tbProduct = {szName="B¹ch Hæ LÖnh",tbProp={6,1,2357,1,0,0},},
	nWidth = 1,
	nHeight = 1,
	nFreeItemCellLimit = 1,
}
local tbCompose_PVT2BHL = tbActivityCompose:new(tbFormula2, "DungPhongVanThachDoiBachHoLenh")
pEventType:Reg("Hµng rong", "§æi B¹ch Hæ LÖnh", tbCompose_PVT2BHL.ComposeDailog, {tbCompose_PVT2BHL})