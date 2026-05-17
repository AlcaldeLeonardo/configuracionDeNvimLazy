return {
  {
    "yetone/avante.nvim",
    opts = {
      provider = "openai", -- Siempre el nativo puro para evitar bugs de stream
      auto_suggestions_provider = "openai",
      behaviour = {
        auto_suggestions = false, -- Candado de saldo activo
      },
      providers = {
        openai = {
          endpoint = "https://api.openai.com/v1",
          model = "gpt-4o-mini", -- Arranca siempre con el barato por defecto
          max_tokens = 4096,
          extra_request_body = {
            temperature = 0,
          },
        },
      },
    },
  },
}
