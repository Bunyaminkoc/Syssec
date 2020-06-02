#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int check_authentication(char *password) {
int auth_flag = 0;
char password_buffer[16];
strcpy(password_buffer, password);
if(strcmp(password_buffer, "swordfish") == 0)
auth_flag = 1;
return auth_flag;
}

int main(int argc, char *argv[]) {
if(argc < 2) {
printf("Usage: %s <password>\n", argv[0]);
exit(0);
}
char *password = argv[1];
if (check_authentication(password)) printf("Correct!\n");
else printf("You shall not pass!\n");
}