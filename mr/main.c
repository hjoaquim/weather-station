#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>

#include "iocom.h"

// compliation: gcc -o main main.c iocom.c


int main() {
    // Define the five bytes to send ("hello")
    
	HANDLE hSerial;
	hSerial = openCOM("\\\\.\\COM1");
	
	if(hSerial != NULL){

		while(1){
			while(!kbhit()){
				
				char * read_data = readCOM(hSerial);
							
                if(read_data == NULL || read_data[0] == '\0') 
					continue;
				
                printf("\nReceived = %s\n", read_data);
				printf("Temperatura = %c%c\n", read_data[8],read_data[9]);
			}
		}
		
		char input = getch();
		printf("%c\n\n", input);

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
