vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.bo.expandtab = true

local bufnr = vim.api.nvim_get_current_buf()
local parser = vim.treesitter.get_parser(bufnr)
local tree = parser:parse()
local root = tree[1]:root()

local function get_val(key)
  local query = vim.treesitter.parse_query(
    'yaml',
    string.format(
      [[
;; query
(block_mapping_pair 
(flow_node (plain_scalar (string_scalar) @key_name_str))
(flow_node (plain_scalar (string_scalar) @val_name_str))
(#match? @key_name_str "^%s")
) 
]],
      key
    )
  )

  for id, match, metadata in query:iter_matches(root, bufnr) do
    for j, key in ipairs(match) do
      local capture_name = query.captures[j]
      if capture_name == 'val_name_str' then
        return vim.treesitter.get_node_text(key, bufnr)
      end
    end
  end
  return nil
end

local kubernetes = setmetatable({}, {
  __index = function(self, key)
    local _, res = pcall(get_val, key)
    return res
  end,
})

local yaml_configs = {
  format = {
    enable = true,
    singleQuote = true,
    bracketSpacing = true,
    proseWrap = 'always',
    printWidth = 80,
  },
  validate = true,
  hover = true,
  completion = true,
  schemaStore = {
    enable = true,
  },
  editor = {
    formatOnType = true,
  },
}

if kubernetes.kind ~= nil and kubernetes.apiVersion ~= nil then
  yaml_configs.schemaStore.enable = false
  yaml_configs.schemas = {
    kubernetes = { '*' },
  }
end

vim.lsp.start({
  name = 'yamlls',
  cmd = { 'yaml-language-server', '--stdio' },
  init_configs = {
    yaml = yaml_configs,
  },
  -- before_init = function(initilize_params, config)
  --   -- vim.notify(vim.inspect(initilize_params))
  --   -- vim.notify(vim.inspect(config))
  --   -- vim.notify(vim.inspect(vim.bo.filetype))
  -- end,
  on_init = function(client, initialization_result)
    -- vim.notify(vim.inspect(vim.opt.filetype))
    -- vim.notify(vim.inspect(initialization_result))
    client.server_capabilities.documentFormattingProvider = vim.bo.filetype ~= 'gotmpl'
  end,
  on_attach = function(_, _)
    vim.api.nvim_create_user_command('GetJsonSchema', function()
      vim.lsp.buf_request(0, 'yaml/get/jsonSchema', { vim.uri_from_bufnr(0) }, nil)
    end, {})
  end,
  root_dir = vim.fs.dirname(vim.fs.find({ '.git', 'README.md' }, { upward = true })[1]),
  handlers = {
    ['yaml/get/jsonSchema'] = function(err, result, ctx, config)
      if vim.tbl_isempty(result) then
        vim.notify('Schema is not recognized')
      end

      for _, schema in ipairs(result) do
        vim.notify(schema.description, 'info', { title = schema.name })
      end
    end,
  },
})
