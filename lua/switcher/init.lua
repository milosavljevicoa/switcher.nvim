local status_ok, Path = pcall(require, "plenary.path")
if not status_ok then
  print "Please provide plenary plugin"
  return
end

local normalize_path = function(item)
  return Path:new(item):make_relative(vim.loop.cwd())
end

-- not yet in use
local function is_path_matching_suffix(file_path, suffix)
  suffix = string.reverse(suffix)
  file_path = string.sub(string.reverse(file_path), 1, string.len(suffix))
  return suffix == file_path
end

local function convert_file_suffix_to(file_path, suffix)
  return string.sub(
    file_path,
    1,
    string.len(file_path) - string.len(suffix)
  ) .. suffix
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

local function getFileExtension(file)
return file:match("^.+(%..+)$")
end

local M = {}

function M.switch_to(extension)
  local normalized_current_path = normalize_path(vim.api.nvim_buf_get_name(0));
  if getFileExtension(normalized_current_path) == extension then
    print "File already opened"
    return
  end

  local normalized_path_to_open = convert_file_suffix_to(normalized_current_path, extension)
  if not file_exists(normalized_path_to_open) then
    print "File does not exist"
    return
  end

  vim.fn.execute('edit ' .. normalized_path_to_open)
end


return M
