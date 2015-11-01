# Installing node without root privilegies

This script have been implemente followin the step in this article ["NODE.JS HOWTO: INSTALL NODE+NPM AS USER (NOT ROOT) UNDER UNIX OSES"](http://tnovelli.net/blog/blog.2011-08-27.node-npm-user-install.html). Kudos to Tom Novelli!

## What does it do?

The script will install nodejs ([compiling it](#requirements) from source) in your home directory.

At the end you will have a `.local` and a `.node_modules` folders in your home directory. The first one containing the source and binaries for node and npm, the second one is just a link to `~/.local/lib/node_modules` where all the globally installed node module will be stored.

## How to use it

Clone the repo

```
git clone git@github.com:p16/nodeinstall.git

or

git clone https://github.com/p16/nodeinstall.git
```

run

```
cd /repo/path/

./nodeinstall.sh [4.2.1] ['/.bashrc']
```

**The two parameters are not mandatory. The default values are the ones written above**

The first parameter has to be the node version you want to use.

The second has to be the file that your console reads your modification to the PATH env variable

## Update

To update nodejs you can run the same command, just remember to specify the new version as the first parameter.

```
cd /repo/path/

./nodeinstall.sh 5.0.0
```


## Requirements

* You need to have the following packages (or xcode on mac osx) installed to compile the source:
 * make
 * gcc
 * g++
 * python
 * linux-headers
 * paxctl
 * libgcc
 * libstdc++
 * tar
 * wget (**on mac osx you will need to install it with `brew install wget`**)


## Improvements

* Add custom install path option, now it installs node+npm in `~/.local`
* Remove dependency on bash
