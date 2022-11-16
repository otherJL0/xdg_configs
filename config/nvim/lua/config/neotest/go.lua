local neotest = require('neotest')
local dap_go = require('dap-go')
local dap = require('dap')
local dapui = require('dapui')

require('nvim-dap-virtual-text').setup({
  enabled = true, -- enable this plugin (the default)
  enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
  highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
  highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
  show_stop_reason = true, -- show stop reason when stopped for exceptions
  commented = false, -- prefix virtual text with comment string
  -- experimental features:
  virt_text_pos = 'eol', -- position of virtual text, see `:h nvim_buf_set_extmark()`
  all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
  virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
  virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
  -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
})

dapui.setup({
  icons = { expanded = '', collapsed = '', current_frame = '*' },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { '<CR>', '<2-LeftMouse>' },
    open = 'o',
    remove = 'd',
    edit = 'e',
    repl = 'r',
    toggle = 't',
  },
  -- Use this to override mappings for specific elements
  element_mappings = {
    -- Example:
    -- stacks = {
    --   open = "<CR>",
    --   expand = "o",
    -- }
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has('nvim-0.7') == 1,
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        { id = 'scopes', size = 0.25 },
        'breakpoints',
        'stacks',
        'watches',
      },
      size = 40, -- 40 columns
      position = 'left',
    },
    {
      elements = {
        'repl',
        'console',
      },
      size = 0.25, -- 25% of total lines
      position = 'bottom',
    },
  },
  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    enabled = true,
    -- Display controls in this element
    element = 'repl',
    icons = {
      pause = '||',
      play = '|>',
      step_into = '->>',
      step_over = '~>',
      step_out = '<~',
      step_back = '<<',
      run_last = '<||',
      terminate = '-|',
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = 'single', -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { 'q', '<Esc>' },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  },
})

dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.before.event_exited['dapui_config'] = dapui.close

vim.keymap.set('n', '<F8>', dap.toggle_breakpoint)
vim.keymap.set('n', '  bp', dap.toggle_breakpoint)
vim.keymap.set('n', '<F9>', dap.continue)
vim.keymap.set('n', '  c', dap.continue)
vim.keymap.set('n', '<F7>', dap.reverse_continue)
vim.keymap.set('n', '<F4>', dapui.toggle)
vim.keymap.set('n', '<F2>', dap.step_over)
vim.keymap.set('n', '<F1>', dap.step_into)
vim.keymap.set('n', ' <F5>', dap.terminate)
dap_go.setup()

local neotest_ns = vim.api.nvim_create_namespace('neotest')
vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      local message =
          diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
      return message
    end,
  },
}, neotest_ns)

neotest.setup({
  adapters = {
    require('neotest-go')({
      experimental = {
        test_table = true,
      },
    }),
  },
  benchmark = {
    enabled = true,
  },
  consumers = {},
  default_strategy = 'dap',
  diagnostic = {
    enabled = true,
  },
  discovery = {
    concurrent = 0,
    enabled = true,
  },
  floating = {
    border = 'rounded',
    max_height = 0.6,
    max_width = 0.6,
    options = {},
  },
  highlights = {
    adapter_name = 'NeotestAdapterName',
    border = 'NeotestBorder',
    dir = 'NeotestDir',
    expand_marker = 'NeotestExpandMarker',
    failed = 'NeotestFailed',
    file = 'NeotestFile',
    focused = 'NeotestFocused',
    indent = 'NeotestIndent',
    marked = 'NeotestMarked',
    namespace = 'NeotestNamespace',
    passed = 'NeotestPassed',
    running = 'NeotestRunning',
    select_win = 'NeotestWinSelect',
    skipped = 'NeotestSkipped',
    target = 'NeotestTarget',
    test = 'NeotestTest',
    unknown = 'NeotestUnknown',
  },
  icons = {
    child_indent = '│',
    child_prefix = '├',
    collapsed = '─',
    expanded = '╮',
    failed = '❌',
    final_child_indent = ' ',
    final_child_prefix = '╰',
    non_collapsible = '─',
    passed = '✔',
    running = '⦿',
    running_animated = { '/', '|', '\\', '-', '/', '|', '\\', '-' },
    skipped = '‒',
    unknown = '?',
  },
  jump = {
    enabled = true,
  },
  log_level = 3,
  output = {
    enabled = true,
    open_on_run = 'short',
  },
  output_panel = {
    enabled = true,
    open = 'botright split | resize 15',
  },
  projects = {},
  run = {
    enabled = true,
  },
  running = {
    concurrent = true,
  },
  status = {
    enabled = true,
    signs = true,
    virtual_text = false,
  },
  strategies = {
    integrated = {
      height = 40,
      width = 120,
    },
  },
  summary = {
    animated = true,
    enabled = true,
    expand_errors = true,
    follow = true,
    mappings = {
      attach = 'a',
      clear_marked = 'M',
      clear_target = 'T',
      debug = 'd',
      debug_marked = 'D',
      expand = { '<CR>', '<2-LeftMouse>' },
      expand_all = 'e',
      jumpto = 'i',
      mark = 'm',
      next_failed = 'J',
      output = 'o',
      prev_failed = 'K',
      run = 'r',
      run_marked = 'R',
      short = 'O',
      stop = 'u',
      target = 't',
    },
  },
})
vim.api.nvim_create_user_command('Test', function()
  dap_go.debug_test()
  -- neotest.run.run({ strategy = 'dap' })
end, {})

vim.api.nvim_create_user_command('TestFile', function()
  neotest.run.run(vim.fn.expand('%'))
end, {})

vim.api.nvim_create_user_command('TestAll', function()
  neotest.run.run(vim.fn.expand('%'))
end, {})

vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
