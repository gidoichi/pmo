# pmo
**Package Manager Organizer**

pmo manager many package manager such as apt, brew, and others. You are not need to use many package managers to update packages they managed. And you will not use old deprecated package for the hassle of updating.

## USAGE

To register CLI package manager `pm`:

```
$ git clone https://github.com/gidoichi/pmo.git
$ cd pmo/bin
$ ln -s ../plugins/<pm> .
```

To register git repositoy `repo` to manage by pmo:

```
$ cd pmo/bin
$ ln -s ../plugins/git .
$ echo '/path/to/repo' | cat - <(pmo --pm=git list) | pmo --pm=git pm-list-save
```

To update all the package managers and upgrade all packages:

```
$ pmo update && pmo upgrade
```
