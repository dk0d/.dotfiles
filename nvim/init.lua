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

--- Open a URL under the cursor with the current operating system (Supports Mac OS X and *nix)
-- @param path the path of the file to open with the system opener
function SystemOpen(path)
  path = path or vim.fn.expand("<cfile>")
  if vim.fn.has("mac") == 1 then
    -- if mac use the open command
    vim.fn.jobstart({ "open", path }, { detach = true })
  elseif vim.fn.has("unix") == 1 then
    -- if unix then use xdg-open
    vim.fn.jobstart({ "xdg-open", path }, { detach = true })
  else
    -- if any other operating system notify the user that there is currently no support
    vim.notify("System open is not supported on this OS!", "error")
  end
end

require("config.lazy")
