-- bootstrap lazy.nvim, LazyVim and your plugins

function IsEmpty(s)
  return s == nil or s == ""
end

function GetPython()
  if not IsEmpty(os.getenv("CONDA_PREFIX")) then
    return os.getenv("CONDA_PREFIX") .. "/bin/python"
  else
    return "python"
  end
end

P = function(v)
  print(vim.inspect(v))
  return v
end

require("config.lazy")
