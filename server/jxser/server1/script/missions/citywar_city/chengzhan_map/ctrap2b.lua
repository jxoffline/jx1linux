
--¹¥³ÇÕ½ ÖÐ×ªµØÍ¼to³ÇÕ½µØÍ¼£¨ÊØ³Ç·½£©
--Trap ID£º¹¥³ÇÕ½
--211£¬1622£¬3249      211£¬1608£¬3235
Include("\\script\\missions\\citywar_city\\head.lua")

function main()
	ft = GetFightState();
	if (ft == 0) then 
		SetPos(1858,3590)
		SetFightState(1)
		bt_RankEffect(BT_GetData(PL_CURRANK))
	else
		if (GetCurCamp() ~= 2) then 
			Msg2Player("Kh«ng thÓ ®i ®­îc, nÕu ®i sÏ ®Õn n¬i phôc kÝch cña ®Þch qu©n. ");
			SetPos(1858,3590)
		else
			SetPos(1862,3597)
			SetFightState(0)
		end;
	end;
end;
