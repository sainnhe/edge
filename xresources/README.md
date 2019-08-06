# Installation

## Method 1

Copy the content of the [edge-light.Xresources](./edge-light.Xresources)/[edge-dark.Xresources](./edge-dark.Xresources) into the `~/.Xresources` file and reload the settings with `xrdb`.

## Method 2

Add the following line to `~/.Xresources`:

```xdefaults
#include "/path/to/edge/xresources/edge-light.Xresources"
```

or

```xdefaults
#include "/path/to/edge/xresources/edge-dark.Xresources"
```

## Method 3

Execute the following command:

```sh
xrdb -merge /path/to/edge/xresources/edge-light.Xresources
```

or

```sh
xrdb -merge /path/to/edge/xresources/edge-dark.Xresources
```
