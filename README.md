# [EDiLDs](https://github.com/EDiLD)’s dotfiles


These are the base dotfiles that I start with when I set up a
new environment. For more specific local needs I use the `.local`
files described in the [`Local Settings`](#local-settings) section.


## Setup

To set up the `dotfiles` clone this repository and run setup.sh:

```bash
git clone git@github.com:EDiLD/dotfiles.git
./dotfiles/src/os/setup.sh

```



(:warning: **DO NOT** run the `setup.sh` snippet if you don't fully
understand [what it does](src/os/setup.sh). Seriously, **DON'T**!)

That's it! :sparkles:

The setup process will:

* Download the dotfiles on your computer (by default it will suggest
  `~/dotfiles`)
* Create some additional [directories](src/os/create_directories.sh)
* [Symlink](src/os/create_symbolic_links.sh) the
  [`git`](src/git),
  [`shell`](src/shell), 
  [`sublime-text`](src/sublime-text),
  [`xfce`](src/xfce4),
  [`zsh`](src/zsh)
  [`.Rprofile`](src/R)and
  [`conky`](src/conky) files
* Install applications / command-line tools for
  [`Ubuntu`](src/os/install/ubuntu)
* Set custom
  [`Ubuntu`](src/os/preferences/ubuntu) preferences
* Install R 
  [`R`](src/R) packages
* Misc stuff



## Customize

### Local Settings

The `dotfiles` can be easily extended to suit additional local
requirements by using the following files:

#### `~/.bash.local`

If the `~/.bash.local` file exists, it will be automatically sourced
after all the other [`bash` related files](src/shell), thus, allowing
its content to add to or overwrite the existing aliases, settings,
PATH, etc.

Here is a very simple example of a `~/.bash.local` file:

```bash

#!/bin/bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Set local aliases

alias starwars="telnet towel.blinkenlights.nl"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Set PATH additions

PATH="/usr/local/bin:$PATH"
PATH="$PATH:$HOME/projects/dotfiles/src/bin"

export PATH

```

#### `~/.gitconfig.local`

If the `~/.gitconfig.local` file exists, it will be automatically
included after the configurations from `~/.gitconfig`, thus, allowing
its content to overwrite or add to the existing `git` configurations.

__Note:__ Use `~/.gitconfig.local` to store sensitive information such
as the `git` user credentials, e.g.:

```bash
[user]
    name = Eduard Szöcs
    email = EDiLD@example.com
    signingkey = XXXXXXXX
```


### Forks

If you decide to fork this project, don't forget to substitute my
username with your own in the [`setup` snippets](#setup) and [in the
`setup` script](https://github.com/EDiLD/dotfiles/blob/1503cf23ef23f6e31342b140bcd246625160b94f/src/os/setup.sh#L3).


## Update

To update the dotfiles you can either run the [`setup`
script](src/os/setup.sh) or, if you want to just update one particular
part, run the appropriate [`os` script](src/os).


## Acknowledgements
Initial clone from [Cătălin Mariș'](https://github.com/alrra/dotfiles) dotfiles.

Inspiration and code was taken from many sources, including:

* [Mathias Bynens'](https://github.com/mathiasbynens)
  [dotfiles](https://github.com/mathiasbynens/dotfiles)



## License

The code is available under the [MIT license](LICENSE.txt).
