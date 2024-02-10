#ifndef SMNHSH_HPP 
#define SMNHSH_HPP

#include <iostream>
#include <unordered_map>
#include <map>
#include <limits.h>
#include <vector>
#include <vector>

#include "station.hpp"
#include "smnhsh.hpp"
#include "time.hpp"

using namespace std;

struct node
{
    int value = INT_MAX;
    vector <string> directions;      //name of station
    vector <string> type_of_vehicle; //name of vehicle (bus / taxi_metro)

};

class smnhsh
{
    private:
    station pathes [59][59] = {}; 
    station costs  [59][59] = {};
    map <string, int > names_of_station;         
    unordered_map <string, vector<string>> lines; //for linking each line to its stations


    public:
    smnhsh(); //constructor
    bool is_valid(string start, string end); //checking name of stations(does exist or not)
    void run(); //run program
    void get_input(); //get inputs from users
    void read_distance_from_file (); //reading information from file
    void complete_graph_for_cost();  //make a graph filled with costs
    string search_in_map(int);  
    int minDistance(node dist[], bool sptSet[]);
    void find_short_path(int start, int end , Time start_time); 
    void find_lowest_cost(int start, int end, Time start_time);
    void show_shortest_path(node pathe , Time start_time); //printing name of stations for shortest path 
    void show_cost(vector<string> line , vector <string> station , Time start_time);//printing name of stations for lowest cost 
};

#endif