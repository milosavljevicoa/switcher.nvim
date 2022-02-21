local status_ok, Path = pcall(require, "plenary.path")
if not status_ok then
  print "Please provide plenary plugin"
  return
end

local normalize_path = function(item)
  return Path:new(item):make_relative(vim.loop.cwd())
end

local function file_exists(name)
   local f = io.open(name,"r")
   if f ~= nil then
     io.close(f)
     return true
   else
     return false
  end
end

local function getFileWithExtension(file)
  local ext = file:match("^.+(%..+)$")
  local fileWithoutExt = string.sub(
    file,
    1,
    string.len(file) - string.len(ext)
  )
  return fileWithoutExt, ext
end

local M = {}

function M.switch_to(extension, possible_suffix)
  possible_suffix = possible_suffix or ""
  local current_file = normalize_path(vim.api.nvim_buf_get_name(0));
  local file, _ = getFileWithExtension(current_file)

  if possible_suffix ~= "" then
    local index_of_suffix = string.len(file) - (string.len(possible_suffix))
    local suffix = string.sub(file, index_of_suffix + 1)
    if suffix == possible_suffix then
      file = file.sub(file, 1, index_of_suffix - 1)
    end
  end

  file = file .. "." .. extension
  if not file_exists(file) then
    print ("File does not exist: " .. file)
    return
  end

  if file == current_file then
    print ("File already opened")
    return
  end

  vim.fn.execute('edit ' .. file)
end

return M
