# switcher.nvim
Easy switching between files for nvim.

## Problem
Working for an example in angular, I have to switch between **SAME** file but with different extension, for example: `html`, `ts`, `spec.ts` & `css`, very frequently and I would like an easier approach rather then using tree explorer navigation or some fuzzy find. 

## Demo
With single key combination I can navigate through all the files that I need. 
![WindowsTerminal_9ut8KyrAHE](https://user-images.githubusercontent.com/47518781/155019573-8a78fac8-c93f-4dc3-b0ce-79db1e8e22ce.gif)


## Installation
- neovim 0.5.0+ required
- install using your favorite plugin manager

With `packer.nvim`
```lua
use 'nvim-lua/plenary.nvim',
use 'milosavljevicoa/switcher.nvim'
```

## Usage
Main function is `switch_to` and it has the following declaration
```lua
function switch_to(extension, possible_suffix)
```
Where:
- extension is requried and it's the new file extension to which to change the current file
- possible_suffix is optional and it specifies suffix that current file might have in order to correctly switch the file

### Example with extension parameter only
```viml
" switch extension of current file to html
nnoremap <A-h> <cmd>lua require('switcher').switch_to('html')<CR>
" switch extension of current file to ts
nnoremap <A-t> <cmd>lua require('switcher').switch_to('ts')<CR>
" switch extension of current file to css
nnoremap <A-s> <cmd>lua require('switcher').switch_to('css')<CR>
```

### Example with both parameters in use ("complex" extension)
In angular there is 4 main extensions for files (if excluding `module.ts`) and those are: `html`, `ts`, `css` and `spec.ts`.
`spec.ts` is file reserved for testing. So in order for extension switching to work properly you have you define the `possible_suffix` parameter to be that extra suffix for a file. For example this is how it's configured for me for angular development:
```viml
nnoremap <A-h> <cmd>lua require('switcher').switch_to('html', 'spec')<CR>
nnoremap <A-t> <cmd>lua require('switcher').switch_to('ts', 'spec')<CR>
nnoremap <A-t> <cmd>lua require('switcher').switch_to('spec.ts', 'spec')<CR>
nnoremap <A-s> <cmd>lua require('switcher').switch_to('css', 'spec')<CR>
```
