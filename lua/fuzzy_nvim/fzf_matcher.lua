local fzf = require('fzf_lib')

local M = {}

-- return a list of {line, positions, score}
M.filter = function(_, pattern, lines, case_mode)
	local ans = {}
	local slab = fzf.allocate_slab()
	local pattern_obj = fzf.parse_pattern(pattern, case_mode, true)

	for index, line_tbl in ipairs(lines) do
		local line = line_tbl[1] or line_tbl
		local score = fzf.get_score(line, pattern_obj, slab)
		local positions = fzf.get_pos(line, pattern_obj, slab)
		if positions and #positions > 0 then
			table.insert(ans, { line_tbl, positions, score, index })
		end
	end
	table.sort(ans, function(a, b) return a[3] > b[3] end)

	fzf.free_pattern(pattern_obj)
	fzf.free_slab(slab)
	return ans
end

return M
