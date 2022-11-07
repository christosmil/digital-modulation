function plotQpsk()
% Function to plot QPSK modulation.
% bitstream
% 000001011011100100111101

clc; close all;

[LINEWIDTH, FONTSIZE, FONTNAME, LINECOLOR] = parameters();

FREQ = 4;

% plot symbols
k = linspace(0,4*pi);
PLOT_1 = sin(k + 0*pi/2);
PLOT_2 = sin(k + 1*pi/2);
PLOT_3 = sin(k + 2*pi/2);
PLOT_4 = sin(k + 3*pi/2);

figure;
tiledlayout(2,2);
PLOTS = {PLOT_1, PLOT_2, PLOT_3, PLOT_4};
for i = 1:length(PLOTS)
    nexttile;
    plot(PLOTS{i}, 'LineWidth', LINEWIDTH, 'color', LINECOLOR);
    if length(dec2bin(i - 1)) == 1
        title(sprintf('0%c',dec2bin(i - 1)));
    elseif length(dec2bin(i - 1)) == 2
        title(sprintf('%c',dec2bin(i - 1)));
    end
    ylim([-1 1]);
    set(gca, 'XTick', [], 'FontSize', FONTSIZE - 2, 'FontName', FONTNAME);
    yticks([-1 0 1]);
    set(gca, 'YGrid', 'on', 'XGrid', 'off');
    yticklabels({'-A_c', '0', 'A_c'});
end

% plot modulation
syms x;
y = piecewise( ...
    0 <= x < 2, sin(FREQ*(x-0)*pi), ...
    2 <= x < 4, sin(FREQ*(x-2)*pi + pi/2), ...
    4 <= x < 5, sin(FREQ*(x-4)*pi + pi), ...
    5 <= x < 6, sin(FREQ*(x-5)*pi + 3*pi/2), ...
    6 <= x < 7, sin(FREQ*(x-6)*pi + pi), ...
    7 <= x < 8, sin(FREQ*(x-7)*pi + pi/2), ...
    8 <= x < 9, sin(FREQ*(x-8)*pi), ...
    9 <= x < 11, sin(FREQ*(x-9)*pi + 3*pi/2), ...
    11 <= x < 12, sin(FREQ*(x-11)*pi + pi/2) ...
    );

figure;
fplot(y, 'LineWidth', LINEWIDTH, 'color', LINECOLOR);
ylim([-1 1]);
xlim([0 12]);
set(gca, 'YGrid', 'off', 'XGrid', 'on');
yticks([-1 0 1]);
xticks((1:12));
yticklabels({'-A_c', '0', 'A_c'});
xticklabels({ ...
    '00','00','01', ...
    '01','10','11', ...
    '10','01','00', ...
    '11','11','01', ...
    });
set(gca, 'FontSize', FONTSIZE, 'FontName', FONTNAME);
end