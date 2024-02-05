#include <string>
#include <stdexcept>
#include <algorithm>

#include "matrixes.hpp"
#include <fstream>


matrixes::matrixes()
{
    read_distance_from_file();
    complete_graph_for_cost();
}

string matrixes::search_in_map(int i)
{
    for(auto item : names_of_station)
    {
        if(item.second == i)
        {
            return item.first;
        }
    }

    return NULL;
}

int matrixes::minDistance(node dist[], bool sptSet[])
{
    int min = INT_MAX, min_index;
 
    for (int i = 0; i < 59; i++)
    {
        if (sptSet[i] == false && dist[i].distance <= min)
            min = dist[i].distance, min_index = i;
    }

    return min_index;
}


void matrixes::run()
{
    get_input();
        
}

void matrixes::find_short_path(int start, int end)
{
    node shortest[59]; 
    bool sptSet[59]; 
  
    for (int i = 0; i < 59; i++)
        shortest[i].distance = INT_MAX, sptSet[i] = false;
 
    
    shortest[start].distance = 0;
    shortest[start].directions.push_back(search_in_map(start));
 
    for (int count = 0; count < 58; count++) 
    {  
        int u = minDistance(shortest, sptSet);
 
        sptSet[u] = true;
 
        for (int v = 0; v < 59; v++)
        {
            if (!sptSet[v] && pathes[u][v].getdis() && shortest[u].distance != INT_MAX
                && shortest[u].distance + pathes[u][v].getdis() < shortest[v].distance)
                {
                    shortest[v].distance = shortest[u].distance + pathes[u][v].getdis();
                    shortest[v].directions =  shortest[u].directions;  shortest[v].directions.push_back(search_in_map(v));
                    shortest[v].type_of_vehicle = shortest[u].type_of_vehicle; shortest[v].type_of_vehicle.push_back(pathes[v][u].getvic());
                }
        }
    }

    show_shortest_path(shortest[end]);
}

bool matrixes::is_valid(string start, string end)
{   
    try
    {
        if( !(names_of_station.count(start) && names_of_station.count(end)) )
        {
            throw invalid_argument("start or end is invalid!");
        }

        else return 1;
    }

    catch(const std::exception& e)
    {
        std::cerr << e.what() << '\n';
        return 0;
    }
    
}

void matrixes::show_shortest_path(node path)
{
    cout << path.distance << '\n';
    int size = path.directions.size();
    
    int j = 0;

    cout << " ** " << path.directions[0];

    for(int i = 1; i < size; i++)
    {
        
        cout << " -> " << path.directions[i];

        if(path.type_of_vehicle[j + 1] != path.type_of_vehicle[j])
        {
            cout << ": " << path.type_of_vehicle[j] << endl;
        }

        j++;
    }
}

void matrixes::read_distance_from_file ()
{
    fstream file;
 
    file.open("taxi_bus_distance.txt");

    string start, destiny, distance, type;

    getline(file, type);
    int counter = 0;
    bool flag = 0;
    
    if(!file.is_open())
    {
        cout << "error!";
    }

    else
    {
        while (!file.eof())
        {
            getline(file, start);

            if(start == "end*")
            {    
                break;
            }

            if(start == "end")
            {   
                getline(file, type);
                getline(file, start);
                flag = 0;  
            }
            
            getline(file, destiny);
            getline(file, distance);

            if(!flag)
            {   
                if(!names_of_station.count(start))
                {
                    names_of_station.insert({start, counter});
                    counter++;
                }
                lines[type].push_back(start);
                if(!names_of_station.count(destiny))
                {
                    names_of_station.insert({destiny, counter});
                    counter++;
                }
                lines[type].push_back(destiny);
                flag = 1;
            }

            else
            {   
                if(!names_of_station.count(destiny))
                {
                    names_of_station.insert({destiny, counter});
                    counter++;
                }
                lines[type].push_back(destiny);  
            }
    
            pathes[names_of_station[start]][names_of_station[destiny]].setinfo(stoi(distance), type);
            pathes[names_of_station[destiny]][names_of_station[start]].setinfo(stoi(distance), type);
        }

        file.close();
    }
}

void matrixes::complete_graph_for_cost()
{   
    bool Bus_flag = 0;

    for(auto i : lines)
    {   
        Bus_flag = i.first[0] == 'B' ? 1 : 0;

        for(auto j : i.second)
        {
            for(auto k : i.second)
            {   
                if(Bus_flag)
                {
                    
                        costs[names_of_station[j]][names_of_station[k]].setinfo(2250, i.first);
                        costs[names_of_station[k]][names_of_station[j]].setinfo(2250, i.first);
                   
                }

                else
                {
                    if (costs[names_of_station[j]][names_of_station[k]].getdis() != 2250)
                    {
                        
                        costs[names_of_station[j]][names_of_station[k]].setinfo(3267, i.first);
                        costs[names_of_station[k]][names_of_station[j]].setinfo(3267, i.first);
                        
                    }
                    
                    
                                        
                  
                }
            }
        }
    }

    // for(int i = 0; i < 59; i++)
    // {
    //     for(int j = 0; j < 59; j++)
    //     {
    //         cout << search_in_map(i) << "->" << search_in_map(j) << ": "  << costs[i][j].getdis() << endl;
    //     }
    // }

}

void matrixes::find_lowest_cost(int start, int end)
{
    node shortest[59]; 
    bool sptSet[59]; 
  
    for (int i = 0; i < 59; i++)
        shortest[i].distance = INT_MAX, sptSet[i] = false;
 
    
    shortest[start].distance = 0;
    shortest[start].directions.push_back(search_in_map(start));
 
    for (int count = 0; count < 58; count++) 
    {  
        int u = minDistance(shortest, sptSet);
 
        sptSet[u] = true;
 
        for (int v = 0; v < 59; v++)
        {
            if (!sptSet[v] && costs[u][v].getdis() && shortest[u].distance != INT_MAX
                && shortest[u].distance + costs[u][v].getdis() < shortest[v].distance)
                {
                    shortest[v].distance = shortest[u].distance + costs[u][v].getdis();
                    shortest[v].directions =  shortest[u].directions;  
                    shortest[v].directions.push_back(search_in_map(v));
                    shortest[v].type_of_vehicle = shortest[u].type_of_vehicle; 
                    shortest[v].type_of_vehicle.push_back(costs[v][u].getvic());
                }
        }
    }

    cout << shortest[end].distance << endl;
    show_cost(shortest[end].type_of_vehicle ,shortest[end].directions);
}

void matrixes:: get_input()
{
    string start, end;
    getline(cin, start);
    getline(cin, end);

    while ( !is_valid(start, end) )
    {
        getline(cin, start);
        getline(cin, end);
    }
    cout << "# Shortest Path #" << endl; 
    find_short_path(names_of_station[start], names_of_station[end]);
    cout << "# Lowest Cost #" << endl; 
    find_lowest_cost(names_of_station[start], names_of_station[end]);

}
void matrixes::show_cost(vector<string> line , vector <string> station)
{
    int j =0;

    // for(auto i : station)
    // {
    //     cout << i << " " ;
    // }
    for(int i = 0 ; i < station.size()-1 ; i++)
    {
        auto start = find(lines[line[j]].begin() ,lines[line[j]].end() , station[i] );
        auto end = find(lines[line[j]].begin() ,lines[line[j]].end() , station[i+1] );
        int dir =0;

        dir = start < end ? 1 : -1;

        for(auto k = start ; k <= end ; k+=dir)
        {
            cout << *k ;
            if(k!= end)
            {
                cout << " -> ";
            }
        }

       cout << ": " <<line[j] << endl ;


       j++;
    }

}