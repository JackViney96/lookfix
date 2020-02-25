# lookfix
## Arma 3 Aiming Deadzone Fix

This small script mod ties the player's horizontal rotation to their mouse again while using the game's Aiming Deadzone feature. The exact behavior can be customized in a CBA Settings menu (Addon Options on the pause screen).

When your weapon reaches the edge of the deadzone, you will turn at full speed - just like normal. Additionally, there is a separate configuration for when you aim, disabled by default, so that you can be more precise when looking down your sights.

## What About Vertical Movement?
In the CBA settings menu, there is a checkbox and slider you can use to enable and configure vertical smoothing. Why is it disabled by default?

The reason is that in order to overcome the limitations of ARMA's scripting engine, vertical smoothing is accomplished by tilting the entire player model. (horizontal is much the same - the player model is rotated, but this is a much more natural movement that the game expects so it doesn't look broken). As a result, the player's legs clip through or float over the ground, and in multiplayer sessions they jitter severely as the game tries to correct the 'illegal' movement.

Server admins should consider disabling the ability for any player to use vertical smoothing, as these factors make it quite easy to look through walls or exploit. It is recommended that players only enable this setting in singleplayer, and set the slider to as low a value as they can in order to minimize the negative effects.

## Methods? What are those?
Currently, the mod provides two modes of operation (three if you count 'Disabled' as a mode...): Classic, and Vector-based. Server admins can control this setting in order to enforce consistent operation across clients - Vector-based mode is recommended in multiplayer.

### Classic
This is (similar to) how the original release of the mod operated. It works using the setDir command for horizontal smoothing, and provides perhaps a slightly better experience - in singleplayer.
In multiplayer, the heavy use of the setDir command results in serious stuttering and 'lag' appearing for other players - at best, it is immersion-breaking and visually distracting, and at worst it will make it exceptionally difficult to aim at another player in PVP.

As a result, this mode if still available - but no longer the default mode of operation.

### Vector-based
This mode works by using the setVectorDir command for horizontal smoothing. This avoids the issues of Classic mode, providing a much more pleasant experience in multiplayer. Players once again appear to move smoothly.
The one caveat to this method of operation is first-person jitter. For reasons I don't fully understand, vector rotation in the manner done by the mod seems to produce a noticeable flickering/jitter when turning, unless efforts are made to restrict its affect. At present, this comes in the form of a hard-coded constant value that limits the horizontal turning influence generated by mouse input - but this is less than ideal, and does not address the core issue, which can still appear momentarily from time to time.

If you play exclusively in singleplayer with this mod, classic mode is more stable.

## Centered Aim ("Freelook Trick")
By enabling this option, the behaviour of this mod when the player is using Freelook will change. Specifically, it is designed for the player to be using the same binding for 'Look' as they are for 'Optics Temporary' (or 'Freelook' and 'Optics' if you prefer to toggle) - with this combination, the player will find that their aim automatically snaps to the center of the screen and moves without any deadzone behaviour. It isn't perfect, but it works.

## Future plans
Aside from bug fixing the new Vector-based method (pull requests etc. are appreciated!), I am interested in expanding the variety of modes on offer in order to suit the tastes of players. 
