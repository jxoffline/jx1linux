
Include("\\script\\event\\pingzi\\200805\\compose.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\pingzi\\200805\\head.lua")
Include("\\script\\event\\pingzi\\200805\\recipe.lua")


function pingzi0805:main()
	self:ResetTask()
	
	if not self:IsActTime() then
		return 
	end
	
	
	if GetLevel() < 50 then
		return Say(format("§¼ng cÊp kh«ng ®ñ %s, kh«ng thÓ tham gia ho¹t ®éng.",50), 0)
	end
	
	local tbSay = 
	{
		"<dec><npc>§¹i hiÖp muèn ®æi phÇn th­ëng nµo?<enter>PhÇn th­ëng 1: 'Phong' x 1 + 'Háa' x 1 + 'Liªn' x 1 + 'Thµnh' x 1 + 3 v¹n l­îng<enter>PhÇn th­ëng 2: 'Mõng' x 3 + 'VLTK' x 3 + '3' x 3 + 'Tuæi' x 3 + 10 v¹n l­îng<enter>PhÇn th­ëng 3: 'Mõng' x 3 +'VLTK' x 3 + '3' x 3 + 'Tuæi' x 3 + §¹i hû lÔ bao x 1",
		format("NhËn phÇn th­ëng 1/#%s:draw(1)", self.szClassName),
		format("NhËn phÇn th­ëng 2/#%s:draw(2)", self.szClassName),
		format("NhËn phÇn th­ëng 3/#%s:draw(3)", self.szClassName),
		"Ta sÏ ghÐ l¹i sau/OnCancel"
	}
	CreateTaskSay(tbSay)
end


function pingzi0805:draw(nRecipeId)
	self:ResetTask()
	if GetLevel() < 50 then
		return Say(format("§¼ng cÊp kh«ng ®ñ %s, kh«ng thÓ tham gia ho¹t ®éng.",50), 0)
	end
	local nCount = GetTask(self.TSK_Recipe1Count)
	if nRecipeId == 1 and nCount >= self.nMaxRecipe1Count then
		return Say(format("PhÇn th­ëng nµy chØ cã thÓ ®æi <color=yellow>%d<color> lÇn.", nCount),0)
	end
	local tbRecipe = self.tbRecipe[nRecipeId]
	if nRecipeId == 1 then
		pingzi0805_ComposeClass:Compose("Nguyªn liÖu mang theo kh«ng ®ñ.", tbRecipe.tbItemList, tbRecipe.nMoney, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbRecipe.tbAwardItem, self.szClassName, 1, SetTask, self.TSK_Recipe1Count, nCount + 1)
	else
		pingzi0805_ComposeClass:Compose("Nguyªn liÖu mang theo kh«ng ®ñ.", tbRecipe.tbItemList, tbRecipe.nMoney, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbRecipe.tbAwardItem, self.szClassName)
	end
end

function pingzi0805:Detailed(nStep)
	local tbSay = nil
	if nStep == 1 then
		tbSay = 
		{
			"<dec><npc><enter>PhÇn th­ëng 1: 'Phong' x 1 + 'Háa' x 1 + 'Liªn' x 1 + 'Thµnh' x 1 + 3 v¹n l­îng = 2 triÖu ®iÓm kinh nghiÖm.<enter>PhÇn th­ëng 2: 'Mõng' x 3 + 'VLTK' x 3 + '3' x 3 + 'Tuæi' x 3 + 10 v¹n l­îng = B¸nh kem nh­ ý vµ PhÇn th­ëng ngÉu nhiªn.<enter>PhÇn th­ëng 3: 'Mõng' x 3 + 'VLTK' x 3 + '3' x 3 + 'Tuæi' x 3 +  §¹i hû lÔ bao x 1 = B¸nh kem nh­ ý vµ phÇn th­ëng ngÉu nhiªn hoÆc B¸nh kem c¸t t­êng.",
			format("NhËn l·nh phÇn th­ëng/#%s:main()", self.szClassName),
			"Ta sÏ ghÐ l¹i sau/OnCancel"
		}
	else
		tbSay = 
		{
			"<dec><npc>V¹n Niªn Gia: Trong thêi gian ho¹t ®éng, ®¹i hiÖp cã c¬ héi nhÆt ®­îc c¸c LÔ bao khi ®¸nh qu¸i, bªn trong cã chøa nguyªn liÖu mµ ta cÇn.<enter>Thêi gian ho¹t ®éng: tõ 11-06-2008 ®Õn 24:00 13-07-2008",
			format("PhÇn th­ëng gåm nh÷ng g×?/#%s:Detailed(1)", self.szClassName),
			"Ta sÏ ghÐ l¹i sau/OnCancel"
		}	
	end
	
	CreateTaskSay(tbSay)
end