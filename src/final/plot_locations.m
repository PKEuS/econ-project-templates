% Add path to Matlab's project_paths function
addpath ../../bld/src/library/

load(project_paths('OUT_ANALYSIS', 'schelling_baseline.mat'));

n_cycles = size(locations_by_round, 3);
n_rows = ceil(n_cycles / 2);

f = figure('visible', 'off');

for i = 1 : n_cycles;
    this_round = locations_by_round( :, :, i);
    type_1 = this_round( :, 3) == 1;
    type_2 = this_round( :, 3) == 2;
    subplot(n_rows, 2, i);
    hold on
    plot(this_round(type_1, 1), this_round(type_1, 2), 'o', 'MarkerEdgeColor','g', 'MarkerSize', 4);
    plot(this_round(type_2, 1), this_round(type_2, 2), 'o', 'MarkerEdgeColor','b', 'MarkerSize', 4); 
    hold off
    title(['Cycle ', int2str(i)]);
    axis([0 1 0 1]);
end

saveas(f, project_paths('OUT_FIGURES','schelling_baseline_fig.png));