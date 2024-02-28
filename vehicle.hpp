#include <iostream>

using namespace std;
class vehicle
{
    private:
    unsigned int distance; //value
    string line_vic;
    string vic_type;

    public:
    unsigned int get_distance(){return distance;}
    void setdis(int dis);
    void set_line(string line);
    void set_vic(string vic);
    vehicle(){distance = 0; line_vic = ""; vic_type = "" ;} 
    string get_line(){return line_vic;}
    string get_vic(){return vic_type;}


};