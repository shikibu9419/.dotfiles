# dotfiles
This is my dotfiles for macOS.

## Setup

Install dotfiles:

```shell
$ bash <(curl -fsSL raw.github.com/shikibu9419/.dotfiles/master/init/install.sh) [DIRECTORY]
```

Make target list:

```shell
$ make list     # List up deployed dotfiles
$ make init     # Initialize
$ make deploy   # Deploy dotfiles
$ make install  # Initialize and deploy
$ make update   # Update repository, submodules and other plugins
$ make help     # Display target list
```
