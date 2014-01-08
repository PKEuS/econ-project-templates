.. _analysis:

Main model estimations / simulations
=====================================

Documentation of the code in **analysis**. Here's the core of the project. In case this step is very extensive, it may be useful to further break it up.


Schelling example:

Run a Schelling (1969, :cite:`Schelling69`) segregation
model and store a database with locations and types at each cycle.

The scripts expects a model name to be passed on the command
line that needs to correspond to a file called
``[model_name].json`` in the "IN_MODEL_SPECS" directory.