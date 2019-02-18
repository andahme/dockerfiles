### Design Goals
* Strive to keep images simple/basic

### Design Choices
* Can always execute `bash` with command override. 

##### Applications
* Bootstrap Macro(s)
  * Configuration via **Environment** variables
  * Self-Assembly of **dependent** services via **Default** values
    * Assume 1 instance of each service
      * Addressable at basic/common naming
        * Addressable at default ports
    * Provide only configuration necessary for proper function
* Do not run as **root**
  * Attempt to provide proper function as user (as well as **root**)
  * By default, prefer a system account (511)
     * If a user home directory is needed for proper function, create a user account (1011)
* If you write to disk, create a **data volume**
  * This does not need to apply to ephemeral configuration files (generated from environment variables)
* Log to **console**
  * Sometimes this means overriding log4j.properties or similar

##### Base Images
* Root `andahme/debian` is not modified in any way (see [debian/BUILD.md](https://github.com/andahme/dockerfiles/blob/release/debian/debian/BUILD.md)).  
* Do not specify runtime user
* Do not create volumes
