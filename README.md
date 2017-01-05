
# vsel-search.vim

This is a plugin for Vim, that allows searching for visually selected text.

It was created by Raymond Li, and published in
[vim.wikia.com/wiki/VimTip171](http://vim.wikia.com/wiki/Search_for_visually_selected_text#Advanced).

It has been copied to this repository for easier install with tools like Vundle or pathogen.

## Installation

You can use any of those methods:

- Use [pathogen](https://github.com/tpope/vim-pathogen) (the git repository of
  this plugin is `https://github.com/joseluis/vsel-search.vim.git`)

- Use [Vundle](https://github.com/VundleVim/Vundle.vim) by adding to your
  `.vimrc` Vundle plugins section:

  ```vim
  Plugin 'joseluis/vsel-search.vim' " Allow searching for visually selected text
  ```

  Then remember to call `:PluginInstall`.

- Manually, by downloading the file
  [`vsel-search.vim`](https://raw.githubusercontent.com/joseluis/vsel-search.vim/master/vsel-search.vim)
  and moving it into your Vim runtime directory (`~/.vim` on UNIX/Linux and
  `$VIM_INSTALLATION_FOLDER\vimfiles` on Windows).

## Features

- Press `*` to search forwards for selected text, or `#` to search backwards.
- As normal, press `n` for next search, or `N` for previous.
- Handles multiline selection and search.
- Whitespace in the selection matches any whitespace when searching (searching
  for "hello world" will also find "hello" at the end of a line, with "world"
  at the start of the next line).
- Each search is placed in the search history allowing you to easily repeat
  previous searches.
- No registers are changed.


### Extra

- A global variable (`g:VeryLiteral`) controls whether selected whitespace
  matches any whitespace (by default, VeryLiteral is off, so any whitespace
  is found).
- Type `\vl` to toggle VeryLiteral to turn whitespace matching off/on (assuming
  the default backslash leader key).
- When VeryLiteral is off, any selected leading or trailing whitespace will
  not match newlines, which is more convenient, and avoids false search hits.

