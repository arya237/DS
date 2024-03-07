#ifndef TIMEE_H
#define TIMEE_H

#include <iostream>

class Timee
{
private:
    int hour = 0;
    int min = 0;

public:
    Timee(const std::string & start_time);
    void operator+(int minute); // operator overloading
    void print();
    Timee(){}
    std::string to_str();
    int get_hour(){return hour;}
    int get_minute(){return min;}
};

#endif // TIMEE_H
