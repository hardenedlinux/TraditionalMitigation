/*************************************************************************
	> File Name: fortify_source1.c
	> Author: mudongliang
	> Mail: mudongliangabcdi@163.com
	> Created Time: Wed 25 May 2016 08:22:49 PM EDT
 ************************************************************************/

#include<stdio.h>
#include<string.h>

struct S {
	struct T {
		char buf[5];
		int x;
	} t;
	char buf[20];
} var;

int main(int argc,const char *argv[])
{
	strcpy(&var.t.buf[1], argv[1]);	
    return 0;
}
