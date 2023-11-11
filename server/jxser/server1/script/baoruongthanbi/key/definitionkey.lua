Include("\\script\\baoruongthanbi\\head.lua");
function DefinitionKey_main()
	GiveItemUI("Gi¸m ®Þnh l¹i Ch×a Khãa V¹n N¨ng", "Gi¸m ®Þnh l¹i Ch×a Khãa V¹n N¨ng", "ConfirmDefinitionKey", "OnCancel");
end

function ConfirmDefinitionKey(nCount)
		if (nCount < 1) then
			return
		end
		if (nCount > 6) then -- cho phep bo bao duy nhat 3 vat pham
			Talk(1, "", "§¹i hiÖp bá nhiÒu thø qu¸, ta hoa c¶ m¾t !");
			return
		end
		local lag1, lag2, lag3, lag4 = 0, 0, 0, 0 
		local nCountBox, nCountKey, nCountNHB, nCountTHB = 0, 0, 0, 0
		local  nIndexBox, nIndexKey =0, 0
		for i=1, nCount do
			local nItemIndex = GetGiveItemUnit(i)	--lay ve Item Index cac vat pham
			local itemgenre, detailtype, parttype = GetItemProp(nItemIndex)
			if (parttype ~= 30036 and parttype ~= 30037 and parttype ~= 30038 and parttype ~= 30039) then
				Talk(1, "", "§¹i hiÖp xin h·y bá vµo ®óng vËt phÈm !");
				return
			end
				if (parttype == 30036) then--ruong
					lag1 = 1
					nIndexBox = nItemIndex
					nCountBox = nCountBox +1
				end
				if (parttype == 30037) then--key
					lag2 = 1
					nIndexKey = nItemIndex
					nCountKey = nCountKey +1
				end
				if (parttype == 30038) then--nhi ho bua
					lag3 = 1
					nCountNHB = nCountNHB + 1
					--nIndexHB = nItemIndex
				end
				if (parttype == 30039) then--tam ho bua
					lag4 = 1
					--nIndexHB = nItemIndex
					nCountTHB = nCountTHB + 1
				end
		end--for
		if (nCountBox > 1 or nCountKey > 1 or nCountNHB > 4 or nCountTHB > 4) then
				Talk(1, "", "§¹i hiÖp xin h·y bá vµo ®óng vËt phÈm !");
				return
		end
		if (lag3 ==1 and lag4 ==1) then
			Talk(1,"","§¹i hiÖp chØ nªn sö dông 1 lo¹i bïa mµ th«i !")
			return
		end
		if (lag1==1 and lag2 == 1 and (lag3 ==1 or lag4 ==1)) then
				--nGblBoxValue = GetBoxValue(nIndexBox)--lay ve gia tri cua ruong
				if (lag3 == 1) then--user su dung nhi ho bua
					RemoveAllItem(nCount, nIndexBox)
					AddNewKeyValue(nCountNHB, nIndexBox,nIndexKey, 2)
					
				end
				if (lag4 ==1) then--user su dung tam ho bua
					RemoveAllItem(nCount, nIndexBox)
					AddNewKeyValue(nCountTHB, nIndexBox, nIndexKey, 3)
					
				end
		else
			Talk(1, "", "§¹i hiÖp xin h·y bá vµo ®óng vËt phÈm !");
			return
		end
end


function AddNewKeyValue(nCountHB, nIndexBox, nIndexKey, nType)
		local nBoxValue = GetBoxValue(nIndexBox)--lay ve gia tri cua ruong
		local num2 = floor(nBoxValue/ 1000)--lay 2 gia tri dau cua ruong
		local num3 = floor(nBoxValue/ 100)--lay 3 gia tri dau cua ruong
		local num4 = floor(nBoxValue/ 10)--lay 4 gia tri dau cua ruong
		--local num5 = floor(nBoxValue/ 1)--lay 5 gia tri dau cua ruong
		local nValue = 0
		local nRandomKeyValue = random(1, 100)
		if (nCountHB==4) then
			nValue = 100
		elseif (nCountHB==3) then
			nValue = 75
		elseif (nCountHB==2) then
			nValue = 50
		else
			nValue = 25
		end
		if (nValue == 100) then--so luong bua bo vao la 4
			if (nRandomKeyValue <= 10) then--check ty le random <= 10 do....
				if (nType==2) then--neu user su dung nhi ho bua thi add key dung voi 3 so cua box
					local nItemIndex = AddItem(6,1,30037,1,0,0)
					SetSpecItemParam(nItemIndex, 1, num3)
					SyncItem(nItemIndex)
					Msg2Player("Chóc mõng ®¹i hiÖp nhËn ®­îc ch×a khãa cã chøa 3 m· sè")
					WriteLog(date("%Y%m%d %H%M%S").."\t".."B¶o R­¬ng ThÇn BÝ"..GetAccount().."\t"..GetName().."\t".."Gi¸m ®Þnh Key nhËn ®­îc Key 3 sè type 1")
				else--nguoc lai neu su dung tam ho bua thi add key dung voi 4 so cua box
					local nItemIndex = AddItem(6,1,30037,1,0,0)
					SetSpecItemParam(nItemIndex, 1, num4)
					SyncItem(nItemIndex)
					Msg2Player("Chóc mõng ®¹i hiÖp nhËn ®­îc ch×a khãa cã chøa 4 m· sè")
					WriteLog(date("%Y%m%d %H%M%S").."\t".."B¶o R­¬ng ThÇn BÝ"..GetAccount().."\t"..GetName().."\t".."Gi¸m ®Þnh Key nhËn ®­îc Key 4 sè type 1")
				end--check user su dung loai ho bua
			else--ty le random lon hon 10
				if (nType==2) then--neu user su dung nhi ho bua thi add key dung voi 2 so cua box
					local nItemIndex = AddItem(6,1,30037,1,0,0)
					SetSpecItemParam(nItemIndex, 1, num2)
					SyncItem(nItemIndex)
					Msg2Player("Chóc mõng ®¹i hiÖp nhËn ®­îc ch×a khãa cã chøa 2 m· sè")
					WriteLog(date("%Y%m%d %H%M%S").."\t".."B¶o R­¬ng ThÇn BÝ"..GetAccount().."\t"..GetName().."\t".."Gi¸m ®Þnh Key nhËn ®­îc Key 2 sè type 1")
				else--nguoc lai neu su dung tam ho bua thi add key dung voi 3 so cua box
					local nItemIndex = AddItem(6,1,30037,1,0,0)
					SetSpecItemParam(nItemIndex, 1, num3)
					SyncItem(nItemIndex)
					Msg2Player("Chóc mõng ®¹i hiÖp nhËn ®­îc ch×a khãa cã chøa 3 m· sè")
					WriteLog(date("%Y%m%d %H%M%S").."\t".."B¶o R­¬ng ThÇn BÝ"..GetAccount().."\t"..GetName().."\t".."Gi¸m ®Þnh Key nhËn ®­îc Key 3 sè type 1")
				end--check user su dung loai ho bua
			end--check ran dom max key value
		elseif (nRandomKeyValue <= nValue ) then--neu gia tri random <= nValue% thi...
			if (nType==2) then--neu user su dung nhi ho bua thi add key dung voi 2 so cua box
				local nItemIndex = AddItem(6,1,30037,1,0,0)
				SetSpecItemParam(nItemIndex, 1, num2)
				SyncItem(nItemIndex)
				Msg2Player("Chóc mõng ®¹i hiÖp nhËn ®­îc ch×a khãa cã chøa 2 m· sè")
				WriteLog(date("%Y%m%d %H%M%S").."\t".."B¶o R­¬ng ThÇn BÝ"..GetAccount().."\t"..GetName().."\t".."Gi¸m ®Þnh Key nhËn ®­îc Key 2 sè type 1")
			else--nguoc lai neu su dung tam ho bua thi add key dung voi 3 so cua box
				local nItemIndex = AddItem(6,1,30037,1,0,0)
				SetSpecItemParam(nItemIndex, 1, num3)
				SyncItem(nItemIndex)
				Msg2Player("Chóc mõng ®¹i hiÖp nhËn ®­îc ch×a khãa cã chøa 3 m· sè")
				WriteLog(date("%Y%m%d %H%M%S").."\t".."B¶o R­¬ng ThÇn BÝ"..GetAccount().."\t"..GetName().."\t".."Gi¸m ®Þnh Key nhËn ®­îc Key 3 sè type 1")
			end--check user su dung loai ho bua
		elseif (nRandomKeyValue > nValue and nValue >= 75) then--neu user bo vao 3 ho bua vµ gia tri random lon hon cho phep
			if (nType==2) then--neu user su dung nhi ho bua thi add key random 2 so
				local nVarRandom = random(10,99)
				if (nVarRandom == num2) then
					nVarRandom = nVarRandom + 1
				end
				local nItemIndex = AddItem(6,1,30037,1,0,0)
				SetSpecItemParam(nItemIndex, 1, nVarRandom)
				SyncItem(nItemIndex)
				Msg2Player("Chóc mõng ®¹i hiÖp nhËn ®­îc ch×a khãa cã chøa 2 m· sè")
				WriteLog(date("%Y%m%d %H%M%S").."\t".."B¶o R­¬ng ThÇn BÝ"..GetAccount().."\t"..GetName().."\t".."Gi¸m ®Þnh Key nhËn ®­îc Key 2 sè type 2")
			else--nguoc lai neu su dung tam ho bua thi add key random3 so 
				local nVarRandom = random(100,999)
				if (nVarRandom == num2) then
					nVarRandom = nVarRandom + 1
				end
				local nItemIndex = AddItem(6,1,30037,1,0,0)
				SetSpecItemParam(nItemIndex, 1, nVarRandom)
				SyncItem(nItemIndex)
				Msg2Player("Chóc mõng ®¹i hiÖp nhËn ®­îc ch×a khãa cã chøa 3 m· sè")
				WriteLog(date("%Y%m%d %H%M%S").."\t".."B¶o R­¬ng ThÇn BÝ"..GetAccount().."\t"..GetName().."\t".."Gi¸m ®Þnh Key nhËn ®­îc Key 3 sè type 2")
			end--check user su dung loai ho bua
		else--ko phu hop gia tri random, bo vao it hon 3 la bua
			RemoveItemByIndex(nIndexBox)
			RemoveItemByIndex(nIndexKey)
			Talk(1,"","Gi¸m ®Þnh thÊt b¹i, tæn thÊt hÕt nguyªn liÖu !")
			Msg2Player("Gi¸m ®Þnh thÊt b¹i !")
			WriteLog(date("%Y%m%d %H%M%S").."\t".."B¶o R­¬ng ThÇn BÝ"..GetAccount().."\t"..GetName().."\t".."Gi¸m ®Þnh Key thÊt b¹i, trõ hÕt nguyªn liÖu")
		end--check value
end

function OnCancel()
end
