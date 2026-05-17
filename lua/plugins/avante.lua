return {
  {
    "yetone/avante.nvim",
    opts = {
      provider = "openai-gpt-4o-mini", -- Volvemos al rey del bolsillo compatible
      auto_suggestions_provider = "openai-gpt-4o-mini",
      behaviour = {
        auto_suggestions = false, -- Candado de saldo activo
      },
      providers = {
        -- El modelo potente compatible
        openai = {
          endpoint = "https://api.openai.com/v1",
          model = "gpt-4o",
          max_tokens = 4096,
          extra_request_body = {
            temperature = 0,
          },
        },
        -- El modelo económico compatible
        ["openai-gpt-4o-mini"] = {
          __inherited_from = "openai",
          endpoint = "https://api.openai.com/v1",
          model = "gpt-4o-mini",
          max_tokens = 4096,
          extra_request_body = {
            temperature = 0,
          },
        },
      },
    },
  },
}
