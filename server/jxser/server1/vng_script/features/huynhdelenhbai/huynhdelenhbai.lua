Include("\\vng_script\\features\\huynhdelenhbai\\mainfuc.lua")
--Include("\\script\\vng_feature\\getskills.lua")
Include("\\vng_script\\vng_lib\\checkinmap.lua")
Include("\\script\\global\\vipsys\\head.lua") --check actived the hao hiep

tbHuynhdelenhbai = tbHuynhdelenhbai or {};

function main(nItemIdx)	
	if GetLevel() < 50 then
		 Talk(1,"","Tr­íc ®¼ng cÊp 50 h·y ®i t×m V« Danh ë c¸c th«n trÊn, «ng ta sÏ h­íng dÉn ng­¬i lµm nhiÖm vô.")
		return 1
	end
	if GetLevel() > 110 then
		 Talk(1,"","Huynh §Ö T­¬ng Phïng lÖnh bµi chØ cã t¸c dông ®Õn ®¼ng cÊp 110.")
		return 1
	end
	--kich hoat the hao hiep
	local nActieved, szMsg = VipSys:IsActived()
	if 	nActieved ~= 1 then
		lib:ShowMessage("Ch­a kÝch ho¹t ThÎ Hµo HiÖp, kh«ng thÓ dïng Huynh §Ö T­¬ng Phïng lÖnh bµi")
		return 1
	end	
	tbHuynhdelenhbai:MainDialog()
	return 1
end

function tbHuynhdelenhbai:MainDialog()
	local tbOpt = {}		
	tinsert(tbOpt, {"NhiÖm vô Huynh §Ö T­¬ng Phïng lÖnh bµi", self.onDialogNpcGiveTask, {self}})	
	tinsert(tbOpt, {"Xem t×nh h×nh nhiÖm vô hiÖn t¹i", self.onDialogNpcGiveAward, {self}})
	tinsert(tbOpt, {"Hñy bá "})
	CreateNewSayEx("Huynh §Ö T­¬ng Phïng lÖnh bµi:", tbOpt)
end