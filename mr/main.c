#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include <time.h>
#include <ctype.h> 

#include "iocom.h"
#include "toxml.h"
#include "http_req.h"

// compliation: gcc -o main main.c iocom.c toxml.c http_req.c -lws2_32

void isWarning(int i1,int i2, int i3, char* data){
	
	if(print_xml(i1,i2,i3,1))
		printf("Added to DB\n");
	
	if(to_server(data))
		printf("Added to Server\n");
	
}

void menu() {
    printf("\n\nMR Application:\n");
    printf("1 - Request current measurements\n");
    printf("2 - Change alert values\n");
    printf("3 - Show menu\n\n");
}

void change_values(HANDLE hSerial){
	
	char ch;
	char to_send[]="L";
	int flag =1;
	
	printf("\nWich precision?:\n");
    printf("L - low\n");
    printf("M - medium\n");
    printf("H - high\n");
	
	while (flag){
		ch = getch();
		ch = toupper(ch);
		
		if(ch != 'L' && ch != 'M' && ch != 'H'){
			printf("Invalid option. Try again\n");
		}
		else
			flag =0;
	}
	
	printf("char read: %c\n",ch);
	to_send[0] = ch;
	
	writeCOM(hSerial,to_send);
}


int main(){
    
	HANDLE hSerial;
	hSerial = openCOM("\\\\.\\COM2");
	int int_1,int_2,int_3;
	char to_send1[] = "1";
	char to_send2[] = "3";
	
	int_1= 27;
	int_2= 50;
	int_3= 300;
	
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
					
					isWarning(int_1,int_2,int_3, read_data);
					continue;
				}
				
				if(read_data[3]=='T'){
					sscanf(read_data, "{ \"T\": %d, \"H\": %d, \"W\": %d }", &int_1, &int_2,&int_3);
					
					
					printf("temperature= %d\n", int_1);
					printf("humidity= %d\n",int_2);
					printf("wind= %d\n", int_3);
					
					if(print_xml(int_1,int_2,int_3,0))
						printf("Added to DB\n");
				}
				
			}
			
			
			char user_input = getch();
			switch(user_input){
				// printf("1 - Request current measurements\n");
				// printf("2 - Change alert values\n");
				// printf("3 - Show menu\n\n");
				
				
				case '1': printf("\nRequesting current values...\n"); writeCOM(hSerial,to_send1); break;
				case '2': change_values(hSerial); break;
				case '3': printf("\nRequest last warning from EEPROM.\n"); writeCOM(hSerial,to_send2); break;
				case '4': menu();break;
				default: printf("\nInvalid option\n");
				
			}	
		}
	}
	return 0;
}