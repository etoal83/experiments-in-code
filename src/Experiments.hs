module Experiments (plotSin) where

import Graphics.Gnuplot.Simple (plotFunc)

plotSin :: IO ()
plotSin = do
    plotFunc [] [0.0, 0.1..10.0] (sin :: Double -> Double)
    putStrLn "Press enter to exit..."
    _ <- getLine
    return ()
