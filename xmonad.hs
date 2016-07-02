import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Layout.Spacing
import XMonad.Hooks.SetWMName
import XMonad.Layout.Gaps
import XMonad.Layout.Tabbed
import Solarized
import Control.Concurrent.STM

data Orientation = Vertical | Horizontal
    deriving (Eq,Show)

flipOrientation Vertical = Horizontal
flipOrientation Horizontal = Vertical

startup :: X ()
startup = do
    spawn ".screenlayout/layout.sh && feh --bg-fill .image"
    spawn "xrdb /home/edward/.Xresources"
    spawn "xmobar"
    spawn "stalonetray"
    spawn "dropbox"
--  spawn "xcompmgr"
--  spawn "bash /home/edward/.start_up/sudo_start.sh"


myLayout = gaps [(U,16)] $ avoidStruts (tiled ||| simpleTabbed ||| Mirror tiled )
    where  
    --default tiling algorithm partitions the screen into two panes  
    tiled = spacing 10 $ Tall nmaster delta ratio  
    --The default number of windows in the master pane  
    nmaster = 1  
    --Ratio that the master screen takes up
    ratio = 1/2
    --Percent of screen to increment by when resizing panes  
    delta = 5/100  

myWorkspaces = map show [1..10 :: Int]

myManageHook = composeAll
    [ title =? "floatMe" --> doFloat
    , title =? "MiniMetro" --> doFloat
    , manageDocks
    ]

swapOrientaion orieVar = do
    liftIO $ atomically $ modifyTVar' orieVar flipOrientation
    newOri <- liftIO $ readTVarIO orieVar
    case newOri of
        Vertical -> spawn ".screenlayout/layout.sh && feh --bg-fill .image"
        Horizontal -> spawn ".screenlayout/horiz_layout.sh && feh --bg-fill .image"
 
main = do
    orieVar <- newTVarIO Vertical
    xmproc <- spawnPipe "/usr/bin/xmobar /home/edward/.xmobarrc"
    xmonad $ def
        { manageHook = myManageHook <+> manageHook def
    , focusedBorderColor = solarizedRed
    , normalBorderColor = solarizedBase01
    , borderWidth = 2
    , workspaces = myWorkspaces
        , terminal = "urxvt"
        , startupHook = startup
        , layoutHook = myLayout 
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((mod4Mask .|. controlMask, xK_w), spawn "firefox")
        , ((mod4Mask .|. controlMask, xK_v), spawn "pavucontrol")
        , ((mod4Mask, xK_f), swapOrientaion orieVar)
        , ((0, 0x1008ff14), spawn "mocp -G") --Play/Pause Music
        , ((0, 0x1008ff17), spawn "mocp -f") --Next Song Music
        , ((0, 0x1008ff16), spawn "mocp -r") --Previous Song Music
        , ((0, 0x1008ff12), spawn "mocp -P; mocp -Q '%song by %artist' | espeak ; mocp -U") --Speak Song
        , ((0, 0x1008ff13), spawn "amixer set Master 10%+") --Reduce Volume
        , ((0, 0x1008ff11), spawn "amixer set Master 10%-") --Reduce Volume
        , ((0, xK_Print), spawn "scrot")
        ]
