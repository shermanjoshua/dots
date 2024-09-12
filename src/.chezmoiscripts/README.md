# SCRIPTS DIRECTORY

This directory is handled specially by chezmoi. See documentation for the standard handling.

There is also special logic here for any dotfiles. Any file here that starts with a dot (`.`) will automatically be run anytime chezmoi is invoked.

This is particularly useful for initial runs of the tool when you need to ensure some software is installed or files placed BEFORE the first install.

When creating a dotfile here, make sure that you exit as quickly as possible in your script, as this gets run very frequently and multiple times per command in most cases.
