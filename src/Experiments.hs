module Experiments (plotSin, simulateProjectile) where

import Graphics.Gnuplot.Simple (plotFunc)
import Graphics.Gloss (Display(InWindow), black, red, color, Picture(ThickCircle, Translate), simulate)

-- Gnuplot example
plotSin :: IO ()
plotSin = do
    plotFunc [] [0.0, 0.1..10.0] (sin :: Double -> Double)
    putStrLn "Press enter to exit..."
    _ <- getLine
    return ()

-- Gloss example
displayMode :: Display
displayMode = InWindow "Projectile Simulation" (800, 600) (20, 20)

rate :: Int
rate = 30

disk :: Float -> Picture
disk radius = ThickCircle (radius / 2) radius

redDisk :: Picture
redDisk = color red (disk 25)

type Position = (Float, Float)
type Velocity = (Float, Float)
type State = (Position, Velocity)

initialState :: State
initialState = ((-200, 100), (60, 0))

displayFunc :: State -> Picture
displayFunc ((x, y), _) = Translate x y redDisk

updateFunc :: Float -> State -> State
updateFunc dt ((x, y), (vx, vy))
    = ((x + vx * dt, y + vy * dt)
      ,(         vx, vy - 9.8 * dt))

simulateProjectile :: IO ()
simulateProjectile = simulate displayMode black rate initialState displayFunc
                     (\_ -> updateFunc)
