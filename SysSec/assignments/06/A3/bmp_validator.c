#include "stdio.h"
#include "stdlib.h"

#define IMG_MAX_SIZE 1000

int checkImg(FILE* img);
int verifyChecksum(FILE* fp, int size, int checksum);
int createChecksum(char* byteptr, int size);

typedef struct _IMG_HEADER {
    int length;
    int width;
    int checksum;
} IMG_HEADER;

int main(int argc, char* argv[]) {
    FILE* img = NULL;
    char path[20];

    if (argc < 2) {
        printf("Usage: ./bmp_validator <PATH TO BMP FILE>\n");
        return -1;
    }

    printf("Welcome to bmp validator\n");
    sscanf(argv[1], "%19s", path);
    printf("Validating %s\n", path);

    img = fopen(path, "rb");
    if(img == NULL) {
        printf("Failed to open picture\n");
        return -1;
    }
    
    if(checkImg(img)) {
        printf("Checksum successfully verified\n");
    }
    else {
        printf("Checksum corrupted\n");
    }
    return fclose(img);
}

int checkImg(FILE* img) {
    IMG_HEADER hdr;
    int size = 0;

    if(fread(&hdr, 1, sizeof(hdr), img) != sizeof(hdr)) {
        printf("Failed to parse header!\n");
        return 0;
    }
    
    size = hdr.length * hdr.width;
    
    //limit max size	
    if(size > IMG_MAX_SIZE) {
        printf("Size is too large!\n");
        return 0;
    }
    //negative size (or smaller than IMG_HEADER) makes no sense
    if(size < sizeof(IMG_HEADER)) {
        printf("Size is too small!\n");
        return 0;
    }
        
    return verifyChecksum(img, size, hdr.checksum);
}

int verifyChecksum(FILE* fp, int size, int checksum) {
    unsigned char grafic[IMG_MAX_SIZE];

    int i = fread(grafic, 1, size, fp);
    
    if (checksum != createChecksum(grafic, i)) {
        printf("Checksum verification failed!\n");
        exit(1);
    }
    return 1;
}


int createChecksum(char* byteptr, int size) 
{
    int checksum = 0;
    for ( int i = 0; i < size; ++i )
    {
        checksum += *(i + byteptr);

        if ( i % 3 )
            checksum *= *(i + byteptr);

        if ( i & 3 )
            checksum += *(i + byteptr);

        if ( i % 5 )
            checksum ^= *(i + byteptr);
    }
    return checksum;
}