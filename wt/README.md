# Installation

First, open `$env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json`
and add the following `schemes`.

```json
{
    "schemes":
    [
        {
            "name": "Edge (Light)",
            "background": "#fafafa",
            "foreground": "#4b505b",
            "black": "#4b505b",
            "red": "#d05858",
            "green": "#608e32",
            "yellow": "#be7e05",
            "blue": "#5079be",
            "purple": "#b05ccc",
            "cyan": "#3a8b84",
            "white": "#fafafa",
            "brightBlack": "#4b505b",
            "brightRed": "#d05858",
            "brightGreen": "#608e32",
            "brightYellow": "#be7e05",
            "brightBlue": "#5079be",
            "brightPurple": "#b05ccc",
            "brightCyan": "#3a8b84",
            "brightWhite": "#fafafa"
        },
        {
            "name": "Edge (Dark)",
            "background": "#2c2e34",
            "foreground": "#c5cdd9",
            "black": "#3e4249",
            "red": "#ec7279",
            "green": "#a0c980",
            "yellow": "#deb974",
            "blue": "#6cb6eb",
            "purple": "#d38aea",
            "cyan": "#5dbbc1",
            "white": "#c5cdd9",
            "brightBlack": "#3e4249",
            "brightRed": "#ec7279",
            "brightGreen": "#a0c980",
            "brightYellow": "#deb974",
            "brightBlue": "#6cb6eb",
            "brightPurple": "#d38aea",
            "brightCyan": "#5dbbc1",
            "brightWhite": "#c5cdd9"
        },
        {
            "name": "Edge (Dark Aura)",
            "background": "#2b2d37",
            "foreground": "#c5cdd9",
            "black": "#363a49",
            "red": "#ec7279",
            "green": "#a0c980",
            "yellow": "#deb974",
            "blue": "#6cb6eb",
            "purple": "#d38aea",
            "cyan": "#5dbbc1",
            "white": "#c5cdd9",
            "brightBlack": "#363a49",
            "brightRed": "#ec7279",
            "brightGreen": "#a0c980",
            "brightYellow": "#deb974",
            "brightBlue": "#6cb6eb",
            "brightPurple": "#d38aea",
            "brightCyan": "#5dbbc1",
            "brightWhite": "#c5cdd9"
        },
        {
            "name": "Edge (Dark Neon)",
            "background": "#2b2d3a",
            "foreground": "#c5cdd9",
            "black": "#363a4e",
            "red": "#ec7279",
            "green": "#a0c980",
            "yellow": "#deb974",
            "blue": "#6cb6eb",
            "purple": "#d38aea",
            "cyan": "#5dbbc1",
            "white": "#c5cdd9",
            "brightBlack": "#363a4e",
            "brightRed": "#ec7279",
            "brightGreen": "#a0c980",
            "brightYellow": "#deb974",
            "brightBlue": "#6cb6eb",
            "brightPurple": "#d38aea",
            "brightCyan": "#5dbbc1",
            "brightWhite": "#c5cdd9"
        }
    ]
}
```

Then, choose your scheme by defining the `colorScheme` for either global or specific profile.

```json
{
    "profiles":
    {
        "defaults":
        {
            "colorScheme" : "Edge (Dark Neon)"
        }
    }
}
```

Check [Editing Windows Terminal JSON Settings](https://github.com/microsoft/terminal/blob/master/doc/user-docs/UsingJsonSettings.md)
for further information.
