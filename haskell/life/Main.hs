-- not my own code, this is just a bunch of minor modifications to
-- http://yannesposito.com/Scratch/en/blog/Haskell-OpenGL-Mandelbrot/

import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT
import Data.IORef

-- see section 3.2 of http://www.haskell.org/haskellwiki/Performance/Data_types
-- this gives a pretty good speed boost
data Complex = C {-# UNPACK #-} !GLfloat {-# UNPACK #-} !GLfloat

instance Num Complex where
  fromInteger n = C (fromIntegral n) 0.0
  (C a b) + (C c d) = C (a + c) (b + d)
  (C a b) * (C c d) = C (a*c - b*d) (a*d + b*c)
  abs (C x y) = C (sqrt (x*x + y*y)) 0.0
  signum (C x y) = C (signum x) 0.0

complex :: GLfloat -> GLfloat -> Complex
complex x y = C x y

real :: Complex -> GLfloat
real (C x y) = x

im :: Complex -> GLfloat
im (C x y) = y

magnitude :: Complex -> GLfloat
magnitude = real . abs -- function composition

width = 1366 :: GLfloat
height = 768 :: GLfloat

main :: IO ()
main = do
  (progName, _) <- getArgsAndInitialize
  initialDisplayMode $= [DoubleBuffered]
  initialWindowSize $= (Size 1366 768)
  createWindow "Mandelbrot"
  fullScreen
  displayCallback $= display
  mainLoop

display = do
  clear [ColorBuffer]
  loadIdentity
  -- push, execute the callback argument, pop
  -- slow, consider unsafePreservingMatrix for more speed
  preservingMatrix drawMandelbrot
  swapBuffers

allPoints :: [(GLfloat, GLfloat, Color3 GLfloat)]
allPoints = [ (x/width, y/height, colorFromValue $ mandel x y) |
                  x <- [-width, -width+0.5 .. width],
                  y <- [-height, -height+0.5 .. height]]

colorFromValue :: Int -> Color3 GLfloat
colorFromValue n =
  let
    t :: Int -> GLfloat
    t i = 0.5 + 0.5*cos(fromIntegral i / 10)
  in
    --Color3 (t n) (t (n+5)) (t (n+10)) -- brown
    --Color3 (t n) (t (n+10) (t (n+5)) -- pink
    --Color3 (t (n+10)) (t n) (t (n+5)) -- green
    Color3 (t (n+10)) (t (n+5)) (t n) -- blue

mandel x y =
  let r = 2.0 * 1366 * (1 / sqrt(1366*1366 + 768*768)) * x / width
      i = 2.0 * 768 * (1 / sqrt(1366*1366 + 768*768)) * y / height
  in
      f (complex r i) (complex 0 0) 16

-- The Mandelbrot set is the set of complex number c such that the following sequence does not escape to infinity.
-- fc(z) = z^2 + c
-- 0 → fc(0) → fc(fc(0)) → ⋯ → fcn(0) → ⋯

f :: Complex -> Complex -> Int -> Int
-- n is number of tries. this is a hacky way to test if the sequence goes to infinity
f c z 0 = 0
f c z n = if (magnitude z > 2) -- r and i range from -2 to 2 in mandel x y
          then n -- change this to 200 and see what happens
          -- clearly if we use n we get a better visualization
          -- since different complex numbers "fail" at different points
          else f c ((z*z) + c) (n-1)

drawMandelbrot =
  renderPrimitive Points $ do
    mapM_ drawColoredPoint allPoints
  where
    drawColoredPoint (x,y,c) = do
      color c
      vertex $ Vertex3 x y 0