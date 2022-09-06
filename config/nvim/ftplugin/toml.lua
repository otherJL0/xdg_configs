-- Pattern for pyproject.toml
-- (table (dotted_key) @table
--     (pair
--         (bare_key) @bare_key
--     ) @pair
--     (#match? @table "tool\.(black|isort)")
--     (#match? @bare_key "line[_-]length")
-- )

vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = 'Cargo.toml',
  callback = function()
    require('crates').setup({
      smart_insert = true, -- try to be smart about inserting versions
      insert_closing_quote = true,
      avoid_prerelease = true, -- don't select a prerelease if the requirement does not have a suffix
      autoload = true, -- automatically run update when opening a Cargo.toml
      autoupdate = true, -- automatically update when editing text
      loading_indicator = true, -- show a loading indicator while fetching crate versions
      date_format = '%Y-%m-%d', -- the date format passed to os.date
      text = {
        loading = '   Loading',
        version = '   %s',
        prerelease = '   %s',
        yanked = '   %s',
        nomatch = '   No match',
        upgrade = '   %s',
        error = '   Error fetching crate',
      },
      highlight = {
        loading = 'CratesNvimLoading',
        version = 'CratesNvimVersion',
        prerelease = 'CratesNvimPreRelease',
        yanked = 'CratesNvimYanked',
        nomatch = 'CratesNvimNoMatch',
        upgrade = 'CratesNvimUpgrade',
        error = 'CratesNvimError',
      },
      popup = {
        autofocus = false,
        copy_register = '"',
        style = 'minimal',
        border = 'none',
        show_version_date = false,
        show_dependency_version = true,
        max_height = 30,
        min_width = 20,
        padding = 1,
        text = {
          title = ' %s',
          pill_left = '',
          pill_right = '',
          description = '%s',
          created_label = ' created        ',
          created = '%s',
          updated_label = ' updated        ',
          updated = '%s',
          downloads_label = ' downloads      ',
          downloads = '%s',
          homepage_label = ' homepage       ',
          homepage = '%s',
          repository_label = ' repository     ',
          repository = '%s',
          documentation_label = ' documentation  ',
          documentation = '%s',
          crates_io_label = ' crates.io      ',
          crates_io = '%s',
          categories_label = ' categories     ',
          keywords_label = ' keywords       ',
          version = '  %s',
          prerelease = ' %s',
          yanked = ' %s',
          version_date = '  %s',
          feature = '  %s',
          enabled = ' %s',
          transitive = ' %s',
          dependency = '  %s',
          optional = ' %s',
          dependency_version = '  %s',
          loading = ' ',
        },
        highlight = {
          title = 'CratesNvimPopupTitle',
          pill_text = 'CratesNvimPopupPillText',
          pill_border = 'CratesNvimPopupPillBorder',
          description = 'CratesNvimPopupDescription',
          created_label = 'CratesNvimPopupLabel',
          created = 'CratesNvimPopupValue',
          updated_label = 'CratesNvimPopupLabel',
          updated = 'CratesNvimPopupValue',
          downloads_label = 'CratesNvimPopupLabel',
          downloads = 'CratesNvimPopupValue',
          homepage_label = 'CratesNvimPopupLabel',
          homepage = 'CratesNvimPopupUrl',
          repository_label = 'CratesNvimPopupLabel',
          repository = 'CratesNvimPopupUrl',
          documentation_label = 'CratesNvimPopupLabel',
          documentation = 'CratesNvimPopupUrl',
          crates_io_label = 'CratesNvimPopupLabel',
          crates_io = 'CratesNvimPopupUrl',
          categories_label = 'CratesNvimPopupLabel',
          keywords_label = 'CratesNvimPopupLabel',
          version = 'CratesNvimPopupVersion',
          prerelease = 'CratesNvimPopupPreRelease',
          yanked = 'CratesNvimPopupYanked',
          version_date = 'CratesNvimPopupVersionDate',
          feature = 'CratesNvimPopupFeature',
          enabled = 'CratesNvimPopupEnabled',
          transitive = 'CratesNvimPopupTransitive',
          dependency = 'CratesNvimPopupDependency',
          optional = 'CratesNvimPopupOptional',
          dependency_version = 'CratesNvimPopupDependencyVersion',
          loading = 'CratesNvimPopupLoading',
        },
        keys = {
          hide = { 'q', '<esc>' },
          open_url = { '<cr>' },
          select = { '<cr>' },
          select_alt = { 's' },
          toggle_feature = { '<cr>' },
          copy_value = { 'yy' },
          goto_item = { 'gd', 'K', '<C-LeftMouse>' },
          jump_forward = { '<c-i>' },
          jump_back = { '<c-o>', '<C-RightMouse>' },
        },
      },
    })

    require('cmp').setup.buffer({ sources = { { name = 'crates' } } })
  end,
})

vim.lsp.start({
  name = 'taplo',
  cmd = { 'taplo', 'lsp', 'stdio' },
  root_dir = vim.fs.dirname(vim.fs.find({ 'Cargo.toml', 'pyproject.toml' }, { upward = true })[1]),
})
