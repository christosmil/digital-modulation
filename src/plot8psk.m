function plot8psk()
% Function to plot 8-PSK modulation.
% bitstream
% 000   001   010   011   100   101   110   111
% |     |     |     |     |     |     |     |
% 0     pi/4  pi/2  3pi/4 pi    5pi/4 3pi/2 7pi/4

clc; close all;

[LINEWIDTH, FONTSIZE, FONTNAME, LINECOLOR] = parameters();

FREQ = 4;

% plot symbols
k = linspace(0,4*pi);
PLOT_1 = sin(k + 0*pi/4);
PLOT_2 = sin(k + 1*pi/4);
PLOT_3 = sin(k + 2*pi/4);
PLOT_4 = sin(k + 3*pi/4);
PLOT_5 = sin(k + 4*pi/4);
PLOT_6 = sin(k + 5*pi/4);
PLOT_7 = sin(k + 6*pi/4);
PLOT_8 = sin(k + 7*pi/4);

figure;
tiledlayout(4,2);
PLOTS = {PLOT_1, PLOT_2, PLOT_3, PLOT_4, PLOT_5, PLOT_6, PLOT_7, PLOT_8};
for i = 1:length(PLOTS)
    nexttile;
    plot(PLOTS{i}, 'LineWidth', LINEWIDTH, 'color', LINECOLOR);
    if length(dec2bin(i - 1)) == 1
        title(sprintf('00%c',dec2bin(i - 1)));
    elseif length(dec2bin(i - 1)) == 2
        title(sprintf('%c%c', '0', dec2bin(i - 1))); 
    elseif length(dec2bin(i - 1)) == 3
        title(sprintf('%c',dec2bin(i - 1)));
    end
    ylim([-1 1]);
    set(gca, 'XTick', [], 'FontSize', FONTSIZE - 4, 'FontName', FONTNAME);
    yticks([-1 0 1]);
    set(gca, 'YGrid', 'on', 'XGrid', 'off');
    yticklabels({'-A_c', '0', 'A_c'});
end

% plot modulation
syms x;
y = piecewise( ...
    0 <= x < 1, sin(FREQ*(x-0)*pi), ...
    1 <= x < 2, sin(FREQ*(x-2)*pi + pi/4), ...
    2 <= x < 4, sin(FREQ*(x-4)*pi + 3*pi/4), ...
    4 <= x < 6, sin(FREQ*(x-5)*pi + pi), ...
    6 <= x < 7, sin(FREQ*(x-6)*pi + 7*pi/4), ...
    7 <= x < 8, sin(FREQ*(x-7)*pi + 5*pi/4) ...
    );

figure;
fplot(y, 'LineWidth', LINEWIDTH, 'color', LINECOLOR);
ylim([-1 1]);
xlim([0 8]);
set(gca, 'YGrid', 'off', 'XGrid', 'on');
yticks([-1 0 1]);
xticks((1:8));
yticklabels({'-A_c', '0', 'A_c'});
xticklabels({ ...
    '000','001','011', ...
    '011','100','100', ...
    '111','101', ...
    });
set(gca, 'FontSize', FONTSIZE, 'FontName', FONTNAME);
