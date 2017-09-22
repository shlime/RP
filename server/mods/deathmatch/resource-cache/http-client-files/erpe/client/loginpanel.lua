
local screenX,screenY = guiGetScreenSize()
local oWidth, oHeigth = 1920, 1080

function showLoginPanel()
	local x = screenX - 340
	local y = screenY - 1080
	showCursor(true, true)

	image = guiCreateStaticImage(x/oWidth*screenX, y/oHeigth*screenY, 340/oWidth*screenX, 1080/oHeigth*screenY, "gui/login.png", false)
	guiSetAlpha(image, 0.95)

	usernameBox = guiCreateEdit( 53/oWidth*screenX, 576/oHeigth*screenY, 230/oWidth*screenX, 26/oHeigth*screenY, "adasdasda", false, image)
	guiBringToFront( usernameBox )
	guiEditSetCaretIndex( usernameBox, 1 )

	passwordBox = guiCreateEdit( 53/oWidth*screenX, 638/oHeigth*screenY, 230/oWidth*screenX, 26/oHeigth*screenY, "adasdasda", false, image)
	guiBringToFront( passwordBox )
	guiEditSetCaretIndex( passwordBox, 1 )

	loginButton = guiCreateLabel( 55/oWidth*screenX, 704/oHeigth*screenY, 225/oWidth*screenX, 55/oHeigth*screenY, "", false, image)
	addEventHandler("onClientGUIClick", loginButton, onLoginButtonClicked, false)

	registerButton = guiCreateLabel( 55/oWidth*screenX, 776/oHeigth*screenY, 225/oWidth*screenX, 55/oHeigth*screenY, "", false, image)
	addEventHandler("onClientGUIClick", registerButton, onRegisterButtonClicked, false)



end
addEventHandler("onClientResourceStart", getRootElement(), showLoginPanel)


function onLoginButtonClicked()
	username = guiGetText(usernameBox)
	password = guiGetText(passwordBox)

	triggerServerEvent("submitLogin", getRootElement(), username, password)

end

function onRegisterButtonClicked()
	username = guiGetText(usernameBox)
	password = guiGetText(passwordBox)

	triggerServerEvent("submitRegister", getRootElement(), username, password)
end
