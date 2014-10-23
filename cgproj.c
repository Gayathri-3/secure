#include <GL/glut.h>
#include<SOIL/SOIL.h>
GLfloat ver[8][3] =
{
    {-1.0,-1.0,1.0},
    {-1.3,0.0,0.0},
    {1.0,1.0,0.5},
    {0.5,-1.7,-0.1},
    {-1.0,-1.0,-1.0},
    {-0.2,1.0,-1.0},
    {1.0,1.0,-1.0},
    {1.0,-1.0,-0.5},
};

void quad(int a,int b,int c,int d)
{
    glColor3f(0.0,0.0,1.0);
    glBegin(GL_LINES);
        glVertex3fv(ver[a]);
        glVertex3fv(ver[c]);
        glVertex3fv(ver[d]);
        glEnd();
    glBegin(GL_LINES);
        glVertex3f(1.0,-1.0,-0.5);
        glVertex3f(1.0,1.0,-1.0);
    glEnd();
}


void colorcube()
{
   quad(2,6,7,3);
   quad(1,5,6,2);
   quad(2,6,5,1);
}

void polyfill()
{
    glBegin(GL_POLYGON);
        glColor3f (0.5, 0.5,0.5);
        glVertex3f(-1.3,0.0,0.0);
        glVertex3f(-0.5,0.25,0.03);
        glVertex3f(-0.5,0.25,-0.092);
        glVertex3f(0.45,0.75,0.35);
        glVertex3f(0.45,0.75,0.24);
        glVertex3f(1.0,1.0,0.5);
        glVertex3f(1.0,1.0,-1.0);
        glVertex3f(-0.2,1.0,-1.0);
    glEnd();


    glBegin(GL_POLYGON);
        glColor3f (0.8, 0.8,0.8);
        glVertex3f(1.0,1.0,0.5);
        glVertex3f(0.91,0.6334,0.5);
        glVertex3f(0.91,0.6334,0.4);
        glVertex3f(0.83,0.32,0.41);
        glVertex3f(0.83,0.32,0.3);
        glVertex3f(0.75,-0.1,0.25);
        glVertex3f(0.75,-0.1,0.15);
        glVertex3f(0.66,-0.6,0.1);
        glVertex3f(0.66,-0.6,-0.01);
        glVertex3f(0.56,-1.16663,-0.02);
        glVertex3f(0.58,-1.16663,-0.11);
        glVertex3f(0.5,-1.7,-0.1);
        glVertex3f(1.0,-1.0,-0.5);
        glVertex3f(1.0,1.0,-1.0);
    glEnd();


    glBegin(GL_POLYGON);
        glColor3f(0.5,0.5,0.5);
        glVertex3f(-0.3666,-0.7771,0.5078);
        glVertex3f(-0.3666,-0.7771,0.6078);
        glVertex3f(-0.15,-0.95,0.3078);
        glVertex3f(-0.15,-0.95,0.4078);
        glVertex3f(0.05,-1.14,0.1178);
        glVertex3f(0.05,-1.14,0.2178);
        glVertex3f(0.18,-1.3,-0.02);
        glVertex3f(0.25,-0.85,0.02);
        glVertex3f(0.2,-0.85,0.04);
        glVertex3f(0.33,-0.39,0.11);
        glVertex3f(0.22,-0.43,0.11);
        glVertex3f(0.43,0.05,0.25);
        glVertex3f(0.32,0.02,0.25);
        glVertex3f(0.43,0.3611,0.26);
        glVertex3f(0.28,0.3122,0.23);
        glVertex3f(-0.6666,-0.6605,0.7244);
    glEnd();


    glBegin(GL_POLYGON);
            glColor3f(0.8,0.8,0.8);
            glVertex3f(0.28,0.3122,0.36);
            glVertex3f(-0.38,-.009,0.18);
            glVertex3f(-.5833,-0.2055,0.2922);
            glVertex3f(-0.6666,-0.6605,0.4444);
    glEnd();
}

GLuint tex_2d, tex_2d1, tex_2d2;

void image1()
{
    glEnable(GL_TEXTURE_2D);
    glColor4f(1.0f, 1.0f, 1.0f, 1.0f);
	tex_2d1 = SOIL_load_OGL_texture
		 (
			 "strairs2.jpeg",
			 SOIL_LOAD_AUTO,
			 SOIL_CREATE_NEW_ID,
			 SOIL_FLAG_COMPRESS_TO_DXT
		 );
	glBindTexture(GL_TEXTURE_2D, tex_2d1);
	glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
	glBegin(GL_POLYGON);
		glTexCoord2f(1.0, 1.0);
		glVertex2f(0,0);
		glTexCoord2f(0.0, 1.0);
		glVertex2f(0,580);
		glTexCoord2f(0.0, 0.0);
		glVertex2f(480,580);
		glTexCoord2f(1.0, 0.0);
		glVertex2f(580,0);
	glEnd();
    glDisable(GL_TEXTURE_2D);
}

void poly()
{
    polyfill();
    glBegin(GL_LINES);
        glColor3f(0.0,0.0,1.0);
        glVertex3f(-0.6666,-0.6605,0.5344);
         glVertex3f(0.28,0.3122,0.33);
        glVertex3f(-1.3,0.0,0.0);
     glVertex3f(-0.5,0.25,0.03);
     glVertex3f(-0.5,0.25,0.03);
     glVertex3f(-0.5,0.25,-0.092);
    glVertex3f(-0.5,0.25,-0.092);
      glVertex3f(0.45,0.75,0.35);
       glVertex3f(0.45,0.75,0.35);
       glVertex3f(0.45,0.75,0.24);
       glVertex3f(0.45,0.75,0.24);
        glVertex3f(1.0,1.0,0.5);
        glVertex3f(1.0,1.0,-1.0);
        glVertex3f(-0.2,1.0,-1.0);

         glVertex3f(-1.0,-1.0,1.0);
        glVertex3f(-1.15,-0.66,0.66);
        glVertex3f(-1.15,-0.66,0.66);
        glVertex3f(-1.15,-0.66,0.55);
         glVertex3f(-1.15,-0.66,0.55);
            glVertex3f(-1.25,-0.33,0.33);
             glVertex3f(-1.25,-0.33,0.33);
            glVertex3f(-1.25,-0.33,0.22);
              glVertex3f(-1.3,0.0,0.0);
             glVertex3f(-1.25,-0.33,0.22);
            glVertex3f(-0.6666,-0.6605,0.5344);
            glVertex3f(-0.6666,-0.6605,0.7244);


             glVertex3f(-0.6666,-0.6605,0.5344);
             glVertex3f(-0.6666,-0.6605,0.4444);
            glVertex3f(-0.6666,-0.6605,0.4444);
            glVertex3f(-0.5833,-0.2055,0.2922);
            glVertex3f(-0.5833,-0.2055,0.2922);
            glVertex3f(-0.5833,-0.2055,0.1822);
            glVertex3f(-0.5833,-0.2055,0.1822);
           glVertex3f(-0.5,0.25,0.03);

                 glVertex3f(-0.6666,-0.6605,0.5344);
                 glVertex3f(-1.15,-0.66,0.66);
                 glVertex3f(-0.6666,-0.6605,0.4444);
                 glVertex3f(-1.15,-0.66,0.55);
                 glVertex3f(-0.5833,-0.2055,0.2922);
                 glVertex3f(-1.25,-0.33,0.33);
                 glVertex3f(-0.5833,-0.2055,0.1822);
                 glVertex3f(-1.25,-0.33,0.22);

                 glVertex3f(-0.5833,-0.2055,0.1822);
                 glVertex3f(-0.38,-0.009,0.18);
                 glVertex3f(-0.38,-0.009,0.18);
                 glVertex3f(0.29,0.3122,0.34);
                 glVertex3f(0.29,0.3122,0.34);
                 glVertex3f(0.28,0.3122,0.23);
                 glVertex3f(0.28,0.3122,0.23);
                 glVertex3f(0.91,0.67,0.5);
                 glVertex3f(0.29,0.3122,0.23);
                 glVertex3f(0.45,0.75,0.24);
                 glVertex3f(-0.5833,-0.2055,0.1822);
                 glVertex3f(-0.5,0.25,0.03);
                 glVertex3f(-0.38,-0.009,0.18);
                 glVertex3f(-0.5,0.25,-0.092);
                 glVertex3f(0.29,0.3122,0.34);
                 glVertex3f(0.45,0.75,0.35);

                 glVertex3f(1.0,1.0,0.5);
                 glVertex3f(0.91,0.67,0.5);

                 glVertex3f(0.91,0.67,0.4);
                 glVertex3f(0.91,0.67,0.5);
                 glVertex3f(0.91,0.67,0.4);
                 glVertex3f(0.83,0.32,0.41);
                 glVertex3f(0.83,0.32,0.41);
                 glVertex3f(0.83,0.32,0.3);
                 glVertex3f(0.83,0.32,0.3);
                 glVertex3f(0.75,-0.1,0.25);
                 glVertex3f(0.75,-0.1,0.25);
                 glVertex3f(0.75,-0.1,0.15);
                 glVertex3f(0.75,-0.1,0.15);
                 glVertex3f(0.66,-0.58,0.1);
                 glVertex3f(0.66,-0.58,0.1);
                 glVertex3f(0.66,-0.6,0.1);
                 glVertex3f(0.66,-0.6,0.1);
                 glVertex3f(0.66,-0.6,-0.01);
                 glVertex3f(0.66,-0.6,-0.01);
                 glVertex3f(0.56,-1.16663,-0.02);
                 glVertex3f(0.56,-1.16663,-0.02);
                 glVertex3f(0.58,-1.16663,-0.11);
                 glVertex3f(0.58,-1.16663,-0.11);
                 glVertex3f(0.5,-1.7,-0.1);


                 glVertex3f(0.43,0.3611,0.26);
                 glVertex3f(0.32,0.02,0.25);
                 glVertex3f(0.32,0.02,0.25);
                 glVertex3f(0.83,0.32,0.41);
                 glVertex3f(0.32,0.02,0.25);
                 glVertex3f(0.43,0.05,0.25);
                 glVertex3f(0.43,0.05,0.25);
                 glVertex3f(0.22,-0.43,0.11);
                 glVertex3f(0.22,-0.43,0.11);
                 glVertex3f(0.75,-0.1,0.25);


               glVertex3f(0.33,-0.39,0.11);
               glVertex3f(0.2,-0.85,0.04);
               glVertex3f(0.2,-0.85,0.04);
               glVertex3f(0.66,-0.6,0.1);


                  glVertex3f(0.25,-1.1945,0.08);
                  glVertex3f(0.25,-0.85,0.02);
                  glVertex3f(0.25,-1.1945,0.08);
                  glVertex3f(0.56,-1.16663,-0.02);

                    glVertex3f(0.3,-1.575,0.17);
                    glVertex3f(0.35,-1.15,0.1);
                    glVertex3f(0.3,-1.575,0.17);
                    glVertex3f(0.5,-1.7,-0.1);


                 glVertex3f(-1.0,-1.0,1.0);
                 glVertex3f(-0.75,-1.1167,0.8166);
                 glVertex3f(-0.75,-1.1167,0.8166);
                 glVertex3f(-0.6666,-0.6605,0.7244);
                 glVertex3f(-0.75,-1.1167,0.8166);
                 glVertex3f(-0.725,-1.1167,0.85);
                 glVertex3f(-0.475,-1.2333,0.685);
                 glVertex3f(-0.725,-1.1167,0.85);
                 glVertex3f(-0.3666,-0.7771,0.6078);
                 glVertex3f(-0.475,-1.2333,0.685);
                 glVertex3f(-0.45,-1.2333,0.72);
                 glVertex3f(-0.475,-1.2333,0.685);
                 glVertex3f(-0.225,-1.35,0.5);
                 glVertex3f(-0.45,-1.2333,0.72);
                 glVertex3f(-0.225,-1.35,0.5);
                 glVertex3f(-0.15,-0.95,0.4078);
                 glVertex3f(-0.2,-1.35,0.53);
                 glVertex3f(-0.225,-1.35,0.5);
                 glVertex3f(-0.2,-1.35,0.53);
                 glVertex3f(0.025,-1.46676,0.31);
                 glVertex3f(0.05,-1.46676,0.34);
                 glVertex3f(0.025,-1.46676,0.31);
                 glVertex3f(0.05,-1.14,0.2178);
                 glVertex3f(0.025,-1.46676,0.31);
                 glVertex3f(0.05,-1.46676,0.34);
                 glVertex3f(0.28,-1.575,0.15);
                 glVertex3f(0.18,-1.3,-0.02);
                 glVertex3f(0.05,-1.14,0.2178);
                 glVertex3f(0.05,-1.14,0.1178);
                 glVertex3f(0.05,-1.14,0.2178);
                 glVertex3f(0.05,-1.14,0.1178);
                 glVertex3f(-0.15,-0.95,0.4078);
                 glVertex3f(-0.15,-0.95,0.3078);
                 glVertex3f(-0.15,-0.95,0.4078);
                 glVertex3f(-0.15,-0.95,0.3078);
                 glVertex3f(-0.3666,-0.7771,0.6078);
                 glVertex3f(-0.3666,-0.7771,0.5078);
                 glVertex3f(-0.6666,-0.6605,0.7244);
                 glVertex3f(-0.3666,-0.7771,0.5078);
                 glVertex3f(-0.3666,-0.7771,0.6078);
    glEnd();
}

static float ballx=0.4,bally=0.4,ballz=1.5;
void sphere()
{
    int i,j;

    glColor3f(1.0,0.7,0.0);
    glPushMatrix();
    glTranslatef(ballx,bally,ballz);
    glutSolidSphere(0.14,50,50);
    glPopMatrix();
}
void image()
{
    glEnable(GL_TEXTURE_2D);
    glColor4f(1.0f, 1.0f, 1.0f, 1.0f);
	tex_2d2 = SOIL_load_OGL_texture
		 (
			 "stairs1.jpeg",
			 SOIL_LOAD_AUTO,
			 SOIL_CREATE_NEW_ID,
			 SOIL_FLAG_COMPRESS_TO_DXT
		 );
	glBindTexture(GL_TEXTURE_2D, tex_2d2);
	glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
	glBegin(GL_POLYGON);
		glTexCoord2f(1.0, 1.0);
		glVertex2f(0,0);
		glTexCoord2f(0.0, 1.0);
		glVertex2f(0,580);
		glTexCoord2f(0.0, 0.0);
		glVertex2f(480,580);
		glTexCoord2f(1.0, 0.0);
		glVertex2f(580,0);
	glEnd();
    glDisable(GL_TEXTURE_2D);
}
void backP()
{
    char str1[] = "Thank you..!!!";
    int i;

    glColor3f(1.0,0.0,0.0);
    glRasterPos2f(0.1,0.2);
    for(i=0;str1[i]!='\0';i++)
        glutBitmapCharacter(GLUT_BITMAP_HELVETICA_18,str1[i]);
    glFlush();
    glutSwapBuffers();
}

void mouse1(int btn, int state, int x, int y)
{
	if(btn==GLUT_RIGHT_BUTTON && state==GLUT_DOWN)
    {
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
        backP();
    }

}

void display()
{
    int i;
    char str[]="Press 'z' to Experience the Illusion..!!";
    char str1[]="Press 'q' to enlarge the ball before you press 'z'..";
    char str2[]="Right click on the mouse to exit";
    glMatrixMode( GL_PROJECTION );
    glLoadIdentity();
    int w = glutGet( GLUT_WINDOW_WIDTH );
    int h = glutGet( GLUT_WINDOW_HEIGHT );
    gluPerspective( 60, w / h, 0.1, 100 );
    glMatrixMode( GL_MODELVIEW );
    glLoadIdentity();
    gluLookAt
    (
        3, 3, 3,
        0, 0, 0,
        0, 0, 1
    );

    colorcube();
    poly();
    sphere();
	glRasterPos3f(1.0,1.0,2.0);
    for(i=0;str2[i]!='\0';i++)
        glutBitmapCharacter(GLUT_BITMAP_HELVETICA_18,str2[i]);
	glRasterPos3f(1.0,-0.5,2.0);
    for(i=0;str1[i]!='\0';i++)
        glutBitmapCharacter(GLUT_BITMAP_HELVETICA_18,str1[i]);
     glRasterPos3f(1.0,0.1,2.0);
    for(i=0;str[i]!='\0';i++)
        glutBitmapCharacter(GLUT_BITMAP_HELVETICA_18,str[i]);
    glutMouseFunc(mouse1);
    glFlush();
    glutSwapBuffers();
    glutMouseFunc(mouse1);
}


void display1()
{
	glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT);
	image1();
	display();
}


void frontP()
{
    char str1[] = "Impossible Staircase";
    char str2[] = "Illusion Created By : ";
    char name1[] = "Gayathri S";
    char name2[] = "Krishna Channappagoudar";
    char str3[]="Left click on the mouse for the next slide";
    int i,j;

    image();
	glRasterPos2i(200,300);
    for(i=0;str3[i]!='\0';i++)
        glutBitmapCharacter(GLUT_BITMAP_HELVETICA_18,str3[i]);

    glRasterPos2i(180,400);
    for(i=0;str1[i]!='\0';i++)
        glutBitmapCharacter(GLUT_BITMAP_HELVETICA_18,str1[i]);

    glRasterPos2i(100,120);
    for(i=0;str2[i]!='\0';i++)
         glutBitmapCharacter(GLUT_BITMAP_HELVETICA_18,str2[i]);

    glRasterPos2i(150,100);
    for(i=0;name1[i]!='\0';i++)
        glutBitmapCharacter(GLUT_BITMAP_HELVETICA_18,name1[i]);

    glRasterPos2i(150,80);
    for(i=0;name2[i]!='\0';i++)
        glutBitmapCharacter(GLUT_BITMAP_HELVETICA_18,name2[i]);

    glFlush();
}


void mouse(int btn, int state, int x, int y)
{
	if(btn==GLUT_LEFT_BUTTON && state==GLUT_DOWN)
           display1();

}


void myInit()
{
    glClearColor(0.0,0.0,0.0,0.0);
    glPointSize(10);
    gluOrtho2D(0.0,500.0,0.0,500.0);

}


void rotsphere()
{
    int i;
    for(i=0;i<2;i++)
    {
        bally+=.3;
        ballz-=.17;
        display1();
        sleep(1);
    }
}



void rotsphere1()
{

    int i;
    for(i=0;i<2;i++)
    {
    ballx+=.3;
    ballz-=.2;
    bally=1.0;
    display1();
    sleep(1);
    }
}


void rotsphere2()
{

    int i;
    for(i=0;i<2;i++)
    {
    ballx=1.0;
    bally-=.25;
    ballz-=0.05;
    display1();
    sleep(1);
    }
}


void rotsphere3()
{

    int i;
    for(i=0;i<3;i++)
    {
    bally-=0.31;
    ballx=1.0;
    ballz=0.7;
    display1();
    sleep(1);
    }
}



void rotsphere4()
{

    int i;
    for(i=0;i<2;i++)
    {
    ballx-=.2;
        ballz+=0.1;
        bally=-0.39;
    display1();
    sleep(1);
    }
}


void rotsphere5()
{

    int i;
    for(i=0;i<3;i++)
    {
    ballx-=.3;
        ballz+=0.1;
        bally=-0.39;
    display1();
    sleep(1);
    }

}



void myreshape(int w,int h)
{
    glViewport(0,0,w,h);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    if(w<=h)
        glOrtho(-2.0,2.0,-2.0*(GLfloat)h/(GLfloat)w,2.0*(GLfloat)h/(GLfloat)w,-10.0,10.0);
    else
        glOrtho(-2.0*(GLfloat)h/(GLfloat)w,2.0*(GLfloat)h/(GLfloat)w,-2.0,2.0,-10.0,10.0);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
}


void keyp(unsigned char key,int x,int y)
{
    int i,j,k;
    if(key=='z')
    {

        rotsphere();
        rotsphere1();
        rotsphere2();
        rotsphere3();
        rotsphere4();
        rotsphere5();


    }
   /* if(key=='e')
        display2();*/

    if(key=='q')
    {
        ballx=0.4;
        bally=0.4;
        ballz=1.5;
        display1();
    }

}




int main( int argc, char **argv )
{
    glutInit( &argc, argv );
    glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
    glutInitWindowSize( 640, 480 );
    glutCreateWindow( "Front" );
    glutInitWindowPosition(100,100);
    myInit();
    glutDisplayFunc(frontP);
    glutKeyboardFunc(keyp);
    glutMouseFunc(mouse);
    glEnable( GL_DEPTH_TEST );
    glutMainLoop();
}
