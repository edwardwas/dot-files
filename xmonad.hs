import Solarized

import Control.Concurrent.STM
import System.IO
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Layout.Tabbed
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Run(spawnPipe)

data Orientation = Vertical | Horizontal
    deriving (Eq,Show)

flipOrientation Vertical = Horizontal
flipOrientation Horizontal = Vertical

startup :: X ()
startup = do
    let screen1Width = 1920
        screen2Width = 1024
        screen1Ratio = screen1Width / (screen1Width + screen2Width)
        screen2Ratio = screen2Width / (screen1Width + screen2Width)
    spawn "xrdb /home/edward/.Xresources"
    spawn "bash ~/.screenlayout/layout2.sh"
    spawn "feh --bg-fill ~/.image"


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
    , title =? "game-test" --> doFloat
    , manageDocks
    ]

swapOrientaion orieVar = do
    liftIO $ atomically $ modifyTVar' orieVar flipOrientation
    newOri <- liftIO $ readTVarIO orieVar
    case newOri of
        Vertical -> spawn ".screenlayout/layout.sh && feh --bg-fill .image"
        Horizontal -> spawn ".screenlayout/horiz_layout.sh && feh --bg-fill .image"

myLogHook d = dynamicLogWithPP $ dzenPP {
    ppOutput = hPutStrLn d
  , ppLayout = const ""
                                     }
 
main = do
    orieVar <- newTVarIO Vertical
    --xmproc <- spawnPipe "/usr/bin/xmobar /home/edward/.xmobarrc"
    dzenPipe <- spawnPipe "dzen2 -p -xs 1 -ta c -e 'onstart=lower'"
    xmonad $ def
        { manageHook = myManageHook <+> manageHook def
        , focusedBorderColor = solarizedRed
        , normalBorderColor = solarizedBase01
        , borderWidth = 2
        , workspaces = myWorkspaces
        , terminal = "urxvt"
        , startupHook = startup
        , logHook = myLogHook dzenPipe
        , layoutHook = myLayout 
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((mod4Mask .|. controlMask, xK_w), spawn "firefox")
        , ((mod4Mask .|. controlMask, xK_v), spawn "pavucontrol")
        , ((mod4Mask, xK_f), swapOrientaion orieVar)
        ]
