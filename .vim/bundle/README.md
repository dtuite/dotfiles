# Adding Plugins

I use submodules to manage Vim plugins.

*Adding a submodule*

```bash
cd ~/dotfiles
git submodule add [GIRTUB_URL] .vim/bundle/[PLUGIN_NAME]
git add --all
git commit -m "Added Vim plugin [PLUGIN_NAME]"
```

*Removing a submodule*

[See this SO question](http://stackoverflow.com/a/1260982/574190)

   1. Delete the relevant section from the `.gitmodules` file.
   1. Delete the relevant section from `.git/config`.
   1. Run `git rm --cached path_to_submodule` (no trailing slash).
   1. Commit
   1. Delete the now untracked submodule files<br/>`rm -rf path_to_submodule`
