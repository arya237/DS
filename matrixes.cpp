#include <string>
#include <stdexcept>

#include "matrixes.hpp"
#include <fstream>

using namespace std;


matrixes::matrixes()
{
    names_of_station.insert({"Haram-e Hazrat-e Abdolazim", 0});  
    names_of_station.insert({"Tehran Pars", 1});
    names_of_station.insert({"Shahid Kolahdouz", 2});
    names_of_station.insert({"Gha'em", 3});
    names_of_station.insert({"Nirou Havaei", 4});
    names_of_station.insert({"Nabard", 5});
    names_of_station.insert({"Aghdasiyeh", 6});
    names_of_station.insert({"Pirouzi", 7});
    names_of_station.insert({"Shahid Zeynoddin", 8});
    names_of_station.insert({"Ebn-e Sina", 9});
    names_of_station.insert({"Shahid Rezaei", 10});
    names_of_station.insert({"Meydan-e Shohada", 11});
    names_of_station.insert({"Emam Hossein", 12});
    names_of_station.insert({"Shahid Ghodousi", 13});
    names_of_station.insert({"Khajeh Abdollah-e Ansari", 14});
    names_of_station.insert({"Payaneh Javanmard", 15});
    names_of_station.insert({"Darvazeh Shemiran", 16});
    names_of_station.insert({"Sohrevardi", 17});
    names_of_station.insert({"Kahrizak", 18});
    names_of_station.insert({"Shahr-e Rey", 19});
    names_of_station.insert({"Jonoub Terminal", 20});
    names_of_station.insert({"Shoush", 21});
    names_of_station.insert({"Panzdah-e Khordad", 22});
    names_of_station.insert({"Darvazeh Dowlat", 23});
    names_of_station.insert({"Taleghani", 24});
    names_of_station.insert({"Haftom-e Tir", 25});
    names_of_station.insert({"Shahid Mofatteh", 26});
    names_of_station.insert({"Shahid Beheshti", 27});
    names_of_station.insert({"Shahid Haghani", 28});
    names_of_station.insert({"Mirdamad", 29});
    names_of_station.insert({"Gholhak", 30});
    names_of_station.insert({"Gheytariyeh", 31});
    names_of_station.insert({"Tajrish", 32});
    names_of_station.insert({"Ferdowsi", 33});
    names_of_station.insert({"Merza-ye Shirazi", 34});
    names_of_station.insert({"Shahid Sadr", 35});
    names_of_station.insert({"Azadegan", 36});
    names_of_station.insert({"Zamzam", 37});
    names_of_station.insert({"Javadiyeh", 38});
    names_of_station.insert({"Rahahan", 39});
    names_of_station.insert({"Mahdiyeh", 40});
    names_of_station.insert({"Moniriyeh", 41});
    names_of_station.insert({"Teatr-e Shahr", 42});   
    names_of_station.insert({"Meydan-e Hazrat-e ValiAsr", 43});
    names_of_station.insert({"Meydan-e Jahad", 44});  
    names_of_station.insert({"Shahrak-e Shari'ati", 45}); 
    names_of_station.insert({"Meydan-e Enghelab-e Eslami", 46});  
    names_of_station.insert({"Touhid", 47});
    names_of_station.insert({"Boostan-e laleh", 48});     
    names_of_station.insert({"Shademan", 49});  
    names_of_station.insert({"Yadegar-e Emam", 50});  
    names_of_station.insert({"Ostad Mo'in", 51});  
    names_of_station.insert({"Meydan-e Azadi", 52});  
    names_of_station.insert({"Eram-e Sabz", 53});  
    names_of_station.insert({"Allameh Jafari", 54});  
    names_of_station.insert({"Kashani", 55});  
    names_of_station.insert({"Bimeh", 56});
    names_of_station.insert({"Kouhsar", 57});
    names_of_station.insert({"Chaharbagh", 58});


    fstream myfile;
    myfile.open("l1.txt");
    string s;

    while(getline(myfile, s))
    {   
        metro_L1.insert(s);
    }

    myfile.open("l3.txt");

    while(getline(myfile, s))
    {   
        metro_L3.insert(s);
    }

    myfile.open("l4.txt");

    while(getline(myfile, s))
    {   
        metro_L4.insert(s);
    }
   
    myfile.open("l6.txt");
     while(getline(myfile, s))
    {   
        metro_L6.insert(s);
    }

     myfile.open("B1.txt");

    while(getline(myfile, s))
    {   
        Bus_1.insert(s);
    }

       myfile.open("B2.txt");

    while(getline(myfile, s))
    {   
        Bus_2.insert(s);
    }

       myfile.open("B3.txt");

    while(getline(myfile, s))
    {   
        Bus_3.insert(s);
    }
   




    pathes[0][10].setinfo(10, "Metro_Taxi_L6");  pathes[10][0].setinfo(10, "Metro_Taxi_L6");
    pathes[10][11].setinfo(6, "Metro_Taxi_L6");  pathes[11][10].setinfo(6, "Metro_Taxi_L6");  
    pathes[11][12].setinfo(2, "Metro_Taxi_L6");  pathes[12][11].setinfo(2, "Metro_Taxi_L6");
    pathes[11][16].setinfo(2, "Metro_Taxi_L4");  pathes[16][11].setinfo(2, "Metro_Taxi_L4");
    pathes[12][25].setinfo(5, "Metro_Taxi_L6");  pathes[25][12].setinfo(5, "Metro_Taxi_L6");
    pathes[25][43].setinfo(2, "Metro_Taxi_L6");  pathes[43][25].setinfo(2, "Metro_Taxi_L6");
    pathes[43][48].setinfo(2, "Metro_Taxi_L6");  pathes[48][43].setinfo(2, "Metro_Taxi_L6");
    pathes[48][50].setinfo(8, "Metro_Taxi_L6");  pathes[50][48].setinfo(8, "Metro_Taxi_L6");
    pathes[50][55].setinfo(6, "Metro_Taxi_L6");  pathes[55][50].setinfo(6, "Metro_Taxi_L6");
    pathes[55][57].setinfo(10, "Metro_Taxi_L6"); pathes[57][55].setinfo(10, "Metro_Taxi_L6");
    pathes[55][58].setinfo(5, "Metro_Taxi_L4");  pathes[58][55].setinfo(5, "Metro_Taxi_L4");
    pathes[55][54].setinfo(4, "Metro_Taxi_L4");  pathes[54][55].setinfo(4, "Metro_Taxi_L4");
    pathes[54][53].setinfo(5, "Metro_Taxi_L4");  pathes[53][54].setinfo(5, "Metro_Taxi_L4");
    pathes[53][52].setinfo(6, "Metro_Taxi_L4");  pathes[52][53].setinfo(6, "Metro_Taxi_L4");
    pathes[52][51].setinfo(2, "Metro_Taxi_L4");  pathes[51][52].setinfo(2, "Metro_Taxi_L4");
    pathes[51][49].setinfo(4, "Metro_Taxi_L4");  pathes[49][51].setinfo(4, "Metro_Taxi_L4");
    pathes[49][47].setinfo(2, "Metro_Taxi_L4");  pathes[47][49].setinfo(2, "Metro_Taxi_L4");
    pathes[47][46].setinfo(1, "Metro_Taxi_L4");  pathes[46][47].setinfo(1, "Metro_Taxi_L4");
    pathes[46][42].setinfo(3, "Metro_Taxi_L4");  pathes[42][46].setinfo(3, "Metro_Taxi_L4");
    pathes[42][41].setinfo(4, "Metro_Taxi_L3");  pathes[41][42].setinfo(4, "Metro_Taxi_L3");
    pathes[41][40].setinfo(3, "Metro_Taxi_L3");  pathes[40][41].setinfo(3, "Metro_Taxi_L3");
    pathes[40][39].setinfo(1, "Metro_Taxi_L3");  pathes[39][40].setinfo(1, "Metro_Taxi_L3");
    pathes[39][38].setinfo(2, "Metro_Taxi_L3");  pathes[38][39].setinfo(2, "Metro_Taxi_L3");
    pathes[38][37].setinfo(2, "Metro_Taxi_L3");  pathes[37][38].setinfo(2, "Metro_Taxi_L3");
    pathes[37][36].setinfo(8, "Metro_Taxi_L3");  pathes[36][37].setinfo(8, "Metro_Taxi_L3");
    pathes[42][43].setinfo(2, "Metro_Taxi_L3");  pathes[43][42].setinfo(2, "Metro_Taxi_L3");
    pathes[43][44].setinfo(1, "Metro_Taxi_L3");  pathes[44][43].setinfo(1, "Metro_Taxi_L3");
    pathes[44][34].setinfo(2, "Metro_Taxi_L3");  pathes[34][44].setinfo(2, "Metro_Taxi_L3");
    pathes[34][27].setinfo(3, "Metro_Taxi_L3");  pathes[27][34].setinfo(3, "Metro_Taxi_L3");
    pathes[27][28].setinfo(7, "Metro_Taxi_L1");  pathes[28][27].setinfo(7, "Metro_Taxi_L1");
    pathes[28][29].setinfo(5, "Metro_Taxi_L1");  pathes[29][28].setinfo(5, "Metro_Taxi_L1");
    pathes[29][30].setinfo(4, "Metro_Taxi_L1");  pathes[30][29].setinfo(4, "Metro_Taxi_L1");
    pathes[30][31].setinfo(3, "Metro_Taxi_L1");  pathes[31][30].setinfo(3, "Metro_Taxi_L1");
    pathes[31][32].setinfo(2, "Metro_Taxi_L1");  pathes[32][31].setinfo(2, "Metro_Taxi_L1");
    pathes[27][17].setinfo(1, "Metro_Taxi_L3");  pathes[17][27].setinfo(1, "Metro_Taxi_L3");
    pathes[17][13].setinfo(2, "Metro_Taxi_L3");  pathes[13][17].setinfo(2, "Metro_Taxi_L3");
    pathes[13][8].setinfo(5, "Metro_Taxi_L3");   pathes[8][13].setinfo(5, "Metro_Taxi_L3");
    pathes[8][6].setinfo(10, "Metro_Taxi_L3");   pathes[6][8].setinfo(10, "Metro_Taxi_L3");
    pathes[3][6].setinfo(4, "Metro_Taxi_L3");    pathes[6][3].setinfo(4, "Metro_Taxi_L3");
    pathes[26][27].setinfo(2, "Metro_Taxi_L1");  pathes[27][26].setinfo(2, "Metro_Taxi_L1");
    pathes[24][25].setinfo(2, "Metro_Taxi_L1");  pathes[25][24].setinfo(2, "Metro_Taxi_L1");
    pathes[24][23].setinfo(1, "Metro_Taxi_L1");  pathes[23][24].setinfo(1, "Metro_Taxi_L1");
    pathes[22][23].setinfo(4, "Metro_Taxi_L1");  pathes[23][22].setinfo(4, "Metro_Taxi_L1");
    pathes[21][22].setinfo(6, "Metro_Taxi_L1");  pathes[22][21].setinfo(6, "Metro_Taxi_L1");
    pathes[20][21].setinfo(3, "Metro_Taxi_L1");  pathes[21][20].setinfo(3, "Metro_Taxi_L1");
    pathes[20][19].setinfo(9, "Metro_Taxi_L1");  pathes[19][20].setinfo(9, "Metro_Taxi_L1");
    pathes[19][18].setinfo(13, "Metro_Taxi_L1"); pathes[18][19].setinfo(13, "Metro_Taxi_L1");
    pathes[33][42].setinfo(1, "Metro_Taxi_L4");  pathes[42][33].setinfo(1, "Metro_Taxi_L4");
    pathes[33][23].setinfo(1, "Metro_Taxi_L4");  pathes[23][33].setinfo(1, "Metro_Taxi_L4");
    pathes[16][23].setinfo(2, "Metro_Taxi_L4");  pathes[23][16].setinfo(2, "Metro_Taxi_L4");
    pathes[9][11].setinfo(1, "Metro_Taxi_L4");   pathes[11][9].setinfo(1, "Metro_Taxi_L4");
    pathes[7][9].setinfo(3, "Metro_Taxi_L4");    pathes[9][7].setinfo(3, "Metro_Taxi_L4");
    pathes[7][5].setinfo(1, "Metro_Taxi_L4");    pathes[5][7].setinfo(1, "Metro_Taxi_L4");
    pathes[5][4].setinfo(1, "Metro_Taxi_L4");    pathes[4][5].setinfo(1, "Metro_Taxi_L4");
    pathes[4][2].setinfo(7, "Metro_Taxi_L4");    pathes[2][4].setinfo(7, "Metro_Taxi_L4");
    pathes[25][26].setinfo(2, "Metro_Taxi_L1");  pathes[26][25].setinfo(2, "Metro_Taxi_L1");
    
    pathes[1][9].setinfo(10, "Bus_1");  pathes[9][1].setinfo(10, "Bus_1");
    pathes[9][12].setinfo(4, "Bus_1");  pathes[12][9].setinfo(4, "Bus_1");
    pathes[12][23].setinfo(2, "Bus_1");  pathes[23][12].setinfo(2, "Bus_1");
    pathes[23][33].setinfo(1, "Bus_1");  pathes[33][23].setinfo(1, "Bus_1");
    pathes[33][46].setinfo(3, "Bus_1");  pathes[46][33].setinfo(3, "Bus_1");
    pathes[46][51].setinfo(4, "Bus_1");  pathes[51][46].setinfo(4, "Bus_1");
    pathes[52][51].setinfo(4, "Bus_1");  pathes[51][52].setinfo(4, "Bus_1");
    pathes[52][56].setinfo(3, "Bus_1");  pathes[56][52].setinfo(3, "Bus_1");
    pathes[45][39].setinfo(5, "Bus_3");  pathes[39][45].setinfo(5, "Bus_3");
    pathes[39][43].setinfo(8, "Bus_3");  pathes[43][39].setinfo(8, "Bus_3");
    pathes[43][29].setinfo(11, "Bus_3");  pathes[29][43].setinfo(11, "Bus_3");
    pathes[32][29].setinfo(8, "Bus_3");  pathes[29][32].setinfo(8, "Bus_3");
    pathes[32][35].setinfo(4, "Bus_3");  pathes[35][32].setinfo(4, "Bus_3");
    pathes[15][10].setinfo(8, "Bus_2");  pathes[10][15].setinfo(8, "Bus_2");
    pathes[10][7].setinfo(8, "Bus_2");  pathes[7][10].setinfo(8, "Bus_2");
    pathes[7][3].setinfo(19, "Bus_2");  pathes[3][7].setinfo(19, "Bus_2");
    pathes[14][3].setinfo(12, "Bus_2");  pathes[3][14].setinfo(12, "Bus_2");

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
    string start, end;
    getline(cin, start);
    getline(cin, end);

    while ( !is_valid(start, end) )
    {
        getline(cin, start);
        getline(cin, end);
    }
    
    string st, en;
    //find_short_path(names_of_station[start], names_of_station[end]);

    if(metro_L1.find(start) != metro_L1.end())
    {
        st = "l1";
    }
    
    if(metro_L4.find(start) != metro_L4.end())
    {
        st = "l4";
    }

    if(metro_L6.find(start) != metro_L6.end())
    {
        st = "l6";
    }

    if(metro_L3.find(start) != metro_L3.end())
    {
        st = "l3";
    }

    if(Bus_1.find(start) != Bus_1.end())
    {
        st = "b1";
    }

    if(Bus_2.find(start) != Bus_2.end())
    {
        st = "b2";
    }

    if(Bus_3.find(start) != Bus_3.end())
    {
        st = "b3";
    }



    if(metro_L1.find(end) != metro_L1.end())
    {
        en = "l1";
    }
    
    if(metro_L4.find(end) != metro_L4.end())
    {
        en = "l4";
    }

    if(metro_L6.find(end) != metro_L6.end())
    {
        en = "l6";
    }

    if(metro_L3.find(end) != metro_L3.end())
    {
        en = "l3";
    }

    if(Bus_1.find(end) != Bus_1.end())
    {
        en = "b1";
    }

    if(Bus_2.find(end) != Bus_2.end())
    {
        en = "b2";
    }

    if(Bus_3.find(end) != Bus_3.end())
    {
        en = "b3";
    }

    if(en == st && st[0] == 'l')
    cout << 3267;

    else if(st == en && st[0] == 'b')
    cout << 2250;

    else 
    {
        if(st[0] == 'l' && en[0] == 'l')
        {
            cout << 6534;
        }
        
        else if(st[0] == 'b' && en[0] == 'b')
        {
            cout << 4500;
        }

        else if(st[0] == 'l' && en[0] == 'b' || st[0] == 'b' && en[0] == 'l' )
        {
            cout << 5517;
        }
    }

    
    
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
 
            if (!sptSet[v] && pathes[u][v].getdis()&& shortest[u].distance != INT_MAX
                && shortest[u].distance + pathes[u][v].getdis() < shortest[v].distance)
                {
                    shortest[v].distance = shortest[u].distance + pathes[u][v].getdis();
                    shortest[v].directions =  shortest[u].directions;  shortest[v].directions.push_back(search_in_map(v));
                    shortest[v].type_of_vehicle = shortest[u].type_of_vehicle; shortest[v].type_of_vehicle.push_back(pathes[v][u].getvic());
                }
    }
 
    cout << shortest[end].distance << '\n';
    int size = shortest[end].directions.size();
    
    int j = 0;

    cout << " ** " << shortest[end].directions[0];

    for(int i = 1; i < size; i++)
    {
        
        cout << " -> " << shortest[end].directions[i];

        if(shortest[end].type_of_vehicle[j + 1] != shortest[end].type_of_vehicle[j])
        {
            cout << ": " << shortest[end].type_of_vehicle[j] << endl;
        }

        j++;
    }

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

void matrixes::print()
{
    for(auto i : metro_L1)
    cout << i << endl;
}