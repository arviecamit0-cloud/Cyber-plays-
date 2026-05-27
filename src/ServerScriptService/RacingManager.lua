-- RacingManager.lua
-- Manages the racing area and tracks

local RacingManager = {}

local racingPlayers = {}
local raceInProgress = false
local raceLeaderboard = {}

function RacingManager:Init()
    print("[Racing] Initializing racing area...")
    -- Setup tracks, vehicles, checkpoints
end

function RacingManager:AddPlayer(player)
    racingPlayers[player.UserId] = {
        Player = player,
        CurrentTrack = nil,
        Position = 0,
        Time = 0,
        Finished = false
    }
    
    -- Teleport player to racing spawn
    if player.Character then
        local racingSpawn = game.Workspace:FindFirstChild("RacingSpawn")
        if racingSpawn then
            player.Character:MoveTo(racingSpawn.Position)
        end
    end
    
    print("[Racing] Player " .. player.Name .. " joined racing area")
end

function RacingManager:StartRace(player, trackName)
    if racingPlayers[player.UserId] then
        racingPlayers[player.UserId].CurrentTrack = trackName
        racingPlayers[player.UserId].Time = tick()
        print("[Racing] " .. player.Name .. " started race on track: " .. trackName)
    end
end

function RacingManager:FinishRace(player)
    if racingPlayers[player.UserId] then
        local finishTime = tick() - racingPlayers[player.UserId].Time
        racingPlayers[player.UserId].Finished = true
        
        table.insert(raceLeaderboard, {
            Player = player,
            Time = finishTime
        })
        
        print("[Racing] " .. player.Name .. " finished in " .. finishTime .. " seconds")
    end
end

function RacingManager:GetRaceLeaderboard()
    table.sort(raceLeaderboard, function(a, b)
        return a.Time < b.Time
    end)
    return raceLeaderboard
end

return RacingManager
