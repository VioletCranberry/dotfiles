return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "bash" },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "shellcheck", "shfmt" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sh = { "shfmt" },
      },
      formatters = {
        shfmt = {
          extra_args = { "-i", "2", "-ci" },
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {},
      },
    },
  },
}
