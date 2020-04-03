## Installation

Take [edge-light.Xresources](./edge-light.Xresources) for example:

### Method 1

Copy the content of the [edge-light.Xresources](./edge-light.Xresources) into the `~/.Xresources` file and reload the settings with `xrdb`.

### Method 2

Add the following line to `~/.Xresources`:

```xdefaults
#include "/path/to/edge/xresources/edge-light.Xresources"
```

### Method 3

Execute the following command:

```sh
xrdb -merge /path/to/edge/xresources/edge-light.Xresources
```
