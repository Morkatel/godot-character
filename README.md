# Godot Character

A Godot 4.6 game project featuring character-based gameplay with a buff/effect system.

## Project Overview

This is a 2D game built with Godot 4.6 that demonstrates:
- **Multiple Character Types**: Red, blue, green, and yellow characters with distinct behaviors
- **Buff System**: Dynamic buff effects including HP regeneration and speed boosts
- **Game Management**: Event-driven architecture using signals for character collision and interaction
- **Resource Management**: Health and resource tracking with visual UI

## Project Structure

```
characters/        - Character classes (base and color variants)
buffs/            - Buff effect system and implementations
level_one.gd      - Main game level and event orchestration
game_manager.gd   - Game state and event management
resource_bar.gd   - UI for resource/health display
```

## Getting Started

1. Open the project in Godot 4.6
2. The main scene is configured in `project.godot`
3. Run the project to start at Level One

## Key Features

- Character inheritance system with customizable attributes
- Signal-based communication between game systems
- Buff effect application and periodic updates
- Physics-based collision detection with distinct layers

## Requirements

- Godot Engine 4.6+
