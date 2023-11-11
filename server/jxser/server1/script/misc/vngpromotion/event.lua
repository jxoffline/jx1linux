Include("\\script\\lib\\basic.lua")

COIN_EXTPOINT = 3

function takeCoin()
	Say("Trong thêi gian tõ 25-09-2009 ®Õn 24h 01-11-2009 sÏ diÔn ra ho¹t ®éng khuyÕn m·i mõng Trung Thu LÔ Héi. Quı kh¸ch n¹p thÎ sÏ ngÉu nhiªn ®­îc tÆng TiÒn ®ång vµo tµi kho¶n.",2,"Cho ta nhËn tiÒn ®ång/wantCoin","Ta biÕt råi/OnCancel")
end;

function wantCoin()
	local nExtValue = GetExtPoint(COIN_EXTPOINT)
	
	if (nExtValue <= 0) then
		Say("Xin mêi Quı kh¸ch n¹p thÎ ®Ó cã c¬ héi nhËn TiÒn ®ång!",0)
		return
	end
	
	Say("HiÖn t¹i Quı kh¸ch cã tæng céng <color=yellow>"..nExtValue.."<color> tiÒn ®ång trong tµi kho¶n. X¸c nhËn lÊy ra hÕt chø?",2,"§óng råi, ta muèn lÊy/sureCoin","HiÖn t¹i ta ch­a cÇn/OnCancel")
end;

function sureCoin()
	local nExtValue = GetExtPoint(COIN_EXTPOINT)
	
	if (nExtValue <=0 ) then
		Say("Cã lçi x¶y ra khi rót tiÒn ®ång. Xin liªn hÖ bé phËn kü thuËt",0)
		return
	end
	
	local nMod = mod(nExtValue, 100)
	local nReal = nExtValue / 100
	if (nMod ~= 0) then nReal = nReal + 1 end
	
	if (CalcFreeItemCellCount() < nReal) then
		Say("¤ng chñ TiÒn Trang: Hµnh trang kh«ng ®ñ chç trèng, h·y s¾p xÕp l¹i hµnh trang.",0)
		return
	end
	
	local nFinish = 0
	local nCoin = nExtValue
	
	while (nFinish == 0) do
		if (nCoin <= 100) then
			PayExtPoint(COIN_EXTPOINT, nCoin)
			AddStackItem(nCoin,4,417,1,1,0,0,0)
			nFinish = 1
		else
			PayExtPoint(COIN_EXTPOINT, 100)
			AddStackItem(100,4,417,1,1,0,0,0)
			nCoin = nCoin - 100
		end
	end

	Say("TiÒn ®ång cña Quı kh¸ch ®©y, xin h·y nhËn lÊy. Chóc Quı kh¸ch vui vÎ.",0)
	Msg2Player("B¹n nhËn ®­îc "..nExtValue.." tiÒn ®ång")
	WriteLog(format("[VNGPROMOTION]\tDate:%s\tAccount:%s\tName:%s\ttake:%s coin",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),nExtValue))
end;

function OnCancel()
end;
