#ifndef STATION_HPP
#define STATION_HPP

#include <iostream>
#include "vehicle.hpp"
#include <utility> 
#include "time.hpp"

using namespace std;

class station
{   
    private:
    vehicle bus;
    vehicle metro;
    vehicle taxi;
    

    public:
    void setinfo(vehicle value); // change to set distance
    vehicle getdis();
    vehicle getdis(const string & type_vehicle);
    station(){};
    int get_time(string vehicle, bool flag, Time &start_time);


};

#endif

