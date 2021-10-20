#include <stdio.h>      
#include <math.h>   
#include <random>

typedef float        real4 ;
typedef double       real8 ;
typedef long double  real10 ; 

#ifdef SINGLE_PRECISION
typedef real4   Real_t;
#elif defined(QUAD_PRECSION)
typedef real10 Real_t;
#else
typedef real8 Real_t;
#endif

extern Real_t __enzyme_autodiff(void*, Real_t);
extern Real_t __enzyme_autodiff(void*, Real_t,Real_t);

Real_t sin_fun(Real_t x){
    return sin(x);
}

Real_t ex1(Real_t x, Real_t y)
{ // Provide [0.1,1.0] as the input ranges
  Real_t res;

  Real_t h = (y/x)+x;
  Real_t g = x+x*y;
  if (x-y < 0.4)      // P1
    { g = 1 + 1/g;
    }
  else
    {
      if ( (x*x > 0.25) && (y*h <= x*x) ) // P2
	{ g = h + x*y ;
	}
    }
  res = g+y;  
  return res;   
}

Real_t dsin_fun(Real_t x){
    return __enzyme_autodiff((void*) sin_fun, x);
}

Real_t dex1_fun(Real_t p1, Real_t p2){
    return __enzyme_autodiff((void*) ex1, p1,p2);
}

int main(){
  const int nrolls=100;  // number of experiments

  std::default_random_engine generator;
  std::uniform_real_distribution<Real_t> distribution1(0.0,3.0);
  std::uniform_real_distribution<Real_t> distribution2(0.1,1.0);
  for (int i = 0; i< nrolls; ++i){
      Real_t num = distribution1(generator);
      Real_t p1 = distribution2(generator);
      Real_t p2 = distribution2(generator);
      printf("dsin(%f)=%f\n", num, dsin_fun(num));
      printf("dex1(%f,%f)=%f\n", p1,p2, dex1_fun(p1,p2));
  }
}





