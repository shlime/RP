
local x,y = guiGetScreenSize()
oWidth, oHeigth = 1920, 1080

function showLoginPanel()

	dxDrawRectangle(1560, 50, 300, 150, 0x7F000000)
	dxDrawText("Luigi Finucci", 1710-80, 70, _, _, _, 2, "clear", "left", "top")
end
addEventHandler("onClientRender", getRootElement(), showLoginPanel)

