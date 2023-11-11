
Include("\\script\\lib\\common.lua")
Include("\\script\\global\\login_head.lua")

AnnounceNews = {}
AnnounceNews.tbNews = {
--	{
--	nStartDate = 201208130000,
--	nEndDate =  201210312400,	
--	strMsg = "<color=green>Tõ 27/09/2012 ®Õn 24h ngµy 31/10/2012 sÏ diÔn ra ho¹t ®éng Vui Héi Tr¨ng R»m. Th«ng tin chi tiÕt vui lßng xem t¹i trang chñ <color=blue>www.volam.zing.vn<color>", 
--	},
--	{
--	nStartDate = 201007070000,
--	nEndDate =  201010312400,	
--	strMsg = "<color=yellow>Tham gia c¸c ho¹t ®éng trong game, nhËn ngay iPhone 5 vµ iPhone 4S<color>", 
--	},
--	{
--	nStartDate = 201007070000,
--	nEndDate =  201009302400,	
--	strMsg = "<color=yellow>B¸t Niªn Héi Ngé LÖnh Bµi\nTr¶i nghiÖm Trïng Sinh 4 ngay tõ h«m nay. Chi tiÕt t¹i trang chñ http://volam.zing.vn<color>", 
--	},
	{
	nStartDate = 201303110000,
	nEndDate =  201303172400,	
	strMsg = "<color=yellow>TuÇn lÔ vµng - Nh©n ®«i ®iÓm tÝch lòy vµ ®iÓm kinh nghiÖm khi tham gia mét sè<enter>tÝnh n¨ng trong game. <enter>Chi tiÕt t¹i trang chñ <color=green>http://volam.zing.vn<color>",
	},
}

function AnnounceNews:CheckTime(nIdx)
	local nCurDate = tonumber(date("%Y%m%d%H%M"))
	local tbTempNews = self.tbNews[nIdx]
	if nCurDate < tbTempNews.nStartDate or nCurDate > tbTempNews.nEndDate then
		return nil
	end
	return 1
end

function AnnounceNews:AnnounceUpdate()
	local tbNews = %AnnounceNews.tbNews
	for i = 1, getn(tbNews) do
		if %AnnounceNews:CheckTime(i) then
			Msg2Player(tbNews[i].strMsg)
		end
	end	
end

if login_add  then login_add(AnnounceNews.AnnounceUpdate, 2)  end
