/*************************************************************************
	> File Name: ssp.c
	> Author: mudongliang
	> Mail: mudongliangabcdi@163.com
	> Created Time: Tue 24 May 2016 08:45:54 PM EDT
 ************************************************************************/

#include<stdio.h>
#include <stdlib.h>
#include <string.h>

struct no_chars {
	unsigned int len;
	unsigned int data;
};

int main(int argc,const char *argv[])
{
	struct no_chars info = {};

	if (argc < 3) {
		fprintf(stderr, "Usage: %s LENGTH DATA...\n", argv[0]);
		return 1;
	}

	info.len = atoi(argv[1]);
	memcpy(&info.data, argv[2], info.len);

    return 0;
}
