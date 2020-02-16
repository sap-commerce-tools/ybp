> **Archived on 2020-02-16**\
> I recently switched jobs away from SAP Commerce development

# ybp - Execute command in hybris/bin/platform
[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/W7W7VS24)

When working with SAP Commerce, you have to execute most of the interesting
commands like `ant` or `hybrisserver.sh` in the `hybris/bin/platform` directory.

This little wrapper takes care of the navigation, regardless in what folder of the 
project you are, and also sources `setantenv.sh`, if necessary

You current working dir is *not* modified, so you can fire any command without loosing you current context.

## Installation

1. Clone or download this repo
1. `chmod u+x ybp` (Linux / macOS only)
1. put `ybp` / `ybp.bat` somehwere on your `PATH`
1. Never type `cd ../../../hybris/bin/platform` or `source setantenv.sh` / `setantenv.bat` again

## Examples

```
cd myproject/hybris/bin/custom/myextension/some/sub/folder
ybp ant clean all
# run ant clean all for the whole platform

ybp ./hybrisserver.sh debug
# start server
```

## Hint

For maximum ~~laziness~~ developer efficiency, I recommend following aliases:

```
alias ya='ybp ant'
alias ys='ybp ./hybrisserver.sh'
```
