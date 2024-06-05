# Personal Dotfiles and Scripts

Personal configuration and scripts for my Linux environment.

It make use of:
- [st terminal](https://st.suckless.org/) with the configuration from [LukeSmith st](https://github.com/lukesmithxyz/st)
- [Spectrwm](https://github.com/conformal/spectrwm) with vim keybindings
- [Vim](https://www.vim.org/) the best editor possible
- [Tmux](https://github.com/tmux/) the best terminal multiplexor

## Packages

- `dmenu` - Minimal menu for launching applications
- `st` - Minimal and fast terminal
- `tmux` - Best terminal multiplexor
- `spectrwm` - Minimal window manager
- `vim` - Best editor


## Installation

### Terminal

```bash
cd st
sudo make install
```

### Configuration Files

All files should go into the `$HOME` directory of the user

## Usage

All my workflow is based on `tmux` and `vim` with the `st` terminal, and `qutebrowser` and `lynx` for navigate the web

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
