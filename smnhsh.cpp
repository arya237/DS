#include <string>
#include <stdexcept>
#include <algorithm>
#include <fstream>
#include <time.h>

#include "smnhsh.hpp"

smnhsh::smnhsh()
{
    read_distance_from_file();
    complete_graph_for_cost();
}

//--------------------------------------------------------

bool smnhsh::is_valid(const string &start, const string &end) const //checking names of stations
{
    try
    {
        if (!(names_of_station.count(start) && names_of_station.count(end)))
        {
            throw invalid_argument("start or end is invalid!");
        }

        else
            return 1;
    }

    catch (const std::exception &e)
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

void smnhsh::get_input()
{

    int num_order;
    cin >> num_order;
    cin.ignore();

    while (num_order--) // number of test cases
    {
        string start, end, time;

        getline(cin, time);
        getline(cin, start);
        getline(cin, end);

        Time start_time(time);

        while (!is_valid(start, end))
        {
            getline(cin, start);
            getline(cin, end);
        }

        

        // cout << "\n# Shortest Path #" << endl;
        // find_short_path(names_of_station[start], names_of_station[end], start_time);

        // cout << "\n# Lowest Cost #" << endl;
        // find_lowest_cost(names_of_station[start], names_of_station[end], start_time);

        cout << "\n# Lowest Time #\n";
        find_lowest_time(names_of_station[start], names_of_station[end], start_time);
    }
}

//--------------------------------------------------------

void smnhsh::read_distance_from_file()
{
    fstream file;

    file.open("taxi_bus_distance.txt");

    string start, destiny, distance, type;

    //read first line of file 
    getline(file, type);
    int counter = 0;
    bool flag = 0;

    if (!file.is_open())
    {
        cout << "error!";
    }

    else
    {
        while (!file.eof())
        {
            vehicle temp;
            
            getline(file, start);

            //if file finished
            if (start == "end*")
            {
                break;
            }

            //if line finished
            if (start == "end")
            {
                getline(file, type);
                getline(file, start);
                flag = 0;
            }

            getline(file, destiny);
            getline(file, distance);

            if (!flag)
            {
                if (!names_of_station.count(start))
                {
                    names_of_station.insert({start, counter});
                    counter++;
                }

                lines[type].push_back(start);

                if(type[0] == 'M')
                {
                    station_vechicle[start][type].insert("metro");
                    station_vechicle[start][type].insert("taxi");
                }

                else station_vechicle[start][type].insert("bus");

                if (!names_of_station.count(destiny))
                {
                    names_of_station.insert({destiny, counter});
                    counter++;
                }
                lines[type].push_back(destiny);

                if(type[0] == 'M')
                {
                    station_vechicle[destiny][type].insert("metro");
                    station_vechicle[destiny][type].insert("taxi");
                }

                else station_vechicle[destiny][type].insert("bus");
                flag = 1;
            }

            else
            {
                if (!names_of_station.count(destiny))
                {
                    names_of_station.insert({destiny, counter});
                    counter++;
                }

                lines[type].push_back(destiny);
                 
                if(type[0] == 'M')
                {
                    station_vechicle[destiny][type].insert("metro");
                    station_vechicle[destiny][type].insert("taxi");
                }

                else station_vechicle[destiny][type].insert("bus");
            }

            temp.setval(stoi(distance));
            temp.set_line(type);


            pathes[names_of_station[start]][names_of_station[destiny]].setinfo(temp);
            pathes[names_of_station[destiny]][names_of_station[start]].setinfo(temp);

           
        }

        file.close();
    }
    
}

//--------------------------------------------------------

void smnhsh::complete_graph_for_cost()
{
    bool Bus_flag = 0, Metro_Taxi = 0;
    for (auto i : lines)
    {
        Bus_flag = i.first[0] == 'B' ? 1 : 0;
        Metro_Taxi = i.first[0] == 'M' ? 1 : 0;

        for (auto j : i.second)
        {
            for (auto k : i.second)
            {
                vehicle temp;

                if (Bus_flag)
                {
                    temp.setval(2250);
                    temp.set_line(i.first);
                    temp.set_vic("bus");

                    costs[names_of_station[j]][names_of_station[k]].setinfo(temp);
                    costs[names_of_station[k]][names_of_station[j]].setinfo(temp);
                }

                if (Metro_Taxi && costs[names_of_station[j]][names_of_station[k]].getdis().get_val() != 2250)
                {
                    int cost = pathes[names_of_station[j]][names_of_station[k]].getdis().get_val() * 6000;

                    temp.setval(cost);
                    temp.set_line(i.first);
                    temp.set_vic("taxi");

                    costs[names_of_station[j]][names_of_station[k]].setinfo(temp);
                    costs[names_of_station[k]][names_of_station[j]].setinfo(temp);
                }

                if (Metro_Taxi && (costs[names_of_station[j]][names_of_station[k]].getdis().get_val() > 3267 ||
                                   costs[names_of_station[j]][names_of_station[k]].getdis().get_val() == 0))
                {
                    temp.setval(3267);
                    temp.set_line(i.first);
                    temp.set_vic("metro");
                    
                    costs[names_of_station[j]][names_of_station[k]].setinfo(temp);
                    costs[names_of_station[k]][names_of_station[j]].setinfo(temp);
                }
            }
        }
    }
}

//--------------------------------------------------------

string smnhsh::search_in_map(int i)
{
    for (auto item : names_of_station)
    {
        if (item.second == i)
        {
            return item.first;
        }
    }

    return "";
}

//--------------------------------------------------------

int smnhsh::minvalue(const node dist[], const bool sptSet[]) const //return minimum value 
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

void smnhsh::find_short_path(const int &start, const int &end, Time &start_time)
{   
    node shortest[59];
    bool sptSet[59];

    for (int i = 0; i < 59; i++)
        shortest[i].value = INT_MAX, sptSet[i] = false;

    shortest[start].value = 0;
    shortest[start].directions.push_back(search_in_map(start));

    for (int count = 0; count < 58; count++)
    {
        int u = minvalue(shortest, sptSet);

        sptSet[u] = true;

        for (int v = 0; v < 59; v++)
        {

            if (!sptSet[v] && pathes[u][v].getdis().get_val() && shortest[u].value != INT_MAX 
            && shortest[u].value + pathes[u][v].getdis().get_val() < shortest[v].value)
            {   
                
                shortest[v].value = shortest[u].value + pathes[u][v].getdis().get_val();
                shortest[v].directions = shortest[u].directions;
                shortest[v].directions.push_back(search_in_map(v));
                shortest[v].line_of_vehicle = shortest[u].line_of_vehicle;
                shortest[v].line_of_vehicle.push_back(pathes[v][u].getdis().get_line());
                shortest[v].type_of_vehicle = shortest[u].type_of_vehicle;
                shortest[v].type_of_vehicle.push_back(pathes[v][u].getdis().get_vic());
            }
        }
    }

    show_shortest_path(shortest[end], start_time);
}

//--------------------------------------------------------

void smnhsh::find_lowest_cost(const int &start, const int &end, Time &start_time)
{
    node shortest[59];
    bool sptSet[59];

    for (int i = 0; i < 59; i++)
        shortest[i].value = INT_MAX, sptSet[i] = false;

    shortest[start].value = 0;
    shortest[start].directions.push_back(search_in_map(start));

    for (int count = 0; count < 58; count++)
    {
        int u = minvalue(shortest, sptSet);

        sptSet[u] = true;

        for (int v = 0; v < 59; v++)
        {
          
            if (!sptSet[v] && costs[u][v].getdis().get_val() && shortest[u].value != INT_MAX 
            && shortest[u].value + costs[u][v].getdis().get_val() <= shortest[v].value)
            {   
                
                shortest[v].value = shortest[u].value + costs[u][v].getdis().get_val();
                shortest[v].directions = shortest[u].directions;
                shortest[v].directions.push_back(search_in_map(v));
                shortest[v].line_of_vehicle = shortest[u].line_of_vehicle;
                shortest[v].line_of_vehicle.push_back(costs[v][u].getdis().get_line());
                shortest[v].type_of_vehicle = shortest[u].type_of_vehicle;
                shortest[v].type_of_vehicle.push_back(costs[v][u].getdis().get_vic());
            }
        }
    }
    cout << shortest[end].value << endl;
    show_cost(shortest[end].line_of_vehicle, shortest[end].directions, shortest[end].type_of_vehicle ,start_time);
}

//--------------------------------------------------------

void smnhsh::show_shortest_path(const node &path, Time start_time) 
{
    //print direction for shortest path and calculate arriving time
    cout << path.value << '\n';
    int size = path.directions.size();

    int j = 0;

    cout << " ** " << path.directions[0];

    for (int i = 1; i < size; i++)
    {

        int time = 0;

        cout << " -> " << path.directions[i];
        if (path.line_of_vehicle[j][0] == 'B')
        {
            int trafic_time = start_time.get_hour() < 8 && start_time.get_hour() >= 6 ? 8 : 4;
            time += pathes[names_of_station[path.directions[j]]][names_of_station[path.directions[i]]].getdis().get_val() * trafic_time;
        }

        else
        {
            time += pathes[names_of_station[path.directions[j]]][names_of_station[path.directions[i]]].getdis().get_val();
        }

        if (path.line_of_vehicle[j + 1] != path.line_of_vehicle[j])
        {
            if (path.line_of_vehicle[j][0] == 'B')
            {
                time += 15;
            }

            else
            {
                int trafic_time = start_time.get_hour() < 8 && start_time.get_hour() >= 6 ? 24 : 8;
                time += trafic_time;
            }

            cout << ": " << path.line_of_vehicle[j] << endl;
        }

        start_time + time;
        j++;
    }

    start_time.print();
}

//--------------------------------------------------------

void smnhsh::show_cost(const vector<string> &line, const vector<string> &station, const vector<string> & vehicle, Time start_time)
{
    //print direction for shortest path and calculate arriving time
    int j = 0;

    for (int i = 0; i < station.size() - 1; i++)
    {
        auto start = find(lines[line[j]].begin(), lines[line[j]].end(), station[i]);
        auto end = find(lines[line[j]].begin(), lines[line[j]].end(), station[i + 1]);
        int dir = 0;
        int time = 0;

        dir = start < end ? 1 : -1;
        for (auto k = start; k != end + dir; k += dir)
        {

            if (k != end)
            {
                if (line[j][0] == 'B')
                {
                    int trafic_time = start_time.get_hour() < 8 && start_time.get_hour() >= 6 ? 8 : 4;
                    time += pathes[names_of_station[*k]][names_of_station[*(k + dir)]].getdis(vehicle[j]).get_val() * trafic_time;
                }

                else
                {
                    time += pathes[names_of_station[*k]][names_of_station[*(k + dir)]].getdis(vehicle[j]).get_val();
                }
            }

            cout << *k;
            if (k != end)
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
            int trafic_time = start_time.get_hour() < 8 && start_time.get_hour() >= 6 ? 24 : 8;
            time += trafic_time;
        }

        cout << ": " << vehicle[j] << " with " << line[j] << endl;
    
        start_time + time;

        j++;
    }

    start_time.print();
}

//--------------------------------------------------------

void smnhsh::find_lowest_time(const int &start, const int &end, Time start_time)
{   
    
    node shortest[59];
    bool sptSet[59];

    for (int i = 0; i < 59; i++)
        shortest[i].value = INT_MAX, sptSet[i] = false;

    shortest[start].value = 0;
    shortest[start].directions.push_back(search_in_map(start));

    for (int count = 0; count < 59; count++)
    {
        int u = minvalue(shortest, sptSet);

        calculate_time_each_line(station_vechicle[search_in_map(u)], search_in_map(u), shortest, sptSet , start_time);

        sptSet[u] = true;
    }

    print_lowest_time(shortest[end], start_time);
    
}

//--------------------------------------------------------

void smnhsh::print_lowest_time(const node &time, Time start_time)
{
    cout << time.value << endl;
    start_time + time.value;
    
    for(int i = 0 ; i < time.directions.size() -1 ; i++ )
    {
        cout << time.directions[i]  << " (" << time.type_of_vehicle[i] << ")" <<" -> ";
    }

    cout << time.directions[time.directions.size()-1]  <<endl;
    
    start_time.print();
}

//--------------------------------------------------------

void smnhsh::calculate_time_each_line(unordered_map<string, unordered_set<string>> vechicles, string src, node array[], bool visible[],Time start_time)
{
    for(auto line: vechicles)
    {
        for(auto vehicle: line.second)
        {   
            Time cal_time = start_time;
            auto source = find(this->lines[line.first].begin(), this->lines[line.first].end(), src) ; //source station
            node resault = array[names_of_station[src]];
            bool flag = 1;

            for(auto i = source; i != this->lines[line.first].end() - 1; i++) 
            {   

                if(i == source)
                {
                    if(!array[names_of_station[src]].type_of_vehicle.size()) //if vector(type_of_vehicle) is empty 
                                                                            //true flag
                    {   
                        flag = 1;
                    }

                    else if(array[names_of_station[src]].type_of_vehicle[array[names_of_station[src]].type_of_vehicle.size() - 1] != vehicle)
                    flag = 1; // if the last element of "type_of_vehicle" is not equal to vehicle
                              // true flag

                    else if(array[names_of_station[src]].line_of_vehicle[array[names_of_station[src]].line_of_vehicle.size() - 1] != line.first)
                    flag = 1; // if the last element of "line_of_vehicle" is not equal to line.first(line's name)
                              // true flag

                }
                    
                    resault.value += pathes[names_of_station[*i]][names_of_station[*(i + 1)]].get_time(vehicle, flag, cal_time);
                  //  temp.value = pathes[names_of_station[*i]][names_of_station[*(i + 1)]].get_time(vehicle, flag, cal_time);
                    start_time = pathes[names_of_station[*i]][names_of_station[*(i + 1)]].get_time(resault.value , cal_time);
                   // cout << "1 :  " ; start_time.print(); cout << endl;
                    //calculate time between 2 stations
                    //start_time + resault.value;
                  //  cout << "2 :  " ; start_time.print(); cout << endl;
                    resault.directions.push_back(*(i + 1));
                    resault.line_of_vehicle.push_back(line.first); //which line
                    resault.type_of_vehicle.push_back(vehicle);   // which vehicle

                    flag = 0;

                if(array[names_of_station[*(i + 1)]].value >= resault.value )
                {
                    array[names_of_station[*(i + 1)]] = resault;
                    // start_time + resault.value;
                    
                }
            }

            resault = array[names_of_station[src]]; 
            flag = 1;

            for(auto i = source; i != this->lines[line.first].begin(); i--)
            {   
                if(!visible[names_of_station[*(i - 1)]]) //if it's not visited
                {   

                    if(i == source)
                    {
                        if(!array[names_of_station[src]].type_of_vehicle.size())
                        {   
                            flag = 1;
                        }

                        else if(array[names_of_station[src]].type_of_vehicle[array[names_of_station[src]].type_of_vehicle.size() - 1] != vehicle)
                        flag = 1; // if the last element of "type_of_vehicle" is not equal to vehicle
                                  // true flag

                        else if(array[names_of_station[src]].line_of_vehicle[array[names_of_station[src]].line_of_vehicle.size() - 1] != line.first)
                        flag = 1; // if the last element of "line_of_vehicle" is not equal to line.first(line's name)
                                 // true flag

                    }
        
                    resault.value += pathes[names_of_station[*i]][names_of_station[*(i - 1)]].get_time(vehicle, flag, cal_time);
                   // temp.value = pathes[names_of_station[*i]][names_of_station[*(i + 1)]].get_time(vehicle, flag, cal_time);
                    start_time = pathes[names_of_station[*i]][names_of_station[*(i + 1)]].get_time(resault.value , cal_time);
                     //calculate time between 2 stations
                    // cout << "3 :  " ; start_time.print(); cout << endl;
                    //  start_time + resault.value;
                    // cout << "4 :  " ; start_time.print(); cout << endl;
                    resault.directions.push_back(*(i - 1));
                    resault.line_of_vehicle.push_back(line.first);
                    resault.type_of_vehicle.push_back(vehicle);
                    flag = 0;
                    
                    
                    if(array[names_of_station[*(i - 1)]].value  >= resault .value)
                    {
                        array[names_of_station[*(i - 1)]] = resault ;
                         //start_time + resault.value;

                    }
                }
            }
        }
    }

}
