local ls = require("luasnip")

require("luasnip").config.set_config({ -- Setting LuaSnip config
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
})

-- LUA SNIP
vim.keymap.set("i", "<c-k>", function ()
    if ls.jumpable(1) then
        ls.jump(1)
    end
    --if ls.expand_or_jumpable() then
      --  ls.expand_or_jump()
   -- end
end)

vim.keymap.set("i", "<c-j>", function ()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end)

vim.keymap.set("i", "<c-f>", function ()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)


require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})
