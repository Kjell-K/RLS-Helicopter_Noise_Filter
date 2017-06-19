function PlotCoeffs(LS_Coeff, RLS_Coeff, M, fs)

N_coeff = 1:M;
colors = {[1 0.4 0.6], [0 0.4 0.5] , [1 0 1], [0 1 1], [1 0 0], [0 1 0], [0 0 1], [0 0 0], [0.2 0.2 1], [0.3 0.1 0.7]};

time = (1:length(RLS_Coeff))/fs;

figure(1)
set(1, 'units', 'centimeters', 'position', [2 8 8.74 8]);
hold on;
for i = N_coeff
    p(i) = plot(time, RLS_Coeff(i,:), 'Color', colors{i});
    %legendlist{i} = ['Coeff ' num2str(i)];
    plot(time, LS_Coeff(i)*ones(1,length(RLS_Coeff)), 'Color', colors{i}, 'LineStyle', '--');
end
ylabel('Coefficients');
xlabel('Time (s)');
%legend(p(N_coeff), legendlist);
hold off;

end

