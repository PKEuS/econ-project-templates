% Draw simulated samples from two uncorrelated uniform variables
% (locations in two dimensions) for two types of agents and store
% them in a 3-dimensional NumPy array.

% *Note:* In principle, one would read the number of dimensions etc.
% from the "IN_MODEL_SPECS" file, this is to demonstrate the most basic
% use of *run_py_script* only.

% Add path to Matlab's project_paths function
addpath ../../bld/src/library/matlab/

n_types = 2;
n_draws = 30000;

% Set random seed
rng(12345)

% 3d array with random draws from a (0,1) uniform distribution
sample = rand(n_draws, 2, n_types);

% Save 
save(project_paths('OUT_DATA', 'samples.mat'), 'sample');
