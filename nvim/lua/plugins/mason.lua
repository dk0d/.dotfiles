return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "black",
        "ruff",
        "pyright",
        "ruff-lsp",
        "debugpy",
      },
    },
  },
}
