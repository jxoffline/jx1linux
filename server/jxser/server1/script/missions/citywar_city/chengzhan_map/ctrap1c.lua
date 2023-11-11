--¹¥³ÇÕ½ ÖÐ×ªµØÍ¼to³ÇÕ½µØÍ¼£¨ÊØ³Ç·½£©
--Trap ID£º¹¥³ÇÕ½

Include("\\script\\missions\\citywar_city\\head.lua")

function main()
	ft = GetFightState();
	if (ft == 0) then 
		SetPos(1582,3227)
		SetFightState(1)
		bt_RankEffect(BT_GetData(PL_CURRANK))
	else
		if (GetCurCamp() ~= 1) then 
			Msg2Player("Kh«ng thÓ ®i ®­îc, nÕu ®i sÏ ®Õn n¬i phôc kÝch cña ®Þch qu©n. ");
			SetPos(1582,3227)
		else
			SetPos(1577,3236)
			SetFightState(0)
		end;
	end;
end;
