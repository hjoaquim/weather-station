#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include <time.h>

#include "iocom.h"
#include "toxml.h"

// compliation: gcc -o main main.c iocom.c

// void isWarning(char * json){
// }




int main() {
    
	HANDLE hSerial;
	hSerial = openCOM("\\\\.\\COM1");
	int values[];
	
	if(hSerial != NULL){

		while(1){
			while(!kbhit()){
				
				char * read_data = readCOM(hSerial);
							
                if(read_data == NULL || read_data[0] == '\0') 
					continue;
				
                printf("\nReceived = %s\n", read_data);
				
				if(read_data[3]=='W'){
					printf("\nwarning Detected\n");
					//isWarning(read_data);
				}
				
				printf("temperatura= %c%c\n", read_data[8],read_data[9]);
				printf("humidade= %c%c\n", read_data[18],read_data[19]);
				printf("vento= %c%c%c\n", read_data[27],read_data[28],read_data[29]);
				
				//toXML(read_data);
				
			}
			
			
			// char input = getch();
			// printf("%c\n\n", input);
		}

	}
	return 0;
}





	// if(hSerial != NULL){
	
		// char bytes_to_send[5];
		// bytes_to_send[0] = 104;
		// bytes_to_send[1] = 101;
		// bytes_to_send[2] = 108;
		// bytes_to_send[3] = 108;
		// bytes_to_send[4] = 111;
	 
		// writeCOM(hSerial, bytes_to_send);
		
		// if(closeCOM(hSerial) ==1)
			// return 0;
	// }
	// return 1;
