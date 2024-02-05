#ifndef MATRIXES_HPP 
#define MATRIXES_HPP

#include <iostream>
#include <unordered_map>
#include <map>
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
    station pathes [59][59] = {};
    station costs [59][59] = {};
    map <string, int > names_of_station;
    unordered_map <string, vector<string> > lines;


    public:
    matrixes();
    void read_distance_from_file ();
    void complete_graph_for_cost();
    string search_in_map(int);
    int minDistance(node dist[], bool sptSet[]);
    bool is_valid(string start, string end); 
    void run();
    void show_shortest_path(node pathe);
    void find_short_path(int start, int end);
    void find_lowest_cost(int start, int end);
};

#endif