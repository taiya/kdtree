#include "mex.h"
#include "KDTree.h"

#include "/Applications/matlab.app/extern/include/mex.h"

void KDTree::from_matlab_matrix(const mxArray *matstruct){

}

void mexFunction(int nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[]){
    if(nrhs!=1) mexErrMsgTxt("varargin{1}  is the struct pointer");
    if(nlhs!=1) mexErrMsgTxt("varargout{1} is the tree pointer");
    
    /// Instantiate tree
    KDTree* tree = new KDTree();
    tree->from_matlab_matrix(prhs[0]);
    
    /// Store pointer in matlab
    plhs[0] = mxCreateDoubleMatrix(1,1,mxREAL);
    double* pointer_to_tree = mxGetPr(plhs[0]);
    pointer_to_tree[0] = (long) tree;
}

