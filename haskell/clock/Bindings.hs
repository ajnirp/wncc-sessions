module Bindings (display, reshape, keyboardMouse) where

import Graphics.UI.GLUT
import Data.IORef
import Display

reshape :: ReshapeCallback
reshape size = do
  viewport $= (Position 0 0, size)

keyboardMouse :: IORef GLfloat -> IORef (GLfloat, GLfloat) -> KeyboardMouseCallback
-- keyboardMouse _key _state _modifiers _position = return ()
keyboardMouse a p key Down _ _ = case key of
  (SpecialKey KeyEsc) -> destroyWindow _window
  _ -> return ()