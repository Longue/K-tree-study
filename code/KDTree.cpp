#include "KDTree.hpp"

random_device myRandomDevice;
unsigned seed = myRandomDevice(); // para generar la "semilla"

uniform_real_distribution<double> Uniforme(0.0, 1.0); // distribuci)on de probabilidad que se quiere: uniforme entre 0 y 1

default_random_engine RNG(seed);  

double distance(const vector<double>& v, const vector<double>& u) {
    double sum_squares = 0; 
    for (int i = 0; i < v.size(); ++i) {
        double d = v[i] - u[i];
        sum_squares += d*d;
    }
    return sqrt(sum_squares);
}

shared_ptr<Node> closest(const vector<double>& e, shared_ptr<Node> temp, shared_ptr<Node> n) {
    if (temp == nullptr)
        return n;
    if (n == nullptr)
        return temp;

    if (distance(e,temp->x) < distance(e,n->x))
        return temp;
    else 
        return n;
}

void printPoint(const vector<double> &e) {
    int kdim = e.size();
    for (int i=0; i < kdim-1; ++i)
        cout << e[i] << ",";
    cout << e[kdim-1] << endl;
}

KDTree::KDTree (int kdim)
:   p(nullptr), kdim(kdim), depth(0)
{   }

bool KDTree::empty () const {
    return (p==nullptr);
}

const vector<double>& KDTree::value() const {
    assert(not empty());
    return p->x;
}

int KDTree::getKdim() const {
    return kdim;
}

int KDTree::getDepth() const {
    return depth;
}

void KDTree::insert(const vector<double>& e) {
    int st = 0;
    p = iInsert(p, e, 0, st);
    //cout << st << endl;
}

shared_ptr<Node> KDTree::iInsert(shared_ptr<Node> n, const vector<double>& e, int level, int &steps) {
    ++steps;

    if(n == nullptr)
        return make_shared<Node>(e, nullptr, nullptr);
    
    if (e[level%kdim] < n->x[level%kdim])
        n->left = iInsert(n->left, e, level+1, steps);
    else
        n->right = iInsert(n->right, e, level+1, steps);
    return n;
}

void KDTree::insert(const vector<vector<double>>& v) {
    for (const vector<double> e : v)
        insert(e);
}

shared_ptr<Node> KDTree::iFindNearest(shared_ptr<Node> root, const vector<double>& target, shared_ptr<Node> best, int level, int &steps) {
    
    if(root == nullptr)
        return best;

    ++steps;

    double currentDist  = distance(root->x, target);
    double bestDist  = distance(best->x, target);

    shared_ptr<Node> nextBest;

    if (currentDist < bestDist)
        nextBest = root;
    else 
        nextBest = best;

    int axis = level % kdim;
    shared_ptr<Node> next, other;

    if (target[axis] < root->x[axis]) {
        next = root->left;
        other = root->right;
    }
    else {
        next = root->right;
        other = root->left;
    }

    nextBest = iFindNearest(next, target, nextBest, level+1, steps);

    if (distance(target, nextBest->x) > abs(target[axis]-root->x[axis])) {
        nextBest = iFindNearest(other, target, nextBest, level+1, steps);
    }

    return nextBest;
}


vector<double> KDTree::findNearest(const vector<double>& e, int &steps) {
    return iFindNearest(p, e, p, 0, steps)->x;
}

void KDTree::printBT(const std::string& prefix, const shared_ptr<Node> node, bool isLeft) {
    if( node != nullptr ) {
        
        cout << prefix;

        cout << (isLeft ? "|--" : "'--" );

        // print the value of the node
        printPoint(node->x);

        // enter the next tree level - left and right branch
        printBT( prefix + (isLeft ? "|   " : "    "), node->left, true);
        printBT( prefix + (isLeft ? "|   " : "    "), node->right, false);
    }
}

void KDTree::printBT() {
    printBT("", p, false);    
}

vector<double> KDTree::randomPoint() {
    vector<double> p(kdim);
    for(int j=0; j < kdim; ++j) {
       p[j]= Uniforme(RNG);
    }
    return p;
}

void KDTree::randomFill(int nPoints) {
    //Creation list of random points
    double min=10;
    target = randomPoint();

    for(int i=0; i < nPoints; ++i) {
        vector<double> p = randomPoint();
        double dist = distance(p, target);
        if (dist < min) {
            min=dist;
            nearest=p;
        }
        insert(p);
    }
}

void KDTree::printPoint(const vector<double> &e) {
    for (int i=0; i < e.size()-1; ++i)
        cout << e[i] << ",";
    cout << e[e.size()-1] << endl;
}

vector<double> KDTree::getRealNearest() {
    return nearest;
}

vector<double> KDTree::getTarget() {
    return target;
}