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
    void setinfo(unsigned int, string); // change to set distance
    void set_cost(unsigned int, string);
    unsigned int getdis();
    string getvic();
    station();

};

#endif

