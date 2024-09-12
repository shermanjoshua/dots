# github.com/shermanjoshua/dots

## The Important Stuff

These are my new (as of 2024) dotfiles. I have done quite a bit of work to go through everything I had in my previous iteration and cull, update, or outright replace all of it.

**Here's the high-level stuff:**

### dotfile management

- [chezmoi](https://chezmoi.io) is what I'm using currently to manage this repo and installation across machines.
- These should be fully idempotent. Fix anything that is not immediately.
- I'm using Dashlane for secret management. chezmoi offers lots of other tool integrations though.
  - Probably will just switch to Azure/AWS secrets.

### my dotfiles (summary)

- NOTE: I try to stay in the terminal as much as possible and limit having to switch to different tools/screens for tasks wherever I can. So I keep quite a bit of stuff in here.
  - Meaning... this is not a small amount of software 😂
- List of (some of) the stuff:

<details>
  <summary>An incomplete compendium</summary>

    * <kbd>gnupg (with pinentry setup and automatic key registration)
    * <kbd>ssh auto-config (with automatic encrypt/decrpt of private keys)
    * <kbd>p4v suite for mac UI diff/merge
    * <kbd>git configuration with my aliases and shortcuts
    * <kbd>CLIs for almost anything along with configs
    * <kbd>kitty terminal with customer tab bar setup and theme 🐈
    * <kbd>powerline 10k with my preferred config 🔌
    * <kbd>zsh with oh-my-zsh and plugins for hundreds of tools, themes, and autocompletes
    * <kbd>fzf terminal fuzzy search
    * <kbd>docker/compose/k8 🐳
    * <kbd>terminal sms/imessage client (coming soon) 💬
    * <kbd>terminal spotify player 🎧
    * <kbd>extensive brewfile with casks, taps, and formulae for all tools/software that I use 🍺
    * <kbd>vscode and dozens of extensions (I like having the option, and some of the extension UIs are pretty nifty...)
    * <kbd>pgsql and associated tools/configs
    * <kbd>dashlane and 1password install with CLIs for secrets and file management/import
    * <kbd>Neovim editor with about 40 plugins. Highlights include:
      - telescope with all pickers
        - especially nice - check out the `quickfix list` integration/wrapper. Makes working with the lists super slick.
      - noice with sane config
      - lsp configured and setup
      - lazy/mason package managers
      - dynamic lsp-config for easy addition/extension of lsp and linting tools
      - cmp completion with full extensibility and plugins
      - neogit/octo for git, diff/merge, github, and pr management from nvim
      - which-key configured for keybind prompting (recognizes first keypress and shows menu of options)
      - a gazillion other little things...

</details>

---

## Installation

### Prereqs

- Computer
  - mac os (tested on both apple and intel silicon!)
  - You'll want to have local admin on the machine. And `su`/`sudo` for some of the installers.
- Internet connection
- ...that's it

### Process (it's crazy easy)

> [!TIP]
>
> Filenames are important here.
> So are directories.
> `chezmoi` is a fickle bitch and it was intentionally built in a very opinionated way.
> Don't waste time making it do stuff it doesn't want to!

#### Steps

- You are already reading this, so you should either have or be able to download the release from the repo.
  - You can clone this anywhere you like. This location will become your `source`. From there, `~/.local/share/chezmoi` will get created as your `target`, and the final drop point for everything on the machine (mostly `~`) becomes the `destination`.
- `./install.sh` should already be executable, so test that and run it. If you don't have permissions, just `chmod +x ./install.sh` to run.
- That's it. Shit should just install. The first time you open nvim, Lazy and Mason should just install everything automatically too.

### TODO

- [x] finish readme
- [x] add dashlane install
- [x] fix decrypt
- [x] pre-run installer
- [ ] 1password install
- [ ] test on virtual mac
- [ ] pull files from blob storage

See ROADMAP.md for more...
