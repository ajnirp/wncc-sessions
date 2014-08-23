--http://www.haskell.org/haskellwiki/OpenGLTutorial1

import Graphics.UI.GLUT
import Bindings

main :: IO ()
main = do
  (_progName, _args) <- getArgsAndInitialize
  _window <- createWindow "Clock"
  initialDisplayMode $= [WithDepthBuffer, DoubleBuffered]
  displayCallback $= display
  reshapeCallback $= Just reshape
  keyboardMouseCallback $= Just keyboardMouse
  mainLoop

-- Other PrimitiveMode values
-- http://hackage.haskell.org/package/OpenGL-2.9.2.0/docs/Graphics-Rendering-OpenGL-GL-BeginEnd.html#v:renderPrimitive

-- $= :: s a -> a -> IO ()
-- displayCallback is a globally defined StateVar