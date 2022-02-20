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
    string.len(file_path) - (string.len(suffix) - 1)
  ) .. "." .. suffix
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

-- not working when there is an extension like .spec.ts
function M.switch_to(extension)
  local normalized_current_path = normalize_path(vim.api.nvim_buf_get_name(0));
  local file, ext = getFileWithExtension(normalized_current_path)
  if ext == extension then
    print "File already opened"
    return
  end

  file = file .. "." .. extension
  if not file_exists(file) then
    print ("File does not exist: " .. file)
    return
  end

  vim.fn.execute('edit ' .. file)
end


return M
