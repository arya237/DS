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
//    if((bus.get_distance()== 0 && metro.get_distance() == 0) || 
//    (bus.get_distance()!= 0 && metro.get_distance() != 0)) 
//    {     
//         return min(bus.get_distance() , metro.get_distance());
//    }

//    else if((bus.get_distance()== 0 && metro.get_distance() != 0) || 
//    (bus.get_distance()!= 0 && metro.get_distance() == 0)) 
//    {
//         return max(bus.get_distance() , metro.get_distance());
//    }

    //added new

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
    // if(bus.get_distance()!= 0 && metro.get_distance()!= 0 
    // && min(bus.get_distance() , metro.get_distance()) == bus.get_distance())
    //     return make_pair(bus.get_line() , bus.get_vic());
        
    // else if(bus.get_distance()!= 0 && metro.get_distance()!= 0 
    // && min(bus.get_distance() , metro.get_distance()) == metro.get_distance())
    //     return make_pair(metro.get_line() , metro.get_vic());

    // else if (bus.get_distance()== 0 && metro.get_distance() != 0) 
    //     return  make_pair(metro.get_line() , metro.get_vic());

    // else if (bus.get_distance()!= 0 && metro.get_distance() == 0)
    //     return make_pair(bus.get_line() , bus.get_vic());
    
    // if(bus.get_distance()!= 0 && metro.get_distance()!= 0 && 
    // && min(bus.get_distance() , metro.get_distance()) == bus.get_distance())
    //     return make_pair(bus.get_line() , bus.get_vic());



    //if two = 0??
}

// int station::get_time(string vehicle)
// {   
//     int 
//     return 
// }
//getvictime
/*
vehicle station::get_time(string pre_line , string pre_vic )
{
    int m = 8 , t = 2 , b = 4  ;
    int m_time =0 , t_time = 0 , b_time = 0; 
    vehicle answer;
    answer.setdis(0);

    //if(time.get_hour() >=6 && start_time.get_hour()<=8 )

    m_time = metro.get_distance() ; 
    t_time = taxi.get_distance() *t;  
    b_time = bus.get_distance()  *b; 


    //-----------------------------------------------------------------
    if((pre_line == metro.get_line() && pre_vic != metro.get_vic()) ||
    (pre_line != taxi.get_line() && pre_vic == taxi.get_vic())) //same line change to taxi or both taxi diffrent line
    {
        answer.setdis(t_time + 5);
        answer.set_line(taxi.get_line());
        answer.set_vic("taxi");

    }

    else if((pre_line == taxi.get_line() && pre_vic != taxi.get_vic()) ||
    (pre_line != metro.get_line() && pre_vic == metro.get_vic()))//same line change to metro or both metro difrrent line
    {
        answer.setdis(m_time + m);
        answer.set_line(metro.get_line());
        answer.set_vic("metro");
    }
    //-----------------------------------------------------------------
    
    else if((pre_line != bus.get_line() && pre_vic == bus.get_vic())) // both bus in a diffrent line(dont have same line but difrrent vic)
    {
        answer.setdis(b_time + 15);
        answer.set_line(bus.get_line());
        answer.set_vic("bus");
    }
    //-----------------------------------------------------------------
    else
    {
        if(b_time != 0 && m_time != 0)
        {
            if(min( min(t_time , b_time) , m_time ) == t_time)
            {
                answer.setdis(t_time);
                answer.set_line(taxi.get_line());
                answer.set_vic("taxi");
            }
            else if (min( min(t_time , b_time) , m_time) == m_time)
            {
                answer.setdis(m_time);
                answer.set_line(metro.get_line());
                answer.set_vic("metro");
            }
            else
            {
                answer.setdis(b_time);
                answer.set_line(bus.get_line());
                answer.set_vic("bus");
            }
        }
        else if(b_time == 0 && m_time != 0)
        {
            if(min(t_time , m_time) == t_time)
            {
                answer.setdis(t_time);
                answer.set_line(taxi.get_line());
                answer.set_vic("taxi");
            }
            else 
            {
                answer.setdis(m_time);
                answer.set_line(metro.get_line());
                answer.set_vic("metro");
            }
        }
        else if (b_time != 0 && m_time == 0)
        {
            answer.setdis(b_time);
            answer.set_line(bus.get_line());
            answer.set_vic("bus");

        }
    }
    
    return answer;
}
*/

int station::get_time(string vehicle, bool flag)
{
    if(vehicle == "metro" && flag)
        return getdis(vehicle).get_distance() + 8;

    else if(vehicle == "metro" && !flag) 
        return getdis(vehicle).get_distance();

    else if(vehicle == "bus" && flag)
        return getdis(vehicle).get_distance() * 4 + 15;

    else if(vehicle == "bus" && !flag) 
        return getdis(vehicle).get_distance() * 4 ;

    if(vehicle == "taxi" && flag)
        return getdis(vehicle).get_distance() * 2 + 5;

    else if(vehicle == "taxi" && !flag) 
        return getdis(vehicle).get_distance() * 2;
}
