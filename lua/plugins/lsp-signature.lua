return {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  opts = {
    bind = true,
    handler_opts = {
      border = "none"
    }
  },
  config = function(_, opts) require'lsp_signature'.setup(opts) end
}
