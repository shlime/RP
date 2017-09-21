idTable = {}
 
function thisResourceStart ()
        exports.dxscoreboard:addScoreboardColumn( "ID", getRootElement(), 2, 0.05 )
        local players = getElementsByType ( "player" )
        for i,player in ipairs ( players ) do
                assignID ( player )
        end
end
 
function thisResourceStop ()
        exports.dxscoreboard:removeScoreboardColumn( "ID" )
        idTable = {}
        local players = getElementsByType ( "player" )
        for i,player in ipairs ( players ) do
                removeElementData ( player ,"ID" )
        end
end
 
function playerJoin ()
        assignID ( source )
end
 
function playerLeave ()
        idTable[source] = nil
end
 
function assignID ( player )
        for i=1,128 do
                if not table.find(idTable,i) then
                        idTable[player] = i
                        setElementData ( player, "ID", i )
                        return true
                end
        end
end
 
function table.find ( tableToSearch, value )
        for k,v in pairs ( tableToSearch ) do
                if v == value then
                        return k
                end
        end
        return false
end
 
function getIDFromName ( playersName )
        local playerFound = getPlayerFromName ( playersName )
        for k,v in pairs ( idTable ) do
                if k == playerFound then
                        return v
                end
        end
end
 
function getIDFromNameC ( player, command, name )
        name = tostring ( name )
        local plID = getIDFromName ( name )
        if plID == nil then
                outputChatBox ("Name doesn't exist.", player )
        else
                outputChatBox ("Player Name: " ..name.. " ID: " ..plID, player )
        end
end
 
function getNameFromID ( ID )
        for k,v in pairs ( idTable ) do
                if v == ID then
                        local playername = getPlayerName ( k )
                        return playername
                end
        end
end
 
function getNameFromIDC ( player, command, id )
        id = tostring ( id )
        local plName = getNameFromID ( id )
        if plName == nil then
                outputChatBox ("ID Doesn't exist.", player )
        else
                outputChatBox ("Player Name: " ..plName.. " ID: " ..id, player )
        end
end
 
function showIDs ( player, command )
        for players,id in pairs ( idTable ) do
                local playersname = getPlayerName ( players )
                outputChatBox ("PName:" ..playersname.. " ID:" ..id )
        end
end
addCommandHandler ( "showallIDs", showIDs )
 
-------------------------------------------------------All Functions for ID system
function commandGoToCar(player, commandName, player2nick)
        if tonumber ( player2nick ) == nil then
                local player2 = getPlayerFromName ( player2nick )
                local x, y, z = getElementPosition ( player2 )
                x = x+5
                y = y+5
                local r = getPedRotation ( player2 )
                teleportPlayer (player, x, y, z, r)
        else
                player2nick = tonumber ( player2nick )
                player2nick2 = getNameFromID ( player2nick )
                local player2 = getPlayerFromName ( player2nick2 )
                local x, y, z = getElementPosition ( player2 )
                x = x+5
                y = y+5
                local r = getPedRotation ( player2 )
                teleportPlayer (player, x, y, z, r)
        end
end
function consoleWarpTo ( player, command, player2nick )
        local x, y, z, r, d = 0, 0, 0, 0, 2.5
        if tonumber ( player2nick ) == nil then
                if getPlayerFromName ( player2nick ) == nil then
                        outputChatBox ("That player does not exist.", player )
                else
                        local player2 = getPlayerFromName ( player2nick )
                        if isPedInVehicle ( player2 ) == true then
                                local player2vehicle = getPedOccupiedVehicle ( player2 )
                                local maxseats = getVehicleMaxPassengers ( player2vehicle ) + 1
                                local i = 0
                                while ( i < maxseats ) do
                                        if ( getVehicleOccupant ( player2vehicle, i ) ) then
                                                i = i + 1
                                        else
                                                break
                                        end
                                end
                                if ( i < maxseats ) then
                                        removePedFromVehicle ( player )
                                        local status = setTimer ( warpPedIntoVehicle, 100, 1, player, player2vehicle, i )
                                else
                                        outputConsole ( "Sorry, the player's vehicle is full.", player )
                                        local x2, y2, z2 = getElementPosition ( player2 )
                                        local x = x2+5
                                        local y = y2+5
                                        local z = z2+2
                                        if isPedInVehicle ( player ) then
                                                removePedFromVehicle ( player )
                                        end
                                        teleportPlayer ( player, x, y, z, r )
                                end
                        end
                end
        else
                player2nick = tonumber ( player2nick )
                if getNameFromID ( player2nick ) == nil then
                        outputChatBox ("That ID does not exist.", player )
                else
                        player2nick = tonumber ( player2nick )
                        player2nick2 = getNameFromID ( player2nick )
                        local player2 = getPlayerFromName ( player2nick2 )
                        if isPedInVehicle ( player2 ) == true then
                                local player2vehicle = getPedOccupiedVehicle ( player2 )
                                local maxseats = getVehicleMaxPassengers ( player2vehicle ) + 1
                                local i = 0
                                while ( i < maxseats ) do
                                        if ( getVehicleOccupant ( player2vehicle, i ) ) then
                                                i = i + 1
                                        else
                                                break
                                        end
                                end
                                if ( i < maxseats ) then
                                        removePedFromVehicle ( player )
                                        local status = setTimer ( warpPedIntoVehicle, 100, 1, player, player2vehicle, i )
                                else
                                        outputConsole ( "Sorry, the player's vehicle is full.", player )
                                        local x2, y2, z2 = getElementPosition ( player2 )
                                        local x = x2+5
                                        local y = y2+5
                                        local z = z2+2
                                        if isPedInVehicle ( player ) then
                                                removePedFromVehicle ( player )
                                        end
                                        teleportPlayer ( player, x, y, z, r )
                                end
                        end
                end
        end
end
 
function teleportPlayer ( player, x, y, z, r )
        if isPedInVehicle(player) then --if a player is in a car
                local vehicle = getPedOccupiedVehicle(player)           --find what car
                local seat = getPedOccupiedVehicleSeat ( player )       --find what seat
                if seat ~= 0 then                                                                               --if player is not the driver
                        removePedFromVehicle ( player )                                 --and take them out of the car
                        setElementPosition(player, x, y , z)
                        setPedRotation(player, r)                                               --put them on foot and teleport
                else                                                                                                    --they are the driver
                        setElementPosition(vehicle, x, y, z+1.5)
                        setElementVelocity(vehicle, 0, 0, 0)
                        setVehicleTurnVelocity(vehicle, 0, 0, 0)
                        setVehicleRotation(vehicle, 0, 0, r)
                        setTimer(stopCar, 75, 5, vehicle, x, y, z, r)           --teleport the car
                end
        else                                                                                                            --not in a car at all
                setElementPosition(player, x, y , z)
                setPedRotation(player, r)                                                       --teleport the player
        end
        setElementInterior ( player, 0 )
end
 
function stopCar(vehicle, x, y, z, r)
        setElementPosition(vehicle, x, y, z+1.5)
        setElementVelocity(vehicle, 0, 0, 0)
        setVehicleTurnVelocity(vehicle, 0, 0, 0)
        setVehicleRotation(vehicle, 0, 0, r)
end
-------------------------------------------------------End Functions for ID system
addCommandHandler ("pname", getNameFromIDC )
addCommandHandler ("pid", getIDFromNameC )
addCommandHandler ( "goto", consoleWarpTo )
addCommandHandler ( "gt", consoleWarpTo )
addCommandHandler ( "warpto", consoleWarpTo )
addCommandHandler ( "gotocar", commandGoToCar )
addCommandHandler ( "gc", commandGoToCar )
addEventHandler ( "onPlayerQuit", getRootElement(), playerLeave )
addEventHandler ( "onPlayerJoin", getRootElement(), playerJoin )
addEventHandler ( "onResourceStart", getResourceRootElement(getThisResource()), thisResourceStart )
addEventHandler ( "onResourceStop", getResourceRootElement(getThisResource()), thisResourceStop )