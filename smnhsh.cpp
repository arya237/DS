#include <string>
#include <stdexcept>
#include <algorithm>

#include "smnhsh.hpp"
#include <fstream>


smnhsh::smnhsh()
{
    read_distance_from_file();
    complete_graph_for_cost();
}

//--------------------------------------------------------

bool smnhsh::is_valid(string start, string end)
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

//--------------------------------------------------------

void smnhsh::run()
{
    get_input();
        
}

//--------------------------------------------------------

void smnhsh:: get_input()
{
    
    int num_order;
    //cout<< "num_order" <<num_order<<endl;
    cin>>num_order;
    cin.ignore();

    while (num_order --)
    {
        string start, end;
        string time;
        getline(cin, time);
        //cout<< "time" << time<<endl;
        getline(cin, start);
        getline(cin, end);

        while ( !is_valid(start, end) )
        {
            getline(cin, start);
            getline(cin, end);
        }
        cout << "# Shortest Path #" << endl; 
        find_short_path(names_of_station[start], names_of_station[end], time);
        cout << "# Lowest Cost #" << endl; 
        find_lowest_cost(names_of_station[start], names_of_station[end], time);   
            
    }
    
}

//--------------------------------------------------------

void smnhsh::read_distance_from_file ()
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

//--------------------------------------------------------

void smnhsh::complete_graph_for_cost()
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
}

//--------------------------------------------------------

string smnhsh::search_in_map(int i)
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

//--------------------------------------------------------

int smnhsh::minDistance(node dist[], bool sptSet[])
{
    int min = INT_MAX, min_index;
 
    for (int i = 0; i < 59; i++)
    {
        if (sptSet[i] == false && dist[i].value <= min)
            min = dist[i].value, min_index = i;
    }

    return min_index;
}

//--------------------------------------------------------

void smnhsh::find_short_path(int start, int end, string start_time)
{
    node shortest[59]; 
    bool   sptSet[59]; 
  
    for (int i = 0; i < 59; i++)
        shortest[i].value = INT_MAX, sptSet[i] = false;
 
    
    shortest[start].value = 0;
    shortest[start].directions.push_back(search_in_map(start));
 
    for (int count = 0; count < 58; count++) 
    {  
        int u = minDistance(shortest, sptSet);
 
        sptSet[u] = true;
 
        for (int v = 0; v < 59; v++)
        {
            if (!sptSet[v] && pathes[u][v].getdis() && shortest[u].value != INT_MAX
                && shortest[u].value + pathes[u][v].getdis() < shortest[v].value)
                {
                    shortest[v].value = shortest[u].value + pathes[u][v].getdis();
                    shortest[v].directions =  shortest[u].directions;  
                    shortest[v].directions.push_back(search_in_map(v));
                    shortest[v].type_of_vehicle = shortest[u].type_of_vehicle; 
                    shortest[v].type_of_vehicle.push_back(pathes[v][u].getvic());
                }
        }
    }

    show_shortest_path(shortest[end], start_time);
}

//--------------------------------------------------------

void smnhsh::find_lowest_cost(int start, int end , string start_time)
{
    node shortest[59]; 
    bool   sptSet[59]; 
  
    for (int i = 0; i < 59; i++)
        shortest[i].value = INT_MAX, sptSet[i] = false;
 
    
    shortest[start].value = 0;
    shortest[start].directions.push_back(search_in_map(start));
 
    for (int count = 0; count < 58; count++) 
    {  
        int u = minDistance(shortest, sptSet);
 
        sptSet[u] = true;
 
        for (int v = 0; v < 59; v++)
        {
            if (!sptSet[v] && costs[u][v].getdis() && shortest[u].value != INT_MAX
                && shortest[u].value + costs[u][v].getdis() <= shortest[v].value)
                {
                    shortest[v].value = shortest[u].value + costs[u][v].getdis();
                    shortest[v].directions =  shortest[u].directions;  
                    shortest[v].directions.push_back(search_in_map(v));
                    shortest[v].type_of_vehicle = shortest[u].type_of_vehicle; 
                    shortest[v].type_of_vehicle.push_back(costs[v][u].getvic());
                }
        }
    }

    cout << shortest[end].value << endl;
    show_cost(shortest[end].type_of_vehicle ,shortest[end].directions , start_time);
}

//--------------------------------------------------------

void smnhsh::show_shortest_path(node path , string start_time)
{
    int time = 0;

    cout << path.value << '\n';
    int size = path.directions.size();
    
    int j = 0;

    cout << " ** " << path.directions[0];

    for(int i = 1; i < size; i++)
    {
        
        cout << " -> " << path.directions[i];
        if (path.type_of_vehicle[j][0] == 'B' )
        {
            time += pathes[names_of_station[path.directions[j]]][names_of_station[path.directions[i]]].getdis() * 4;
            
            
        }
        else
        {
            time += pathes[names_of_station[path.directions[j]]][names_of_station[path.directions[i]]].getdis();
        }
        
         

        if(path.type_of_vehicle[j + 1] != path.type_of_vehicle[j])
        {
            if (path.type_of_vehicle[j][0] == 'B')
            {
                time += 15;
            }
            else
            {
                time += 8;
            }
            
            cout << ": " << path.type_of_vehicle[j] << endl;
        }
        j++;
       

    }
  
    string time_min , time_hr ;
    time_min = start_time[start_time.size()-2];
    time_min +=  start_time[start_time.size()-1];
    time_hr = start_time[0];
    time_hr += start_time[1];
    time += stoi(time_min) ;
    int hour = 0, min = 0;
    hour = time / 60;
    min  = time % 60;
    hour += stoi(time_hr);
    hour %= 24;
    cout << hour << ":" << min << endl ;
}


//--------------------------------------------------------

void smnhsh::show_cost(vector<string> line , vector <string> station , string start_time)
{
    int j =0;
    int time = 0;

    for(int i = 0 ; i < station.size() - 1 ; i++)
    {
        auto start = find(lines[line[j]].begin() ,lines[line[j]].end() , station[i] );
        auto end   = find(lines[line[j]].begin() ,lines[line[j]].end() , station[i + 1] );
        int dir    = 0;

        dir = start < end ? 1 : -1;
        for(auto k = start ; k != end + dir ; k += dir)
        {
            if( k != end)
            {
                if (line[j][0] == 'B' )
                {
                    time += pathes[names_of_station[*k]][names_of_station[*(k+dir)]].getdis() * 4;
                }
                else
                {
                    time += pathes[names_of_station[*k]][names_of_station[*(k+dir)]].getdis();
                }
            }
            
            cout << *k ;
            if(k!= end)
            {
                cout << " -> ";
            }
        }

            if (line[j][0] == 'B')
            {
                time += 15;
            }
            else
            {
                time += 8;
            }
            
            cout << ": " <<line[j] << endl ;
       j++;
    }

    string time_min , time_hr ;
    time_min = start_time[start_time.size()-2];
    time_min +=  start_time[start_time.size()-1];
    time_hr = start_time[0];
    time_hr += start_time[1];
    time += stoi(time_min) ;
    int hour = 0, min = 0;
    hour = time / 60;
    min  = time % 60;
    hour += stoi(time_hr);
    hour %= 24;
    cout << hour << ":" << min << endl ;
    
}

//conflict