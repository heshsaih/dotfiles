-- #######################################################################################
-- Hyprland Lua config — converted from hyprland.conf (hyprlang).
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/configuring/
--
-- NOTE: when hyprland.lua exists, Hyprland loads it INSTEAD of hyprland.conf.
-- hyprlock / hypridle / hyprpaper still use their own hyprlang .conf files.
-- #######################################################################################


-- ################
-- ### MONITORS ###
-- ################

-- See https://wiki.hypr.land/configuring/core/monitors/
-- (was: monitor=,preferred,auto,auto)
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

-- https://wiki.hypr.land/configuring/core/config-options/#xwayland
hl.config({
    xwayland = {
        enabled            = true,
        force_zero_scaling = true,
    },
})


-- -------------------
-- ---- AUTOSTART ----
-- -------------------

-- See https://wiki.hypr.land/configuring/core/autostart/

-- (was: exec-once = ...)
hl.on("hyprland.start", function()
    hl.exec_cmd("noctalia")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("brightnessctl -r")
end)


-- -------------------------------
-- ---- ENVIRONMENT VARIABLES ----
-- -------------------------------

-- See https://wiki.hypr.land/configuring/core/environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("LC_NUMERIC", "C")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "x11")
hl.env("ELECTRON_FORCE_DEVICE_SCALE_FACTOR", "1")
hl.env("GDK_SCALE", "1")


-- #####################
-- ### LOOK AND FEEL ###
-- #####################

-- Refer to https://wiki.hypr.land/configuring/core/config-options/

-- https://wiki.hypr.land/configuring/core/config-options/#general
hl.config({
    general = {
        gaps_in  = 4,
        gaps_out = 4,

        border_size = 2,

        -- https://wiki.hypr.land/configuring/naming-conventions/ for info about colors
        col = {
            active_border   = "rgba(bed18caa)",
            inactive_border = "rgba(2d3025aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/configuring/extra/tearing/ before you turn this on
        allow_tearing = true,

        layout = "dwindle",
    },
})

-- https://wiki.hypr.land/configuring/core/config-options/#decoration
hl.config({
    decoration = {
        rounding       = 4,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a, -- was: rgba(1a1a1aee)
        },

        -- https://wiki.hypr.land/configuring/core/animations/#blur
        blur = {
            enabled  = true,
            size     = 3,
            passes   = 1,

            vibrancy = 0.1696,
        },
    },
})

-- https://wiki.hypr.land/configuring/core/animations/
hl.config({
    animations = {
        enabled = true, -- was: yes, please :)
    },
})

-- Default curves, see https://wiki.hypr.land/configuring/core/animations/#curves
--         NAME,           X0,   Y0,   X1,   Y1
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
-- NOTE: this param is "damping" in 0.57+; 0.56.x spelled it "dampening"
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 238.1191, damping = 24.21279333 })

-- Default animations, see https://wiki.hypr.land/configuring/core/animations/
--           NAME,          ONOFF, SPEED, CURVE/SPRING, [STYLE]
hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,     bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,   bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79,  bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39,  bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94,  bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21,  bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94,  bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,     bezier = "quick" })

-- Ref https://wiki.hypr.land/configuring/core/rules/workspace-rules/
-- ("Smart gaps" / "No gaps when only" rules from the old config were inert examples.)

-- See https://wiki.hypr.land/configuring/layouts/dwindle-layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/configuring/layouts/master-layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- https://wiki.hypr.land/configuring/core/config-options/#misc
hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


-- #############
-- ### INPUT ###
-- #############

-- https://wiki.hypr.land/configuring/core/config-options/#input
hl.config({
    input = {
        kb_layout  = "pl,us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
        },
    },
})

-- See https://wiki.hypr.land/configuring/core/binds/#gestures
hl.gesture({
    fingers   = 4,
    direction = "horizontal",
    action    = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/configuring/core/devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

hl.device({
    name        = "logitech-pro-x-1",
    sensitivity = -0.75,
})

hl.device({
    name        = "logitech-pro-x-wireless-2",
    sensitivity = -0.75,
})

hl.device({
    name        = "logitech-mx-master-3s",
    sensitivity = -0.75,
})


local mainMod = "SUPER"


-- ###################
-- ### KEYBINDINGS ###
-- ###################

-- Custom binds
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("wezterm"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))  -- was: fullscreen,0
hl.bind(mainMod .. " + Tab", hl.dsp.exec_cmd("rofi -show window"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))            -- was: fullscreen,1
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.swap({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("~/.config/hypr/scripts/reload.bash"))
-- Super alone toggles the panel: release flag fires it on a clean tap, while any
-- other key event while SUPER is held shadows it (0.57 keybind-system semantics)
hl.bind(mainMod .. " + Super_L", hl.dsp.exec_cmd("noctalia msg panel-toggle control-center"), { release = true })
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("noctalia msg panel-toggle session"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"))

-- Example binds, see https://wiki.hypr.land/configuring/core/binds/ for more
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("nautilus"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo()) -- dwindle
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
-- hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -s -e4 -n2 set 5%+"),               { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -s -e4 -n2 set 5%-"),               { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


-- ################################
-- ### WINDOWS AND WORKSPACES ###
-- ################################

-- See https://wiki.hypr.land/configuring/core/rules/ for more

-- Ignore maximize requests from all apps. You'll probably like this.
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name  = "gnome-calculator-floating",
    match = { class = "org.gnome.Calculator" },

    float = true,
})

hl.window_rule({
    name  = "noctalia-settings-floating",
    match = { class = "dev.noctalia.Noctalia" },

    float  = true,
    center = true,
    size   = "(monitor_w*0.3) (monitor_h*0.6)",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})


-- ##############################
-- ### SPLIT CONFIGURATION ###
-- ##############################

-- HyprEmoji config (was: source = ~/.config/hypremoji/hypremoji.conf —
-- Lua configs cannot source hyprlang files, so the rules were inlined).
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd("hypremoji"))
hl.window_rule({
    name  = "hypremoji",
    match = { title = "^(HyprEmoji)$" },

    float = true,
    move  = "1093 785",
    size  = "640 340",
})

-- (was: source = ~/.config/hypr/hyprland-gui.conf)
require("./hyprland-gui.lua")

-- (was: source = ~/.config/hypr/monitors.conf — nwg-displays writes both formats)
require("./monitors.lua")
