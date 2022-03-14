function main()
	--dofile("script/global/nhmnghia/item/kimmalebao.lua")
	local str = ""..GetName().." muèn chän Kim M· LÖnh nµo?"
	local tb_KML = {
			"Kim M· LÖnh - 1./#NhanKML(1)",
			"Kim M· LÖnh - 2./#NhanKML(2)",
			"Kim M· LÖnh - 3./#NhanKML(3)",
			"Kim M· LÖnh - 4./#NhanKML(4)",
			"Kim M· LÖnh - 5./#NhanKML(5)",
			"Kim M· LÖnh - 6./#NhanKML(6)",
			"Kim M· LÖnh - 7./#NhanKML(7)",
			--"Tho¸t./no",
		}
	Say(str,getn(tb_KML),tb_KML)
	--return 1
end

function NhanKML(nIndex)
	AddItem(6, 1, 4089 + nIndex, 1, 0 , 0)
end

function no()
end