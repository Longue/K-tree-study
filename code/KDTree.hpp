#ifndef KDTREE_HPP
#define KDTREE_HPP

#ifndef NO_DIAGRAM
#include <cassert>
#include <memory>
#include <vector>
#include <iostream>
#include <cmath>
#include <cstdlib>
#include <random>
#endif

using namespace std;

// Euclidian distance between 2 k-dim points
// Pre: v.size() == u.size()
double distance(const vector<double>& v, const vector<double>& u); 

struct Node{
    vector<double> x;
    shared_ptr<Node> left, right;
    
    Node(const vector<double> key, shared_ptr<Node> left, shared_ptr<Node> right)
    :   x(key), left(left), right(right)
    {   }
};

// K dimension tree
class KDTree {
private:
    // Node pointer of the tree
    shared_ptr<Node> p;

    int depth, kdim;
    vector<double> target, nearest;

    // Immersive insert
    shared_ptr<Node> iInsert(shared_ptr<Node> n, const vector<double>& p, int level, int &steps);

    // Immersive fins Nearest
    shared_ptr<Node> iFindNearest(shared_ptr<Node> n, const vector<double>& e, shared_ptr<Node> best, int level, int &steps);

public:
    /* ------------ */
    /* Constructors */
    /* ------------ */
    // Empty tree with k-dimension defined. O(1)
    KDTree(int kdim);
    /* ------------ */

    /* ------------ */
    /* Methods      */
    /* ------------ */
    // Tells if this tree is empty. Θ(1).
    bool empty () const;

    // Returns the root value of this tree (cannot be empty). Θ(1).
    const vector<double>& value () const;

    // Retrurns kdim of the tree
    int getKdim() const;

    // Retrurns kdim of the tree
    int getDepth() const;

    // Pre: k-dimension has been defined
    // Insert new element into the tree
    void insert(const vector<double>& x);

    // Pre: k-dimension has been defined
    // Insert collection of elements into the tree
    void insert(const vector<vector<double>>& v);

    // Finds the nearest point in the tree
    vector<double> findNearest(const vector<double>& e, int &steps);

    void printBT(const std::string& prefix, const shared_ptr<Node> node, bool isLeft);
    void printBT();

    // Print point
    static void printPoint(const vector<double>& p);

    // Random point creation with kdim == KDTree::kdim
    vector<double> randomPoint();

    // Fills the tree with random values
    void randomFill(int nPoints);

    // Returns real nearest node to the target
    vector<double> getRealNearest();

    // Returns target node
    vector<double> getTarget();
    /* ------------ */
};

#endif
