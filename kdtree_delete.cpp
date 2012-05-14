#include "KDTree.h"

#ifndef CPPONLY
#include "mex.h"
void retrieve_tree( const mxArray* matptr, KDTree* & tree){
    // retrieve pointer from the MX form
    double* pointer0 = mxGetPr(matptr);
    // check that I actually received something
    if( pointer0 == NULL )
        mexErrMsgTxt("varargin{1} must be a valid kdtree pointer\n");
    // convert it to "long" datatype (good for addresses)
    long pointer1 = (long) pointer0[0];
    // convert it to "KDTree"
    tree = (KDTree*) pointer1;
    // check that I actually received something
    if( tree == NULL )
        mexErrMsgTxt("varargin{1} must be a valid kdtree pointer\n");
    if( tree -> ndims() <= 0 )
        mexErrMsgTxt("the k-D tree must have k>0");
}
void mexFunction(int nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[]){   
	// check the arguments
	if( nrhs!=1 || !mxIsNumeric(prhs[0]) )
		mexErrMsgTxt("varargin{1} must be a valid kdtree pointer\n");
	
	// retrieve the tree pointer
    KDTree* tree;
    retrieve_tree( prhs[0], tree );
    tree -> ~KDTree();
}
#endif