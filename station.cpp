#include "station.hpp"

void station::setinfo(vehicle value)
{
    if(value.get_type_vehicle()[0] == 'B')
    {   
        this->bus = value;
    }

    else if(value.get_type_vehicle()[0] == 'M')
    {   
        this->metro_taxi = value;
    }
}

int station::getdis()
{  
   if((bus.get_distance()== 0 && metro_taxi.get_distance() == 0) || 
   (bus.get_distance()!= 0 && metro_taxi.get_distance() != 0)) 
   {
        return min(bus.get_distance() , metro_taxi.get_distance());
   }

   else if((bus.get_distance()== 0 && metro_taxi.get_distance() != 0) || 
   (bus.get_distance()!= 0 && metro_taxi.get_distance() == 0)) 
   {
        return max(bus.get_distance() , metro_taxi.get_distance());
   }
} 

int station::getdis(const string & type_vehicle)
{
    return type_vehicle[0] == 'M' ? this->metro_taxi.get_distance() : this->bus.get_distance();
}

string station::getvic()
{
    if(bus.get_distance()!= 0 && metro_taxi.get_distance()!= 0  && min(bus.get_distance() , metro_taxi.get_distance()) == bus.get_distance())
        return bus.get_type_vehicle();

    else if(bus.get_distance()!= 0 && metro_taxi.get_distance()!= 0 
    && min(bus.get_distance() , metro_taxi.get_distance()) == metro_taxi.get_distance())
        return metro_taxi.get_type_vehicle();

    else if (bus.get_distance()== 0 && metro_taxi.get_distance() != 0) 
        return metro_taxi.get_type_vehicle();

    else if (bus.get_distance()!= 0 && metro_taxi.get_distance() == 0)
        return bus.get_type_vehicle();

    //if two = 0??
}


