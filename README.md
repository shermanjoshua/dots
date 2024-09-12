# github.com/shermanjoshua/dots

## The Important Stuff

These are my new (as of 2024) dotfiles. I have done quite a bit of work to go through everything I had in my previous iteration and cull, update, or outright replace all of it.

**Here's the high-level stuff:**

### dotfile management

- [chezmoi](https://chezmoi.io) is what I'm using currently to manage this repo and installation across machines.
  - Felt cute. Might delete.
- These should be fully idempotent. Fix anything that is not immediately.
- I'm using Dashlane for secret management. chezmoi offers lots of other tool integrations though.
  - Probably will just switch to Azure/AWS secrets.

### my dotfiles (summary)

- NOTE: I try to stay in the terminal as much as possible and limit having to switch to different tools/screens for tasks wherever I can. So I keep quite a bit of stuff in here.
  - Meaning... this is not a small amount of software 😂
- List of (some) of the stuff:

```
* gnupg (with pinentry setup and automatic key registration)
* ssh auto-config (with automatic encrypt/decrpt of private keys)
* p4v suite for mac UI diff/merge
* git configuration with my aliases and shortcuts
* CLIs for almost anything along with configs
* kitty terminal with customer tab bar setup and theme 🐈
* powerline 10k with my preferred config 🔌
* zsh with oh-my-zsh and plugins for hundreds of tools, themes, and autocompletes
* fzf terminal fuzzy search
* docker/compose/k8 🐳
* terminal sms/imessage client (coming soon)  💬
* terminal spotify player 🎧
* extensive brewfile with casks, taps, and formulae for any dev tool I need 🍺
* vscode and dozens of extensions
* pgsql and associated tools/configs
* dashlane and 1password install with CLIs for secrets and file management/import
* Neovim editor with about 40 plugins. Highlights include:
  - telescope with all pickers
  - noice with sane config
  - lsp configured and setup
  - lazy/mason package managers
  - cmp completion with full extensibility and plugins
  - neogit/octo for git, diff/merge, github, and pr management from nvim
  - which-key configured for keybind prompting (recognizes first keypress and shows menu of options)
  - a gazillion other little things...
```

## Installation

### Prereqs

- Computer
  - mac os (tested on both apple and intel silicon!)
  - You'll want to have local admin on the machine. And `su`/`sudo` for some of the installers.
- Internet connection
- ...that's it

### Process (it's crazy easy)

_Some tips..._

Filenames are important here.
So are directories.
`chezmoi` is a fickle bitch and it was intentionally built in a very opinionated way.
Don't waste time making it do stuff it doesn't want to!

#### Steps

- You are already reading this, so you should either have or be able to download the release from the repo.
  - Clone everything into a folder called `chezmoi` at `~/.local/share`
- `./install.sh` should already be executable, so test that and run it. If you don't have permissions, just `chmod +x ./install.sh` to run - BUT FIX THAT SHIT NOW!!! It's happened twice if you are reading this!!!
- That's it. Shit should just install. The first time you open nvim, Lazy and Mason should just install everything automatically too.

### TODO

[x] finish readme
[x] add dashlane install
[x] fix decrypt
[x] pre-run installer

See ROADMAP.md for more...
