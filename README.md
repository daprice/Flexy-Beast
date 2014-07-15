Flexy Beast
===========

The Flexy Beast is a wrist-powered prosthetic hand for the [e-NABLE Project](http://enablingthefuture.org). This is a mashup of the [Parametric Cyborg Beast](http://www.thingiverse.com/thing:320173) by MakerBlock and the [Flexy Hand](http://www.thingiverse.com/thing:380665) by Steve Wood/Gyrobot. Like the Flexy-Hand, the Flexy Beast uses flexible joints to replace the Chicago screws and elastics used on previous e-NABLE designs. This makes the hand lightweight, less expensive, better looking, more adaptable for smaller sizes, and easier to assemble and use.

I recommend using [molded silicone flex joints](https://github.com/daprice/Flexy-Joint/tree/FlexyBeast) for this design. See the [Flexy Joint wiki](https://github.com/daprice/Flexy-Joint/wiki) for information about materials to use and the process of making these joints.

## Assembly
Most of the sizing and assembly process follows the [standard Cyborg Beast assembly instructions](http://enablingthefuture.org/upper-limb-prosthetics/cyborg-beast/). The following only covers the assembly of the fingers.

1. Print the palm, thumb base, thumb tip, and four each of the finger base, middle, and tip. These can be scaled as needed using the `x-`, `y-`, and `zScaleFactor` variables in the OpenSCAD code.
2. After making the 3D printed parts and flexible joints, slide a flex joint into the proximal end of each finger, then use a flat screwdriver or other thin, flat tool to insert the other end of the joint into the corresponding slot on the next inner segment.
3. Route a string through the holes in the palm and finger (these may need to be drilled out slightly) and tie it off at the fingertip.

### Finger Pads
The Flexy Beast fingers can be made with silicone finger pads for improved grip. These finger pads are designed to be easily removeable and replaceable by hand, but attach firmly enough to stay on during use. Different varieties of silicone can be used to create harder or softer pads, but Dragon Skin 10 or 20 is a good starting point. The following instructions explain how to make the finger pads.

1. Print the thumb and finger tips with the `fingerPads` variable set to `true`.
2. Print the fingertip mold.
3. Mix silicone according to the instructions from the supplier. The process should be similar to [that for casting joints](https://github.com/daprice/Flexy-Joint/wiki/Casting). Pour the liquid silicone to mostly fill the fingertip mold.
4. Insert the printed fingertip piece into the filled mold. If necessary, use tape to hold it in place.
5. When the silicone is cured, remove the fingertip and silicone pad from the mold.
6. If the pad came off the fingertip, it can be reattached by stretching it to go inside the groove in the fingertip. If necessary, use an x-acto knife to trim off excess silicone so that the edges of the pad are flush with the edges of the fingertip.


## Future Improvements
* Flexible joints for gauntlet attachment (this is currently unchanged from the original Cyborg Beast)
* Possible aesthetic options such as text, decorative elements, superhero themes, etc.
