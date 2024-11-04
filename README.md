# Jicmou's dotfiles

This repo's purpose is to gather all the dotfiles I need for my setup, with all
the scripts needed to install them smoothly.

## X11 trackball configuration

This small config file sets up my Kensington slimblade pro. The most important
option being:

`conf Option     "LeftHanded" "true" `

In order to make it work, simply copy the file `01-trackball.conf` into
`/etc/X11/xorg.conf.d/`
