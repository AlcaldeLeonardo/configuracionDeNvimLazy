# 💤 LazyVim

<!--toc:start-->

- [💤 LazyVim](#💤-lazyvim)
  - [Configuracion Personal De NvimLazy](#configuracion-personal-de-nvimlazy) - [Configuraciones de Eslint en NeoVim](#configuraciones-de-eslint-en-neovim) - [1. Instalar dependencias](#1-instalar-dependencias) - [Opcional si ya lo tienes instalado](#opcional-si-ya-lo-tienes-instalado) - [2. Configura LSP en init.lua](#2-configura-lsp-en-initlua) - [3. Crear en el la raíz de proyecto el .eslintre.json](#3-crear-en-el-la-raíz-de-proyecto-el-eslintrejson) - [Opcional si tienes Prettier](#opcional-si-tienes-prettier)
  <!--toc:end-->

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Configuracion Personal De NvimLazy

### Configuraciones de Eslint en NeoVim

Para configurarlo en NeoVim con StandardJs apliqué en consola estas instalaciones:

#### 1. Instalar dependencias

```bash
npm install eslint-config-standard eslint-plugin-import eslint-plugin-node eslint-plugin-promise --save-dev
```

Cada programa que se instala es necesario para usar lo
principal de standardJs, no saltear ninguno.

##### Opcional si ya lo tienes instalado

También para tener a disposición `EslintFixAll` que luego escribiréen
en la configuración de LSP debo escribir:

```bash
npm i -g vscode-langservers-extracted
```

#### 2. Configura LSP en init.lua

En init.lua:

```lua
require('lspconfig').eslint.setup {
  settings = {
    validate = "on",
    codeAction = {
      enable = true,
      mode = "all", -- Habilita todas las acciones de corrección
    },
  },
  on_attach = function(client, bufnr) -- Para realizar los fix al guardar
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.cmd("EslintFixAll")-- Comando de neoVim (:EslintFixAll)
      end,
    })
  end,
}
```

#### 3. Crear en el la raíz de proyecto el .eslintre.json

Por ultimo no olvidar de crear un archivo .eslintrc.json con esto en su interior:

```JSON
{
  "extends": "standard",
  "rules": {}
}
```

#### Opcional si tienes Prettier

Para que no haya conflictos entre prettier y standadjs crear en la raíz del proyecto
un archivo .pretierignore con el siguiente contenido

```prettierignore
*.js
```

Esto provoca que tenga a mi disposición el Standard de JavaScript y la posibilidad
de formatear y corregir el código al guardar.
