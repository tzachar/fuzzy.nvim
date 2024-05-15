local zf = require('zf')

local M = {}

-- return a list of {line, positions, score}
M.filter = function(_, pattern, lines, is_case_sensitive)
	local ans = {}
	is_case_sensitive = is_case_sensitive or false
	local matches = {}
	local tokens = zf.tokenize(pattern)

	for index, line_tbl in ipairs(lines) do
		local line = line_tbl[1] or line_tbl
		local rank = zf.rank(line, tokens.tokens, tokens.len, false, is_case_sensitive)
		local positions = zf.highlight(line, tokens.tokens, tokens.len, false, is_case_sensitive)
		if positions and #positions > 0 then
			positions = vim.tbl_map(function(p) return p.start end, positions)
			table.insert(ans, { line_tbl, positions, rank, index })
		end
	end

	table.sort(ans, function(a, b) return a[3] > b[3] end)
	return ans
end

return M
