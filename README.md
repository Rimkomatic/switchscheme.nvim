# 🎨 switchscheme.nvim  

A minimal Neovim plugin for browsing and switching colorschemes **with a Telescope UI**.  
It allows you to preview themes live before selecting them.  

## ✨ Features  
- 🔍 **Telescope-powered UI** for selecting colorschemes.  
- 🎨 **Live preview** while scrolling through themes.  
- ⚡ **Lazy-loaded for efficiency** (via Lazy.nvim).  

---

## 📦 Installation  

### Using Lazy.nvim  
Add the following to your Lazy.nvim configuration:  

```lua
{
    "Rimkomatic/switchscheme.nvim",
    lazy = true,
    cmd = { "SwitchColorscheme" },
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        require("switchscheme").setup()
    end,
}
```

Then, run:

```sh
:Lazy sync
```

## 🚀 Usage  

### Commands  
| Command              | Description                         |
|----------------------|-------------------------------------|
| `:SwitchColorscheme` | Open the colorscheme picker UI     |
| `:ListColorschemes`  | Print all available colorschemes   |
| `:SetColorscheme <name>` | Manually apply a colorscheme |

### Keybindings in Telescope UI  
| Key    | Action                  |
|--------|--------------------------|
| ↑ / ↓  | Navigate themes          |
| `<CR>` | Apply selected colorscheme |

---

## ⚙️ Configuration  
To customize `switchscheme.nvim`, use:

```lua
require("switchscheme").setup({
    preview = true,  -- Enable live preview
    layout = { width = 0.4, height = 0.4 },  -- Floating window size
})
```

---

## 🛠️ Contributing  
PRs are welcome! To contribute:

1. Fork the repo  
2. Create a new branch  
3. Make changes  
4. Submit a PR 🚀  

---

🌟 Enjoy effortless theme switching in Neovim!
