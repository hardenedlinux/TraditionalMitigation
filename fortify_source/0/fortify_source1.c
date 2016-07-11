/*************************************************************************
	> File Name: fortify_source.c
	> Author: mudongliang
	> Mail: mudongliangabcdi@163.com
	> Created Time: Wed 25 May 2016 06:01:12 PM EDT
 ************************************************************************/

#include<stdio.h>
#include<string.h>

int main(int argc,const char *argv[])
{	
	char buffer[10];
	if (argc < 1) {
		printf("need one argument"); 
	}
	strcpy(buffer, "abcdefg");
    return 0;
}
