
# vsel-search.vim

This is a plugin for Vim, that allows searching for visually selected text.

It was created by Raymond Li, and published in
[vim.wikia.com/wiki/VimTip171](http://vim.wikia.com/wiki/Search_for_visually_selected_text#Advanced).

I have copied it to github for an easier installation using tools like [Vundle](https://github.com/VundleVim/Vundle.vim) or [vim-pathogen](https://github.com/tpope/vim-pathogen).


## Features

- Press * to search forwards for selected text, or # to search backwards.
- As normal, press n for next search, or N for previous.
- Handles multiline selection and search.
- Whitespace in the selection matches any whitespace when searching (searching
  for "hello world" will also find "hello" at the end of a line, with "world"
  at the start of the next line).
- Each search is placed in the search history allowing you to easily repeat
  previous searches.
- No registers are changed.


### Extra

- A global variable (g:VeryLiteral) controls whether selected whitespace
  matches any whitespace (by default, VeryLiteral is off, so any whitespace
  is found).
- Type \vl to toggle VeryLiteral to turn whitespace matching off/on (assuming
  the default backslash leader key).
- When VeryLiteral is off, any selected leading or trailing whitespace will
  not match newlines, which is more convenient, and avoids false search hits.
