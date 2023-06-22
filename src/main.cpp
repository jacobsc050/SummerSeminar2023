#include <iostream>
#include <cmath>
#include <iomanip>

float squareVal(float x);
float cubeVal(float x);
void printFunPtrVal(float (*fun_ptr)(float));
int main()
{
    printFunPtrVal(&squareVal);
    printFunPtrVal(&cubeVal);
    return 0;
}

float squareVal(float x)
{
    return x * x;
}

float cubeVal(float x)
{
    return x * x * x;
}
void printFunPtrVal(float (*fun_ptr)(float))
{
    std::cout << fun_ptr(2.0) << std::endl;
}