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
    station distance [59][59];
    map < const string, int > names;

    public:
    matrixes();
    void print();
    void search_in_map(int, int);
    void find_short_path(int start, int end);
    int minDistance(int dist[], bool sptSet[]); 
    void run();
};

#endif