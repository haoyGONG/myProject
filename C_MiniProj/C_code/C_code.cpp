#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include<string.h> 
FILE *outfile;
struct Student
{
	char stdnum[6];
	int grade;
	int time;
};
int CheckID(char []);
void Exam(int,int *,int *);
int main()
{
	struct Student std;
	int i,p,op,m,n,*a,*b,d=0,e,sc=0,r,c1[10],c2[10];
	float r1,y;
	char s[6];
	time_t start_time,end_time,t;
	
	printf("Please input your ID number:");
	gets(s);
	while(1)                                                         //检查ID 
	{
		p=CheckID(s);
		if(p==1)
		break;
		else if(p==0)
		{printf("Your ID is error,please input again:");
		gets(s);}
	}
	
	printf("Please choose one option following:\n");
	printf("(1)Start a test\n(2)Check scores\n(3)Exit\n");
	printf("Please input the option's number:");
	scanf("%d",&op);
	
		if(op==3)
		return 0;
		else if(op==1)
		{
			start_time=time(NULL);
			for(i=0;i<10;i++)
			{
				srand(time(NULL));
				m=rand()%4;               //取随机数 
				*a=rand()%100;
				*b=rand()%100;                                   
				
				Exam(m,a,b);                      //出题 
				scanf("%d",&n);                   //输入答案 
				c2[d]=n;
				switch(m)                        //判断正误 
				{      
		            case 0:
                    {
		               if(n==*a+(*b))
		               {printf("Correct\n");
		               sc=sc+10;}
	                   else     
					   {printf("Error\n");}
					   c1[d]=*a+(*b);
					   break;
                    }
                    case 1:
                	{
                 		if(n==(*a)-(*b))
             	     	{printf("Correct\n");
             	     	sc=sc+10;}
              		    else
	             	    {printf("Error\n");}
	             	    c1[d]=*a-(*b);
	             	    break;
                 	}
                    case 2:
                   	{
	              	    if(n==(*a)*(*b))
	             	    {printf("Correct\n");
	             	    sc=sc+10;}
	            	    else
             	     	{printf("Error\n");}
             	     	c1[d]=(*a)*(*b);
             	     	break;
                	}
           	        case 3:
                   	{
               		    if(n==*a/(*b))
               		    {printf("Correct\n");
               		    sc=sc+10;}
             		    else
               		    {printf("Error\n");}
               		    c1[d]=*a/(*b);
               		    break;
                	}
				}                                //判断结束 
				d++;
				
			}
			end_time=time(NULL);
			outfile=fopen("record.txt","a");                    //存储数据
			if(outfile==NULL)
	        {printf("Fail to open it.");}         //判断是否成功打开 
			std.time=end_time-start_time;
			for(i=0;i<6;i++)
			{
				std.stdnum[i]=s[i];
			}
			std.stdnum[6]='\0'; 
			std.grade=sc;                      
		    fprintf(outfile,"\n%s  %d  %d",std.stdnum,std.grade,std.time);
		    fclose(outfile);
			printf("Your score is %d.\n",std.grade);
			printf("Prob. | Correct Answ.  |  Ur Answ.\n");
			for(i=0;i<10;i++)
			{
				printf("%3d %11d %15d\n",i+1,c1[i],c2[i]);
			}
			
		}
		
		else if(op==2)
		{
			printf("Your previous records are:\n");
			outfile=fopen("record.txt","r");
	         if(outfile==NULL)
              {printf("Fail to open it.");}              //判断是否成功打开
         	while(fscanf(outfile,"%s  %d  %d",std.stdnum,&(std.grade),&(std.time))!=EOF)
         	{ 
              if((strcmp(std.stdnum,s))==0) 
                 printf("%s  %d  %dseconds\n",std.stdnum,std.grade,std.time);
           	}
           fclose(outfile);
		} 
	    return 0;
}
int CheckID(char s[])
{
	int i;
	for(i=0;i<2;i++)
	{
		if(s[i]>='A' && s[i]<='Z' || s[i]>='a' && s[i]<='z')
		continue;
		else
		return 0;
	}
	for(i=2;i<6;i++)
	{
		if(s[i]>='0' && s[i]<='9')
		continue;
		else
		return 0;
	}
	while(s[i]!='\0')
	{i++;}
	if(i>6)
	{return 0;}
	return 1;
}
void Exam(int m,int *a,int *b)
{
	if(m==0)
	{
		while(*a+(*b)>=100)
		{*a=rand()%100;
		 *b=rand()%100;}
		printf("%d+%d=",*a,*b);
	}
	else if(m==1)
	{
		while(*a-(*b)<0)
		{*a=rand()%100;
		 *b=rand()%100;}
		printf("%d-%d=",*a,*b);
	}
	else if(m==2)
	{
		while((*a)*(*b)>=100)
		{*a=rand()%100;
		 *b=rand()%100;}
		printf("%d*%d=",*a,*b);
	}
	else if(m==3)
	{
		while(*b==0 || *a%(*b)!=0)
		{*a=rand()%100;
		 *b=rand()%100;}
		printf("%d/%d=",*a,*b);
	}
}

