function main()
	local szTitle = "§¹i hiÖp nhËn phÇn th­ëng nµo?"
	local tbOpt={}
	tinsert(tbOpt, "NhËn ®¹i thµnh bİ kİp 150/daithanh150")
	tinsert(tbOpt, "NhËn 10 000 Ch©n Nguyªn/channguyen")
	tinsert(tbOpt, "NhËn 400 Tinh Ngäc/tinhngoc")
	tinsert(tbOpt, "Tho¸t/no")
	Say(szTitle, getn(tbOpt), tbOpt)
	return 1
end

function daithanh150()
	ConsumeItem(3, 1, 6, 1, 2922, -1)
	AddItem(6,1,30446,0,0,0)
	Msg2Player("Më cÈm hép, nhËn ®­îc <color=yellow> §¹i thµnh bİ kİp 150<color>.")
end

function channguyen()
	ConsumeItem(3, 1, 6, 1, 2922, -1)
	local m = 10000
	SetTask(4000, GetTask(4000) + m)
	Msg2Player("Më cÈm hép, nhËn ®­îc <color=yellow>"..m.." Ch©n Nguyªn<color>")
end

function tinhngoc()
	ConsumeItem(3, 1, 6, 1, 2922, -1)
	AddStackItem(200,6,1,4546,1,0,0)
	AddStackItem(200,6,1,4546,1,0,0)
	Msg2Player("Më cÈm hép, nhËn ®­îc <color=yellow>400 Tinh Ngäc")
end