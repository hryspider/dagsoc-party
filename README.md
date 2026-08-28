# README
Will contain instructions on how to modify the project.

## File structure
All the base menus, the board game system and general assets we've provided for minigames are stored in the `main_board` folder.
Do not edit content in here when making your minigame.

All minigames are stored in the `minigames` folder.
Each minigame and their unique assets are stored in their own separate folder inside this. We have made an example minigame (`res://minigames/example_minigame/`) that you're reccomended to duplicate and work from as a base.
At the top level of a minigame's folder, there is a file called `data.tres`. This is required to exist here for a minigame to be read in.
`data.tres` is a `MinigameData` resource (a custom prefab) that has fields you can fill in for the Title, Author, Description and Scene Path (which is the local path to the scene that will get loaded in when the minigame commences.

`default_theme.tres` is a simple theme that styles Buttons and sets the font of Control nodes to a pixel font (`res://main_board/fonts/retro-pixel-cute-prop.ttf`.)
- Set the `theme` attribute of a Control node to this file to apply the same effect.
