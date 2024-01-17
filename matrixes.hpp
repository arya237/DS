#ifndef MATRIXES_HPP 
#define MATRIXES_HPP

#include <iostream>
#include <unordered_map>
#include <limits.h>
#include <vector>
#include <vector>


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
    vector <string> metro_L1;
    vector <string> metro_L3;
    vector <string> metro_L4;
    vector <string> metro_L6;
    vector <string> Bus_1;
    vector <string> Bus_2;
    vector <string> Bus_3;


    public:
    matrixes();
    string search_in_map(int);
    int minDistance(node dist[], bool sptSet[]);
    bool is_valid(string start, string end); 
    void run();
    void show_shortest_path(node pathe);
    void show_lowest_cost_path(string start, string end);
    void find_short_path(int start, int end);
    vector <string> find_line(string & station);
    string find_intersection(vector <string> & start, vector <string> & end);
};

#endif