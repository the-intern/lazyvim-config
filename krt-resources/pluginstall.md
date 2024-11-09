# Hugo Templating Plugin

> How do I install Hugo's templating language into LazyVim

To add support for Hugo's templating language in LazyVim, you can integrate a plugin that enhances syntax highlighting and autocompletion for Hugo templates. Since Hugo uses **Go's template language**, you'll need a plugin that supports **Go templates** or **HTML with Go templating**.

Here’s how you can set it up:

### Step 1: Install a Plugin for Hugo Templating

There are a couple of plugins that provide support for Hugo’s Go-based templating language:

1. **vim-go**: A comprehensive Go development plugin that also includes support for Go templates, which Hugo uses.
2. **leafOfTree/vim-vue-plugin**: Offers Go template support in HTML and markdown files.

In LazyVim, plugins are managed through Lazy, so you’ll need to add the appropriate plugin to your configuration.

### Step 2: Add Plugin to Lazy Configuration

1. Open your LazyVim configuration file. This is typically located in `lua/config/lazy.lua` (or another file that’s loaded in `init.lua`).

2. Add the following plugin entries based on your needs:

#### Option 1: Install **vim-go** (for general Go and template support)

```lua
return {
  -- Other plugins...
  
  {
    "fatih/vim-go",
    run = ":GoUpdateBinaries",
    ft = { "go", "tmpl", "gotmpl" }, -- Supports Go and Go templates
    config = function()
      require("go").setup({})
    end,
  },
}
```

#### Option 2: Install **vim-hugo** (specific Hugo support)

This plugin is specifically for Hugo template language:

```lua
return {
  -- Other plugins...
  
  {
    "jinzhongjia/vim-hugo",
    ft = { "gohtmltmpl", "tmpl", "html" }, -- Hugo templates
  },
}
```

#### Option 3: Install **leafOfTree/vim-vue-plugin** (for Go templates in HTML)

```lua
return {
  -- Other plugins...
  
  {
    "leafOfTree/vim-vue-plugin",
    ft = { "html", "tmpl", "gohtmltmpl" },
  },
}
```

3. After adding the plugin, save your configuration file and reload Neovim, or run the following command in Neovim to sync the plugins:

   ```vim
   :Lazy sync
   ```

### Step 3: Open Hugo Template Files

Once installed, you should have proper syntax highlighting, auto-completion, and indenting for Hugo template files, which typically use the `.html`, `.tmpl`, `.gohtmltmpl`, and `.tpl` extensions.

### Optional: LSP for Go Templates

If you want more robust LSP features (like autocompletion and linting) for Go template files, you can configure `gopls` (which you already installed) to handle Hugo’s Go templates:

1. In your `lspconfig` setup, you can add support for Hugo’s template file extensions.

```lua
local lspconfig = require("lspconfig")

lspconfig.gopls.setup {
  filetypes = { "go", "tmpl", "gohtmltmpl" },
  -- Ensure Hugo template files are included
}
```

Now, whenever you open Hugo template files,
you’ll have language-specific features like syntax
highlighting and, optionally, LSP features depending on your setup.

Let me know if you need further assistance!

---

> I can find no evidence that these two plugins provide Hugo template support.  
> Go templates are the foundation for Hugo templates, but Hugo extends these.  
> So I need a Hugo templating language

To enhance Neovim's support for Hugo's templating language, you can integrate the `vim-hugo` plugin, which is specifically designed to improve syntax highlighting and indentation for Hugo templates.

**Installation Steps:**

1. **Add the Plugin to Your LazyVim Configuration:**

   Locate your LazyVim configuration file, typically found at `~/.config/nvim/lua/plugins.lua`.

   Insert the following code to include the `vim-hugo` plugin:

   ```lua
   return {
     -- Other plugins...
     {
       "phelipetls/vim-hugo",
       ft = { "html", "gohtmltmpl", "tmpl" },
     },
   }
   ```

2. **Synchronize Plugins:**

   After saving the configuration, open Neovim and run:

   ```vim
   :Lazy sync
   ```

   This command will install the new plugin and update your setup.

3. **Verify Functionality:**

   Open a Hugo template file (e.g., a `.html` file containing Hugo's templating syntax) to confirm that syntax highlighting and indentation are functioning as expected.

By following these steps, Neovim should provide enhanced support for Hugo's templating language, improving your development experience.
