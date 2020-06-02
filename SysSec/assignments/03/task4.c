#include <stdio.h>


int g(int v1, int v2)
{
    for (int i = 0; i < v2; i++)
    {
        v1 += v2;
    }
    return v1;
}


int f(int v1, int v2, int v3)
{
    int tmp, res;
    tmp = !v1 ? (v2 + v3) : g(v1,v2);
    return res = v3 + tmp; 
}



int main()
{
    int a =f(1,2,3);
    printf("%d\n",a);
    return 0;
}