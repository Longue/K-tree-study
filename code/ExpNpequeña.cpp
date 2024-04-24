#include <iostream>
#include <vector>
#include <windows.h>
#include "KDTree.hpp"
using namespace std;

//Number of dimension of the kd-tree
int dim = 6;
//Number of points to generate
//int num = 10000;

int main() {

    for (int i=1; i <= 10000; ++i) {
        int suma=0;
        for (int j=0; j < 25; ++j) {
            //KdTree
            KDTree t(dim);

            // Random fill of points for the tree
            t.randomFill(i);

            int steps = 0;
            vector<double> nearest, target;
            
            nearest = t.findNearest(t.getTarget(), steps);
            
            suma += steps;
        }
        cout << i << "," << suma/double(25) << endl;
    }
}