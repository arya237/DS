#ifndef MATRIXES_HPP 
#define MATRIXES_HPP

#include <iostream>
#include <map>

#include "station.hpp"
#include "matrixes.hpp"

using namespace std;

class matrixes
{
    private:
    station distance [58][58];
    map <const string, int> names;

    public:
    matrixes();
};

#endif