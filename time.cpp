#include "time.hpp"
#include <iostream>

using namespace std;

Time::Time(string start_time)
{   
    string time_hr, time_min;

    time_hr = start_time[0];
    time_hr += start_time[1];
    time_min = start_time[start_time.size()-2];
    time_min +=  start_time[start_time.size()-1];

    min = stoi(time_min);
    hour = stoi(time_hr);
}

void Time::operator+(int minute)
{
    min += minute;
    hour += min / 60; 
    hour %= 24; 
    min %= 60;
}

void Time::print()
{
    cout << hour << ":" << min << endl;
}