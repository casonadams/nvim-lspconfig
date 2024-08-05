local util = require 'lspconfig/util'
local path = util.path

return {
  default_config = {
    cmd = { 'bsc', '--lsp', '--stdio' },
    filetypes = { 'brs', 'bs' },
    single_file_support = true,
    root_dir = util.root_pattern('makefile', 'Makefile', 'manifest'),
    on_new_config = function(new_config, new_root_dir)
      local bsconfig = path.join(path.dirname(new_root_dir), 'bsconfig.json')

      if path.exists(bsconfig) then
        new_config.cmd = { 'bsc', '--lsp', '--stdio', '--project', '"' .. bsconfig .. '"' }
      end
    end,
  },
  docs = {
    description = [[
https://github.com/RokuCommunity/brighterscript

`brighterscript` can be installed via `npm`:
```sh
npm install -g brighterscript
```
]],
    default_config = {
      root_dir = [[root_pattern('makefile', 'Makefile', 'manifest')]],
    },
  },
}
