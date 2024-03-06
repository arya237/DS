#include <iostream>
#include "vehicle.hpp"

using namespace std;

void vehicle:: setval(int value)
{
    this -> value = value;
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