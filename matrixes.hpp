#ifndef MATRIXES_HPP 
#define MATRIXES_HPP

#include <iostream>
#include <unordered_map>
#include <limits.h>
#include <vector>
#include <unordered_set>


#include "station.hpp"
#include "matrixes.hpp"

using namespace std;


struct node
{
    int distance = INT_MAX;
    vector <string> directions;
    vector <string> type_of_vehicle;

};

class matrixes
{
    private:
    station pathes [59][59];
    unordered_map <string, int > names_of_station;
    unordered_set <string> metro_L1;
    unordered_set <string> metro_L3;
    unordered_set <string> metro_L4;
    unordered_set <string> metro_L6;
    unordered_set <string> Bus_1;
    unordered_set <string> Bus_2;
    unordered_set <string> Bus_3;

    public:
    matrixes();
    void run();
    string search_in_map(int);
    void find_short_path(int start, int end);
    int minDistance(node dist[], bool sptSet[]);
    bool is_valid(string start, string end); 
    void print();
};

#endif