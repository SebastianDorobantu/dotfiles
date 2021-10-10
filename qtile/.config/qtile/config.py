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
    Key([mod], "Return",lazy.spawn('rofi -show drun -show-icons'),desc='Run Launcher'),
    Key([], "Print", lazy.spawn("deepin-screenshot")),
    Key([mod], "w", lazy.spawn("alacritty -e nvim /home/seba/MEGA/wiki/index.md"))
    ]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]



#Group Creation###############################################################

groups=[]

group_names=['WEB', 'TERM', 'VIM', 'PHOTO', 'FILES', 'CHAT', 'SOUND', 'ETC']
group_layouts = ["columns", "verticaltile", "verticaltile", "verticaltile", "columns", "columns", "columns", "columns", "columns", "columns"]
group_labels = ["", "", "", "", "", "", "", ""]



for i,nume in enumerate(group_names, 0):
    keys.append(Key([mod], str(i+1), lazy.group[nume].toscreen()))
    keys.append(Key([mod, "shift"], str(i+1), lazy.window.togroup(nume)))
    groups.append(
            Group(
                name=group_names[i],
                layout=group_layouts[i],
                label=group_labels[i]
                ))



#Layouts########################################################################
layouts = [
    layout.Columns(
        border_focus="#7D15FF",
        border_normal='#312E79',
        margin=6,
        margin_on_single=2),
    layout.MonadTall(broder_focus="#7800FF",margin=5 ),
    layout.VerticalTile(
        border_focus="#7D15FF",
        border_normal='#312E79',
        margin=6  ) ,
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
                                active='#9045ff',
                                highlight_method='line' ,
                                disable_drag='True',
                                fontsize=30,
                                this_current_screen_border='#9045ff',
                                other_current_screen_border='#9045ff',
                                this_screen_border='#c700c7',
                                other_screen_border='#c700c7',
                                block_highlight_text_color='#FFFFFF'
                               ),

                widget.Prompt(),
                widget.WindowName(
                    font="Ubuntu Mono Bold"
                                 ),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff") },
                    name_transform=lambda name: name.upper()
                            ),
                #widget.CurrentLayoutIcon(scale=0.7),
                #widget.Memory()
                widget.Clock(
                    format='%I:%M:%S %p',
                    font="Ubuntu Mono Bold",
                    fontsize=17
                            ),
                widget.Spacer(60),


                # DE AICI IS CONFIGURI FURATE DE LA PAUL
                widget.TextBox(
                    text="",
                    background="#37323F",
                    foreground="#9045ff",
                    padding=-44,
                    fontsize=231
                    ),
                widget.TextBox(
                text = "",
                padding = 2,
                background="#9045ff",
                foreground="#ffffff",
                fontsize="20"
                              ),

                widget.OpenWeather(
                    font="Ubuntu Mono Bold",
                    fontsize=17,
                    location="Timisoara",
                    foreground="#ffffff",
                    background="#9045ff",
                    format='{location_city}: {main_temp} °{units_temperature}',
                    update_interval=60
                    ),
                widget.TextBox(
                    text="",
                    background="#9045ff",
                    foreground="#37323F",
                    padding=-44,
                    fontsize=231
                    ),

                widget.CPU(
                        font="Ubuntu Mono Bold",
                    fontsize=17,
                        format='CPU usage: {load_percent}%',
                        background="#37323F",
                        padding=5,
                        foreground="#ffffff",
                        ),
                widget.Memory(
                    font="Ubuntu Mono Bold",
                    fontsize=17,
                    foreground="#ffffff",
                    format='RAM usage: {MemPercent: .0f}%',
                    measure_mem="G",
                    background="#37323F",
                    padding=5
                    ),


                widget.TextBox(
                    text="",
                    background="#37323F",
                    foreground="#9045ff",
                    padding=-44,
                    fontsize=231
                    ),
                widget.TextBox(
                    text="",
                    background="#9045ff",
                    foreground="#37323F",
                    padding=-44,
                    fontsize=231
                    ),


                # PANA AICI IS CONFIGURI FURATE DE LA PAUL
                widget.Clock(
                        font="Ubuntu Mono Bold",
                    fontsize=17,
                        format='%A %d %b'),
                widget.Systray(
                                padding=10,
                        ),
                widget.Spacer(10),



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
    Match(wm_class='megasync'),  # PacketTracer
    Match(wm_class='roxterm'),  # Gns3 Terminal
    Match(wm_class='VirtualBox Manager'),  # VirtualBox
    Match(wm_class='VirtualBox Machine'),  # VirtualBox

])
auto_fullscreen = True
focus_on_window_activation = "smart"



wmname = "LG3D"
