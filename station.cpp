#include "station.hpp"

void station::setinfo(unsigned int distance, string vec)
{
    this->distance = distance;
    this->vehicle = vec;
}

unsigned int station:: getdis()
{
    return this->distance;
}

string station:: getvic()
{
    return this->vehicle;
}

station::station()
{
    this->distance = 0;
    this->vehicle = "";
}
