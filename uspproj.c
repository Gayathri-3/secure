#include<signal.h>
#include<sys/stat.h>
#include<sys/types.h>
#include<sys/times.h>
#include<stdio.h>
#include<utime.h>
#include<unistd.h>
#include<string.h>
#include<fcntl.h>
#include<dirent.h>
#include<sys/timeb.h>
#include<time.h>
#include<stdlib.h>
#include <sys/utsname.h>
int i;
struct utsname a;
char *arg[100];
int i;
void ln(char *arg[],int i)
{
    int p,q;
    if(i==4)
    {
    if(strcmp(arg[1],"-s")==0)
    {
        printf("creating sym link\n");
        p=symlink(arg[2],arg[3]);
       
        if(p==0)
            printf("sucessfully created soft link\n");

        else
            perror("soft link");
       
    }
    }
   
    else if(i==3)
    {
    printf("creating hard link\n");
    q=link(arg[1],arg[2]);
    if(q==0)
        printf("sucessful\n");
   
    else
        perror("hard link");
    }
   
}

void touch(char *arg[],int i)
{
    struct utimbuf tm;
    int c,fd;

    if(access(arg[1],F_OK)==0)
        c=utime(arg[1],0);
    else
        fd=open(arg[1],O_CREAT,0777);
}

void date()
{
    time_t t;
	time(&t);//built in function
	{
		printf("\n%s\n",ctime(&t));
	}
}
void env(char *envp[])
{
   
    int i=0;
    while(envp[i]!=NULL)
    {
        printf("%s\n",envp[i]);
        i++;
    }
}

void mkdir1(char *arg[])
{
    if(!mkdir(arg[1],S_IRWXU|S_IRWXG|S_IRWXO))
	printf("successfully created\n");
    else
	printf("unsuccessful\n");
}

void echo()
{
	int d;
	char buff[100];
	d=read(0,buff,sizeof(buff));
	write(1,buff,d);
}

void rm(char *arg[])
{
	if(access(arg[1],F_OK))
		printf("file doesn't exist\n");
	if(!unlink(arg[1]))
		printf("successfully unlinked the file\n");
}

void mv(int i,char *arg[])
{
	int fd,size,fd1;
	char buf[100];
	if(i!=3)
		printf("invalid number of arguments\n");
	if(access(arg[1],F_OK))
		printf("file doesn't exist\n");
	fd=open(arg[1],O_RDONLY);
	size=read(fd,buf,sizeof(buf));
	fd1=open(arg[2],O_RDWR|O_CREAT|O_APPEND,0777);
	write(fd1,buf,size);
	unlink(arg[1]);
	close(fd1);
	printf("successfully moved\n");
}

void kill1(char *arg[])
{
    kill(atoi(arg[1]), SIGKILL);
}

void pwd1()
{
	char buff[100],*buff1;
	buff1=getcwd(buff,sizeof(buff));
	printf("%s\n",buff1);
}

void grep1(int i,char *arg[])
{
	char *arg1[100000];
	char *buff,buff1[100000],*cmd;
	int fd,b=1;
	if(i<3)
		printf("invalid no of arguments\n");
	if(access(arg[2],F_OK))//checks if the file exists
		printf("file doesn't exist\n");
	buff=arg[1];
	fd=open(arg[2],O_RDONLY);
	read(fd,buff1,sizeof(buff1));
	strtok(buff1," ");
	cmd=strtok(buff1,"\n");
	arg1[0]=cmd;	
	while((arg1[b]=strtok(NULL,"\n"))!=NULL)
	{	
		if(strstr(arg1[b],buff))
		{
		puts(arg1[b]);
		}
		b++;
	}
}

void utime1()
{
	uname(&a);
	puts(a.sysname);
}

void cp(int i,char *arg[])
{
	int fd,size,fd1;
	char buf[10000];
	if(i!=3)//checks for the iber of files as input
		printf("invalid iber of arguments\n");
	if(access(arg[1],F_OK))//checks if the file exists
		printf("file doesn't exist\n");
	fd=open(arg[1],O_RDONLY);//opening the file to be read
	size=read(fd,buf,sizeof(buf));//reads the file content
	fd1=open(arg[2],O_RDWR|O_CREAT|O_TRUNC,0777);//opening the file to be written to
	write(fd1,buf,size);//writes the file content
	close(fd1);
	close(fd);
	printf("successfully copied\n");
}

void rmdir1(int i,char *arg[])
{
    int cnt;
    typedef struct dirent Dirent;
    Dirent* dp;
    DIR* fd;
    while(--i>0)
    {
        if(!(fd=opendir(*++arg)))
            perror("opendir");
    for(cnt=0;dp=readdir(fd);)
    {
        if(strcmp(dp->d_name,".") && strcmp(dp->d_name,".."))
            cnt++;
    }

    if(!cnt)
	{        
		rmdir(*arg);
		printf("successful\n");
	}
    }

}

void cmp(int k,char *arg[])
{
	int fd1,fd2,d1,d2,i=0,j=0;
	char buff1[10000],buff2[10000],buff3[100];
	FILE *f1,*f2;
	fd1=open(arg[1],O_RDONLY);
	fd2=open(arg[2],O_RDONLY);
	d1=read(fd1,buff1,sizeof(buff1));
	d2=read(fd2,buff2,sizeof(buff2));

	while(i<d1||i<d2)
	{
		if(buff1[i]==buff2[i])
		{
			if(buff1[i]=='\n')
			j++;
		i++;
		}
		else
			break;
	}
	printf("they differ at byte %d and line %d\n",i+1,j+1);
}

void cd1(int i,char *arg[])
{
	char buff[100],*buff1;
	if(i<2)
		printf("invalid no of inputs\n");
	chdir(arg[1]);
	buff1=getcwd(buff,sizeof(buff));
	printf("%s\n",buff1);
}

void head1(int i,char *arg[])
{
	int y;
	char buff[100][100];
	FILE *fp;
	if(i<2)
		printf("invalid no of inputs\n");
	fp=fopen(arg[1],"r");
	for(y=0;y<10;y++)
	{
		fgets(buff[y],sizeof(buff),fp);
		printf("%s",buff[y]);
	}
	fclose(fp);
}

void whoami1()
{
	printf("%s\n",getlogin());
}

void cat(int argc,char **argv)
{
	int fd,size,fd1,d,i;
	char buf[1000000];	
	if(argc==2)//checks for the number of files as input
	{
		//printf("invalid number of arguments\n");
	if(access(argv[1],F_OK))//checks if the file exists
		printf("file doesn't exist\n");
	fd=open(argv[1],O_RDONLY);//opening the file to be read
	size=read(fd,buf,sizeof(buf));//reads the file content
	write(1,buf,size);//writes the file content
	close(fd);
	}
}


int main(int argc,char **argv,char **envp)
{
	char cmd[100];
	int j;
	while(1)
	{
		printf("Gayathri>");
		int m=0;
		gets(cmd);
		arg[m++]=strtok(cmd," ");
		while((arg[m]=strtok(NULL," "))!=NULL)
			m++;
		i=m;
		if(strcmp(arg[0],"cp")==0)
			cp(i,arg);
		else if(strcmp(arg[0],"ln")==0)
            		ln(arg,i);
		else if(strcmp(arg[0],"rmdir")==0)
			rmdir1(i,arg);
		else if(strcmp(arg[0],"touch")==0)
            		touch(arg,i);
        	else if(strcmp(arg[0],"date")==0)
            		date();
        	else if(strcmp(arg[0],"env")==0)
            		env(envp);
        	else if(strcmp(arg[0],"mkdir")==0)
            		mkdir1(arg);
		else if(strcmp(arg[0],"echo")==0)
			echo();
		else if(strcmp(arg[0],"rm")==0)
			rm(arg);
		else if(strcmp(arg[0],"mv")==0)
			mv(i,arg);
		else if(strcmp(arg[0],"kill")==0)
			kill1(arg);
		else if(strcmp(arg[0],"pwd")==0)
			pwd1();
		else if(strcmp(arg[0],"grep")==0)
			grep1(i,arg);
		else if(strcmp(arg[0],"uname")==0)
			utime1();
		else if(strcmp(arg[0],"cmp")==0)
			cmp(i,arg);
		else if(strcmp(arg[0],"cd")==0)
			cd1(i,arg);
		else if(strcmp(arg[0],"head")==0)
			head1(i,arg);
		else if(strcmp(arg[0],"whoami")==0)
			whoami1();
		else if(strcmp(arg[0],"cat")==0&&i==2)
			cat(i,arg);
		else if(strcmp(arg[0],"cat")==0)
			echo();
		else if(strcmp(arg[0],"exit")==0)
			exit(0);
	}
	return 0;
}
	

