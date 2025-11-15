return {
  {
    "neovim/nvim-lspconfig",
    dependecies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      vim.lsp.config['lua_ls'] = {}
      vim.lsp.enable('lua_ls')

      vim.lsp.config['ts_ls'] = {}
      vim.lsp.enable('ts_ls')

      --vim.lsp.config['angularls'] = {}
      local ng_path = vim.fn.expand("~/.nvm/versions/node/v22.19.0/lib/node_modules/@angular/language-server")

      vim.lsp.config["angularls"] = {
        cmd = {
          "ngserver",
          "--stdio",
          "--tsProbeLocations",
          ng_path,
          "--ngProbeLocations",
          ng_path,
        },
        filetypes = { "htmlangular", "typescript", "html", "typescriptreact", "typescript.tsx" },
        root_markers = { "angular.json", "nx.json", ".git" },
      }
      vim.lsp.enable('angularls')

      vim.lsp.config["roslyn"] = {}
      vim.lsp.enable("roslyn")
    end
  }
}
