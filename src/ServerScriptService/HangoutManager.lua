-- HangoutManager.lua
-- Manages the hangout/social area

local HangoutManager = {}

local hangoutPlayers = {}

function HangoutManager:Init()
    print("[Hangout] Initializing hangout area...")
    -- Setup hangout spawn points, decorations, etc.
end

function HangoutManager:AddPlayer(player)
    hangoutPlayers[player.UserId] = player
    
    -- Teleport player to hangout spawn
    if player.Character then
        local hangoutSpawn = game.Workspace:FindFirstChild("HangoutSpawn")
        if hangoutSpawn then
            player.Character:MoveTo(hangoutSpawn.Position)
        end
    end
    
    print("[Hangout] Player " .. player.Name .. " joined hangout area")
end

function HangoutManager:RemovePlayer(player)
    hangoutPlayers[player.UserId] = nil
end

function HangoutManager:GetPlayerCount()
    local count = 0
    for _ in pairs(hangoutPlayers) do
        count = count + 1
    end
    return count
end

return HangoutManager
