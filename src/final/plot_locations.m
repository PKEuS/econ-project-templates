% Add path to Matlab's project_paths function
addpath ../../bld/src/library/

load(project_paths('OUT_ANALYSIS', 'schelling_baseline.mat'));

n_cycles = size(locations_by_round, 3);
n_rows = ceil(n_cycles / 2);
n_types = 2;
colors = ['g', 'b'];

f = figure('visible', 'off');

% Plot agents' location for each cycle
for i = 1 : n_cycles;
    this_round = locations_by_round( :, :, i);
    subplot(n_rows, 2, i);
    hold on
    % Allow for multiple types
    for t = 1 : n_types;
        this_type = this_round( :, 3) == t;
        plot( ... 
            this_round(this_type, 1), this_round(this_type, 2), ... 
            'o', 'MarkerEdgeColor', colors(t) , 'MarkerSize', 4 ...
        );
    end
    hold off
    title(['Cycle ', int2str(i)]);
    axis([0 1 0 1]);
end

saveas(f, project_paths('OUT_FIGURES','schelling_baseline_fig.png'));