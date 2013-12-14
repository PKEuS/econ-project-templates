function [new_location] = move_until_happy(location, agents, n_neighbours, require_same_type, max_moves)
% If not happy, then randomly choose new locations until happy or max moves
% reached.

    function [zero_one] = happy(location, type, agents, n_neighbours, require_same_type)
    % 1, if sufficient number of nearest neighbours are of the same type,
    % else 0.
    
    % Obtain row indeces of *n_neighbours*-nearest neighbours in *other_agents*
    N = KDTreeSearcher(agents(:, 1:2));
    idx = knnsearch(N, location(1:2), 'K', n_neighbours);

    % Check if agents is happy
    if sum(agents(idx, 3) == type) >= require_same_type;
        zero_one = 1; % happy
    elseif sum(agents(idx, 3) == type) < require_same_type;
        zero_one = 0; % unhappy
    else
        disp('Counting nearest types went wrong');
    end
    end

% Get agent's type
this_type = location(3);

% Get agent's happiness
agent_happy = happy(location, this_type, agents, n_neighbours, require_same_type);

% Check if agent is happy
if agent_happy == 1;
    new_location = location;
    return;
else
    for i = 1:max_moves;
        % Draw new location and pass agent's type
        new_location = [rand(1,2), this_type];
        if happy(new_location, this_type, agents, n_neighbours, require_same_type) == 1;
            return;
        end
    end
end
end