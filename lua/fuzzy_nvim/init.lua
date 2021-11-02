local has_fzf, matcher = pcall(require, 'fuzzy_nvim.fzf_matcher')
if not has_fzf then
	local has_fzy, fzy_matcher = pcall(require, 'fuzzy_nvim.fzy_matcher')
	if has_fzy then
		matcher = fzy_matcher
	else
		vim.notify('fuzzy.nvim: Cannot find neither fzy nor fzf. Please install either')
		return
	end
end

return matcher
