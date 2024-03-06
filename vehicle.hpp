#include <iostream>

using namespace std;
class vehicle
{
    private:
    unsigned int value; 
    string line_vic;
    string vic_type;

    public:
    unsigned int get_val(){return value;}
    void setval(int val);
    void set_line(string line);
    void set_vic(string vic);
    vehicle(){value = 0; line_vic = ""; vic_type = "" ;} 
    string get_line(){return line_vic;}
    string get_vic(){return vic_type;}


};