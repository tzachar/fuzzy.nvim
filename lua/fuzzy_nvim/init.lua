local has_fzf, matcher = pcall(require, 'fuzzy_nvim.fzf_matcher')
if not has_fzf then
	local has_fzy, fzy_matcher = pcall(require, 'fuzzy_nvim.fzy_matcher')
	if has_fzy then
		matcher = fzy_matcher
	else
		local has_zf, zf_matcher = pcall(require, 'fuzzy_nvim.zf_matcher')
		if has_zf then
			matcher = zf_matcher
		else
			vim.notify('fuzzy.nvim: Cannot find neither fzy nor fzf. Please install either')
			return
		end
	end
end

return matcher
