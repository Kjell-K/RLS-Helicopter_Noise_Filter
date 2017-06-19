function PlotAudio(E_RLS, d, fs)

time = (1:length(E_RLS))/fs;

colors = {[1 0.4 0.6], [0 0.4 0.5]};

figure(2)
set(2, 'units', 'centimeters', 'position', [2 8 8.74 8]);
hold on;

plot(time, d, 'Color', colors{1});

plot(time, E_RLS, 'Color', colors{2});

ylabel('Audio Signal');
xlabel('Time (s)');
hold off;

end