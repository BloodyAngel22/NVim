-- require "lsp_signature".setup({
--     bind = true, -- This is mandatory, otherwise border config won't get registered.
--     handler_opts = {
--       border = "rounded"
--     }
--   })
local example_setup = {
  on_attach = function(client, bufnr)
    …
    require "lsp_signature".on_attach({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "rounded"
      }
    }, bufnr)
    …
  end,
  …
}
