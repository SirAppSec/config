return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "catppuccin",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- exatra configuratino
    --
    --

    -- don't use swap
    vim.opt.swapfile = false
    function _G.Base64ToggleLine()
      -- Force visual mode reselection to update '< and '> marks
      -- Used to toggle the line to and from base 64 with VisualSelection ofLine only
      vim.cmd "normal! gv"

      -- Capture the currently selected line
      local line_num = vim.fn.getpos("'<")[2]
      local line = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, false)[1]

      -- Determine if we should encode or decode
      local result
      local is_base64 = (#line % 4 == 0) and line:match "^[A-Za-z0-9+/]+=?=?$"

      if is_base64 then
        -- Attempt to decode the line
        local status, decoded = pcall(
          function() return vim.fn.system("echo '" .. line:gsub("'", "'\\''") .. "' | base64 --decode") end
        )
        result = (status and decoded and #decoded > 0 and not decoded:match "%c") and decoded or line
      else
        -- Encode the line
        result = vim.fn.system("printf '%s' " .. vim.fn.shellescape(line) .. " | base64")
      end

      -- Trim the newline character from the system call result
      result = result:gsub("%s+$", "")

      -- Replace the selected line with the result
      vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, false, { result })
    end

    -- Key mapping for line-wise visual mode<cmd>
    -- <cmd> was originally used, using :<c-u> it now registers the selection correctly.
    vim.api.nvim_set_keymap("x", "g?", ":<c-u>lua Base64ToggleLine()<CR>", { noremap = true, silent = true })
  end,
}
