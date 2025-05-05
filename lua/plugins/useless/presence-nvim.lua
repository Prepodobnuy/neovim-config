-- discord rich presence plugin
-- https://github.com/andweeb/presence.nvim
-- actually useless
return {
  'andweeb/presence.nvim',
  config = function()
    require('presence').setup {
      auto_update = true,
      neovim_image_text = 'ПИСЬКИ ЧЛЕНЫ КАКИ КАКАШКИ',
      main_image = 'neovim',
      log_level = nil,
      debounce_timeout = 10,
      enable_line_number = false,
      blacklist = {},
      buttons = true,
      file_assets = {},
      show_time = true,

      editing_text = 'Editing %s',
      file_explorer_text = 'Browsing %s',
      git_commit_text = 'Committing changes',
      plugin_manager_text = 'Managing plugins',
      reading_text = 'Reading %s',
      workspace_text = 'Жечка Дырова <3',
      line_number_text = 'Line %s out of %s',
    }
  end,
}
