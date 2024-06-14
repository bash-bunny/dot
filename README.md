# Personal Dotfiles and Scripts

Personal configuration and scripts for my Linux environment.

It make use of:
- [st terminal](https://st.suckless.org/) with the configuration from [LukeSmith st](https://github.com/lukesmithxyz/st)
- [Spectrwm](https://github.com/conformal/spectrwm) with vim keybindings
- [Vim](https://www.vim.org/) the best editor possible
- [Tmux](https://github.com/tmux/) the best terminal multiplexor
- [gf](https://github.com/tomnomnom/gf) wrapper around grep to search for interesting things

## Packages

- `dmenu` - Minimal menu for launching applications
- `st` - Minimal and fast terminal
- `tmux` - Best terminal multiplexor
- `spectrwm` - Minimal window manager
- `vim` - Best editor


## Installation

Clone the repo in your `$HOME` directory

```bash
git clone https://github.com/deads3c/dot.git
```

### Terminal

```bash
cd st
sudo make install
```

### Configuration Files

All files should go into the `$HOME` directory of the user

## Usage

All my workflow is based on `tmux` and `vim` with the `st` terminal, and `qutebrowser` and `lynx` for navigate the web

**Note**: always you can use the `Ctrl+[` combination to escape the current mode and go back into the normal mode, it acts as the `Esc` key

### Terminal keybindings

As with vim it has *normal* and *editing* mode

- `Alt+l` - Launch the URL selected from `dmenu` in the default browser
- `Alt+y` - Yank the URL selected from `dmenu`
- `Alt+o` - Copy the output of the last command
- `Alt+u` - Scroll up half of a page in the terminal
- `Alt+d` - Scroll down half of a page in the terminal
- `Alt+Shift+k` - Increase font size
- `Alt+Shift+j` - Decrease font size

#### Normal mode

- `i` - Enter editing mode to write
- `k` - Go back in history
- `j` - Go forward in history
- `w` - Jump between words
- `/` - Search for a word in the history
- `A` - Enter *Editing* mode at the **END** of the line
- `I` - Enter *Editing* mode at the beginning of the line
- `f<letter>` - Find and go to the next time that letter appear in the text
- `ct<letter>` - Delete the text from within the cursor until that letter and enter *Editing* mode
- `C` - Delete the text from within the cursor until the end of the line and enter *Editing* mode
- `D` - Delete the text from within the cursor until the end of the line
- `cw` - Delete the word under the cursor and enter *Editing* mode

#### Edit Mode

- `Esc` - Exit *Editing* mode and enter *normal* mode
- `Alt+k` - Exit *Editing* mode and go back in history
- `Alt+j` - Exit *Editing* mode and go forward in history

### Tmux keybindings

- `Ctrl+a` - Master combination to start introducing commands
- `Master+-` - Split panes horizontally
- `Master+|` - Split panes vertically
- `Master+c` - Create new tab
- `Master+a` - Go between the last tab and the actual one
- `Master+&` - Kill the actual tab
- `Master+j` - Go to the bottom pane
- `Master+k` - Go to the upper pane
- `Master+l` - Go to the right pane
- `Master+h` - Go to the left pane
- `Master+q` - Show numbers in all the panes and select any number to change pane
- `Master+t` - Show the current hour
- `Master+s` - Show all the tmux sessions and select one with vim keybindings
- `Master+[` - Enter visual mode
  - `Space` - Select text in visual mode
  - `Enter` - Copy into the tmux buffer the text selected and exit the visual mode
- `Master+]` - Paste the selected text
