
### Install

	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew install emacs
	cd ~
	git clone https://github.com/ivories/emacs.d.git
	rm -rf .emacs.d
	mv emacs.d .emacs.d
	emacs
