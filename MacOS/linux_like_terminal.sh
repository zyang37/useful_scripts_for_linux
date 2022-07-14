# zsh example #
# Color based on file types
echo 'export CLICOLOR=1' >> ~/.zshrc

# add / to directories
echo "alias ls='ls -p'" >> ~/.zshrc

# adding ll to mac terminal
echo "alias ll='ls -lG'" >> ~/.zshrc

# add new command la
# echo "alias la='ls -la'" >> ~/.zshrc

# make custom prompt
# %w: date
# %d: current dir; %3d: levels to show
# %n: user name
# if you have conda install, put (base) in front
# You can event copy emoji here
echo "export PS1=\"(base) %1d:~$ \"" >> ~/.zshrc