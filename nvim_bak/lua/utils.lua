local function isempty(s)
	return s == nil or s == ''
end

local function getpython()
	if not isempty(os.getenv 'CONDA_PREFIX') then
		return os.getenv 'CONDA_PREFIX' .. '/bin/python'
	else
		return 'python'
	end
end

P = function(v)
	print(vim.inspect(v))
	return v
end

return {
	P = P,
	isempty = isempty,
	getpython = getpython,
}
