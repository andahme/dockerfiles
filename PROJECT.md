## andahme/dockerfiles
This project aims to provide easy to use **developer**/**development** focused **Docker Images**.

### Best Practices

##### Applications
* Map **Environment Variables** to **Configuration Files**.
    * **NOTE**: Do not generate configuration files if already mounted/present.
* Create a **system account** (**511**).
    * **NOTE**: If a home directory is needed, create a **user account** (**1011**).
* Use standard ports, unless they cannot be bound by a normal (non-root) user.
    * Use port **8080** for **http**.
    * Use port **8443** for **https**.
* Use common/simple names to connect to clients/services.
* Use a **data volume** when writing data.
    * **NOTE**: This does not need to apply to configuration files generated at startup.
* Log to the **console**.
    * **NOTE**: This may require overriding log4j.properties or similar.

##### Root Image
* `andahme/debian` images are re-tagged official `debian:testing-slim` images.
    * See [debuerreotype](https://github.com/debuerreotype/debuerreotype/blob/master/build.sh) for build details.

##### Base Images
* Designated with **Dockerfile.base**.
* Do not declare volumes.
* Do not specify a runtime user.

##### Other
* Can always execute **bash** using command override.
    * **NOTE**: Perform **Environment Variable** configuration mapping before starting bash.

