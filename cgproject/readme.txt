You can use Ubuntu to run this main.c file..
Open the terminal and move to this folder and then type "gcc main.c -lGL -lGLU -lglut -lSOIL".
And then "./a.out" to run the file.
Before all this,since I hav use the GLUT and SOIL packages,you need to install these packages using the following commands.
sudo apt-get install freeglut3
sudo apt-get install freeglut3-dev
sudo apt-get install libsoil
sudo apt-get install libsoil-dev
