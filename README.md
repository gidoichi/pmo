# pmo
**Package Manager Organizer**

pmo manager many package manager such as apt, brew, and others. You are not need to use many package managers to update packages they managed. And you will not use old deprecated package for the hassle of updating.

## INSTALLATION

### git clone

```sh
git clone https://github.com/gidoichi/pmo.git
echo "PATH=\"$PWD/pmo:\$PATH\"" >> .bashrc
```

### Homebrew

```sh
brew install gidoichi/tap/pmo
```

## USAGE

### Registering package managers

pmo manages it's package managers called at pmo command running. No managers are installed by default.

Officially supported managers are checked by:

```sh
pmo --manager=pmo list
```

To register managers to call by pmo:

```sh
pmo --manager=pmo install <manager...>
# or auto detected registration can be used to register all manager binaries in $PATH
# `pmo --manager=pmo install --auto`
```

### pmo subcommands

To update and upgrade all packages, run:

```sh
pmo update && pmo upgrade
```

or it's equevalent:

```sh
pmo update,upgrade
```
