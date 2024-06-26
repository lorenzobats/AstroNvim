return {
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
".____                                                 ",
"|    |    ___________   ____   ____ ____________  ______",
"|    |   /  _ \\_  __ \\_/ __ \\ /    \\\\___   /  _ \\/  ___/",
"|    |__(  <_> )  | \\/\\  ___/|   |  \\/    (  <_> )___ \\ ",
"|_______ \\____/|__|    \\___  >___|  /_____ \\____/____  >",
"        \\/                 \\/     \\/      \\/         \\/ ",
"           ___________   ____.___   _____                         ",
"           \\      \\   \\ /   /|   | /     \\                        ",
 "           /   |   \\   Y   / |   |/  \\ /  \\                       ",
 "          /    |    \\     /  |   /    Y    \\                      ",
 "          \\____|__  /\\___/   |___\\____|__  /                      ",
 "                  \\/                     \\/  ",
      }
      return opts
    end,
  },
  { "rcarriga/nvim-notify", enabled = false},
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
        harpoon:setup()
     
      vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
      
      vim.keymap.set("n", "<S-1>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<S-2>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<S-3>", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<S-4>", function() harpoon:list():select(4) end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<C-Tab>", function() harpoon:list():prev() end)
      vim.keymap.set("n", "<C-S-Tab>", function() harpoon:list():next() end)
    end,
  }
  -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },
  --
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom luasnip cRunde 1onfiguration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   end,
  -- },
  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
  -- By adding to the which-key config and using our helper function you can add more which-key registered bindings
  -- {
  --   "folke/which-key.nvim",
  --   config = function(plugin, opts)
  --     require "plugins.configs.which-key"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- Add bindings which show up as group name
  --     local wk = require "which-key"
  --     wk.register({
  --       b = { name = "Buffer" },
  --     }, { mode = "n", prefix = "<leader>" })
  --   end,
  -- },
}
