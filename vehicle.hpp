#include <iostream>

using namespace std;
class vehicle
{
    private:
    unsigned int distance;
    string type_vehicle;

    public:
    unsigned int get_distance(){return distance;}
    void setdis(int dis);
    void setvic(string vic);
    vehicle(){distance = 0; type_vehicle = "";} // problem
    string get_type_vehicle(){return type_vehicle;}


};