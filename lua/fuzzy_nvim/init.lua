local has_fzf, matcher = pcall(require, 'fuzzy_nvim.fzf_matcher')
if has_fzf then
   return matcher
end

local has_fzy, fzy_matcher = pcall(require, 'fuzzy_nvim.fzy_matcher')
if has_fzy then
   return fzy_matcher 
end

local has_zf, zf_matcher = pcall(require, 'fuzzy_nvim.zf_matcher')
if has_zf then
   return zf_matcher 
end

vim.notify('fuzzy.nvim: Cannot find neither fzy nor fzf or zf. Please install any of them')
return
