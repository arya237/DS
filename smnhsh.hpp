#ifndef SMNHSH_HPP 
#define SMNHSH_HPP

#include <iostream>
#include <unordered_map>
#include <map>
#include <limits.h>
#include <vector>
#include <unordered_set>

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
    station pathes [59][59] = {}; //this matrix store every information between each two node i and j like line, vehicle and distance
    station costs  [59][59] = {}; // this matrix store cost between two node
    unordered_map <string, int > names_of_station; // links name of every station to a index
    unordered_map <string, vector<string>> lines; //for linking each line to its stations
    unordered_map <string, unordered_map<string, unordered_set<string>>> station_vechicle; // link name of every station to its lines
                                                                                          // then link each line to its avalible vehicle  

    public:
    smnhsh(); //constructor
    bool is_valid(const string & start, const string & end) const; //checking name of stations(does exist or not)
    void run(); //run program
    void get_input(); //get inputs from users
    void read_distance_from_file (); //reading information from file
    void complete_graph_for_cost();  //make a graph filled with costs
    string search_in_map(int);  // it used for find name of a station with a number with search in map 
    int  minvalue(const node dist[], const bool sptSet[]) const; // it used for dijkestra 
    void find_short_path(const int & start, const int & end , Time & start_time); // it is dijkestra
    void find_lowest_cost(const int & start, const int & end, Time & start_time); // it is dijkestra
    void show_shortest_path(const node & pathe, Time start_time); //print direction for shortest path and calculate arriving time 
    void show_cost(const vector <string> & , const vector <string> & , const vector <string> & , Time);//print directrion for lowest cost
    void calculate_time_each_line(unordered_map<string, unordered_set<string>> , string , node array[], bool visible[], Time start_time);
    void find_lowest_time(const int &start, const int &end, Time start_time);
    void print_lowest_time(const node &path, Time start_time); // print direction for lowest time

};

#endif