

all: solution

solution:
	javac -d bin -classpath ./ojdbc6.jar -sourcepath src src/TestFenetre.java

exe:
	java -classpath bin:./ojdbc6.jar TestFenetre

clean:
	rm -rf bin/*
