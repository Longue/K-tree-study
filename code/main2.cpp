#include <iostream>
#include "KDTree.hpp"

using namespace std;

int main() {
    cout << "--- TEST ----" << endl;

    // Test Euclidian Distance v = (2, 3, 1) and u = (8, −5, 0) -> 10.05
    vector<float> v{2, 3, 1};
    vector<float> u{8, -5, 0};
    cout << "Euclidian distance: " << distance(v, u) << endl;

    // Test correcta insercion
    vector<float> p1{3,3};
    vector<float> p2{5,2};
    vector<float> p3{1,5};
    vector<float> p4{2,1};
    vector<float> p5{4,4};
    vector<float> p6{0,0};

    cout << "creo arbol" << endl;
    KDTree t(2);
    cout << "inserto 1" << endl;
    t.insert(p1);
    cout << "inserto 2" << endl;
    t.insert(p2);
    cout << "inserto 3" << endl;
    t.insert(p3);
    cout << "inserto 4" << endl;
    t.insert(p4);
    cout << "inserto 5" << endl;
    t.insert(p5);
    t.insert(p6);

    t.print_node();

    cout << "depth: " << t.get_depth() << endl;
    cout << "kdim: " << t.get_kdim() << endl;
}
