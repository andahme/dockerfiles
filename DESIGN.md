## Design

### Minimal Debian Docker image(s)
**NOTE**: Base image `andahme/debian` is not modified in any way ([link](http://source.lab.andah.me:3000/andahme/docs/src/master/debian/README.md)).  
**NOTE**: Can always start a shell by passing "bash".  

### Customization(s)

#### Configuration
* Bootstrap Macro(s)
  * Configuration via **Environment** variable(s)
  * Self-Assembly of **dependent** services via **Default** value(s)
    * Assume 1 instance of each service
      * Addressable at basic/common naming
        * Addressable at default port(s)
    * Provide only configuration necessary for proper function

#### Andahme Best Practice(s)
* Don't run as **root**
  * Attempt to provide proper function as (as well as **root**)
  * Create a system account (511) or a user account (1011) if the image is intended for user interaction.
    * Do **NOT** override the default **USER** a base image(s), provide for runtime override
* If you write to disk, make a **data volume**
* Log to **console**
  * Sometimes this means overriding log4j.properties or similar


