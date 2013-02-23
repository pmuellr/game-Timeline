Cheapass-Timeline
================================================================================

A web implementation of the 
[Cheapass](http://www.cheapass.com/) game 
[Timeline](http://www.cheapass.com/freegames/timeline).

See the [LICENSE](LICENSE) file for licensing information.

building
================================================================================

To build this application, you'll have to download some 3rd party content.

To download various web pre-req's, you'll need to run the following commands

    make vendor
    npm install

The artwork in the application comes from Cheapass.  You will need to run
the following command to download and convert that artwork.

    make orig cards icons

You will also need to have 
[ImageMagick](http://www.imagemagick.org/)
installed to convert the icons.

Finally, use

    make build

to do the final build.  The result is the contents of the `web` directory,
specifcally, the `index.html` file.