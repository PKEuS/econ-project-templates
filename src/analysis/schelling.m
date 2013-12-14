% Run a Schelling (1969, :cite:`Schelling69`) segregation
% model and store a list with locations by type at each cycle.

% The scripts expects a model name to be passed on the command
% line that needs to correspond to a file called
% ``[model_name].json`` in the "IN_MODEL_SPECS" directory.

% TO DO: - Load json files with model specifications
%        - Allow for multiple types
%        - Recover model name from command line

% Load random sample
load('samples.mat')

% Set up a matrix specifying each agent's location and type

% Number of different types
n_types = 2;

% Number of agents by types
% # type 1
n1 = 250;
% # type 2
n2 = 250;

% max iterations
max_iter = 1000;

% max moves to find happiness
max_moves = 2;

% K nearest neighbours
n_neighbours = 10;

% Same type requirement
require_same_type = 4;

% Initilize agents. Column 1 & 2: location; Column 3: type.
agents = NaN*zeros(n1+n2, 3);

% Obtain agents' initial locations and types from sample
agents(1:n1, :) = [sample(1:n1, :, 1), 1*ones(n1,1)];
agents((n1+1):(n1+n2), :) = [sample((n1+1):(n1+n2), :, 2), 2*ones(n2,1)];


% Initilize 3d locations-by-round matrix
locations_by_round = NaN*zeros(size(agents, 1), 3, max_iter);

% "Zero" round is agents' initial location
locations_by_round( :, :, 1) = agents;
rounds = 1;

for loop_counter = 1:max_iter;
    
    if loop_counter > 1;
        locations_by_round(:, :, loop_counter) = (...
            locations_by_round( :, :, loop_counter-1)...
        );
    end
    
    someone_moved = 0;
    for a = 1:size(agents, 1); % loop through agents
        
        disp(a);
        
        % Obtain this agent's current location
        old_location = locations_by_round(a, :, loop_counter);
        
        % Obtain all other agents' current location
        other_agents = locations_by_round(:, :, loop_counter);
        other_agents(a, :) = []; 
                
        % Obtain this agent's new location conditioned on his happiness
        new_location = move_until_happy(...
            old_location, ...
            other_agents, ...
            n_neighbours, ...
            require_same_type, ...
            max_moves ...
        );
        
        % Check if this agent moved
        if (new_location ~= old_location);
            someone_moved = 1;
        end
        
        % Update this agent's location
        locations_by_round(a, :, loop_counter) = new_location;
    
    end
    
    % We are done if everybody is happy
    if someone_moved == 0;
        rounds = loop_counter;
        break;
    end
    
end

% Not everybody has reached happiness
if someone_moved == 1;
    disp('No convergence reached: Not everyone happy!');
end

locations_by_round = locations_by_round( :, :, (1:rounds));
save('locations_by_round.mat', 'locations_by_round');   