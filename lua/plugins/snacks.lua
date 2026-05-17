local m = require("variables.carpinchos")

local hora = tonumber(os.date("%H"))

local function elegirCarpincho()
  if hora >= 6 and hora < 12 then
    return m.carpinchito
  elseif hora >= 12 and hora < 15 then
    return m.carpinchoLechuga
  elseif hora >= 15 and hora < 18 then
    return m.carpinchoLEAG
  elseif hora >= 18 and hora < 20 then
    return m.carpinchoHacker
  else
    return m.carpinchitoDurmiendo
  end
end

return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        pick = function(cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,
        header = elegirCarpincho(),
      },
      sections = {
        { section = "header" },
        { section = "startup", padding = 1 },
        {
          pane = 2,
          {
            title = "Key Maps",
            section = "keys",
            padding = 1,
            indent = 2,
          },
          { title = "Recent Files", section = "recent_files", padding = 1, indent = 2 },
          { title = "Recent Projects", section = "projects", padding = 1, indent = 2 },
        },
      },
    },
  },
}
