#include <iostream>
#include "vehicle.hpp"

using namespace std;

void vehicle:: setdis(int dis)
{
    this -> distance = dis;
}

void vehicle:: setvic(string vic)
{
    this -> type_vehicle = vic;
}