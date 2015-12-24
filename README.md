### Install

	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew install emacs
	cd ~
	git clone https://github.com/ivories/emacs.d.git
	rm -rf .emacs.d
	mv emacs.d .emacs.d
	emacs

### short key

	ctrl + o : 打开文档
	ctrl + h : Ibuffer 可以查看当前已经打开的文档和BUFER
	ctrl + j : frame之前切的 
	ctrl + l : 跳指定行
	ctrl + k : 选择块区域
	ctrl + r : 搜索当前buffer
	ctrl + s : 保存文档
