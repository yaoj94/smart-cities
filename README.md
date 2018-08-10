# Smart Cities Debug
Application for GENIVI [Smart Cities Pilot](https://genivi.vegas/) project. Forked from [GENIVI/smart-cities](https://github.com/GENIVI/smart-cities) and edited to include debugging information on the display.

This code was built using tjamison's version of the [Genivi Development Platform](https://github.com/tjamison/genivi-dev-platform/tree/smart-cities-pilot).
## Usage
### Prerequisites
Bash shell
### Installing
Clone the Genivi Dev Platform and switch to the smart-cities-pilot branch

`$ git clone https://github.com/tjamison/genivi-dev-platform.git -b smart-cities-pilot`

To use the code in this repository, change "SRC_URI" link to "github.com/yaoj94/smart-cities.git" in the 'smart-cities.bb' file (location: meta-smart-cities-pilot/recipes-dev-hmi).

To get the smart cities display to show up, replace the content in ‘genivi-dev-platform.bb’ (location: meta-genivi-dev/meta-genivi-dev/recipes-dev-platform/images) with ‘smart-cities-pilot.bb’ (location: meta-smart-cities-pilot/recipes-dev-platform/images).

Set up for raspberry pi 3

`$ cd genivi-dev-platform`

`$ source init.sh raspberrypi3`

See below for build errors and how I resolved them.
### Building
After the steps above, type the following command to build the rpi image. This could take a few hours.

`$ bitbake genivi-dev-platform`
## Devices
* Raspberry Pi 3 with 7" display
* [V2X board](https://github.com/PDXostc/rvi_v2x_firmware/blob/master/field-support-manual.md)
* SIM card

## Deployment
Image will be located in the folder that is produced by the build. Flash image to SD card using preferred method.
## Build Errors
#### Permission denied when cloning into 'meta-smart-cities-pilot'
Clone [meta-smart-cities-pilot](https://github.com/GENIVI/meta-smart-cities-pilot.git)
#### poky/oe-init-build-env: No such file or directory
Clone [poky](git://git.yoctoproject.org/poky) and switch to branch 'morty'
#### erlang-native-18.2.3-r0 checksum mismatch
The error message should have a message that looks like this:

`If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:`

In 'erlang-18.2.3.inc' (location: meta-erlang/recipes-devtools/erlang): replace "SRC_URI9[md5sum]" and "SRC_URI[sha256sum]" values with the ones generated from the error message.
#### The metadata is not deterministic and this needs to be fixed
If the build fails because of this error, in 'bblayers.inc': move everything in "BBLAYERS +=" to end of the "BBLAYERS ?=" list.
## Issues
We had problems reproducing the previous image without the debugging info. After tesing the image generated from this build, we found that GPS wasn't being updated or communicating well with the V2X, but we're not sure exactly what the problem was. This could be a plugin issue or a problem with how the image was built. RVI was never connected but it initialized even when there was no SIM card inserted. The system was laggy and at times the touch screen was unresponsive. Also, the display was upside down.
