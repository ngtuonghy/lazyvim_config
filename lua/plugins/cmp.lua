---------
-- cmp --
---------
--
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "onsails/lspkind-nvim", -- completion menu icons
    "saadparwaiz1/cmp_luasnip", -- snippets
    "hrsh7th/cmp-nvim-lsp", -- lsp completion
    "hrsh7th/cmp-buffer", -- buffer completion
    "hrsh7th/cmp-path", -- path completion
    "hrsh7th/cmp-cmdline", -- command-line completion
    "hrsh7th/cmp-nvim-lua", -- nvim builtins completion
    "hrsh7th/cmp-nvim-lsp-signature-help", -- signature
  },
  event = { "insertenter", "cmdlineenter" },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    --local lspkind = require("lspkind")
    local cmp_insert = { behavior = cmp.SelectBehavior.Insert }
    local cmp_disabled = cmp.config.disable
    local icons = require("config.icons")

    vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "cyan" })

    local check_backspace = function()
      local col = vim.fn.col(".") - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
    end

    -- local function cmp_formatting()
    --   return function(entry, vim_item)
    --     local format_opts = { mode = "symbol_text", maxwidth = 25 }
    --     local kind = lspkind.cmp_format(format_opts)(entry, vim_item)
    --     local strings = vim.split(kind.kind, "%s", { trimempty = true })
    --
    --     kind.kind = strings[1] or ""
    --     kind.menu = "  " .. (strings[2] or "")
    --
    --     return kind
    --   end
    -- end

    local function complete(fallback)
      if cmp.visible() then
        cmp.mapping.confirm({ select = true })()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end

    local function cmdline_complete()
      if cmp.visible() then
        cmp.mapping.confirm({ select = true })()
      else
        cmp.complete()
      end
    end

    local function cmp_map(rhs, modes)
      if modes == nil then
        modes = { "i", "c" }
      else
        if type(modes) ~= "table" then
          modes = { modes }
        end
      end
      return cmp.mapping(rhs, modes)
    end

    local function toggle_complete()
      return function()
        if cmp.visible() then
          cmp.close()
        else
          cmp.complete()
        end
      end
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- for `luasnip` users.
        end,
      },
      mapping = {
        ["<C-j>"] = cmp_map(cmp.mapping.select_next_item(cmp_insert)),
        ["<C-k>"] = cmp_map(cmp.mapping.select_prev_item(cmp_insert)),
        ["<C-b>"] = cmp_map(cmp.mapping.scroll_docs(-4)),
        ["<C-f>"] = cmp_map(cmp.mapping.scroll_docs(4)),
        ["<C-Space>"] = cmp_map(toggle_complete(), { "i", "c", "s" }),
        ["<Tab>"] = cmp.mapping({
          i = complete,
          c = cmdline_complete,
        }),
        ["<C-y>"] = cmp_disabled,
        ["<C-n>"] = cmp_disabled,
        ["<C-p>"] = cmp_disabled,
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(_, vim_item)
          local kind = vim_item.kind
          -- local format_opts = { mode = "symbol_text", maxwidth = 50 }
          vim_item.kind = icons.kind[kind] or "?"
          vim_item.menu = "󱦰 " .. kind
          -- vim_item.abbr = string.sub(vim_item.abbr, 1, 10)
          vim_item.abbr = vim_item.abbr:match("[^(]+")
          return vim_item
        end,
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        -- { name = "nvim_lsp_signature_help" },
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      window = {
        completeopt = "menu,menuone,noinsert",
        -- documentation = cmp.config.window.bordered(),
        --completion = cmp.config.window.bordered(),
        completion = cmp.config.window.bordered({
          border = "none",
          side_padding = 0,
        }),
      },
      experimental = {
        ghost_text = true,
        -- native_menu = false,
      },
    })

    cmp.setup.cmdline("/", {
      sources = {
        { name = "buffer" },
      },
    })

    -- Use cmdline & path source for `:`
    cmp.setup.cmdline(":", {
      sources = cmp.config.sources({
        { name = "path" },
        { name = "cmdline" },
      }),
    })
  end,
}
