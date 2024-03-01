#ifndef STATION_HPP
#define STATION_HPP

#include <iostream>
#include "vehicle.hpp"
#include <utility> 

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
    int getdis(const string & type_vehicle);
    pair <string , string> getvic();
    station(){};
    // vehicle get_time(string pre_line , string pre_vic );
    int get_time(string vehicle);
    //int get_time_getinto(const int & start, const int & end ); 
    
    //get type of vehicle

};

#endif

