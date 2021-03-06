{-# LANGUAGE ScopedTypeVariables #-}
import Numerical.OpenBLAS.BLAS.FFI


import Data.Vector.Storable.Mutable as M 
import Foreign.Ptr


main :: IO ()
main = do
  -- Just test that the symbol resolves
  openblas_set_num_threads_unsafe 7  
  v  :: IOVector Double <- M.replicate 10 1.0
  res <- unsafeWith v (\ptr-> cblas_ddot_unsafe 10 (castPtr ptr) 1 (castPtr ptr) 1) 
  putStrLn $ show res 
  putStrLn "it works!"
  