#!/bin/bash

NPMRC="/.npmrc"
LOCAL="/.local"

if [ $1 ]
then
    NODEVERSION=$1
else
    NODEVERSION="4.2.1"
fi

if [ $2 ]
then
    BASHRC=$2
else
    BASHRC="/.bashrc"
fi

if [ ! -e "$HOME$LOCAL" ]
then
    echo "Create $HOME$LOCAL"
    mkdir $HOME$LOCAL
fi

if [ ! -e "$HOME$NPMRC" ]
then
    echo "Create $HOME$NPMRC"
    echo "" > $HOME$NPMRC
fi

if ! grep -q -E 'root\s*=\s*.*\/\.local\/lib\/node_modules|binroot\s*=\s*.*\/\.local\/bin|manroot\s*=\s*.*\/\.local\/share\/man' $HOME$NPMRC
then
    echo "Adding configuration to .npmrc"
    echo "root = $HOME/.local/lib/node_modules"
    echo "binroot = $HOME/.local/bin"
    echo "manroot = $HOME/.local/share/man"

    echo "root = $HOME/.local/lib/node_modules" >> $HOME$NPMRC
    echo "binroot = $HOME/.local/bin" >> $HOME$NPMRC
    echo "manroot = $HOME/.local/share/man" >> $HOME$NPMRC
fi

cd $HOME$LOCAL
rm -f node-v$NODEVERSION.tar.gz
wget https://nodejs.org/dist/v$NODEVERSION/node-v$NODEVERSION.tar.gz

tar xf node-v$NODEVERSION.tar.gz
cd node-v$NODEVERSION
./configure --prefix=$HOME/.local
make
make install

cd $HOME
ln -sf "$HOME/.local/lib/node_modules" "$HOME/.node_modules"

if [ ! -e "$HOME$BASHRC" ]
then
    echo "Create $HOME$BASHRC"
    echo "" > $HOME$BASHRC
fi

if ! grep -q -E '\/\.local\/bin' $HOME$BASHRC
then
    echo "export PATH=\$HOME/.local/bin:\$PATH" >> $HOME$BASHRC
    source $HOME$BASHRC
fi

which npm
npm --version

which node
node --version

echo "Done"
