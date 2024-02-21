#ifndef STATION_HPP
#define STATION_HPP

#include <iostream>
#include "vehicle.hpp"

using namespace std;

class station
{   
    private:
    vehicle bus;
    vehicle metro_taxi;
    

    public:
    void setinfo(vehicle value); // change to set distance
    int getdis();
    string getvic();
    station(){};
    
     //get type of vehicle

};

#endif

