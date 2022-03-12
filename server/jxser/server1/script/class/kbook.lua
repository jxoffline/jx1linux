--Creator:yfeng
--Date:2004-08-31
--Comm:Êé¼®µÄÀàÄ£°å,ÓÃinherit(KBook,VarName="...",Page={})À´ÒıÓÃ

KBook = {	--VarName Îª±äÁ¿Ãû£¬PageÎªÊéµÄÄÚÈİ£¬ÊÇÒ»¸ötable
	TurnTo = function (self,pageno)
		local pageCount = getn(self.Page)
		if(pageCount < 1) then --Ã»ÓĞÓĞĞ§Ò³
			return nil
		end
		if(pageno > pageCount) then --µ±Ç°Ò³ÎŞĞ§
			return nil
		end
		local str_NEXT = "Trang kÕ /#%s:TurnTo(%s)"
		local str_PREVIOUS = "Trang tr­íc/#%s:TurnTo(%s)"
		local str_CLOSE = "§ãng/#%s:Close()"
		
		if(pageCount == 1 ) then  --Ö»ÓĞÒ»Ò³
			if(pageno == 1) then
				Say(self.Page[1],1,format(str_CLOSE,self.VarName))
				return 1
			end
			return nil
		end
		--pageCount > 1
		if(pageno == 1) then --µÚÒ»Ò³
			Say(self.Page[1],2,format(str_NEXT,self.VarName,pageno+1),
								format(str_CLOSE,self.VarName))
			return 1
		end
		if(pageno == pageCount) then
			Say(self.Page[pageCount],2,format(str_PREVIOUS,self.VarName,pageno-1),
										format(str_CLOSE,self.VarName))
			return 1
		end
		Say(self.Page[pageno],3,format(str_NEXT,self.VarName,pageno+1),
								format(str_PREVIOUS,self.VarName,pageno-1),
								format(str_CLOSE,self.VarName))
		return 1
	end,
	Close = function(self)
		return 1
	end,
}
