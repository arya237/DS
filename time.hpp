#ifndef TIME_HPP
#define TIME_HPP

#include <iostream>

class Time
{
    private:
    int hour = 0;
    int min = 0;
    
    public:
    Time(const std::string & start_time);
    void operator+(int minute); // operator overloading
    void print();
    int get_hour(){return hour;}
    int get_minute(){return min;}
};

#endif

