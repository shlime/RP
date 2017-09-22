
local x,y = guiGetScreenSize()
local oWidth, oHeigth = 1920, 1080

function showInformationPanel()

	--dxDrawRectangle(1560/oWidth*x, 50/oHeigth*y, 300/oWidth*x, 150/oHeigth*y, 0x7F000000)
	--dxDrawText("Luigi Finucci", (1710)/oWidth*x, 50/oHeigth*y, _, _, _, 2, "clear", "center", "top")
	--dxDrawText("20000€", (1710)/oWidth*x, 100/oHeigth*y, _, _, 0xFF009900, 2, "bankgothic", "center", "top")

end
addEventHandler("onClientRender", getRootElement(), showInformationPanel)

