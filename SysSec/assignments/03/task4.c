#include <stdio.h>


int g(int v2, int v3)
{
    for (int i = 0; i < v3; i++)
    {
        v3 += v2;
    }
    return v3;
}


int f(int v1, int v2, int v3)
{
    int tmp, res;
    if(v2 = 0) tmp= v2 + v3;
    else tmp= g(v2, v3);
    return res = v3 + tmp; //v3 noch unklar  
}


int main()
{
    int a =f(1,2,3);
    printf("%d\n",a);
    return 0;
}