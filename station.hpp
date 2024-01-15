#ifndef STATION_HPP
#define STATION_HPP

#include <iostream>

using namespace std;

class station
{   
    private:
    unsigned int distance;
    string vehicle;

    public:
    station(string, unsigned int);
    station(){}
};

#endif

