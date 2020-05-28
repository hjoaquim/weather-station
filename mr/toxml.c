#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "toxml.h"

char* giveDatetime() {
	
    time_t t = time(NULL);
    struct tm tm = *localtime(&t);
    char* datetime = (char*) malloc(sizeof(char) * 18);

    sprintf(datetime, "%02d/%02d/%d - %02d:%02d",tm.tm_mday,  tm.tm_mon + 1, (tm.tm_year + 1900), tm.tm_hour, tm.tm_min);
        
    return datetime;
}

int toXML(char* jason,int* val){
	FILE *fp;
	
	fp = fopen("database.xml","ab+");
	
	if(fp == NULL){
		printf("Error oppening file");   
		return 0;             
	}
	
	fprintf(fp, "<Msg1>\n");
    fprintf(fp, "\t<datetime> %s </datetime>\n",giveDatetime());
    fprintf(fp, "\t<temperature> </temperature>\n",val[0]);
    fprintf(fp, "\t<humidity> </humidity>\n",val[1]);
    fprintf(fp, "\t<wind> </wind>\n",val[2]);
    fprintf(fp, "</Msg1>\n");
	
	fclose(fp);
	return 1;
}

// void Warning_to_XML(char* jason){
	
// }