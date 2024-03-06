#ifndef STATION_H
#define STATION_H

#include <iostream>
#include "vehicle.h"
#include <utility>
#include "timee.h"

using namespace std;

class station
{
private:
    vehicle bus;
    vehicle metro;
    vehicle taxi;


public:
    void setinfo(vehicle value); // change to set distance
    vehicle getdis(); // return vehicle that have minimum value
    vehicle getdis(const string & type_vehicle); // overload getdis that return appropriate vehicle
    station(){};
    int get_time(string vehicle, bool flag, Timee &start_time); // return time of appropriate vehicle


};

#endif // STATION_H
