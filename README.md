# github.com/shermanjoshua/dots

## The Important Stuff

These are my new (as of 2024) dotfiles. They are based off of a few key chunks that are pretty common right now, but they definitely have my "flavor" to them...

**Here's the high-level stuff:**

- [chezmoi](https://chezmoi.io) is what I'm using currently to manage this repo and installation across machines.
  - Felt cute. Might delete.
- These should be fully idempotent. Fix anything that is not immediately.
- I'm using Dashlane for secret management. chezmoi offers lots of other tool integrations though.
  - Probably will just switch to Azure/AWS secrets.

## Installation

### Tools

- Computer
  - mac os w/ apple silicon
  - this was all written on a 2024 M3 Macbook Pro
- Internet connection
- ...that's it

### Process (it's crazy easy)

Filenames are important here.
So are directories.
`chezmoi` is a fickle bitch and it was intentionally built in a very opinionated way.
Don't waste time making it do stuff it doesn't want to!

#### Steps

- You are already reading this, so you should either have or be able to download the release from the repo.
  - Clone everything into a folder called `chezmoi` at `~/.local/share`
- `./install.sh` should already be executable, so test that and run it. If you don't have permissions, just `chmod +x ./install.sh` to run - BUT FIX THAT SHIT NOW!!! It's happened twice if you are reading this!!!
- That's it. Shit should just install. The first time you open nvim Lazy and Mason should just install everything automatically too.

### TODO

[x] finish readme
[x] add dashlane install
[ ] fix decrypt
