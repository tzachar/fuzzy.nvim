local fzy = require('fzy-lua-native')

local M = {}

-- return a list of {line, positions, score}
M.filter = function(_, pattern, lines, is_case_sensitive)
	local ans = {}
	is_case_sensitive = is_case_sensitive or false
	local matches = {}

	for index, line_tbl in ipairs(lines) do
		local line = line_tbl[1] or line_tbl
		if fzy.has_match(pattern, line, is_case_sensitive) == 1 then
			local positions, score = fzy.positions(pattern, line, is_case_sensitive)
			if #positions > 0 then table.insert(matches, { line_tbl, positions, score, index }) end
		end
	end

	table.sort(ans, function(a, b) return a[3] > b[3] end)
	return ans
end

return M
