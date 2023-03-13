# The Big Book of Config

I've used these dotfiles for a long time, and even *I* forget what is in them
sometimes. Especially if I step away from a terminal-exclusive environment for
a while.

So, I've created this doc to act as a reminder for myself, and a guide to
whoever is brave enough to use my config. I warn you though, I have the
attention span of a gerbil.

This document will be sectioned off according to the dotfile. So, a section for
vim, tmux, etc.

# VIM
My "kitchen sink" config.

Support for C and C-family languages is umbrella'd
under CPP-Enhanced-Highlight and COC.nvim LSP.

Python syntax highlighting via Indentpython.

Golang support via Vim-Go

Airline for statusbar support, NERDCommenter for QoL, NERDTree for file
navigation, and built-in FZF support.

## General Settings
Describing some of my weird config choices

shiftwidth -- set to 4, because I said so.
setwidth -- 80 columns

## Some Important Keybindings:
Leader -- set to "\"

- leader tn :tabnew -- open new tab
- leader tb :tabprevious -- go back a tab (can be done with gT)
- leader t  :tabnext -- move forward (can be done with gt)
- leader tm :tabmove -- move tab [N] spaces in list
- leader tc :tabclose -- close current tab
- leader to :tabonly -- close all tabs except current
- leader  b --- open list of active buffers
- CTRL+F -- use fuzzy finder
- CTRL+T -- toggle NERDTree
- w!! -- save files with sudo

## Plugin List:
Managed via the Vundle Plugin System for Vim.
Per-plugin settings described under each subheading.

### NERDCommenter
Default config settings enabled. Most mappings work for normal/visual modes.
Preferred mode to edit is in Visual.

- leader cc |NERDCommenterComment|
Comment out the current line or text selected in visual mode.

- leader cn |NERDCommenterNested|
Same as cc but forces nesting.

- leader c |NERDCommenterToggle|
Toggles the comment state of the selected line(s). If the topmost selected line
is commented, all selected lines are uncommented and vice versa.

- leader cm |NERDCommenterMinimal|
Comments the given lines using only one
set of multipart delimiters.

- leader ci |NERDCommenterInvert|
Toggles the comment state of the selected line(s) individually.

- leader cs |NERDCommenterSexy|
Comments out the selected lines with a pretty block formatted layout.

- leader cy |NERDCommenterYank|
Same as cc except that the commented line(s) are yanked first.

- leader cu |NERDCommenterUncomment|
Uncomments the selected line(s).

### Syntastic
Ctrl+W E -- does a syntax check on current active buffer

# TMUX

Nothing Crazy. Dracula colorscheme with some nice QoL improvements

TPM as plugin manager, with tmux-sensible as a plugin (along with dracula)

Enable Mouse Mode because I am a gen-z.

rebind C-b to C-a because screen does at least one thing right IMO.

panes start at 1

## General Settings
- prefix ] -- horizontal split
- prefix [ -- vertical split
- Meta-Up/Down/Left/Right -- move in corresponding direction (panes)
- prefix >/< -- swap pane with next/previous
- prefix + --- current maximize pane
- prefix H/J/K/L -- resize current pane in Left/Down/Up/Right direction
- C-h -- prev window
- C-l -- next window
