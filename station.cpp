#include "station.hpp"
#include "smnhsh.hpp"


void station::setinfo(vehicle value)
{   

    //added new because for cost was false
    if(value.get_vic() == "bus")
    {
        this->bus = value;
    }

    else if(value.get_vic() == "metro")
    {   
        this->metro = value;
    }


    else if(value.get_vic() == "taxi")
    {
        this->taxi = value;
    }

    else if(value.get_line()[0] == 'B')
    {   
        
        this->bus = value;
        this->bus.set_vic("bus");
    }

    else if(value.get_line()[0] == 'M')
    {   
        
        this->metro = value;
        this->metro.set_vic("metro");
        
        this->taxi = value;
        this->taxi.set_vic("taxi");
    }

}

vehicle station::getdis()
{  

    vehicle min = this->metro;
    
    if( (bus.get_distance() && bus.get_distance() < min.get_distance() ) || min.get_distance() == 0)
    min = this->bus;

    if( (taxi.get_distance() && taxi.get_distance() < min.get_distance()) || min.get_distance() == 0)
    min = this->taxi;

    return min;
} 

vehicle station::getdis(const string & type_vehicle)
{   
    //added taxi
    return type_vehicle == "metro" ? this->metro : type_vehicle == "taxi" ? this->taxi: this->bus;
}

pair<string , string > station::getvic()
{
   
}



int station::get_time(string vehicle, bool flag , Time &start_time)
{
    int b = start_time.get_hour() >= 6 && start_time.get_hour() <= 8 ? 2 : 1;
    int m = start_time.get_hour() >= 6 && start_time.get_hour() <= 8 ? 24 : 8;
    int t = start_time.get_hour() >= 18 && start_time.get_hour() <= 20 ? 2 : 1;

    if(vehicle == "metro" && flag)
        return getdis(vehicle).get_distance() + m;

    else if(vehicle == "metro" && !flag) 
        return getdis(vehicle).get_distance();

    else if(vehicle == "bus" && flag)
        return getdis(vehicle).get_distance() * (4*b) + (15*b);

    else if(vehicle == "bus" && !flag) 
        return getdis(vehicle).get_distance() * (4*b) ;

    if(vehicle == "taxi" && flag)
        return getdis(vehicle).get_distance() * (2*t) + (5*t);

    else if(vehicle == "taxi" && !flag) 
        return getdis(vehicle).get_distance() * (2*t);
}
