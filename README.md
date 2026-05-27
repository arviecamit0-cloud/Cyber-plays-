# Cyber-plays

A Roblox game featuring multiple game modes:
- **Hangout Area**: Social space for players to meet and interact
- **Shooting Range**: Combat/target practice area
- **Racing Area**: Competitive racing tracks
- **Voice Chat Server**: Real-time voice communication

## Project Structure

```
Cyber-plays/
├── src/
│   ├── ServerScriptService/
│   │   ├── GameManager.lua
│   │   ├── VoiceChatServer.lua
│   │   ├── HangoutManager.lua
│   │   ├── ShootingManager.lua
│   │   └── RacingManager.lua
│   ├── StarterPlayer/
│   │   └── StarterCharacterScripts/
│   │       └── CharacterSetup.lua
│   └── StarterGui/
│       ├── MainUI.lua
│       └── VoiceChatUI.lua
├── config/
│   └── GameConfig.lua
└── README.md
```

## Features

### 1. Hangout Area
- Spawn point for players
- Social gathering space
- Avatar customization
- Chat system

### 2. Shooting Range
- Target practice area
- Weapon system
- Scoring system
- Leaderboard

### 3. Racing Area
- Multiple race tracks
- Vehicle physics
- Checkpoints and timing
- Win detection

### 4. Voice Chat Server
- Real-time voice communication
- Proximity-based voice
- Server-side voice management
- Audio streaming

## Installation

1. Clone this repository
2. Import scripts into Roblox Studio
3. Configure GameConfig.lua with your settings
4. Test in Roblox Studio

## Dependencies

- Roblox Studio
- Required ModuleScripts (see dependencies.txt)

## Development

See DEVELOPMENT.md for setup instructions.
