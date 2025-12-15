local function ssh(group, label, host, port, username, identityfile, proxycommand, extra_ssh_option)
  local domain = {
    name = group .. ':' .. label,
    remote_address = host .. ':' .. tostring(port),
    multiplexing = 'None',
    assume_shell = 'Posix',
  }

  if username and #username > 0 then
    domain.username = username
  end

  local opt = {}
  if identityfile and #identityfile > 0 then
    opt.identityfile = identityfile
  end
  if proxycommand and #proxycommand > 0 then
    opt.proxycommand = proxycommand
  end
  if extra_ssh_option then
    for k, v in pairs(extra_ssh_option) do
      opt[k] = v
    end
  end
  if next(opt) ~= nil then
    domain.ssh_option = opt
  end

  return domain
end

local ssh_domains = {
  -- Personal
  ssh('Personal', '172.18.1.51(owent)', '172.18.1.51', 36000, 'owent'),
  ssh('Personal', '172.22.1.10(owent)', '172.22.1.10', 36000, 'owent', 'D:/workspace/id_ed25519'),
  ssh('Personal', '172.23.1.10(owent)', '172.23.1.10', 36000, 'owent', 'D:/workspace/id_ed25519'),
  ssh('Personal', '172.23.2.10(owent)', '172.23.2.10', 36000, 'owent', 'D:/workspace/id_ed25519'),
  ssh('Personal', '172.25.1.10(owent)', '172.25.1.10', 36000, 'owent'),
  ssh('Personal', 'home.x-ha.com(owent)', 'home.x-ha.com', 36000, 'owent', 'D:/workspace/id_ed25519'),
  ssh('Personal', 'media.x-ha.com(owent)', 'media.x-ha.com', 36000, 'owent', 'D:/workspace/id_ed25519'),
  ssh('Personal', 'vps.82696.com(owent)', 'vps.82696.com', 18022, 'owent'),
  ssh('Personal', 'vr-cn1.shkits.com(owent)', 'vr-cn1.shkits.com', 36000, 'owent', 'D:/workspace/id_ed25519'),
  ssh('Personal', 'vr-cn2.shkits.com(owent)', 'vr-cn2.shkits.com', 36000, 'owent', 'D:/workspace/id_ed25519'),
  ssh('Personal', 'vr-cn3.shkits.com(owent)', 'vr-cn3.shkits.com', 36000, 'owent', 'D:/workspace/id_ed25519'),
  ssh('Personal', 'vr-h.shkits.com(owent)', 'vr-h.shkits.com', 36000, 'owent'),
  ssh('Personal', 'vr-l.shkits.com(owent)', 'vr-l.shkits.com', 36000, 'owent', 'D:/workspace/id_ed25519'),
  ssh('Personal', 'vr-l2.shkits.com(owent)', 'vr-l2.shkits.com', 36000, 'owent', 'D:/workspace/id_ed25519'),
  ssh('Personal', 'vr-l3.shkits.com(owent)', 'vr-l3.shkits.com', 36000, 'owent', 'D:/workspace/id_ed25519'),
  ssh('Personal', 'vr-sg.shkits.com(owent)', 'vr-sg.shkits.com', 36000, 'owent', 'D:/workspace/id_ed25519'),
  ssh('Personal', 'vr-us1.shkits.com(owent)', 'vr-us1.shkits.com', 36000, 'owent', 'D:/workspace/id_ed25519'),
  ssh('Personal', 'vr-us2.shkits.com(owent)', 'vr-us2.shkits.com', 36000, 'owent', 'D:/workspace/id_ed25519'),
  ssh('Personal', 'vr-wdw.shkits.com (owent)', 'vr-wdw.shkits.com', 18022, 'owent', 'D:/workspace/id_ed25519'),

  -- Dreame.cloud
  ssh('Dreame.cloud', 'aliyun-sh-01.m-oa.com(owent)', 'aliyun-sh-01.m-oa.com', 36000, 'owent'),
  ssh('Dreame.cloud', 'aliyun-hk-01.m-oa.com(owent)', 'aliyun-hk-01.m-oa.com', 36000, 'owent'),
  ssh('Dreame.cloud', 'aliyun-hk-02.m-oa.com(owent)', 'aliyun-hk-02.m-oa.com', 36000, 'owent'),
  ssh('Dreame.cloud', 'aliyun-sg-01.m-oa.com(owent)', 'aliyun-sg-01.m-oa.com', 36000, 'owent'),
  ssh('Dreame.cloud', 'aliyun-sg-02.m-oa.com(owent)', 'aliyun-sg-02.m-oa.com', 36000, 'owent'),
  ssh('Dreame.cloud', 'aliyun-jp-01.m-oa.com(owent)', 'aliyun-jp-01.m-oa.com', 36000, 'owent'),
  ssh('Dreame.cloud', 'aliyun-jp-02.m-oa.com(owent)', 'aliyun-jp-02.m-oa.com', 36000, 'owent'),

  -- Dreame.devnet.local
  ssh('Dreame.devnet', '10.64.0.1(owent@router-main)', '10.64.0.1', 36000, 'owent', 'D:/workspace/keys/id_ed25519.it'),
  ssh('Dreame.devnet', '10.64.8.2(owent@ci-linux)', '10.64.8.2', 36000, 'owent', 'D:/workspace/keys/id_ed25519.it'),
  ssh('Dreame.devnet', '10.64.0.254(owent@debian-template)', '10.64.0.254', 36000, 'owent'),
  ssh('Dreame.devnet', '10.64.3.1(owent@it-auth)', '10.64.3.1', 36000, 'owent'),
  ssh('Dreame.devnet', '10.64.3.64(owent@it-db)', '10.64.3.64', 36000, 'owent'),
  ssh('Dreame.devnet', '10.64.3.128(owent@it-s3)', '10.64.3.128', 36000, 'owent'),
  ssh('Dreame.devnet', '10.64.5.1(owent@it-vcs)', '10.64.5.1', 36000, 'owent'),
  ssh('Dreame.devnet', '10.68.0.0(owent@k8s-template)', '10.68.0.0', 36000, 'owent'),
  ssh('Dreame.devnet', '10.68.0.1(owent@k8s-master-01)', '10.68.0.1', 36000, 'owent'),
  ssh('Dreame.devnet', '10.68.0.2(owent@k8s-master-02)', '10.68.0.2', 36000, 'owent'),
  ssh('Dreame.devnet', '10.68.0.3(owent@k8s-master-03)', '10.68.0.3', 36000, 'owent'),
  ssh('Dreame.devnet', '10.68.64.1(owent@k8s-agent-01)', '10.68.64.1', 36000, 'owent'),
  ssh('Dreame.devnet', '10.68.64.2(owent@k8s-agent-02)', '10.68.64.2', 36000, 'owent'),

  -- Dreame.devnet.remote
  ssh('Dreame.devnet', 'public-gateway.m-oa.com(owent@router-main)', 'public-gateway.m-oa.com', 36000, 'owent'),
  ssh('Dreame.devnet', 'router-main-ssh.w-oa.com(owent)', 'router-main-ssh', 36000, 'owent', nil,
    'cloudflared access ssh --hostname router-main-ssh.w-oa.com'),
  ssh('Dreame.devnet', 'router-vm-ssh.w-oa.com(root)', 'router-vm-ssh.w-oa.com', 36000, 'root', nil,
    'cloudflared access ssh --hostname router-vm-ssh.w-oa.com'),

  -- Dreame.vm-host
  ssh('Dreame.vm-host', 'public-gateway.m-oa.com(root@router-vm)', 'public-gateway.m-oa.com', 36001, 'root'),
  ssh('Dreame.vm-host', 'public-gateway.m-oa.com(root@vm-01)', 'public-gateway.m-oa.com', 36002, 'root'),


  -- Tencent.intlgame
  ssh('Tencent.intlgame', 'jms.devops.intlgame.com(owentou)', 'jms.devops.intlgame.com', 2222, 'owentou', nil, nil, {
    forwardagent = 'yes',
    forwardx11 = 'yes',
  }),

  -- Tencent.mnet
  ssh('Tencent.mnet', 'ieg.mnet2.com(owentou)', 'ieg.mnet2.com', 36000, 'owentou'),
}


local wezterm = require 'wezterm'
local act = wezterm.action

local rename_tab = act.PromptInputLine {
  description = 'Rename tab',
  action = wezterm.action_callback(function(window, pane, line)
    if line and #line > 0 then
      window:active_tab():set_title(line)
    end
  end),
}

return {
  font = wezterm.font_with_fallback({
    { family = 'Maple Mono Normal NF CN' },
    { family = '等距更纱黑体 SC' },
  }),
  font_size = 16.0,

  initial_cols = 160,
  initial_rows = 40,

  color_schemes = {
    PencilDark = {
      foreground = '#f1f1f1',
      background = '#212121',
      cursor_bg = '#20bbfc',
      cursor_border = '#20bbfc',
      cursor_fg = '#212121',
      ansi = {
        '#212121',
        '#c30771',
        '#10a778',
        '#a89c14',
        '#008ec4',
        '#523c79',
        '#20a5ba',
        '#d9d9d9',
      },
      brights = {
        '#424242',
        '#fb007a',
        '#5fd7af',
        '#f3e430',
        '#20bbfc',
        '#6855de',
        '#4fb8cc',
        '#f1f1f1',
      },
    },
  },
  color_scheme = 'PencilDark',

  audible_bell = 'SystemBeep',

  -- Tabby: altIsMeta = true
  send_composed_key_when_left_alt_is_pressed = false,
  send_composed_key_when_right_alt_is_pressed = false,

  -- Tabby 默认 profile: local:powershell-core
  default_prog = { 'pwsh.exe', '-NoLogo' },

  keys = {
    -- copy/paste
    { key = 'C',          mods = 'CTRL|SHIFT', action = act.CopyTo 'Clipboard' },
    { key = 'V',          mods = 'CTRL|SHIFT', action = act.PasteFrom 'Clipboard' },
    { key = 'Insert',     mods = 'SHIFT',      action = act.PasteFrom 'Clipboard' },

    -- zoom
    { key = '=',          mods = 'CTRL',       action = act.IncreaseFontSize },
    { key = '=',          mods = 'CTRL|SHIFT', action = act.IncreaseFontSize },
    { key = '-',          mods = 'CTRL',       action = act.DecreaseFontSize },
    { key = '-',          mods = 'CTRL|SHIFT', action = act.DecreaseFontSize },
    { key = '0',          mods = 'CTRL',       action = act.ResetFontSize },

    -- search: Ctrl-Shift-F
    { key = 'F',          mods = 'CTRL|SHIFT', action = act.Search { CaseInSensitiveString = '' } },

    -- new window/tab
    { key = 'N',          mods = 'CTRL|SHIFT', action = act.SpawnWindow },
    { key = 'T',          mods = 'CTRL|SHIFT', action = act.SpawnTab 'CurrentPaneDomain' },

    -- fullscreen: F11 / Alt-Enter
    { key = 'F11',        mods = 'NONE',       action = act.ToggleFullScreen },
    { key = 'Enter',      mods = 'ALT',        action = act.ToggleFullScreen },

    -- close tab
    { key = 'W',          mods = 'CTRL|SHIFT', action = act.CloseCurrentTab { confirm = true } },

    -- rename tab: Ctrl-Shift-R
    { key = 'R',          mods = 'CTRL|SHIFT', action = rename_tab },

    -- next/prev tab
    { key = 'Tab',        mods = 'CTRL',       action = act.ActivateTabRelative(1) },
    { key = 'Tab',        mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) },
    { key = 'RightArrow', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(1) },
    { key = 'LeftArrow',  mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) },

    -- move tab
    { key = 'PageUp',     mods = 'CTRL|SHIFT', action = act.MoveTabRelative(-1) },
    { key = 'PageDown',   mods = 'CTRL|SHIFT', action = act.MoveTabRelative(1) },

    -- tab 1..10 (Alt-1..0)
    { key = '1',          mods = 'ALT',        action = act.ActivateTab(0) },
    { key = '2',          mods = 'ALT',        action = act.ActivateTab(1) },
    { key = '3',          mods = 'ALT',        action = act.ActivateTab(2) },
    { key = '4',          mods = 'ALT',        action = act.ActivateTab(3) },
    { key = '5',          mods = 'ALT',        action = act.ActivateTab(4) },
    { key = '6',          mods = 'ALT',        action = act.ActivateTab(5) },
    { key = '7',          mods = 'ALT',        action = act.ActivateTab(6) },
    { key = '8',          mods = 'ALT',        action = act.ActivateTab(7) },
    { key = '9',          mods = 'ALT',        action = act.ActivateTab(8) },
    { key = '0',          mods = 'ALT',        action = act.ActivateTab(9) },

    -- split: Ctrl-Shift-S (right), Ctrl-Shift-D (bottom)
    { key = 'S',          mods = 'CTRL|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'D',          mods = 'CTRL|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },

    -- pane nav: Ctrl-Alt-Arrow
    { key = 'RightArrow', mods = 'CTRL|ALT',   action = act.ActivatePaneDirection 'Right' },
    { key = 'LeftArrow',  mods = 'CTRL|ALT',   action = act.ActivatePaneDirection 'Left' },
    { key = 'UpArrow',    mods = 'CTRL|ALT',   action = act.ActivatePaneDirection 'Up' },
    { key = 'DownArrow',  mods = 'CTRL|ALT',   action = act.ActivatePaneDirection 'Down' },

    -- pane maximize: Ctrl-Alt-Enter
    { key = 'Enter',      mods = 'CTRL|ALT',   action = act.TogglePaneZoomState },

    -- scroll
    { key = 'PageUp',     mods = 'CTRL',       action = act.ScrollToTop },
    { key = 'PageDown',   mods = 'CTRL',       action = act.ScrollToBottom },
    { key = 'PageUp',     mods = 'ALT',        action = act.ScrollByPage(-1) },
    { key = 'PageDown',   mods = 'ALT',        action = act.ScrollByPage(1) },

    -- command selector: Ctrl-Shift-P
    { key = 'P',          mods = 'CTRL|SHIFT', action = act.ActivateCommandPalette },

    -- command selector: Ctrl-Shift-T
    { key = 'T',          mods = 'CTRL|SHIFT', action = act.ShowLauncher },
  },

  mouse_bindings = {
    -- Tabby: pasteOnMiddleClick = true
    { event = { Down = { streak = 1, button = 'Middle' } }, mods = 'NONE', action = act.ActivateCommandPalette },
    -- Ctrl + Right = launcher
    -- Use mouse button release to avoid the release-click immediately dismissing the launcher
    { event = { Down = { streak = 1, button = 'Right' } },  mods = 'CTRL', action = act.Nop },
    { event = { Up = { streak = 1, button = 'Right' } },    mods = 'CTRL', action = act.ShowLauncher },
    -- Right = paste
    { event = { Down = { streak = 1, button = 'Right' } },  mods = 'NONE', action = act.PasteFrom 'Clipboard' },
    { event = { Up = { streak = 1, button = 'Right' } },    mods = 'NONE', action = act.Nop },
  },

  ssh_domains = ssh_domains,
}
