#ifndef MATRIXES_HPP 
#define MATRIXES_HPP

#include <iostream>
#include <map>
#include <limits.h>
#include <vector>


#include "station.hpp"
#include "matrixes.hpp"

using namespace std;


struct node
{
    int dist = INT_MAX;
    vector <string> directions;
    vector <string> type;

};

class matrixes
{
    private:
    station distance [59][59];
    map < const string, int > names;

    public:
    matrixes();
    void run();
    string search_in_map(int);
    void find_short_path(int start, int end);
    int minDistance(node dist[], bool sptSet[]);
    bool is_valid(string start, string end); 
};

#endif