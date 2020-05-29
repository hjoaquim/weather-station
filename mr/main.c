#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include <time.h>

#include "iocom.h"
#include "toxml.h"

// compliation: gcc -o main main.c iocom.c toxml.c

void isWarning(int i1,int i2, int i3){
	
	print_xml(i1,i2,i3,1);
	
}

void menu() {
    printf("\n\nMR Application:\n");
    printf("1 - Request current measurements\n");
    printf("2 - Change alert values\n");
    printf("3 - Show menu\n\n");
}

int main(){
    
	HANDLE hSerial;
	hSerial = openCOM("\\\\.\\COM1");
	int int_1,int_2,int_3;
	
	if(hSerial != NULL){
	
	menu();

		while(1){
			while(!kbhit()){
				
				char * read_data = readCOM(hSerial);
							
                if(read_data == NULL || read_data[0] == '\0') 
					continue;
				
                printf("\nReceived = %s\n", read_data);
				
				if(read_data[3]=='W'){
					printf("\nwarning Detected\n");
					
					sscanf(read_data, "{ \"Warning\" : 1, \"T\": %d, \"H\": %d, \"W\": %d }", &int_1, &int_2,&int_3);
					
					printf("temperatura= %d\n", int_1);
					printf("humidade= %d\n",int_2);
					printf("vento= %d\n", int_3);
					
					isWarning(int_1,int_2,int_3);
					continue;
				}
				
				sscanf(read_data, "{ \"T\": %d, \"H\": %d, \"W\": %d }", &int_1, &int_2,&int_3);
				
				
				printf("temperatura= %d\n", int_1);
				printf("humidade= %d\n",int_2);
				printf("vento= %d\n", int_3);
				
				print_xml(int_1,int_2,int_3,0);
				
			}
			
			
			char user_input = getch();
			switch(user_input){
				
				case '1': printf("\noption 1\n");break;
				case '2': printf("\noption 2\n");break;
				case '3': printf("\noption 3\n");break;
				default: printf("\nInvalid option\n");
				
			}
			
		}

	}
	return 0;
}