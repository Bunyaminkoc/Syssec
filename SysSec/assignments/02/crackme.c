#include <stdio.h>
#include <string.h>

int verify_key(char *input)
{
    for(int i=0;i<5;i++)
    {   
        input[i] = input[i] + i;
    }
    return strcmp("HPFRV", input) == 0;
}

int main()
{
    printf("Enter serial (5 capital letters):");
    
    char input[6] = {};

    scanf("%s",&input);

    if (verify_key(input))
    {
        printf("Key is valid! Whoop whoop :)");
    }
    else printf("Key is not valid :(");

    return 0;
}

