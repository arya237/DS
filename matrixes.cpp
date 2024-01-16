#include <string>
#include <stdexcept>

#include "matrixes.hpp"

using namespace std;


matrixes::matrixes()
{
    names.insert({"Haram-e Hazrat-e Abdolazim", 0});  
    names.insert({"Tehran Pars", 1});
    names.insert({"Shahid Kolahdouz", 2});
    names.insert({"Gha'em", 3});
    names.insert({"Nirou Havaei", 4});
    names.insert({"Nabard", 5});
    names.insert({"Aghdasiyeh", 6});
    names.insert({"Pirouzi", 7});
    names.insert({"Shahid Zeynoddin", 8});
    names.insert({"Ebn-e Sina", 9});
    names.insert({"Shahid Rezaei", 10});
    names.insert({"Meydan-e Shohada", 11});
    names.insert({"Emam Hossein", 12});
    names.insert({"Shahid Ghodousi", 13});
    names.insert({"Khajeh Abdollah-e Ansari", 14});
    names.insert({"Payaneh Javanmard", 15});
    names.insert({"Darvazeh Shemiran", 16});
    names.insert({"Sohrevardi", 17});
    names.insert({"Kahrizak", 18});
    names.insert({"Shahr-e Rey", 19});
    names.insert({"Jonoub Terminal", 20});
    names.insert({"Shoush", 21});
    names.insert({"Panzdah-e Khordad", 22});
    names.insert({"Darvazeh Dowlat", 23});
    names.insert({"Taleghani", 24});
    names.insert({"Haftom-e Tir", 25});
    names.insert({"Shahid Mofatteh", 26});
    names.insert({"Shahid Beheshti", 27});
    names.insert({"Shahid Haghani", 28});
    names.insert({"Mirdamad", 29});
    names.insert({"Gholhak", 30});
    names.insert({"Gheytariyeh", 31});
    names.insert({"Tajrish", 32});
    names.insert({"Ferdowsi", 33});
    names.insert({"Merza-ye Shirazi", 34});
    names.insert({"Shahid Sadr", 35});
    names.insert({"Azadegan", 36});
    names.insert({"Zamzam", 37});
    names.insert({"Javadiyeh", 38});
    names.insert({"Rahahan", 39});
    names.insert({"Mahdiyeh", 40});
    names.insert({"Moniriyeh", 41});
    names.insert({"Teatr-e Shahr", 42});   
    names.insert({"Meydan-e Hazrat-e ValiAsr", 43});
    names.insert({"Meydan-e Jahad", 44});  
    names.insert({"Shahrak-e Shari'ati", 45}); 
    names.insert({"Meydan-e Enghelab-e Eslami", 46});  
    names.insert({"Touhid", 47});
    names.insert({"Boostan-e laleh", 48});     
    names.insert({"Shademan", 49});  
    names.insert({"Yadegar-e Emam", 50});  
    names.insert({"Ostad Mo'in", 51});  
    names.insert({"Meydan-e Azadi", 52});  
    names.insert({"Eram-e Sabz", 53});  
    names.insert({"Allameh Jafari", 54});  
    names.insert({"Kashani", 55});  
    names.insert({"Bimeh", 56});
    names.insert({"Kouhsar", 57});
    names.insert({"Chaharbagh", 58}); 

    distance[0][10].setinfo(10, "Metro_Taxi_L6");  distance[10][0].setinfo(10, "Metro_Taxi_L6");
    distance[10][11].setinfo(6, "Metro_Taxi_L6");  distance[11][10].setinfo(6, "Metro_Taxi_L6");  
    distance[11][12].setinfo(2, "Metro_Taxi_L6");  distance[12][11].setinfo(2, "Metro_Taxi_L6");
    distance[11][16].setinfo(2, "Metro_Taxi_L4");  distance[16][11].setinfo(2, "Metro_Taxi_L4");
    distance[12][25].setinfo(5, "Metro_Taxi_L6");  distance[25][12].setinfo(5, "Metro_Taxi_L6");
    distance[25][43].setinfo(2, "Metro_Taxi_L6");  distance[43][25].setinfo(2, "Metro_Taxi_L6");
    distance[43][48].setinfo(2, "Metro_Taxi_L6");  distance[48][43].setinfo(2, "Metro_Taxi_L6");
    distance[48][50].setinfo(8, "Metro_Taxi_L6");  distance[50][48].setinfo(8, "Metro_Taxi_L6");
    distance[50][55].setinfo(6, "Metro_Taxi_L6");  distance[55][50].setinfo(6, "Metro_Taxi_L6");
    distance[55][57].setinfo(10, "Metro_Taxi_L6"); distance[57][55].setinfo(10, "Metro_Taxi_L6");
    distance[55][58].setinfo(5, "Metro_Taxi_L4");  distance[58][55].setinfo(5, "Metro_Taxi_L4");
    distance[55][54].setinfo(4, "Metro_Taxi_L4");  distance[54][55].setinfo(4, "Metro_Taxi_L4");
    distance[54][53].setinfo(5, "Metro_Taxi_L4");  distance[53][54].setinfo(5, "Metro_Taxi_L4");
    distance[53][52].setinfo(6, "Metro_Taxi_L4");  distance[52][53].setinfo(6, "Metro_Taxi_L4");
    distance[52][51].setinfo(2, "Metro_Taxi_L4");  distance[51][52].setinfo(2, "Metro_Taxi_L4");
    distance[51][49].setinfo(4, "Metro_Taxi_L4");  distance[49][51].setinfo(4, "Metro_Taxi_L4");
    distance[49][47].setinfo(2, "Metro_Taxi_L4");  distance[47][49].setinfo(2, "Metro_Taxi_L4");
    distance[47][46].setinfo(1, "Metro_Taxi_L4");  distance[46][47].setinfo(1, "Metro_Taxi_L4");
    distance[46][42].setinfo(3, "Metro_Taxi_L4");  distance[42][46].setinfo(3, "Metro_Taxi_L4");
    distance[42][41].setinfo(4, "Metro_Taxi_L3");  distance[41][42].setinfo(4, "Metro_Taxi_L3");
    distance[41][40].setinfo(3, "Metro_Taxi_L3");  distance[40][41].setinfo(3, "Metro_Taxi_L3");
    distance[40][39].setinfo(1, "Metro_Taxi_L3");  distance[39][40].setinfo(1, "Metro_Taxi_L3");
    distance[39][38].setinfo(2, "Metro_Taxi_L3");  distance[38][39].setinfo(2, "Metro_Taxi_L3");
    distance[38][37].setinfo(2, "Metro_Taxi_L3");  distance[37][38].setinfo(2, "Metro_Taxi_L3");
    distance[37][36].setinfo(8, "Metro_Taxi_L3");  distance[36][37].setinfo(8, "Metro_Taxi_L3");
    distance[42][43].setinfo(2, "Metro_Taxi_L3");  distance[43][42].setinfo(2, "Metro_Taxi_L3");
    distance[43][44].setinfo(1, "Metro_Taxi_L3");  distance[44][43].setinfo(1, "Metro_Taxi_L3");
    distance[44][34].setinfo(2, "Metro_Taxi_L3");  distance[34][44].setinfo(2, "Metro_Taxi_L3");
    distance[34][27].setinfo(3, "Metro_Taxi_L3");  distance[27][34].setinfo(3, "Metro_Taxi_L3");
    distance[27][28].setinfo(7, "Metro_Taxi_L1");  distance[28][27].setinfo(7, "Metro_Taxi_L1");
    distance[28][29].setinfo(5, "Metro_Taxi_L1");  distance[29][28].setinfo(5, "Metro_Taxi_L1");
    distance[29][30].setinfo(4, "Metro_Taxi_L1");  distance[30][29].setinfo(4, "Metro_Taxi_L1");
    distance[30][31].setinfo(3, "Metro_Taxi_L1");  distance[31][30].setinfo(3, "Metro_Taxi_L1");
    distance[31][32].setinfo(2, "Metro_Taxi_L1");  distance[32][31].setinfo(2, "Metro_Taxi_L1");
    distance[27][17].setinfo(1, "Metro_Taxi_L3");  distance[17][27].setinfo(1, "Metro_Taxi_L3");
    distance[17][13].setinfo(2, "Metro_Taxi_L3");  distance[13][17].setinfo(2, "Metro_Taxi_L3");
    distance[13][8].setinfo(5, "Metro_Taxi_L3");   distance[8][13].setinfo(5, "Metro_Taxi_L3");
    distance[8][6].setinfo(10, "Metro_Taxi_L3");   distance[6][8].setinfo(10, "Metro_Taxi_L3");
    distance[3][6].setinfo(4, "Metro_Taxi_L3");    distance[6][3].setinfo(4, "Metro_Taxi_L3");
    distance[26][27].setinfo(2, "Metro_Taxi_L1");  distance[27][26].setinfo(2, "Metro_Taxi_L1");
    distance[24][25].setinfo(2, "Metro_Taxi_L1");  distance[25][24].setinfo(2, "Metro_Taxi_L1");
    distance[24][23].setinfo(1, "Metro_Taxi_L1");  distance[23][24].setinfo(1, "Metro_Taxi_L1");
    distance[22][23].setinfo(4, "Metro_Taxi_L1");  distance[23][22].setinfo(4, "Metro_Taxi_L1");
    distance[21][22].setinfo(6, "Metro_Taxi_L1");  distance[22][21].setinfo(6, "Metro_Taxi_L1");
    distance[20][21].setinfo(3, "Metro_Taxi_L1");  distance[21][20].setinfo(3, "Metro_Taxi_L1");
    distance[20][19].setinfo(9, "Metro_Taxi_L1");  distance[19][20].setinfo(9, "Metro_Taxi_L1");
    distance[19][18].setinfo(13, "Metro_Taxi_L1"); distance[18][19].setinfo(13, "Metro_Taxi_L1");
    distance[33][42].setinfo(1, "Metro_Taxi_L4");  distance[42][33].setinfo(1, "Metro_Taxi_L4");
    distance[33][23].setinfo(1, "Metro_Taxi_L4");  distance[23][33].setinfo(1, "Metro_Taxi_L4");
    distance[16][23].setinfo(2, "Metro_Taxi_L4");  distance[23][16].setinfo(2, "Metro_Taxi_L4");
    distance[9][11].setinfo(1, "Metro_Taxi_L4");   distance[11][9].setinfo(1, "Metro_Taxi_L4");
    distance[7][9].setinfo(3, "Metro_Taxi_L4");    distance[9][7].setinfo(3, "Metro_Taxi_L4");
    distance[7][5].setinfo(1, "Metro_Taxi_L4");    distance[5][7].setinfo(1, "Metro_Taxi_L4");
    distance[5][4].setinfo(1, "Metro_Taxi_L4");    distance[4][5].setinfo(1, "Metro_Taxi_L4");
    distance[4][2].setinfo(7, "Metro_Taxi_L4");    distance[2][4].setinfo(7, "Metro_Taxi_L4");
    distance[25][26].setinfo(2, "Metro_Taxi_L1");  distance[26][25].setinfo(2, "Metro_Taxi_L1");
    
    distance[1][9].setinfo(10, "Bus_1");  distance[9][1].setinfo(10, "Bus_1");
    distance[9][12].setinfo(4, "Bus_1");  distance[12][9].setinfo(4, "Bus_1");
    distance[12][23].setinfo(2, "Bus_1");  distance[23][12].setinfo(2, "Bus_1");
    distance[23][33].setinfo(1, "Bus_1");  distance[33][23].setinfo(1, "Bus_1");
    distance[33][46].setinfo(3, "Bus_1");  distance[46][33].setinfo(3, "Bus_1");
    distance[46][51].setinfo(4, "Bus_1");  distance[51][46].setinfo(4, "Bus_1");
    distance[52][51].setinfo(4, "Bus_1");  distance[51][52].setinfo(4, "Bus_1");
    distance[52][56].setinfo(3, "Bus_1");  distance[56][52].setinfo(3, "Bus_1");
    distance[45][39].setinfo(5, "Bus_3");  distance[39][45].setinfo(5, "Bus_3");
    distance[39][43].setinfo(8, "Bus_3");  distance[43][39].setinfo(8, "Bus_3");
    distance[43][29].setinfo(11, "Bus_3");  distance[29][43].setinfo(11, "Bus_3");
    distance[32][29].setinfo(8, "Bus_3");  distance[29][32].setinfo(8, "Bus_3");
    distance[32][35].setinfo(4, "Bus_3");  distance[35][32].setinfo(4, "Bus_3");
    distance[15][10].setinfo(8, "Bus_2");  distance[10][15].setinfo(8, "Bus_2");
    distance[10][7].setinfo(8, "Bus_2");  distance[7][10].setinfo(8, "Bus_2");
    distance[7][3].setinfo(19, "Bus_2");  distance[3][7].setinfo(19, "Bus_2");
    distance[14][3].setinfo(12, "Bus_2");  distance[3][14].setinfo(12, "Bus_2");

}

string matrixes::search_in_map(int i)
{
    for(auto item : names)
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
        if (sptSet[i] == false && dist[i].dist <= min)
            min = dist[i].dist, min_index = i;
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
    
    
    find_short_path(names[start], names[end]);
}

void matrixes::find_short_path(int start, int end)
{
    node shortest[59]; 
    bool sptSet[59]; 
  
    for (int i = 0; i < 59; i++)
        shortest[i].dist = INT_MAX, sptSet[i] = false;
 
    
    shortest[start].dist = 0;
    shortest[start].directions.push_back(search_in_map(start));
 
    for (int count = 0; count < 58; count++) 
    {  
        int u = minDistance(shortest, sptSet);
 
        sptSet[u] = true;
 
        for (int v = 0; v < 59; v++)
 
            if (!sptSet[v] && distance[u][v].getdis()&& shortest[u].dist != INT_MAX
                && shortest[u].dist + distance[u][v].getdis() < shortest[v].dist)
                {
                    shortest[v].dist = shortest[u].dist + distance[u][v].getdis();
                    shortest[v].directions =  shortest[u].directions;  shortest[v].directions.push_back(search_in_map(v));
                    shortest[v].type = shortest[u].type; shortest[v].type.push_back(distance[v][u].getvic());
                }
    }
 
    cout << shortest[end].dist << '\n';
    int size = shortest[end].directions.size();
    
    int j = 0;
    // cout << shortest[end].type[0] << ": ";

    cout << shortest[end].directions[0];

    for(int i = 1; i < size; i++)
    {
        
        cout << " -> " << shortest[end].directions[i];

        if(shortest[end].type[j + 1] != shortest[end].type[j])
        {
            cout << ": " << shortest[end].type[j] << endl;
        }

        j++;
    }

    //cout << shortest[end].directions[size - 1] << endl;

    // for(int i = 0; i < size - 1; i++)
    // {   
    //     cout << shortest[end].type[i] << " -> ";
    // }
}

bool matrixes::is_valid(string start, string end)
{   
    try
    {
        if( !(names.count(start) && names.count(end)) )
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