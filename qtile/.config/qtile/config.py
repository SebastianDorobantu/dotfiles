# +---------------------------------------------+
# | QTILE CONFIG FILE ---by-Sebastian-Dorobantu |
# +---------------------------------------------+


from typing import List  # noqa: F401
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

mod = "mod4"
terminal = 'alacritty'

#####KEYS#######################################################################
keys = [
    # Switch between windows#####################################
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows###########################################
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows############################################
    Key([mod, "control"], "h", lazy.layout.grow_left(),desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),

    # From floating##########################################
    Key([mod], "Up", lazy.window.toggle_maximize(),lazy.window.disable_floating()),
    Key([mod], "Down", lazy.window.toggle_minimize()),
    Key([mod, "control"], "Up", lazy.window.toggle_fullscreen()),

    # Toggle between layouts################################
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),

    # Actions########################################
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "x", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "F5", lazy.restart(),lazy.spawn('xrandr -s 0'), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Spawns###############################################
    Key([mod], "r", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "f", lazy.spawncmd(),desc="Spawn a command using a prompt widget"),
    Key([mod], "Return",lazy.spawn('rofi -show drun'),desc='Run Launcher'),
    Key([], "Print", lazy.spawn("deepin-screenshot")),
    Key([mod], "w",lazy.spawn('alacritty -e nvim /home/seba/Dropbox/wiki/index.md' ),desc='Start vimwiki')
    ]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]



#Group Creation#################################################################
group_names=['WEB','VIM','SOUND','ETC']

groups = [Group(name) for name in group_names]

for i,name in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))



#Layouts########################################################################
layouts = [
    layout.Columns(border_focus="#7D15FF",
        border_normal='#312E79',
        margin=6,
        margin_on_single=4),
    layout.MonadTall(broder_focus="#7800FF",margin=5 ),
    layout.RatioTile(),
    layout.Tile()
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [   widget.Spacer(4),
                widget.GroupBox(inactive='#FFFFFF' ,
                                foreground='#03FF00',
                                active='#A28943',
                                highlight_method='block' ,
                                this_current_screen_border='#5317AC',
                                block_highlight_text_color='#344FAC'
                               ),

                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff") },
                    name_transform=lambda name: name.upper()
                            ),
                #widget.CurrentLayoutIcon(scale=0.7),
                #widget.Systray(),
                #widget.Memory()
                widget.Clock(format='%I:%M:%S %p',
                            ),
                widget.Spacer(797),
                widget.Clock(format='%A %d %b'),
                widget.Spacer(7),
            ],
                      34, #size
                      background="#37323F",
                      margin=[20,27,0,27] # [up,left,down,right]

                   ),
          )
          ]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry

    #Defined by me
    Match(wm_class='PacketTracer'),  # PacketTracer
    Match(wm_class='VirtualBox Manager'),  # VirtualBox
    Match(wm_class='VirtualBox Machine'),  # VirtualBox

])
auto_fullscreen = True
focus_on_window_activation = "smart"



wmname = "LG3D"
