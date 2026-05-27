-- GameManager.lua
-- Main game controller for Cyber-plays

local GameManager = {}
local config = require(game:GetService("ServerScriptService"):WaitForChild("Config"))

-- Initialize different game areas
local HangoutManager = require(script.Parent:WaitForChild("HangoutManager"))
local ShootingManager = require(script.Parent:WaitForChild("ShootingManager"))
local RacingManager = require(script.Parent:WaitForChild("RacingManager"))
local VoiceChatServer = require(script.Parent:WaitForChild("VoiceChatServer"))

-- Player tracking
local players = game:GetService("Players")
local activePlayers = {}

function GameManager:Initialize()
    print("[GameManager] Initializing Cyber-plays...")
    
    -- Initialize all game systems
    HangoutManager:Init()
    ShootingManager:Init()
    RacingManager:Init()
    VoiceChatServer:Init()
    
    -- Connect player events
    players.PlayerAdded:Connect(function(player)
        self:OnPlayerJoined(player)
    end)
    
    players.PlayerRemoving:Connect(function(player)
        self:OnPlayerLeft(player)
    end)
    
    print("[GameManager] Initialization complete!")
end

function GameManager:OnPlayerJoined(player)
    print("[GameManager] Player joined: " .. player.Name)
    activePlayers[player.UserId] = {
        Player = player,
        CurrentArea = "Hangout",
        JoinTime = tick()
    }
    
    -- Initialize player in hangout
    HangoutManager:AddPlayer(player)
    VoiceChatServer:AddPlayerToVoiceChat(player)
end

function GameManager:OnPlayerLeft(player)
    print("[GameManager] Player left: " .. player.Name)
    activePlayers[player.UserId] = nil
    VoiceChatServer:RemovePlayerFromVoiceChat(player)
end

function GameManager:TransferPlayer(player, targetArea)
    if not activePlayers[player.UserId] then return end
    
    local currentArea = activePlayers[player.UserId].CurrentArea
    
    if targetArea == "Hangout" then
        HangoutManager:AddPlayer(player)
    elseif targetArea == "Shooting" then
        ShootingManager:AddPlayer(player)
    elseif targetArea == "Racing" then
        RacingManager:AddPlayer(player)
    end
    
    activePlayers[player.UserId].CurrentArea = targetArea
end

-- Start the game
GameManager:Initialize()

return GameManager
