# lookfix
### Arma 3 Aiming Deadzone Fix

This small script mod ties the player's horizontal rotation to their mouse again while using the game's Aiming Deadzone feature. Rather than a 1:1 value, which would be identical to not using a deadzone at all, it moves the player's view at half rate - allowing you to look around while still having your weapon aim independently of your view.

When your weapon reaches the edge of the deadzone, you will turn at full speed - just like normal. Additionally, the system is disabled when you aim - allowing precise mouse movement when you are trying to track a target.

### What About Vertical Movement?

Unfortunately the scripting functionality required to adjust a player's vertical viewpoint is not available. If it were possible, it would be quite easy to make an aimbot for the game in SQF, and so it will probably never exist.

Because the majority of the time players are not looking up or down, but rather side-to-side, the impact of this limitation is minimized. Additionally, the aiming deadzone is essentially a box in the center of your screen with the same aspect ratio as your display - and so on modern widescreen monitors, it has the most effect on the horizontal axis, meaning that this fix addresses the biggest issue with the aiming deadzone.
