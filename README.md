# fuzzy.nvim

An abstraction layer on top of fzf and fzy. 

# Installation

Depends on [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) or 
[fzy-lua-native](https://github.com/romgrk/fzy-lua-native).

If both `fzf` and `fzy` are installed, will prefer `fzf`.

Using [Packer](https://github.com/wbthomason/packer.nvim/) with `fzf`:
```lua
use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
use {'tzachar/fuzzy.nvim', requires = {'nvim-telescope/telescope-fzf-native.nvim'}}
```

Using [Packer](https://github.com/wbthomason/packer.nvim/) with `fzy`:
```lua
use {'romgrk/fzy-lua-native', run = 'make'}
use {'tzachar/fuzzy.nvim', requires = {'romgrk/fzy-lua-native'}}
```

# Api

This plugin supports a module with a single method: `filter`.
The `filter` method receives two parameters: a pattern to match and a list of
strings. 
The method returns a list of `{string, match_positions, score}`. For the
meanings of match_positions and score see individual documentations of `fzf` and
`fzy`.

## Example Usage


```lua
local matcher = require('fuzzy_nvim')
matcher:filter('abc', {'aabbcc', '123', 'a1b2c'})
```

result with `fzf` is then: 
`
{ { "a1b2c", { 5, 3, 1 }, 58 }, { "aabbcc", { 5, 3, 1 }, 49 } }
`
