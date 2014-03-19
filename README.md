### Complex network reading group UCD 2014

Matlab code for complex network reading group, UC Denver 2014 for the following papers discussed.



## Xie et al: Evolution of Opinions on Social Networks in the Presence of Completing Committed Groups, PLoS ONE 7(3): 2012.

The code is in the directory `opinion_networks`.  Simply change into the directory and run `onet_quicklook` to obtain quick insight into the figures shown in the paper for the mean field model.

This will create a vector field for `na` and `nb` parameters (proportion of people with opinion `A` or `B` respectively) given `pa` and `pb` (proportion of zealots with opinion `A` or `B` in population) that can be controlled either via sliders to view smooth changes or directly set using the text fields.

Other functions in the directory are:

  * `onet_integrate` which takes a starting point and a stopping time, integrates the trajectory of the system from the starting point and plots this on a graph, the final point is marked with a black circle
  * `onet_model` implements the functions of the model and is constructed so that it's easy to pass to ODE integrators in MATLAB, e.g. ode45
  * `onet_quiver` displays a quiver plot (depicting the vector field of the ODE with given parameters `pa` and `pb`)
  * `onet_analyze_dynamics` displays a quiver plot using `onet_quiver` and plots several trajectories starting at various points in the state space (using `onet_integrate`)
  * `onet_linear_trajectories` displays graphs of the dynamics for varying values of `pa` with `pb=c*pa` as subplots for examination, this make the difference between the second order (`c=1`) and first order (`c not equal to 1`)

Note: `onet_quicklook` simply binds `onet_analyze_dynamics` to the UI controls for changing the parameters and updates the plot accordingly.

