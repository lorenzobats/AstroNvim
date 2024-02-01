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
  colorscheme = "kanagawa",


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
        disabled_plugins = { "nvim-notify", "tohtml", "gzip", "matchit", "zipPlugin" , "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here

  polish = function()

  local mygroup = vim.api.nvim_create_augroup("loading_netrwPlugin", {clear = true})
  vim.api.nvim_create_autocmd({"VimEnter"}, {
      pattern = {"*"},
      callback = function()
          -- Getting the file name that you pass when you launch nvim,
          local current_file = vim.fn.expand("%")
          -- if we have already file_name, then, we edit it
          if current_file ~= "" then
              vim.cmd(":silent! edit " .. current_file)
          else
              -- We will check if the window (buffer) is the lazy nvim, as it conflict if the buffer (popup menu) is lazy
              local lazy_popup_buf_exists = false
              -- We will get list of all current opened buffers
              local buf_list = vim.api.nvim_list_bufs()
              for _, buf in ipairs(buf_list) do
                  -- We will obtain from the table only the filetype
                  local buf_ft = vim.api.nvim_buf_get_option(buf, 'filetype')
                  if buf_ft == "lazy" then
                      lazy_popup_buf_exists = true
                  end
              end -- Check if vim-floaterm is loaded
              local has_floaterm, _ = pcall(require, 'floaterm')
              if not lazy_popup_buf_exists and not has_floaterm then
                  -- Then we can safely loading netrwPlugin at startup
                  vim.cmd(":silent! Explore")
              end
          end
      end,
      group = mygroup
  })
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}
