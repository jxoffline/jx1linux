Include("\\script\\task\\task_addplayerexp.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\awardtype\\simple.lua")
ExpType = SimpleType:new("nExp")
ExpType.pFun = AddOwnExp
--Fix lçi hiÓn thÞ sai nÕu sè qu¸ lín - Modified By DinhHQ - 20110926
ExpType.szMsgFormat = "§¹t ®­îc kinh nghiÖm kh«ng thÓ céng dån %s"
ExpType:Reg()

Exp_tlType = SimpleType:new("nExp_tl")
Exp_tlType.pFun = tl_addPlayerExp
--Fix lçi hiÓn thÞ sai nÕu sè qu¸ lín - Modified By DinhHQ - 20110926
Exp_tlType.szMsgFormat = "NhËn ®­îc ®iÓm kinh nghiÖm céng dån %s."
Exp_tlType:Reg()