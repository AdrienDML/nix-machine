local options = { 
    undofile=true,
    mouse='a',
    tabstop=4,
    shiftwidth=4,
    expandtab=true,
    autoindent=true,
    smartindent=true,
    completeopt={'menu', 'menuone', 'noselect'},
    incsearch=true,
    ignorecase=true,
    smartcase=true,
    gdefault=true,
    number=true,
    relativenumber=true,
    termguicolors = true,
    scrolloff=15,
    foldmethod = "expr",
    foldexpr = "nvim_treesitter#foldexpr()"
}

require('utils.options').set_options(options)
