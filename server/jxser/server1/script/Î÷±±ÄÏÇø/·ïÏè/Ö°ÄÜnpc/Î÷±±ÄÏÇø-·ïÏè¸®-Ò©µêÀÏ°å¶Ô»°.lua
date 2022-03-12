Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
function main(sel)
if (GetTask(169) == 31)  then
Say("Thuèc cña bæn tiÖm toµn lµ thø th­îng h¹ng, cã bÖnh trŞ bÖnh, kh«ng bÖnh c­êng th©n, cã muèn mua mét İt kh«ng? ", 3, "Ta cã viÖc kh¸c muèn t×m «ng./nv30HS", "Giao dŞch/yes", "Kh«ng giao dŞch/no");
elseif (GetTask(169) == 33) and (HaveCommonItem(6,1,3948)>0) then
Say("Thuèc cña bæn tiÖm toµn lµ thø th­îng h¹ng, cã bÖnh trŞ bÖnh, kh«ng bÖnh c­êng th©n, cã muèn mua mét İt kh«ng? ", 3, "Ta cã viÖc kh¸c muèn t×m «ng./nv30HS2", "Giao dŞch/yes", "Kh«ng giao dŞch/no");
elseif (GetTask(169) == 34) then
Say("Thuèc cña bæn tiÖm toµn lµ thø th­îng h¹ng, cã bÖnh trŞ bÖnh, kh«ng bÖnh c­êng th©n, cã muèn mua mét İt kh«ng? ", 3, "Ta cã viÖc kh¸c muèn t×m «ng./nv30HS3", "Giao dŞch/yes", "Kh«ng giao dŞch/no");
else 
Say("Thuèc cña bæn tiÖm toµn lµ thø th­îng h¹ng, cã bÖnh trŞ bÖnh, kh«ng bÖnh c­êng th©n, cã muèn mua mét İt kh«ng? ", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no");
end
end;

function nv30HS3()
Talk(2,"","¤ng chñ d­îc ®iÕm: B¨ng Tµm Ngäc Lé Cao ®¹i hiÖp cÇn ®©y, thuèc nµy trŞ ngo¹i th­¬ng rÊt tèt. NÕu kh«ng ®ñ dïng, h·y quay l¹i t×m ta.")	 			
AddNote("§¹i hiÖp nhËn ®­îc B¨ng Tµm Ngäc Lé Cao.") 
Msg2Player("§¹i hiÖp nhËn ®­îc B¨ng Tµm Ngäc Lé Cao.") 
SetTask(169,35)		
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3949,0,0,0}, nBindState=-2}, "test", 1);
end;

function nv30HS2()
Talk(2,"","¤ng chñ d­îc ®iÕm: ThËt tèt qu¸! ta sÏ chÕ vŞ thuèc nµy ngay, ®¹i hiÖp ®îi mét tİ lµ cã thÓ lÊy ®­îc.")	 			
AddNote("§­a d­îc liÖu cho ¤ng chñ d­îc ®iÕm, l¸t sau quay l¹i nhËn B¨ng Tµm Ngäc Lé Cao.") 
Msg2Player("§­a d­îc liÖu cho ¤ng chñ d­îc ®iÕm, l¸t sau quay l¹i nhËn B¨ng Tµm Ngäc Lé Cao.") 
SetTask(169,34)	
DelCommonItem(6,1,3948)
end;

function nv30HS()
Say("¤ng chñ d­îc ®iÕm: Ng­¬i cã viÖc g×, mau nãi ®i.", 1, "Ta muèn mua mét İt B¨ng Tµm Ngäc Lé Cao/ngoclocao1"); 			
end;

function ngoclocao1()
Talk(4,"","¤ng chñ d­îc ®iÕm: VŞ ®¹i hiÖp nµy ThiÕu hiÖp ®Õn kh«ng ®óng lóc, B»ng Tµm Ngäc Lé Cao chÕ t¹o kh«ng khã, nh­ng giê cßn thiÕu 1 nguyªn liÖu quan träng B¨ng Tµm TuÕ. C¸ch ®©y mÊy h«m ®· bŞ ®¹o tÆc c­íp hÕt.","Ng­êi ch¬i: ViÖc nµy kh«ng khã, ®îi ta ®i ®o¹t vÒ.","¤ng chñ d­îc ®iÕm: ThËt vËy sao? vËy th× phã th¸c cho ThiÕu hiÖp!")	 			
AddNote("D­îc liÖu bŞ c­íp, ®¹i hiÖp nhÊt ®Şnh ph¶i ®Õn KiÕm C¸c T©y B¾c (119/243) ®¸nh b¹i ®¹o tÆc ®o¹t l¹i B¨ng Tµm ThuÕ.") 
Msg2Player("D­îc liÖu bŞ c­íp, ®¹i hiÖp nhÊt ®Şnh ph¶i ®Õn KiÕm C¸c T©y B¾c (119/243) ®¸nh b¹i ®¹o tÆc ®o¹t l¹i B¨ng Tµm ThuÕ.") 
SetTask(169,32)
end

function yes()
Sale(12);  			
end;


function no()
end;