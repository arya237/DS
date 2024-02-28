#include <iostream>

using namespace std;
class vehicle
{
    private:
    unsigned int distance;
    string type_vehicle;

    public:
    vehicle(){distance = 0; type_vehicle = "";} //problem
    unsigned int get_distance(){return distance;}
    string get_type_vehicle(){return type_vehicle;}
    void setdis(int dis);
    void setvic(string vic);


};