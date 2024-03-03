#include <iostream>
#include "vehicle.hpp"

using namespace std;

void vehicle:: setdis(int dis)
{
    this -> distance = dis;
}

//--------------------------------------------------------

void vehicle:: set_line(string line)
{
    this -> line_vic = line;
}

//--------------------------------------------------------

void vehicle:: set_vic(string vic)
{
    this -> vic_type = vic;
}