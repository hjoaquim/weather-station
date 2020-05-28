#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include <time.h>

#include "toxml.h"


char* giveDatetime(){
    time_t t = time(NULL);
    struct tm tm = *localtime(&t);
    char* datetime = (char*) malloc(sizeof(char) * 18);

    sprintf(datetime, "%02d/%02d/%d - %02d:%02d",tm.tm_mday,  tm.tm_mon + 1, (tm.tm_year + 1900), tm.tm_hour, tm.tm_min);
        
    return datetime;
}


int print_xml(int i1,int i2, int i3, int isWarning){
	FILE *fp;
	
	fp = fopen("database.xml","ab+");
	
	if(fp == NULL){
		printf("Error oppening file");   
		return 0;             
	}
	
	if(isWarning)
		fprintf(fp, "<Warning>\n");
	
	if(!isWarning)
		fprintf(fp, "<Msg1>\n");
	
    fprintf(fp, "\t<datetime> %s </datetime>\n",giveDatetime());
    fprintf(fp, "\t<temperature> %d </temperature>\n",i1);
    fprintf(fp, "\t<humidity> %d </humidity>\n",i2);
    fprintf(fp, "\t<wind> %d </wind>\n",i3);
    
	if(!isWarning)
		fprintf(fp,"</Msg1>\n");
	
	if(isWarning)
		fprintf(fp, "</Warning>\n");
	
	fclose(fp);
	return 1;
}
