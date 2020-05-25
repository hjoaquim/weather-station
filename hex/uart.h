#ifndef UART_H
#define	UART_H

	void uart_init(void); 
	void uart_writeChar(char ch);
	void uart_writeText(char *str);
	char uart_read(void);
	void uart_readText(char *str);
	void addNewline(void);

#endif
