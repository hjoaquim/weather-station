// inspired in: 
//
// serial.c / serial.cpp
// A simple serial port writing example
// Written by Ted Burke - last updated 13-2-2013
//
// compiling: gcc -o io.exe io.c

 
#include <windows.h>
#include <stdio.h>
#include <string.h>
#include <conio.h>

#include "iocom.h"

HANDLE openCOM(char * COM){
	
	HANDLE hSerial;
         
    // Open the highest available serial port number
    fprintf(stderr, "Opening serial port...");
    
    hSerial = CreateFile(COM, GENERIC_READ | GENERIC_WRITE, 0, NULL,
                         OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
    
	if (hSerial == INVALID_HANDLE_VALUE){
            fprintf(stderr, "Error\n");		// stderr AKA standart error is the default file where a process can write error messages
            return NULL;
    }
    else fprintf(stderr, "OK\n");
     
    
	// Set device parameters (38400 baud, 1 start bit,
    // 1 stop bit, no parity)
	DCB dcbSerialParams = {0};
    dcbSerialParams.DCBlength = sizeof(dcbSerialParams);
	
    fprintf(stderr, "Setting device parameters...");
	if (GetCommState(hSerial, &dcbSerialParams) == 0){
        
		fprintf(stderr, "Error getting device state\n");
        CloseHandle(hSerial);
        return NULL;
    }
	else fprintf(stderr, "OK\n");
     
    dcbSerialParams.BaudRate = CBR_9600;
    dcbSerialParams.ByteSize = 8;
    dcbSerialParams.StopBits = ONESTOPBIT;
    dcbSerialParams.Parity = NOPARITY;
    
	COMMTIMEOUTS timeouts = {0};
	
	fprintf(stderr, "Setting COM timeouts...");
	if(SetCommState(hSerial, &dcbSerialParams) == 0){
        
		fprintf(stderr, "Error setting device parameters\n");
        CloseHandle(hSerial);
        return NULL;
    }
	else fprintf(stderr, "OK\n");
 
    // Set COM port timeout settings
    timeouts.ReadIntervalTimeout = 5000;
    timeouts.ReadTotalTimeoutConstant = 50;
    timeouts.ReadTotalTimeoutMultiplier = 10;
    timeouts.WriteTotalTimeoutConstant = 50;
    timeouts.WriteTotalTimeoutMultiplier = 10;
    
	if(SetCommTimeouts(hSerial, &timeouts) == 0){
        
		fprintf(stderr, "Error setting timeouts\n");
        CloseHandle(hSerial);
        return NULL;
    }
	
	fprintf(stderr, "Sucess handling Serial Port\n");
	return hSerial;
	
}

int writeCOM(HANDLE hSerial, char * bytes){
	
	// Send specified text (remaining command line arguments)
	DWORD bytes_written, total_bytes_written = 0;
	fprintf(stderr, "Sending bytes...");
	
	if(!WriteFile(hSerial, bytes, strlen(bytes) , &bytes_written, NULL)){
		
		fprintf(stderr, "Error\n");
		CloseHandle(hSerial);
		return 0;
	}   
	
	fprintf(stderr, "%d bytes written\n", bytes_written);
	return 1;
}

char* readCOM(HANDLE hSerial){

	DWORD ridden_bytes, total_bytes_ridden = 0;
	//fprintf(stderr, "Reading bytes...");
	char* buffer = (char*) malloc(sizeof(char) * 512);
	char ch;
	
	ReadFile(hSerial, &ch, sizeof(ch), &ridden_bytes, NULL);
	
	if(ch != '{')
		return NULL;
	
	for(int i=0; ch!='\n'; i++){
		
		if(ridden_bytes==0)
			break;
		
		buffer[i] = ch;
		ReadFile(hSerial, &ch, sizeof(ch), &ridden_bytes, NULL);
	}
	
	buffer[strlen(buffer)]='\0';
	return buffer;
}

int closeCOM(HANDLE hSerial){
	
	fprintf(stderr, "Closing serial port...");

	if (CloseHandle(hSerial) == 0){
		fprintf(stderr, "Error\n");
		return 0;
	}

	fprintf(stderr, "OK\n");
	return 1;
}
