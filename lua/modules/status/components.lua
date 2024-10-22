local function lsp_list()
  local get_clients = vim.fn.has("nvim-0.10") == 1 and vim.lsp.get_clients or vim.lsp.get_active_clients
  local buf_clients = get_clients({ bufnr = 0 })
  local buf_client_names = {}

  for _, client in pairs(buf_clients) do
    table.insert(buf_client_names, client.name)
  end

  return table.concat(buf_client_names, ", ")
end

local function lsp()
  local lsp = lsp_list()
  local prefix = (lsp == "" and " no lsp" or "%#LSPStatusActive#%*")
  return vim.trim(vim.fn.join({ prefix, lsp }, " "))
end
