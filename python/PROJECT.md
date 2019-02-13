## Feature(s)
* Python
* C/C++ compilation
* Contains a `builder` user
* Working directory `/workspace`

## Use Case(s)
* Python REPL/Shell
  * Create volumes for caches
* Application image
  * Do not declare a volume, python libs should be installed into a new layer
  * Be sure to run `pip install --system --no-cache`
* Developer/REPL image
  * Declare volume(s)
    * Python/Pip cache
    * Python Global Library

