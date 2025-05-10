module Main where

import Experiments (plotSin, simulateProjectile)

main :: IO ()
main = do
    putStrLn "Experiment start!"
    Experiments.simulateProjectile
