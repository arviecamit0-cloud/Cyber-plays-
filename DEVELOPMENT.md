# Development Guide

## Setup Instructions

### Prerequisites
- Roblox Studio installed
- Basic Lua knowledge

### Project Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/arviecamit0-cloud/Cyber-plays-.git
   ```

2. **Import into Roblox Studio**
   - Create a new place in Roblox Studio
   - Go to File > Import in the Explorer
   - Import the Lua scripts from `src/ServerScriptService`

3. **Configure Settings**
   - Edit `src/ServerScriptService/Config.lua` with your preferences

4. **Create Map Structures**
   - In Workspace, create:
     - Part named "HangoutSpawn" (spawn point for hangout)
     - Part named "ShootingSpawn" (spawn point for shooting)
     - Part named "RacingSpawn" (spawn point for racing)

### Project Structure

```
ServerScriptService/
├── GameManager.lua (Main game controller)
├── HangoutManager.lua (Social area)
├── ShootingManager.lua (Combat area)
├── RacingManager.lua (Racing tracks)
├── VoiceChatServer.lua (Voice communication)
└── Config.lua (Game configuration)
```

## Features to Implement

### 1. Hangout Area
- [ ] Spawn system
- [ ] Avatar customization UI
- [ ] Chat system
- [ ] Activities (dancing, emotes)
- [ ] NPC interactions

### 2. Shooting Range
- [ ] Weapon system
- [ ] Target spawning
- [ ] Hit detection
- [ ] Score tracking
- [ ] Leaderboard display

### 3. Racing Area
- [ ] Vehicle system
- [ ] Track layouts
- [ ] Checkpoint system
- [ ] Lap timing
- [ ] Collision detection

### 4. Voice Chat
- [ ] Voice input/output
- [ ] Proximity detection
- [ ] Channel management
- [ ] Mute/unmute controls
- [ ] Volume control

## Testing

1. Run the game in Roblox Studio
2. Join as multiple players (use Run > Run Multiple Clients)
3. Test each game area
4. Verify voice chat functionality

## Deployment

1. Test in Studio
2. Create a Roblox game (https://create.roblox.com)
3. Upload and publish

## Troubleshooting

- **Scripts not loading**: Check that all files are in the correct locations
- **Players not spawning**: Verify spawn points are named correctly
- **Voice chat not working**: Check VoiceChat settings in Config.lua
