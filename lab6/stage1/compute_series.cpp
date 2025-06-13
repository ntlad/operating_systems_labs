#include <iostream>
#include <chrono>
#include <cmath>
 
using namespace std;
 
const int ITERATIONS = 100000000; 
 
double compute_series() {
    double sum = 0.0;
    for (int i = 0; i < ITERATIONS; i++) {
        sum += 1.0 / ((i + 1) * (i + 1));
    }
    return sum;
}
 
int main() {
    auto start = chrono::high_resolution_clock::now();
    double sum = compute_series();
    double pi_approximation = sqrt(sum * 6);
    auto end = chrono::high_resolution_clock::now();
    
    auto duration = chrono::duration_cast<chrono::microseconds>(end - start).count();
    
    cout << "Fixed iterations: " << ITERATIONS << endl;
    cout << "Series sum (π^2/6) = " << sum << endl;
    cout << "Approximation of π = " << pi_approximation << endl;
    cout << "Calculation took " << duration << "μs" << endl;
    
    return 0;
}