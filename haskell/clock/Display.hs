module Display (display) where

import Graphics.UI.GLUT

circlePoints :: [(GLfloat,GLfloat,GLfloat)]
circlePoints = [(sin(2*pi*k/50), cos(2*pi*k/50), 0) | k <- [1..50]]

display :: DisplayCallback
display = do
  let color3f r g b = color $ Color3 r g (b :: GLfloat)
      vertex3f x y z = vertex $ Vertex3 x y (z :: GLfloat)
  clear [ColorBuffer, DepthBuffer] -- we don't really need a depth buffer for our clock, but why not
  renderPrimitive Polygon $ mapM_ (\(x, y, z) -> vertex3f x y z) circlePoints
  -- explanation of mapM_
  -- http://members.chello.nl/hjgtuyl/tourdemonad.html#mapM_
  swapBuffers