-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    ["]q"] = { "<cmd>cnext<cr>", desc = "Next quickfix" },
    ["[q"] = { "<cmd>cprev<cr>", desc = "Previous quickfix" },
    ["]Q"] = { "<cmd>cnewer<cr><cr>", desc = "Next quickfix list" },
    ["[Q"] = { "<cmd>colder<cr><cr>", desc = "Previous quickfix list" },

    ["<leader>e"] = {
      function()
        local reveal_file = vim.fn.expand "%:p"
        local curr_dir = vim.fn.getcwd()
        local file_in_dir = reveal_file:sub(1, #curr_dir) == curr_dir
        local opts = {
          source = "last",
          toggle = true,
          reveal = file_in_dir,
        }
        require("neo-tree.command").execute(opts)
      end,
      desc = "NeoTree Focus",
    },

    ["<leader>o"] = {
      function()
        require("telescope.builtin").buffers {
          sort_lastused = true,
          initial_mode = "normal",
        }
      end,
      desc = "Recent Buffer",
    },

    ["<leader>c"] = {
      function()
        local bufs = vim.fn.getbufinfo { buflisted = true }
        require("astronvim.utils.buffer").close(0)
        if
          require("astronvim.utils").is_available "alpha-nvim" and not bufs[2]
        then
          require("alpha").start(true)
        end
      end,
      desc = "Close buffer",
    },

    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  i = {
    ["<C-R><C-R>"] = {"<C-R>\""}
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["<F8>"] = { "<C-\\><C-n>" },
  },
}
