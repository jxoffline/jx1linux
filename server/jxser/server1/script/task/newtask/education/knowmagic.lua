-- ¸÷ÃÅÅÉÎä¹¦Â·Ïß£¨ÎŞĞèÈëÃÅ±ã¿ÉÁË½â£©
-- BY:xiaoyang (2004-11-30)
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")

function Uworld1000_knowmagic()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:  Vâ häc kh«ng cã c¶nh giíi tèi cao. ThËt ra vâ c«ng c¸c m«n ph¸i quan träng nhÊt vÉn lµ siªng n¨ng luyÖn tËp.",11,
	"Nga My ph¸i/Uworld1000_emei",
	"§­êng M«n/Uworld1000_tangmen",
	"Thiªn V­¬ng Bang/Uworld1000_tianwang",
	"Thiªn NhÉn Gi¸o/Uworld1000_tianren",
	"Vâ §ang ph¸i/Uworld1000_wudang",
	"Thóy Yªn m«n/Uworld1000_cuiyan",
	"ThiÕu L©m ph¸i/Uworld1000_shaolin",
	"C¸i Bang/Uworld1000_gaibang",
	"C«n L«n ph¸i/Uworld1000_kunlun",
	"Ngò §éc Gi¸o/Uworld1000_wudu",
	"Sau sÏ hái tiÕp/no")
end

function Uworld1000_emei()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:Nga Mi lµ m«n ph¸i do n÷ nhi s¸ng lËp.'Nga Mi' võa lµ tªn gäi cña vŞ s­ tæ s¸ng lËp m«n ph¸i võa lµ th¸nh ®Şa nói Nga Mi ",4,
	"KiÕm T«ng/Uworld1000_emeijianzong",
	"Khİ T«ng/Uworld1000_emeiqizong",
	"Hç trî /Uworld1000_emeifuzhu",
	"Sau sÏ hái tiÕp/no")
end

function Uworld1000_tangmen()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: §­êng m«n hïng cø Xuyªn Thôc, ¸m khİ vµ háa khİ ®· lõng danh thiªn h¹. Ng­êi trong giang hå nghe ®Õn §­êng m«n th¶y ®Òu biÕn s¾c.",5,
	"Phi §ao/Uworld1000_tangmenfeidao",
	"Ná tiÔn/Uworld1000_tangmennujian",
	"Phi Tiªu/Uworld1000_tangmenfeibiao",
	"C¹m bÉy/Uworld1000_tangmenxianjing",
	"Sau sÏ hái tiÕp/no")
end

function Uworld1000_tianwang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Ngµy tr­íc Së V­¬ng Chung T­¬ng khëi binh t¹i §éng §×nh hå, kh¸ng Kim chèng Tèng! VÒ sau Së V­¬ng bŞ s¸t h¹i, nghÜa qu©n t«n D­¬ng Yªu lµm thñ lÜnh, x­ng lµ §¹i Th¸nh Thiªn V­¬ng! NghÜa qu©n ph¸t triÓn thÇn tèc. VÒ sau bŞ Nh¹c Phi tiªu diÖt. Sau nµy con g¸i D­¬ng yªu lµ D­¬ng Anh trë l¹i n¬i ®©y, chiªu tËp nghÜa qu©n, nèi tiÕp nghiÖp lín!",5,
	"§ao Thiªn V­¬ng/Uworld1000_daotianwang",
	"Th­¬ng Thiªn V­¬ng/Uworld1000_qiangtianwang",
	"Chïy Thiªn V­¬ng/Uworld1000_chuitianwang",
	"Hç trî /Uworld1000_fuzhutianwang",
	"Sau sÏ hái tiÕp/no")
end

function Uworld1000_tianren()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Thiªn NhÉn Gi¸o lµ tæ chøc cña Kim Quèc nh»m ®èi phã víi Vâ L©m Nh©n sÜ cña Tèng Quèc, ®­îc phong lµ T¸t M·n Gi¸o Quèc gi¸o cña §¹i Kim, gi¸o chñ lµ Kim Quèc Quèc s­ Hoµn Nhan Hïng LiÖt, cao thñ trong gi¸o nhiÒu v« sè, cßn chiªu mé thªm ph¶n ®å Chİnh ph¸i vµ Tµ ph¸i cña Tèng Quèc",4,
	"ChiÕn NhÉn/Uworld1000_zhanren",
	"Ma NhÉn/Uworld1000_moren",
	"Chó NhÉn/Uworld1000_zuzhouren",
	"Sau sÏ hái tiÕp/no")
end

function Uworld1000_wudang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Vâ §ang s¬n cßn gäi lµ Th¸i Hßa s¬n, ®­îc mÖnh danh lµ:'Trung Quèc ®¹o gi¸o danh s¬n'. Vâ §ang ph¸i ®­îc phong lµ 'HuyÒn Thiªn TrÊn Vâ §¹i §Õ'. Vâ §ang ph¸i ®· cã lŞch sö l©u ®êi. S¸ng lËp m«n ph¸i lµ tæ s­ 'L¹p Th¸p ®¹o nh©n' Tr­¬ng Tam Phong",4,
	"KiÕm T«ng/Uworld1000_wudangjianzong",
	"Khİ T«ng/Uworld1000_wudangqizong",
	"Hç trî /Uworld1000_wudangfuzhu",
	"Sau sÏ hái tiÕp/no")
end

function Uworld1000_cuiyan()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:Lµ 1 m«n ph¸i thÇn bİ ë V©n Nam, t­¬ng truyÒn Tæ s­ lËp ph¸i lµ 1 vŞ n÷ hiÖp bŞ t×nh nh©n phô rÉy, bá ®i Èn c­ ®Ó quªn hÕt sù ®êi?®· ®Õn vïng nói biªn thïy V©n Nam xa x«i hÎo l¸nh,trªn ®­êng ®i Ng­êi gÆp nhiÒu c« nhi bŞ bá r¬i ®em vÒ nu«i d­ìng vµ truyÒn thô vâ c«ng.Thóy Yªn m«n vµ §­êng M«n cïng x­ng lµ 'Vâ L©m NhŞ M«n', chØ tiÕc lµ hµnh tung thÇn bİ nªn x­a nay İt Nam tö h¸n nµo ®­îc tháa niÒm mong ­íc.Thóy Yªn m«n cuèi cïng lµ Thiªn ®­êng hay §Şa ngôc.",4,
	"§¬n §ao/Uworld1000_cuiyandandao",
	"Song ®ao/Uworld1000_cuiyanshuangdao",
	"Hç trî /Uworld1000_cuiyanfuzhu",
	"§Ó ta suy nghÜ l¹i!/no")
end

function Uworld1000_shaolin()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: ThiÕu L©m Tù s¸ng lËp tõ thêi B¾c Ngôy HiÕu V¨n §Õ N¨m Th¸i Hßa thø 19 (C«ng Nguyªn n¨m 495) ",5,
	"QuyÒn ThiÕu L©m/Uworld1000_quanshaolin",
	"C«n ThiÕu L©m/Uworld1000_gunshaolin",
	"§ao ThiÕu L©m/Uworld1000_daoshaolin",
	"Hç trî /Uworld1000_shaolinfuzhu",
	"§Ó ta suy nghÜ l¹i!/no")
end

function Uworld1000_gaibang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: LŞch sö cña C¸i Bang nãi ra rÊt dµi, ®­îc mÖnh danh Thiªn H¹ §Ö NhÊt Bang. C¸i Bang bang chóng nh­ Ngäa hæ tµng long nh©n tµi v« sè.",4,
	"Ch­ëng C¸i/Uworld1000_zhanggai",
	"C«n C¸i/Uworld1000_gungai",
	"Hç trî /Uworld1000_gaibangfuzhu",
	"§Ó ta suy nghÜ l¹i!/no")
end

function Uworld1000_kunlun()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: C«n L«n ph¸i ë tËn T©y Vùc, tuy ®­îc s¸ng lËp ®· l©u nh­ng sau khi S­ Tæ khai ph¸i qua ®êi, trong ph¸i kh«ng cã ai lµ xuÊt chóng. M·i cho ®Õn h¬n tr¨m n¨m tr­íc, C«n Lu©n ph¸i xuÊt hiÖn mét vŞ kú nh©n. Ng­êi nµy kh«ng nh÷ng t¹o ®­îc uy danh lõng lÉy trong vâ l©m Trung Nguyªn mµ cßn gióp tªn tuæi cña C«n Lu©n b¾t ®Çu lan réng kh¾p vâ l©m.",5,
	"§ao C«n L«n/Uworld1000_daokunlun",
	"KiÕm C«n L«n/Uworld1000_jiankunlun",
	"Bïa chó /Uworld1000_zuzhoukunlun",
	"Hç trî /Uworld1000_kunlunfuzhu",
	"§Ó ta suy nghÜ l¹i!/no")
end

function Uworld1000_wudu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Bæn gi¸o chØ míi thµnh lËp vµi n¨m nay nh­ng ph¸t triÓn rÊt m¹nh. Ngò §éc gi¸o tæ chøc nghiªm ngÆt, Gi¸o chñ s¸ng lËp ph¸i H¾c DiÖn Lang Qu©n. Ngò §éc gi¸o lµ 1 tæ chøc thÇn bİ, ng­êi trong giang hå nghe ®Õn ®Òu biÕn s¾c. T«n chØ cña Ngò §éc gi¸o lµ 'Lîi İch quyÕt ®Şnh b¹n thï', cã lîi míi lµm, kh«ng qu¶n bÊt kÓ chuyÖn thŞ phi chİnh tµ. Ngò §éc gi¸o cßn cã 1 ®iÒu lµ 'KÎ ®¾c téi víi Ngò §éc gi¸o, sÏ chÕt kh«ng toµn th©y'.",5,
	"Ch­ëng ®éc/Uworld1000_zhangdu",
	"§ao ®éc/Uworld1000_daodu",
	"Bïa chó /Uworld1000_zuzhouwudu",
	"Hç trî /Uworld1000_wudufuzhu",
	"§Ó ta suy nghÜ l¹i!/no")
end

function Uworld1000_emeijianzong()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: KiÕm T«ng: NhÊt DiÖp Tri Thu (NhËp m«n) , Nga Mi KiÕm Ph¸p (cÊp 10) , Th«i Song Väng NguyÖt (cÊp 30) , BÊt DiÖt BÊt TuyÖt (cÊp 60) , PhËt Ph¸p V« Biªn (trÊn ph¸i) , Tam Nga TÒ TuyÕt (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_emeiqizong()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Khİ T«ng: Phiªu TuyÕt Xuyªn V©n (NhËp m«n) , Nga Mi Ch­ëng Ph¸p (cÊp 10) , Tø T­îng §ång Quy (cÊp 30) , PhËt Quang Phæ ChiÕu (cÊp 60) , PhËt Ph¸p V« Biªn (trÊn ph¸i) , Phong S­¬ng To¸i ¶nh (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_emeifuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Vâ c«ng hç trî: Tõ Hµng Phæ §é (cÊp 20) , Méng §iÖp (cÊp 30) , L­u Thñy (cÊp 40) , PhËt T©m Tõ H÷u (cÊp 50) , Thanh ¢m Ph¹n X­íng (cÊp 60) , Phæ §é Chóng Sinh (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_tangmenfeidao()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Phi ®ao: Tİch LŞch §¬n (NhËp m«n) , §­êng M«n ¸m Khİ (cÊp 10) , Truy T©m TiÔn (cÊp 30) , TiÓu Lı Phi ®ao (cÊp 60) , T©m Nh·n (trÊn ph¸i) , NhiÕp Hån NguyÖt ¶nh (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_tangmennujian()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Tô TiÔn: Tİch LŞch §¬n (NhËp m«n) , §­êng M«n ¸m Khİ (cÊp 10) , M¹n Thiªn Hoa Vò (cÊp 30) , Thiªn La §Şa Vâng (cÊp 60) , T©m Nh·n (trÊn ph¸i) , B¹o Vò Lª Hoa (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_tangmenfeibiao()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Phi Tiªu: Tİch LŞch §¬n (NhËp m«n) , §­êng M«n ¸m Khİ (cÊp 10) , §o¹t Hån Tiªu (cÊp 30) , T¶n Hoa Tiªu (cÊp 60) , T©m Nh·n (trÊn ph¸i) , Cöu Cung Phi Tinh (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_tangmenxianjing()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: C¹m bÉy: §Şa DiÖm Háa (cÊp 10) , §éc Thİch Cèt (cÊp 20) , Xuyªn T©m Thİch (cÊp 30) , Hµn B¨ng Thİch (cÊp 40) , L«i Kİch ThuËt (cÊp 50) , Lo¹n hoµn Kİch (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_daotianwang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Thiªn V­¬ng §ao: Kinh L«i Tr¶m (NhËp m«n) , Thiªn V­¬ng §ao ph¸p (cÊp 10) , B¸t Phong Tr¶m (cÊp 30) , V« T©m Tr¶m (cÊp 60) , Thiªn V­¬ng ChiÕn ı (trÊn ph¸i) , Ph¸ Thiªn Tr¶m (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_qiangtianwang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Thiªn V­¬ng Th­¬ng: Håi Phong L¹c Nh¹n (NhËp m«n) , Thiªn V­¬ng Th­¬ng ph¸p (cÊp 10) , D­¬ng Quan Tam §iÖp (cÊp 30) , HuyÕt ChiÕn B¸t Ph­¬ng (cÊp 60) , Thiªn V­¬ng ChiÕn ı (trÊn ph¸i) , Truy Tinh Trôc NguyÖt (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_chuitianwang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Thiªn V­¬ng Chïy: Tr¶m Long QuyÕt (NhËp m«n) , Thiªn V­¬ng Chïy ph¸p (cÊp 10) , Hµng V©n QuyÕt (cÊp 30) , Thõa Long QuyÕt (cÊp 60) , Thiªn V­¬ng ChiÕn ı (trÊn ph¸i) , Truy Phong QuyÕt (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_fuzhutianwang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Hç trî: TÜnh T©m QuyÕt (cÊp 20) , §o¹n Hån Thİch (cÊp 40) , Kim Chung Tr¸o (cÊp 50) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_zhanren()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: ChiÕn NhÉn: Tµn D­¬ng Nh­ HuyÕt (NhËp m«n) , Thiªn NhÉn M©u Ph¸p (cÊp 10) , LiÖt Háa T×nh Thiªn (cÊp 30) , Th©u Thiªn Ho¸n NhËt (cÊp 60) , Thiªn Ma Gi¶i ThÓ (trÊn ph¸i) , V©n Long Kİch (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_moren()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:Ma NhÉn: §¬n ChØ LiÖt DiÖm (NhËp m«n) , Thiªn NhÉn §ao Ph¸p (cÊp 10) , Th«i S¬n §iÒn H¶i (cÊp 30) , Ma DiÖm ThÊt S¸t (cÊp 60) , Thiªn Ma Gi¶i ThÓ (trÊn ph¸i) , Thiªn Ngo¹i L­u Tinh (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_zuzhouren()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Bïa Chó: Háa Liªn PhÇn Hoa (cÊp 10) , ¶o ¶nh Phi Hå (cÊp 20) , Phi Hång V« Tİch (cÊp 30) , Bi T« Thanh Phong (cÊp 40) , LŞch Ma §o¹t Hån (cÊp 50) , NhiÕp Hån Lo¹n T©m (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_wudangjiancong()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: KiÕm T«ng: Th­¬ng H¶i Minh NguyÖt (NhËp m«n) , Vâ §ang KiÕm Ph¸p (cÊp 10) , KiÕm Phi Kinh Thiªn (cÊp 30) , Tam Hoµn Thao NguyÖt (cÊp 60) , Th¸i Cùc ThÇn C«ng (trÊn ph¸i) , Nh©n KiÕm Hîp NhÊt (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_wudangqizong()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Khİ T«ng: Né L«i ChØ (NhËp m«n ) , Vâ §ang QuyÒn Ph¸p (cÊp 10) , B¸c CÊp Nhi Phôc (cÊp 30) , V« Ng· V« KiÕm (cÊp 60) , Th¸i Cùc ThÇn C«ng (trÊn ph¸i) , Thiªn §Şa V« Cùc (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_wudangfuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Vâ c«ng Hç trî:  ThÊt Tinh TrËn (cÊp 20) , ThÕ V©n Tung (cÊp 40) , Täa Väng V« Ng· (cÊp 50) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_cuiyandandao()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: §¬n §ao: Phong Hoa TuyÕt NguyÖt (NhËp m«n) , Thóy Yªn §ao Ph¸p (cÊp 10) , Vò §¶ L«i Hoa (cÊp 30) , Môc D· L­u Tinh (cÊp 60) , B¨ng Cèt TuyÕt T©m (trÊn ph¸i) , B¨ng Tung V« ¶nh (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_cuiyanshuangdao()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Song §ao: Phong QuyÓn Tµn TuyÕt (NhËp m«n) , Thóy Yªn Song §ao (cÊp 10) , Phï V©n T¸n TuyÕt (cÊp 30) , Bİch H¶i TriÒu Sinh (cÊp 60) , B¨ng Cèt TuyÕt T©m?trÊn ph¸i) , B¨ng T©m Tiªn Tö  cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_cuiyanfuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Hç trî: B¨ng T©m Tr¸i ¶nh (cÊp 20) , Hé ThÓ Hµn B¨ng (cÊp 40) , TuyÕt ¶nh (cÊp 50) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_quanshaolin()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: ThiÕu L©m QuyÒn: Hµng Long BÊt Vò (NhËp m«n) , ThiÕu L©m QuyÒn Ph¸p (cÊp 10) , La H¸n TrËn (cÊp 30) , Long Tr¶o Hæ Tr¶o (cÊp 50) , Nh­ Lai Thiªn DiÖp (trÊn ph¸i) , §¹t Ma §é Giang (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_gunshaolin()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: ThiÕu L©m C«n: Kim Cang Phôc Ma (NhËp m«n) , ThiÕu L©m C«n Ph¸p (cÊp 10) , La H¸n TrËn (cÊp 30) , Hoµnh T¶o Lôc Hîp (cÊp 50) , Nh­ Lai Thiªn DiÖp (trÊn ph¸i) , Hoµnh T¶o Thiªn Qu©n (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_daoshaolin()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: ThiÕu L©m §ao: Kim Cang Phôc Ma (NhËp m«n) , ThiÕu L©m §ao Ph¸p (cÊp 10) , La H¸n TrËn (cÊp 30) , Ma Ha V« L­îng (cÊp 50) , Nh­ Lai Thiªn DiÖp (trÊn ph¸i) , V« T­íng Tr¶m (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_shaolinfuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Hç trî: BÊt ®éng Minh V­¬ng (cÊp 20) , S­ Tö Hèng (cÊp 40) , DŞch C©n Kinh (cÊp 60) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_zhanggai()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Ch­ëng C¸i: KiÕn Nh©n ThÇn Thñ (NhËp m«n) , C¸i Bang Ch­ëng Ph¸p (cÊp 10) , Gi¸ng Long Ch­ëng (cÊp 30) , Kh¸ng Long H÷u Hèi (cÊp 50) , Tóy §iÖp Cuång Vò (trÊn ph¸i) , Phi Long T¹i Thiªn (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_gungai()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: C«n C¸i: Duyªn M«n Th¸c B¸t (NhËp m«n) , C¸i Bang Bæng Ph¸p (cÊp 10) , §¶ CÈu TrËn (cÊp 30) , Bæng §¶ ¸c CÈu (cÊp 50) , Tóy §iÖp Cuång Vò (trÊn ph¸i) , Thiªn H¹ V« CÈu (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_gaibangfuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Hç trî: Hãa HiÓm Vi Di (cÊp 20) , Ho¹t BÊt L­u Thñ (cÊp 40) , Tiªu Diªu C«ng (cÊp 60) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_daokunlun()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: §ao C«n L«n: H« Phong Ph¸p (NhËp m«n) , §ao C«n L«n ph¸p (cÊp 10) , NhÊt Khİ Tam Thanh (cÊp 30) , Cuång Phong SËu §iÖn (cÊp 50) , S­¬ng Ng¹o C«n L«n (trÊn ph¸i) , Ng¹o TuyÕt Tiªu Phong (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_jiankunlun()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: KiÕm C«n L«n: Cuång L«i ChÊn §Şa (NhËp m«n) , KiÕm C«n L«n Ph¸p (cÊp 10) , Thiªn TÕ TÊn L«i (cÊp 30) , Ngò L«i Chİnh Ph¸p (cÊp 60) , S­¬ng Ng¹o C«n L«n (trÊn ph¸i) , L«i ®éng Cöu Thiªn (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_zuzhoukunlun()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Bïa Chó: Thóc Ph­îc Chó (cÊp 10) , Ky B¸n Phï (cÊp 20) , B¾c Minh §¸o H¶i (cÊp 30) , Khi Hµn Ng¹o TuyÕt (cÊp 40) , Mª Tung ¶o ¶nh (cÊp 50) , Tóy Tiªn T¸ Cèt (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_kunlunfuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Hç trî: Thanh Phong Phï (cÊp 10) , Thiªn Thanh §Şa Träc (cÊp 30) , Khİ T©m Phï (cÊp 40) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_zhangdu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Ch­ëng §éc: §éc Sa Ch­ëng (NhËp m«n) , Ngò §éc Ch­ëng Ph¸p (cÊp 10) , U Minh Kh« L©u (cÊp 30) , Thiªn C­¬ng §Şa S¸t (cÊp 60) , Ngò §éc Kú Kinh (trÊn ph¸i) , ¢m Phong Thùc Cèt (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_daodu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: §ao §éc: HuyÕt §ao §éc S¸t (NhËp m«n) , Ngò §éc §ao Ph¸p (cÊp 10) , B¸ch §éc Xuyªn T©m (cÊp 30) , Chu C¸p Thanh Minh (cÊp 60) , Ngò §éc Kú Kinh (trÊn ph¸i) , HuyÒn ¢m Tr¶m (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_zuzhouwudu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Bïa Chó: Cöu Thiªn Cuång L«i (cÊp 10) , Xİch DiÖm Thùc Thiªn (cÊp 20) , B¨ng Lam HuyÒn Tinh (cÊp 30) , Xuyªn Y Ph¸ Gi¸p (cÊp 40) , Xuyªn T©m §éc Thİch (cÊp 50) , §o¹n C©n Hñ Cèt (cÊp 90) .",1,"Sau sÏ quay l¹i/no")
end

function Uworld1000_wudufuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Vâ c«ng Hç trî:  T¹p Nan D­îc Kinh (cÊp 20) , V« H×nh §éc (cÊp 30) , V¹n §éc Thùc T©m (cÊp 40) .",1,"Sau sÏ quay l¹i/no")
end



function no()
end
