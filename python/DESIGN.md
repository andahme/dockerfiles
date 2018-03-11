## Feature(s)
* Python
* C/C++ compilation
* Contains a `builder` user
* Working directory `/workspace`

## Use Case(s)
* Python REPL/Shell
  * Create volumes for caches
* Application `build`
  * Declare volume(s)
    * Python/Pip cache
    * Python Global Library
* Application `base` image
  * Do not declare a volume, python libs should be installed into a new layer
  * Be sure to run `pip cache clean --force`

