TARGET := mandelbrot

all: $(TARGET) clean

$(TARGET): Main.hs

Main.hs: Bindings.hs Display.hs
	ghc Main.hs -o $(TARGET)

clean:
	rm -f *.hi *.o clock