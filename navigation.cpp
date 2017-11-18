#include "navigation.h"

#define DT 1.0

Navigation::Navigation()
{
}

Navigation::~Navigation()
{
  while (!this->accelerometers.empty())
  {
    delete accelerometers.back();
    accelerometers.pop_back();
  }
}

void Navigation::add_accelerometer(Accelerometer *a)
{
  this->accelerometers.push_back(a);
}

double Navigation::get_acceleration()
{
  double a = 0;
  for (Accelerometer* accelerometer : this->accelerometers)
    a += accelerometer->get_acceleration();
  return a/this->accelerometers.size();
}

double Navigation::get_velocity()
{
   /// TASK 8 (PERSON A) ///////////////////////////////////////////////////////
double a = this->get_acceleration();
this->velocity += a*DT; //integrate
return this->velocity;  
  /// END OF TASK 8A ///////////////////////////////////////////////////////////
}

double Navigation::get_position()
{
  double v = this->get_velocity();
this->position += v*DT; //integrate
return this->position;
}
