#include "smnsh.h"
#include <string>
#include <stdexcept>
#include <algorithm>
#include <fstream>
#include <QQmlComponent>
#include <QObject>

Smnsh::Smnsh(QObject *parent)
    : QObject{parent}
{
    read_distance_from_file();
    complete_graph_for_cost();
}


//--------------------------------------------------------

bool Smnsh::is_valid(const string &start, const string &end) const
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

void Smnsh::run()
{
    get_input();
}

//--------------------------------------------------------

void Smnsh::get_input()
{

    int num_order;
    cin >> num_order;
    cin.ignore();

    while (num_order--)
    {
        string start, end, time;

        getline(cin, time);
        getline(cin, start);
        getline(cin, end);

        Timee start_time(time);

        while (!is_valid(start, end))
        {
            getline(cin, start);
            getline(cin, end);
        }



        cout << "\n# Shortest Path #" << endl;

        find_short_path(names_of_station[start], names_of_station[end], start_time);

        cout << "\n# Lowest Cost #" << endl;
        find_lowest_cost(names_of_station[start], names_of_station[end], start_time);

        cout << "\n# Lowest Time #\n";
        find_lowest_time(names_of_station[start], names_of_station[end], start_time);
    }
}

//--------------------------------------------------------

void Smnsh::read_distance_from_file()
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

            temp.setdis(stoi(distance));
            temp.set_line(type);


            pathes[names_of_station[start]][names_of_station[destiny]].setinfo(temp);
            pathes[names_of_station[destiny]][names_of_station[start]].setinfo(temp);


        }

        file.close();
    }

}

//--------------------------------------------------------

void Smnsh::complete_graph_for_cost()
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
                    temp.setdis(2250);
                    temp.set_line(i.first);
                    temp.set_vic("bus");

                    costs[names_of_station[j]][names_of_station[k]].setinfo(temp);
                    costs[names_of_station[k]][names_of_station[j]].setinfo(temp);
                }

                if (Metro_Taxi && costs[names_of_station[j]][names_of_station[k]].getdis().get_distance() != 2250)
                {
                    int cost = pathes[names_of_station[j]][names_of_station[k]].getdis().get_distance() * 6000;

                    temp.setdis(cost);
                    temp.set_line(i.first);
                    temp.set_vic("taxi");

                    costs[names_of_station[j]][names_of_station[k]].setinfo(temp);
                    costs[names_of_station[k]][names_of_station[j]].setinfo(temp);
                }

                if (Metro_Taxi && (costs[names_of_station[j]][names_of_station[k]].getdis().get_distance() > 3267 ||
                                   costs[names_of_station[j]][names_of_station[k]].getdis().get_distance() == 0))
                {
                    temp.setdis(3267);
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

string Smnsh::search_in_map(int i)
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

int Smnsh::minDistance(const node dist[], const bool sptSet[]) const //change name!!!!!!!!!!!!!!!!!!1
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

void Smnsh::find_short_path(const int &start, const int &end, Timee &start_time)
{
    node shortest[59];
    bool sptSet[59];

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

            if (!sptSet[v] && pathes[u][v].getdis().get_distance() && shortest[u].value != INT_MAX
                && shortest[u].value + pathes[u][v].getdis().get_distance() < shortest[v].value)
            {

                shortest[v].value = shortest[u].value + pathes[u][v].getdis().get_distance();
                shortest[v].directions = shortest[u].directions;
                shortest[v].directions.push_back(search_in_map(v));
                shortest[v].line_of_vehicle = shortest[u].line_of_vehicle;
                shortest[v].line_of_vehicle.push_back(pathes[v][u].getdis().get_line());
                shortest[v].type_of_vehicle = shortest[u].type_of_vehicle;
                shortest[v].type_of_vehicle.push_back(pathes[v][u].getdis().get_vic());
            }
        }
    }


    int j = 0;

    for(int i = 1; i < shortest[end].directions.size(); i++)
    {
        cout << shortest[end].line_of_vehicle[i - 1] << endl;
        cout << shortest[end].directions[i]<<endl;

        if(shortest[end].line_of_vehicle[i - 1][0] == 'B')
        {
            store_ui[shortest[end].directions[i]]->setProperty("color", "#005F73");
        }

        else if(shortest[end].line_of_vehicle[i - 1][0] == 'M')
        {
            store_ui[shortest[end].directions[i]]->setProperty("color", "#9e0059");
        }
    }

    // cout << "Bimeh: " << store_ui["Bimeh"]->objectName().toStdString() << endl;
    // show_shortest_path(shortest[end], start_time);
}

//--------------------------------------------------------

void Smnsh::find_lowest_cost(const int &start, const int &end, Timee &start_time)
{
    node shortest[59];
    bool sptSet[59];

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

            if (!sptSet[v] && costs[u][v].getdis().get_distance() && shortest[u].value != INT_MAX
                && shortest[u].value + costs[u][v].getdis().get_distance() < shortest[v].value)
            {

                shortest[v].value = shortest[u].value + costs[u][v].getdis().get_distance();
                shortest[v].directions = shortest[u].directions;
                shortest[v].directions.push_back(search_in_map(v));
                shortest[v].line_of_vehicle = shortest[u].line_of_vehicle;
                shortest[v].line_of_vehicle.push_back(costs[v][u].getdis().get_line());
                shortest[v].type_of_vehicle = shortest[u].type_of_vehicle;
                shortest[v].type_of_vehicle.push_back(costs[v][u].getdis().get_vic());
            }
        }
    }
    // cout << shortest[end].value << endl;
    show_cost(shortest[end].line_of_vehicle, shortest[end].directions, shortest[end].type_of_vehicle ,start_time);

}

//--------------------------------------------------------

void Smnsh::show_shortest_path(const node &path, Timee start_time)
{

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
            time += pathes[names_of_station[path.directions[j]]][names_of_station[path.directions[i]]].getdis().get_distance() * trafic_time;
        }

        else
        {
            time += pathes[names_of_station[path.directions[j]]][names_of_station[path.directions[i]]].getdis().get_distance();
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

void Smnsh::show_cost(const vector<string> &line, const vector<string> &station, const vector<string> & vehicle, Timee start_time)
{
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
                    time += pathes[names_of_station[*k]][names_of_station[*(k + dir)]].getdis(vehicle[j]).get_distance() * trafic_time;
                }

                else
                {
                    time += pathes[names_of_station[*k]][names_of_station[*(k + dir)]].getdis(vehicle[j]).get_distance();
                }
            }


                if( vehicle[j] == "metro")
                {
                    store_ui[*k]->setProperty("color", "#bf0603");
                }

                else if(vehicle[j] == "bus")
                {
                    store_ui[*k]->setProperty("color", "#005F73");
                }

                else if(vehicle[j] == "taxi" )
                {
                    store_ui[*k]->setProperty("color", "green");
                }

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

void Smnsh::find_lowest_time(const int &start, const int &end, Timee &start_time)
{

    node shortest[59];//shorthestu.save
    bool sptSet[59];

    for (int i = 0; i < 59; i++)
        shortest[i].value = INT_MAX, sptSet[i] = false;

    shortest[start].value = 0;
    shortest[start].directions.push_back(search_in_map(start));

    for (int count = 0; count < 59; count++)
    {
        int u = minDistance(shortest, sptSet);

        calculate_time_each_line(station_vechicle[search_in_map(u)], search_in_map(u), shortest, sptSet , start_time);

        sptSet[u] = true;
    }

    print_lowest_time(shortest[end], start_time);

}

//--------------------------------------------------------

void Smnsh::print_lowest_time(const node &time, Timee start_time)
{
    cout << time.value << endl;
    start_time + time.value;
    cout << time.directions.size() << endl;

    if(time.type_of_vehicle[0] == "metro")
    {
        cout << 1 << endl;
        // cout << time.directions[i] << endl;
        store_ui[time.directions[0]]->setProperty("color", "#bf0603");
        // cout << "1_1" << endl;
    }

    else if(time.type_of_vehicle[0] == "bus")
    {
        cout << 2 << endl;
        store_ui[time.directions[0]]->setProperty("color", "#005F73");
    }

    else if(time.type_of_vehicle[0] == "taxi")
    {
        cout << 3 << endl;
        store_ui[time.directions[0]]->setProperty("color", "#FFB300");
    }



    for(int i = 1 ; i < time.directions.size(); i++ )
    {

        if(time.type_of_vehicle[i - 1] == "metro")
        {
            cout << 1 << endl;
            // cout << time.directions[i] << endl;
            store_ui[time.directions[i]]->setProperty("color", "#bf0603");
            // cout << "1_1" << endl;
        }

        else if(time.type_of_vehicle[i - 1] == "bus")
        {
            cout << 2 << endl;
            store_ui[time.directions[i]]->setProperty("color", "#0a9396");
        }

        else if(time.type_of_vehicle[i - 1] == "taxi")
        {
            cout << 3 << endl;
            store_ui[time.directions[i]]->setProperty("color", "#FFB300");
        }

        cout << "salam";

    }

    // cout << time.directions[time.directions.size()-1]  <<endl;

    // start_time.print();
}

//--------------------------------------------------------

void Smnsh::calculate_time_each_line(unordered_map<string, unordered_set<string>> vechicles, string src, node array[], bool visible[], Timee &start_time)
{
    for(auto line: vechicles)
    {
        for(auto vehicle: line.second)
        {

            auto source = find(this->lines[line.first].begin(), this->lines[line.first].end(), src) ;
            node resault = array[names_of_station[src]];
            bool flag = 1;

            for(auto i = source; i != this->lines[line.first].end() - 1; i++)
            {

                if(i == source)
                {
                    if(!array[names_of_station[src]].type_of_vehicle.size())
                    {
                        flag = 1;
                    }

                    else if(array[names_of_station[src]].type_of_vehicle[array[names_of_station[src]].type_of_vehicle.size() - 1] != vehicle)
                        flag = 1;

                    else if(array[names_of_station[src]].type_of_vehicle[array[names_of_station[src]].line_of_vehicle.size() - 1] != line.first)
                        flag = 1;

                }

                resault.value += pathes[names_of_station[*i]][names_of_station[*(i + 1)]].get_time(vehicle, flag, start_time);
                resault.directions.push_back(*(i + 1));
                resault.line_of_vehicle.push_back(line.first);
                resault.type_of_vehicle.push_back(vehicle);

                flag = 0;

                if(array[names_of_station[*(i + 1)]].value >= resault.value )
                {
                    array[names_of_station[*(i + 1)]] = resault;
                }
            }

            resault = array[names_of_station[src]];
            flag = 1;

            for(auto i = source; i != this->lines[line.first].begin(); i--)
            {
                if(!visible[names_of_station[*(i - 1)]])
                {

                    if(i == source)
                    {
                        if(!array[names_of_station[src]].type_of_vehicle.size())
                        {
                            flag = 1;
                        }

                        else if(array[names_of_station[src]].type_of_vehicle[array[names_of_station[src]].type_of_vehicle.size() - 1] != vehicle)
                            flag = 1;

                        else if(array[names_of_station[src]].type_of_vehicle[array[names_of_station[src]].line_of_vehicle.size() - 1] != line.first)
                            flag = 1;

                    }

                    resault.value += pathes[names_of_station[*i]][names_of_station[*(i - 1)]].get_time(vehicle, flag, start_time);
                    resault.directions.push_back(*(i - 1));
                    resault.line_of_vehicle.push_back(line.first);
                    resault.type_of_vehicle.push_back(vehicle);
                    flag = 0;


                    if(array[names_of_station[*(i - 1)]].value  >= resault .value)
                    {
                        array[names_of_station[*(i - 1)]] = resault ;
                    }
                }
            }
        }
    }

}

void Smnsh::add_objects(QString name, QObject* mynode)
{
    store_ui[name.toStdString()] = mynode;
    // store_ui[name.toStdString()]->setProperty("color", "blue");
}

void Smnsh::get_input_for_path(QString src, QString dest)
{
    Timee time("10:00");
    this->find_short_path(names_of_station[src.toStdString()], names_of_station[dest.toStdString()], time);
}

void Smnsh::get_input_for_cost(QString src, QString dest)
{
    Timee time("10:00");
    this->find_lowest_cost(names_of_station[src.toStdString()], names_of_station[dest.toStdString()], time);
}

void Smnsh::get_input_for_time(QString src, QString dest)
{
    Timee time("10:00");
    this->find_lowest_time(names_of_station[src.toStdString()], names_of_station[dest.toStdString()], time);
}

void Smnsh::reset()
{
    for(auto &i: store_ui)
    {
        if(store_ui[i.first]->objectName().toStdString() == "bus")
        {
            store_ui[i.first]->setProperty("color", "#94d2bd");
        }

        else store_ui[i.first]->setProperty("color", "#EFEFEF");
    }
}
