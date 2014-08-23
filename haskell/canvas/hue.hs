import Haste
import Haste.Graphics
import Data.IORef
import Data.Array
import Data.Array.MArray
import Data.Array.IO

data Tilemap = Tilemap {
	tileData :: Array Int Int,
	tileSet :: Bitmap,
	dimensions :: (Int, Int)
}

data State = State {
	tilemap :: Tilemap,
	selectedTile :: (Int, Int)
}

drawTile :: Bitmap -> Int -> Point -> Picture ()
drawTile tileset tile pt = do
    drawClipped tileset pt (Rect (1+convert tx*17) (1+convert ty*17) 16 16)
	-- first two parameters of Rect are the coordinates of the bottom left vertex
	-- last two parameters are the Rect dimensions
	where
		(ty, tx) = quotRem tile 11