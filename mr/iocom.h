#ifndef IOCOM_H
#define	IOCOM_H

	HANDLE openCOM(char * COM);
	int writeCOM(HANDLE hSerial, char * bytes);
	char* readCOM(HANDLE hSerial);
	int closeCOM(HANDLE hSerial);

#endif	/* IOCOM_H */
