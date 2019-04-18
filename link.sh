function doIt() {
	# Make a symlink for all dotfiles in this directory
  # not add .git floder
	for file in \.[^.]*; do
		if [ $file != '.DS_Store' -a $file != '.git' ]; then
			echo "Creating symlink to $file in home directory."
			ln -sf $PWD/$file ~/$file
		fi
	done
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
