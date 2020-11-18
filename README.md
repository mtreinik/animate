# Animate

Animate is the winner of the [Assembly '95 4kb intro competition](https://archive.assembly.org/1995/pc-4k-intro) held 
in Helsinki in 1995.

In [demoscene](https://en.wikipedia.org/wiki/Demoscene) a **4kb intro** is a computer program that creates multimedia 
art and is at most 4096 bytes in size.
 
Animate is discussed at [pouët.net](https://www.pouet.net/prod.php?which=2859) and you can [watch it on YouTube](https://www.youtube.com/watch?v=Lij1WjjjNw8).  
 
The program and its source code is released here under the MIT license by the sole author, Mikko Reinikainen aka 
schwartz.

## Running the program 

The program is written for [i386](https://en.wikipedia.org/wiki/Intel_80386) compatible PCs running the 
[DOS](https://en.wikipedia.org/wiki/DOS) operating system.
 
It can be run on Mac, Windows, Linux and others in the [DOSBox](https://www.dosbox.com/) DOS emulator.

To run the intro, just change to the directory where the program resides and type `animate.com` at the command prompt.


## Visuals of the intro

Part 1 of the intro shows a group of butterflies flying over a green field.

![butterflies](https://raw.githubusercontent.com/mtreinik/animate/main/docs/butterflies.gif)

In part 2 a metallic vase and its shadow rotate in front of a gray background.

![vase](https://raw.githubusercontent.com/mtreinik/animate/main/docs/vase.gif)

The vase stops and reveals two faces, which slide out. Then the name of the intro zooms out.

![text-zoom](https://raw.githubusercontent.com/mtreinik/animate/main/docs/text-zoom.gif)


## Building the program 

The program is written in assembly language for the x86 processor. 

The source code in `FILL.ASM` was compiled with [Turbo Assembler](https://en.wikipedia.org/wiki/Turbo_Assembler) into 
`FILL.OBJ` and the object file was linked with Turbo Linker into `FILL.COM`.

The executable file `FILL.COM` created by the linker is 5043 bytes long and is further compressed with the 
[compack](http://fileformats.archiveteam.org/wiki/COMPACK) DOS program compaction software down to `ANIMATE.COM` 
which is 4034 bytes long.

The build process is described by a `MAKEFILE`.


### Files

| File      | Description                                          |
|-----------|------------------------------------------------------|
|ANIMATE.COM| The final executable program                         |
|ANIMATE.TXT| Text file that originally accompanied the program. The information is no longer valid. |
|FILL.ASM   | Assembly language source code of the program         |
|FILL.COM   | Executable file created by linker                    |
|FILL.OBJ   | Object file created by assembler                     |
|MAKEFILE   | A makefile that instructed how the program was built |


## Implementation 

Here are some observations about how the program was implemented.

### General

[BIOS interrupt `10h`](https://en.wikipedia.org/wiki/INT_10H) is used for initializing graphics mode and getting back 
to text mode.

[DOS interrupt `21h`](https://en.wikipedia.org/wiki/DOS_API) is used to handle keyboard input and set up a timer 
interrupt.

The memory area between addresses `udatastart` and `mystack`  is reserved for data and cleared at the start of the 
program.

A timer interrupt `timerint` is set up to trigger 256 times per second. In part one of the intro it updates movement of 
the butterflies and in part two it updates movement of the vase. 

A keyboard interrupt `kbdint` is used to watch keypressed. If the ESC key is pressed, a flag `escpressed` is set. 
This is flag is used to break out of animation loops and jump to the end of the program.   

All 3D graphics are drawn into a virtual [framebuffer](https://en.wikipedia.org/wiki/Framebuffer) that uses a 
resolution of 160x100 pixels.  The frame buffer is upsampled with interpolation to 320x200 when the image is copied to 
actual video memory by `bltscreen`. A lower resolution is used to speed up graphics performance. Actually each line of 
the framebuffer is 256 pixels long for optimiziation reasons, but only 160 pixels per line are used.  

3D graphics consist of [Texture mapped](https://en.wikipedia.org/wiki/Texture_mapping) quadrilateral polygons that are 
drawn by `quadtext`. 

All 3D calculation is made with [fixed-point integers](https://en.wikipedia.org/wiki/Fixed-point_arithmetic). 
No [floating-point](https://en.wikipedia.org/wiki/Floating-point_arithmetic) numbers are used in the intro.

Since the `idiv` division instruction is expensive, a division table `YDIVX` is generated for the fixed-point 
results of division of any number between -64..64 by another number between -64..64.

A sine function table is calculated by using a [series definition](https://en.wikipedia.org/wiki/Sine#Series_definition)
based on powers and factorials.

Square root of a fixed-point integer is calculated in `sqrt_eax`.

A color palette can be specified and generated with `makepalette`and colors can be gradually faded from a palette to 
another with `fadepalette`.

### Part 1

A [pseudorandom number generator](https://en.wikipedia.org/wiki/Pseudorandom_number_generator) with hand-picked seeds 
is used to choose relative positions of the butterflies.  

Each butterfly wing is a single polygon with a generated texture that has transparency on the edges 
which makes the wing into a round shape.

The ground texture is generated with another pseudorandom algorithm and smoothed out with a 2x2 
[box blur](https://en.wikipedia.org/wiki/Box_blur). 

The butterflies are sorted in order from farthest to closest before drawing them. Sorting is done using the 
[bubble sort](https://en.wikipedia.org/wiki/Bubble_sort) algorithm, which is far from optimal but is fast enough here
as the number of butterflies is not very large.

The orientation of a butterfly is used to determine which wing is drawn first near `db_firstfirst`.

The little effect between parts1 and 2 that blurs, rotates, zooms and fades out the previous graphics is `chaosfadeoff`.

### Part 2

The model of the vase is stored as a 2D curve which is rotated to create a 
[surface of revolution](https://en.wikipedia.org/wiki/Surface_of_revolution).

The background, shadow and the vase are drawn in `do_vase`.

Only half of the polygons of the vase are drawn: those quads that are facing away from the camera are not drawn. 
Orientation of a polygon is determined by the [cross product](https://en.wikipedia.org/wiki/Cross_product) of
two sides of the polygon.    

When the faces slide out, [screen tearing](https://en.wikipedia.org/wiki/Screen_tearing) is prevented by syncronizing 
animation with vertical retrace of the graphics adapter with `wait_vsync`.

When the intro ends, it gets back to text mode and prints the string at `exitmsg`.

### Constants

Here are some constants

| Constant     | Explanation |
|--------------|-------------|
| `MAXP`       | maximum number of butterflies |
| `LX1`, `LZ1` | X and Z coordinates of light source in part 2 |
| `pal2`, `pal3`, `pal4` | different color palettes |
| `perho_points` | y and z coordinates of polygons of a butterfly (perho or perhonen is a butterfly in Finnish) |
| `vase_points` | 2D curve which defines the shape of the vase |
| `logo_packed` | a 64 by 16 pixel image of the name of the intro stored as 1-bit per pixel bit map |
| `exitmsg` | string printed at the end of the intro |

## Creating this document

The gif captures of the intro were made with DOSBox's video capture feature and converted to gif format with [ffmpeg](https://ffmpeg.org/).

Video capture in DOSBox is started and stopped by pressing `CTRL-ALT-F5` on PC or `CTRL-OPTION-CMD-F5` on Mac.

Avi video produced by DOXBox can be converted to gif with 
```
ffmpeg -i ~/Library/Preferences/capture/animate_002.avi -r 30 text-zoom.gif
```
