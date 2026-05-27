-- VoiceChatServer.lua
-- Voice chat system for Cyber-plays

local VoiceChatServer = {}
local voiceChannels = {}
local playerVoice = {}

local config = {
    VoiceDistance = 100,
    MaxPlayers = 32,
    EnableProximityVoice = true
}

function VoiceChatServer:Init()
    print("[VoiceChat] Initializing voice chat system...")
    
    -- Create main voice channel
    self:CreateChannel("GlobalChat")
    self:CreateChannel("ShootingChat")
    self:CreateChannel("RacingChat")
    
    print("[VoiceChat] Voice chat system ready")
end

function VoiceChatServer:CreateChannel(channelName)
    if not voiceChannels[channelName] then
        voiceChannels[channelName] = {
            Name = channelName,
            Players = {},
            CreatedAt = tick()
        }
        print("[VoiceChat] Channel created: " .. channelName)
    end
end

function VoiceChatServer:AddPlayerToVoiceChat(player)
    playerVoice[player.UserId] = {
        Player = player,
        ActiveChannel = "GlobalChat",
        Muted = false,
        Volume = 1.0
    }
    
    -- Add to global chat by default
    table.insert(voiceChannels["GlobalChat"].Players, player)
    print("[VoiceChat] Player " .. player.Name .. " joined voice chat")
end

function VoiceChatServer:RemovePlayerFromVoiceChat(player)
    if playerVoice[player.UserId] then
        local channel = playerVoice[player.UserId].ActiveChannel
        
        -- Remove from all channels
        for _, ch in pairs(voiceChannels) do
            for i, p in ipairs(ch.Players) do
                if p.UserId == player.UserId then
                    table.remove(ch.Players, i)
                    break
                end
            end
        end
        
        playerVoice[player.UserId] = nil
        print("[VoiceChat] Player " .. player.Name .. " left voice chat")
    end
end

function VoiceChatServer:SwitchChannel(player, newChannel)
    if not voiceChannels[newChannel] then return end
    
    local playerData = playerVoice[player.UserId]
    if not playerData then return end
    
    -- Remove from old channel
    local oldChannel = playerData.ActiveChannel
    for i, p in ipairs(voiceChannels[oldChannel].Players) do
        if p.UserId == player.UserId then
            table.remove(voiceChannels[oldChannel].Players, i)
            break
        end
    end
    
    -- Add to new channel
    table.insert(voiceChannels[newChannel].Players, player)
    playerData.ActiveChannel = newChannel
    
    print("[VoiceChat] Player " .. player.Name .. " switched to channel: " .. newChannel)
end

function VoiceChatServer:MutePlayer(player, mute)
    if playerVoice[player.UserId] then
        playerVoice[player.UserId].Muted = mute
        print("[VoiceChat] Player " .. player.Name .. " mute status: " .. tostring(mute))
    end
end

function VoiceChatServer:GetChannelPlayers(channelName)
    if voiceChannels[channelName] then
        return voiceChannels[channelName].Players
    end
    return {}
end

return VoiceChatServer
