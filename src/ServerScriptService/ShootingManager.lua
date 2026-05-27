-- ShootingManager.lua
-- Manages the shooting range area

local ShootingManager = {}

local shootingPlayers = {}
local shootingScores = {}

function ShootingManager:Init()
    print("[Shooting] Initializing shooting range...")
    -- Setup targets, weapons, scoring system
end

function ShootingManager:AddPlayer(player)
    shootingPlayers[player.UserId] = player
    shootingScores[player.UserId] = 0
    
    -- Teleport player to shooting range spawn
    if player.Character then
        local shootingSpawn = game.Workspace:FindFirstChild("ShootingSpawn")
        if shootingSpawn then
            player.Character:MoveTo(shootingSpawn.Position)
        end
    end
    
    print("[Shooting] Player " .. player.Name .. " joined shooting range")
end

function ShootingManager:RecordHit(player, targetId)
    if shootingPlayers[player.UserId] then
        shootingScores[player.UserId] = shootingScores[player.UserId] + 10
        print("[Shooting] " .. player.Name .. " hit target! Score: " .. shootingScores[player.UserId])
    end
end

function ShootingManager:GetLeaderboard()
    local leaderboard = {}
    for userId, score in pairs(shootingScores) do
        table.insert(leaderboard, {UserId = userId, Score = score})
    end
    
    table.sort(leaderboard, function(a, b)
        return a.Score > b.Score
    end)
    
    return leaderboard
end

return ShootingManager
