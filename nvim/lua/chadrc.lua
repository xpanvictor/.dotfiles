-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "bearded-arc",
	transparency = true,
  -- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
  nvdash = {
    load_on_startup = true,
    header = {
"`8.`8888.      ,8' 8 888888888o      .8.          b.             8 ",
" `8.`8888.    ,8'  8 8888    `88.   .888.         888o.          8 ",
"  `8.`8888.  ,8'   8 8888     `88  :88888.        Y88888o.       8 ",
"   `8.`8888.,8'    8 8888     ,88 . `88888.       .`Y888888o.    8 ",
"    `8.`88888'     8 8888.   ,88'.8. `88888.      8o. `Y888888o. 8 ",
"    .88.`8888.     8 888888888P'.8`8. `88888.     8`Y8o. `Y88888o8 ",
"   .8'`8.`8888.    8 8888      .8' `8. `88888.    8   `Y8o. `Y8888 ",
"  .8'  `8.`8888.   8 8888     .8'   `8. `88888.   8      `Y8o. `Y8 ",
" .8'    `8.`8888.  8 8888    .888888888. `88888.  8         `Y8o.` ",
".8'      `8.`8888. 8 8888   .8'       `8. `88888. 8            `Yo ",
    },
  },
  hl_override = {
    NvDashAscii = { fg = "cyan", bg = "none" },
  }
}

M.plugins = "plugins"

return M
