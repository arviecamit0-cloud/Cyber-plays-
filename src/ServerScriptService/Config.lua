-- Config.lua
-- Configuration for Cyber-plays game

local Config = {
    -- Game Settings
    GameName = "Cyber-plays",
    MaxPlayers = 32,
    
    -- Hangout Area
    HangoutSettings = {
        SpawnRadius = 20,
        MaxPlayers = 32
    },
    
    -- Shooting Range
    ShootingSettings = {
        MaxPlayers = 8,
        TargetHealth = 100,
        HitPoints = 10,
        RoundDuration = 300 -- 5 minutes
    },
    
    -- Racing
    RacingSettings = {
        MaxPlayersPerRace = 8,
        TrackCount = 3,
        LapCount = 3
    },
    
    -- Voice Chat
    VoiceChatSettings = {
        ProximityDistance = 100,
        MaxChannels = 10,
        Enabled = true
    }
}

return Config
