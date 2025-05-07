module Main where

import Experiments (plotSin)

main :: IO ()
main = do
    putStrLn "Experiment start!"
    Experiments.plotSin
