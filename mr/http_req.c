#include<stdio.h>
#include<winsock2.h>
#include <string.h>
#include "http_req.h"

#pragma comment(lib,"ws2_32.lib") //Winsock Library


SOCKET initalize() {
	WSADATA wsa;
	SOCKET s;
	struct sockaddr_in server;


	printf("\nInitialising Winsock...");
	if (WSAStartup(MAKEWORD(2, 2), &wsa) != 0)
	{
		printf("Failed. Error Code : %d", WSAGetLastError());
		return NULL;
	}else 
		printf("Initialised.\n");

	//Create a socket
	if ((s = socket(AF_INET, SOCK_STREAM, 0)) == INVALID_SOCKET)
	{
		printf("Could not create socket : %d", WSAGetLastError());
		return NULL;
	}else
		printf("Socket created.\n");


	server.sin_addr.s_addr = inet_addr("193.136.120.133");
	server.sin_family = AF_INET;
	server.sin_port = htons(80);

	//Connect to remote server
	if (connect(s, (struct sockaddr*) & server, sizeof(server)) < 0)
	{
		printf("connect error.\n");
		return NULL;
	}else
		printf("Connected.\n");

	return s;
}

int send_message(SOCKET s, char* msg) {

	char* message;
	char contentLen[];

	// Work well with Get Method
	strcat(message, "POST / ~sad / HTTP / 1.1\n");
	strcat(message, "Host: 193.136.120.133\n");
	strcat(message, "Connection: close\n");
	strcat(message, "Content-Type: application/json\n");
	strcat(message, "Content-Encoding: binary\n");

	sprintf(contentLen, "Content-Length: %d\n", strlen(msg));
	strcat(message, contentLen);

	strcat(message, "Accept-Charset: utf-8\n\n");
	strcat(message, msg);


	if (send(s, message, strlen(message), 0) < 0)
	{
		puts("Send failed");
		return 0;
	}

	return 1;
}

int recieve_reply(SOCKET s) {
	int recv_size;
	char* server_reply[2000];

	if ((recv_size = recv(s, server_reply, 2000, 0)) == SOCKET_ERROR)
	{
		printf("Recieve Failed\n");
		return 0;
	}

	server_reply[recv_size] = '\0';
	printf("\n %s \n", server_reply);

	printf("Reply received\n");

	return 1;

}

void closeSocket(SOCKET socket) {
	printf("\nClosing\n");
	if (closesocket(socket) == 0) {
		WSACleanup();
		
	}
}


void to_server(char* msg) {


	SOCKET socket;

	socket = initialize();
	send_message(socket, msg);
	close_socket(socket);

}