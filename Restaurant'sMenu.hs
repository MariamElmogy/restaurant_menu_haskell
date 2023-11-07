import Graphics.UI.Gtk
import Data.IORef
import System.IO.Unsafe (unsafePerformIO)
--------------------------------------------------------------
beginProg :: IO()
beginProg = do
  windowBegin <- windowNew
  set windowBegin [windowTitle := "WELCOME :)", containerBorderWidth := 10,
              windowDefaultWidth := 250, windowDefaultHeight := 250]
  
  buttonBegin <- buttonNew
  boxBegin <- labelBox "/home/reham/Desktop/begin.png" ""
  containerAdd buttonBegin boxBegin
  containerAdd windowBegin buttonBegin
  onClicked buttonBegin mainQuit
  onDestroy windowBegin mainQuit
  widgetShowAll windowBegin
  mainGUI
-------------------------------------------------------------
main :: IO ()
main = do
  initGUI

  beginProg

  window  <- windowNew
  set window [windowTitle := "FOOD MENU", containerBorderWidth := 10,
              windowDefaultWidth := 500, windowDefaultHeight := 500] 
  table   <- tableNew 8 4 False
  containerAdd window table

  button1 <- buttonNew
  box <- labelBox "/home/reham/Desktop/tea.jpg" "    Tea    5$"
  containerAdd button1 box

  label1 <- labelNew (Just "0")
  on button1 buttonActivated (buttonClickHandlerTea label1)
  tableAttachDefaults table button1 1 2 0 1 

  button2 <- buttonNew
  box2 <- labelBox "/home/reham/Desktop/juice.jpg" "    Juice    7$"
  containerAdd button2 box2
  on button2 buttonActivated (buttonClickHandlerJuice label1)
  tableAttachDefaults table button2 2 3 0 1

  button3 <- buttonNew
  box3 <- labelBox "/home/reham/Desktop/steak.jpg" "    Steak    40$"
  containerAdd button3 box3
  on button3 buttonActivated (buttonClickHandlerSteak label1)
  tableAttachDefaults table button3 1 2 1 2 

  button4 <- buttonNew
  box4 <- labelBox "/home/reham/Desktop/water.jpg" "    Water    1$"
  containerAdd button4 box4
  on button4 buttonActivated (buttonClickHandlerWater label1)
  tableAttachDefaults table button4 2 3 1 2

  button5 <- buttonNew
  box5 <- labelBox "/home/reham/Desktop/fish.jpg" "    Fish    25$"
  containerAdd button5 box5
  on button5 buttonActivated (buttonClickHandlerFish label1)
  tableAttachDefaults table button5 1 2 2 3 

  button6 <- buttonNew
  box6 <- labelBox "/home/reham/Desktop/frise.jpg" "    Fries    10$"
  containerAdd button6 box6
  on button6 buttonActivated (buttonClickHandlerFrise label1)
  tableAttachDefaults table button6 2 3 2 3

  image <- imageNewFromFile "/home/reham/Desktop/pattern5.png"
  tableAttachDefaults table image 3 4 0 5

  labelCalc <- labelNew (Just "TOTAL: ")
  tableAttachDefaults table labelCalc 1 2 4 5

  tableAttachDefaults table label1 2 3 4 5

  buttonReset <- buttonNewWithLabel "Reset"
  on buttonReset buttonActivated (buttonClickHandlerReset label1)
  tableAttachDefaults table buttonReset 3 4 5 6

  buttonQuit <- buttonNewWithLabel "Quit"
  onClicked buttonQuit mainQuit
  tableAttachDefaults table buttonQuit 3 4 6 7
  onDestroy window mainQuit
  widgetShowAll window
  mainGUI

labelBox :: FilePath -> String -> IO HBox
labelBox fn txt = do
  box   <- hBoxNew False 0
  set box [containerBorderWidth := 2]
  image <- imageNewFromFile fn
  label <- labelNew (Just txt)
  boxPackStart box image PackNatural 3
  boxPackStart box label PackNatural 3
  return box
----------------------------------------------
buttonClickHandlerTea :: Label ->  IO ()
buttonClickHandlerTea lbl = do
  str <- labelGetText lbl
  let x = read  str :: Integer
  labelSetText lbl (show (5 + x))
--------------------------------------------
buttonClickHandlerJuice :: Label ->  IO ()
buttonClickHandlerJuice lbl = do
  str <- labelGetText lbl
  let x = read  str :: Integer
  labelSetText lbl (show (7 + x))
--------------------------------------------
buttonClickHandlerSteak :: Label ->  IO ()
buttonClickHandlerSteak lbl = do
  str <- labelGetText lbl
  let x = read  str :: Integer
  labelSetText lbl (show (40 + x))
---------------------------------------------
buttonClickHandlerWater :: Label ->  IO ()
buttonClickHandlerWater lbl = do
  str <- labelGetText lbl
  let x = read  str :: Integer
  labelSetText lbl (show (1 + x))
---------------------------------------------
buttonClickHandlerFish :: Label ->  IO ()
buttonClickHandlerFish lbl = do
  str <- labelGetText lbl
  let x = read  str :: Integer
  labelSetText lbl (show (25 + x))
---------------------------------------------
buttonClickHandlerFrise :: Label ->  IO ()
buttonClickHandlerFrise lbl = do
  str <- labelGetText lbl
  let x = read  str :: Integer
  labelSetText lbl (show (10 + x))
---------------------------------------------
buttonClickHandlerReset :: Label ->  IO ()
buttonClickHandlerReset lbl = do
  str <- labelGetText lbl
  let x = read  str :: Integer
  labelSetText lbl(show(x - x))