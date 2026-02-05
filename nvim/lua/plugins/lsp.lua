return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      nil_ls = {
        mason = false,
        cmd = { "/etc/profiles/per-user/ryanrolon/bin/nil" },
      },
    },
  },
}
