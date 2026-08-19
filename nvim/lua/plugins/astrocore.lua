-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        showmode = true, -- モード表示をオンにする
        cmdheight = 1,   -- コマンドラインの高さを1行分確保する
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- Space + 1〜9 で左から順にタブへ移動
        ["<Leader>1"] = { function() require("astrocore.buffer").nav_to(1) end, desc = "Go to buffer 1" },
        ["<Leader>2"] = { function() require("astrocore.buffer").nav_to(2) end, desc = "Go to buffer 2" },
        ["<Leader>3"] = { function() require("astrocore.buffer").nav_to(3) end, desc = "Go to buffer 3" },
        ["<Leader>4"] = { function() require("astrocore.buffer").nav_to(4) end, desc = "Go to buffer 4" },
        ["<Leader>5"] = { function() require("astrocore.buffer").nav_to(5) end, desc = "Go to buffer 5" },
        ["<Leader>6"] = { function() require("astrocore.buffer").nav_to(6) end, desc = "Go to buffer 6" },
        ["<Leader>7"] = { function() require("astrocore.buffer").nav_to(7) end, desc = "Go to buffer 7" },
        ["<Leader>8"] = { function() require("astrocore.buffer").nav_to(8) end, desc = "Go to buffer 8" },
        ["<Leader>9"] = { function() require("astrocore.buffer").nav_to(9) end, desc = "Go to buffer 9" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
      i = {
        -- インサートモードを抜けるキーバインド
        ["jj"] = { "<Esc>", desc = "Escape to Normal mode" },
        ["jk"] = { "<Esc>", desc = "Escape to Normal mode" },
      },
    },
  },
}
