TARGET := mandelbrot

all: $(TARGET)

$(TARGET): Main.hs
	ghc -O3 Main.hs -o $(TARGET)

clean:
	rm -f *.hi *.o $(TARGET)