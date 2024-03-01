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
    vector <string> line_of_vehicle;

};

class smnhsh
{
    private:
    station pathes [59][59] = {}; 
    station costs  [59][59] = {};
    map <string, int > names_of_station;         
    unordered_map <string, vector<string>> lines; //for linking each line to its stations
    unordered_map <string, unordered_map<string, vector<string>>> station_vechicle;


    public:
    smnhsh(); //constructor
    bool is_valid(const string & start, const string & end) const; //checking name of stations(does exist or not)
    void run(); //run program
    void get_input(); //get inputs from users
    void read_distance_from_file (); //reading information from file
    void complete_graph_for_cost();  //make a graph filled with costs
    string search_in_map(int);  
    int minDistance(const node dist[], const bool sptSet[]) const;
    void find_short_path(const int & start, const int & end , Time & start_time); 
    void find_lowest_cost(const int & start, const int & end, Time & start_time);
    void show_shortest_path(const node & pathe, Time start_time); //printing name of stations for shortest path 
    void show_cost(const vector <string> & line , const vector <string> & station, const vector <string> & vehicle , Time start_time);//printing name of stations for lowest cost 
    // void calculate_each_line(unordered_map<string, vector<string>> vechicles, string src, node array[]);
    // void find_lowest_time(const int &start, const int &end, Time &start_time);
    // void show_lowest_time( const vector<string> &line, const vector<string> &station, const vector<string> & vehicle, Time start_time);
};

#endif