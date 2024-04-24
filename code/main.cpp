#include <iostream>
#include <vector>
#include <windows.h>
#include "KDTree.hpp"
using namespace std;


int abdul(int a, int b) {

}

int abdul(int a, int b, int c) {
    
}


//Number of dimension of the kd-tree
int dim = 6;
//Number of points to generate
int num = 10000;

int main() {

    //KdTree
    KDTree t(dim);

    // Random fill of points for the tree
    t.randomFill(num);

    int steps = 0;
    vector<double> nearest, target;
    nearest = t.findNearest(t.getTarget(), steps);
    
    cout << "target: ";
    KDTree::printPoint(t.getTarget());
    cout << "found in " << steps << " steps" << endl;
    cout << "nearest: ";
    KDTree::printPoint(nearest);
    cout << "Real nearest: ";
    KDTree::printPoint(t.getRealNearest());
    cout << endl;

}