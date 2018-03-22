## Project Goal(s)
Provide developer/development focused Docker image(s).

### Application(s)
* Application Server(s)
* Database(s)
* Queue(s)

### Base/Build Image(s)
* Compiler(s)
* Runtime(s)

### Utility
* Build-Process/Support
* Sandbox (REPL/Shell)
* Tool(s)


## Design

### Minimal Debian Docker image(s)
**NOTE**: Base image `andahme/debian` is not modified in any way ([debian/BUILD.md](https://github.com/andahme/dockerfiles/blob/release/debian/debian/BUILD.md)).  
**NOTE**: Can always execute `bash` with command override.  

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
  * By default, prefer a system account (511)
    * If a user home directory is needed for proper function, create a user account (1011)
    * Do **NOT** override the default **USER** in base image(s), provide for runtime override
* If you write to disk, make a **data volume**
* Log to **console**
  * Sometimes this means overriding log4j.properties or similar


