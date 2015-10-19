cd ~/.emacs.d
cd software
tar zxvf geben-0.26.tar.gz

UNAME=$(uname)
if [ "$UNAME" != "Linux" -a "$UNAME" != "Darwin" ] ; then
    echo "Sorry, this OS is not supported yet."
    exit 1
fi

if [ "$UNAME" = "Darwin" ] ; then
    ### OSX ###
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install global
    brew install graphviz
    brew install plantuml
elif [ "$UNAME" = "Linux" ] ; then
    ### LINUX ###
    tar zxvf global.tar.gz
    cd global
    ./configure
    make && make install
    cd ../
fi
