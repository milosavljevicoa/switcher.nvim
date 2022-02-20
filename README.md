# switcher.nvim
Easy switching between files for nvim.

## WIP
This is still work in progress and isn't fully completed, if you have any suggestions or want to contribute don't be shy ;) 

Currently file changes are possible by extensions. Example: from `html` to `ts` to `scss`, etc.

## Installation
- neovim 0.5.0+ required
- install using your favorite plugin manager

With `packer.nvim`
```lua
use 'nvim-lua/plenary.nvim',
use 'milosavljevicoa/switcher.nvim'
```

## Usage
```viml
nnoremap <A-h> <cmd>lua require('switcher').switch_to('html')<CR>
nnoremap <A-t> <cmd>lua require('switcher').switch_to('ts')<CR>"
nnoremap <A-s> <cmd>lua require('switcher').switch_to('scss')<CR>
```

## Improvments
Add possibility for "complex extension" for example 
```viml
nnoremap <A-n> <cmd>lua require('switcher').switch_to('spec.ts')<CR>
```
