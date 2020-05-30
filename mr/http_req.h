#pragma once

#include<winsock2.h>

#ifndef HTTP_REQ_H
#define HTTP_REQ_H

SOCKET initialize();
int send_message(SOCKET s, char* msg);
int recieve_reply(SOCKET s);
void closeSocket(SOCKET socket);
void to_server(char* msg);

#endif

