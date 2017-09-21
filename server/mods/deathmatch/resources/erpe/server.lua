root = getRootElement()


addEventHandler("onPlayerJoin", root,
	function ()
		spawnPlayer(source, 0, 0, 3)
		setCameraTarget(source, source)
		fadeCamera(source, true)
		outputChatBox("Szia barát! Üdv Diószeg legjobb erpé szerverén..", source)
	end
)

