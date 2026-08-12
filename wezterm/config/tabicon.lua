local wezterm = require("wezterm")

local function get_tab_icon(proc_path, default_title)
  -- Windows側のプロセス名
  local proc_name = proc_path and string.gsub(proc_path:match("[^\\]+$") or proc_path:match("[^/]+$") or "", ".exe", "") or ""

  -- WSL経由の場合は default_title を優先して判定対象にする
  local tab = proc_name
  if (proc_name == "wslhost" or proc_name == "wsl" or proc_name == "") and default_title and default_title ~= "" then
    tab = default_title:match("^%s*(%S+)") or default_title
  end

  local title = nil
  local icon = wezterm.nerdfonts.md_console_line
  local icon_color = "#50A0F0"

  local l_tab = string.lower(tab or "")
  local l_title = string.lower(default_title or "")
  local l_proc = string.lower(proc_name or "")

  -- AI Agent の判定 (node, antigravity, agy, claude, gemini などを包括的に拾う)
  if l_tab:find("antigravity") or l_tab:find("agy") or l_tab:find("claude") or l_tab:find("gemini") or
     l_title:find("antigravity") or l_title:find("agy") or l_title:find("claude") or l_title:find("gemini") or
     l_title:find("antigravity-cli") then
    title = "AI Agent"
    icon = wezterm.nerdfonts.md_robot or wezterm.nerdfonts.fa_robot
    icon_color = "#ff69b4"
  elseif tab == "pwsh" then
    title = "PowerShell 7"
    icon = wezterm.nerdfonts.md_console_line
    icon_color = "#50A0F0"
  elseif tab == "cmd" then
    title = "CommandPrompt"
    icon = wezterm.nerdfonts.md_console_line
    icon_color = "#101010"
  elseif tab == "btm" then
    title = "bottom"
    icon = wezterm.nerdfonts.cod_circuit_board
    icon_color = "#F0F0F0"
  elseif tab == "yazi" then
    title = "yazi"
    icon = wezterm.nerdfonts.cod_folder
    icon_color = "#F9F900"
  elseif tab == "broot" then
    title = "broot"
    icon = wezterm.nerdfonts.cod_folder
    icon_color = "#909000"
  elseif tab == "lazygit" then
    title = "Lazygit"
    icon = wezterm.nerdfonts.dev_git
    icon_color = "#25d580"
  elseif tab == "micro" then
    title = "micro"
    icon = wezterm.nerdfonts.md_alpha_m_box
    icon_color = "#2e3192"
  -- Neovim
  elseif tab == "nvim" or tab == "vim" or tab == "language_server_windows_x64" then
    title = "Neovim"
    icon = wezterm.nerdfonts.custom_neovim
    icon_color = "#30c030"
  elseif tab == "clangd" then
    title = "Neovim"
    icon = wezterm.nerdfonts.dev_c
    icon_color = "#085e9f"
  elseif tab == "rust-analyzer" or tab == "rust-analyzer-proc-macro-srv" then
    title = "Neovim"
    icon = wezterm.nerdfonts.dev_rust
    icon_color = "#f74b00"
  elseif tab == "python" or tab == "python3" then
    title = "Python"
    icon = wezterm.nerdfonts.dev_python
    icon_color = "#ffdd50"
  elseif tab == "lua-language-server" then
    title = "Neovim"
    icon = wezterm.nerdfonts.dev_lua
    icon_color = "#080884"
  elseif tab == "docker" or tab == "docker-compose" or tab == "podman" or l_title:find("docker") then
    title = "Docker"
    icon = wezterm.nerdfonts.linux_docker or wezterm.nerdfonts.fl_docker
    icon_color = "#0db7ed"
  elseif tab == "zsh" or tab == "bash" then
    title = tab
    icon = wezterm.nerdfonts.cod_terminal_bash
    icon_color = "#4eaa25"
  else
    -- カスタム定義がないものは WezTerm 標準のタイトルを使用
    title = (default_title and default_title ~= "") and default_title or (tab ~= "" and tab or "WSL")
    icon = wezterm.nerdfonts.cod_terminal_linux
    icon_color = "#e95420"
  end

  return {
    icon = icon,
    icon_color = icon_color,
    title = title,
  }
end

return get_tab_icon
