#ifndef TIME_HPP
#define TIME_HPP

#include <iostream>

class Time
{
    private:
    int hour = 0;
    int min = 0;
    
    public:
    Time(std::string start_time);
    void operator+(int minute);
    void print();
    int get_hour(){return hour;}
    int get_minute(){return min;}
};

#endif

