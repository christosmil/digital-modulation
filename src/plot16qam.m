function plot16qam()
% Function to plot 8-PSK modulation.
% bitstream
% 0000      0101        1011        1001        0011        1101
% Α1 π/4    Α2 3π/4     Α4 5π/4     Α2 5π/4     Α4 π/4      Α2 7π/4
% 
% 0000 Α1 π/4 (45)
% 0001 Α2 π/4
% 0010 Α3 π/4
% 0011 Α4 π/4
% 0100 Α1 3π/4 (135)
% 0101 Α2 3π/4
% 0110 Α3 3π/4
% 0111 Α4 3π/4
% 1000 Α1 5π/4 (225)
% 1001 Α2 5π/4
% 1010 Α3 5π/4
% 1011 Α4 5π/4
% 1100 Α1 7π/4 (315)
% 1101 Α2 7π/4
% 1110 Α3 7π/4
% 1111 Α4 7π/4

clc; close all;

[LINEWIDTH, FONTSIZE, FONTNAME, LINECOLOR] = parameters();

FREQ = 4;
AMPL_1 = 1;
AMPL_2 = 2;
AMPL_3 = 3;
AMPL_4 = 4;

% plot symbols
k = linspace(0,4*pi);
PLOT_1 = AMPL_1*sin(k + pi/4);
PLOT_2 = AMPL_2*sin(k + pi/4);
PLOT_3 = AMPL_3*sin(k + pi/4);
PLOT_4 = AMPL_4*sin(k + pi/4);
PLOT_5 = AMPL_1*sin(k + 3*pi/4);
PLOT_6 = AMPL_2*sin(k + 3*pi/4);
PLOT_7 = AMPL_3*sin(k + 3*pi/4);
PLOT_8 = AMPL_4*sin(k + 3*pi/4);
PLOT_9 = AMPL_1*sin(k + 5*pi/4);
PLOT_10 = AMPL_2*sin(k + 5*pi/4);
PLOT_11 = AMPL_3*sin(k + 5*pi/4);
PLOT_12 = AMPL_4*sin(k + 5*pi/4);
PLOT_13 = AMPL_1*sin(k + 7*pi/4);
PLOT_14 = AMPL_2*sin(k + 7*pi/4);
PLOT_15 = AMPL_3*sin(k + 7*pi/4);
PLOT_16 = AMPL_4*sin(k + 7*pi/4);

figure;
tiledlayout(4,4);
PLOTS = {PLOT_1, PLOT_2, PLOT_3, PLOT_4, PLOT_5, PLOT_6, PLOT_7, PLOT_8,...
    PLOT_9, PLOT_10, PLOT_11, PLOT_12, PLOT_13, PLOT_14, PLOT_15, PLOT_16};
for i = 1:length(PLOTS)
    nexttile;
    plot(PLOTS{i}, 'LineWidth', LINEWIDTH, 'color', LINECOLOR);
    if length(dec2bin(i - 1)) == 1
        title(sprintf('000%c',dec2bin(i - 1)));
    elseif length(dec2bin(i - 1)) == 2
        title(sprintf('%c%c', '00', dec2bin(i - 1))); 
    elseif length(dec2bin(i - 1)) == 3
        title(sprintf('%c%c', '0', dec2bin(i - 1))); 
    elseif length(dec2bin(i - 1)) == 4
        title(sprintf('%c',dec2bin(i - 1)));
    end
    ylim([-AMPL_4 AMPL_4]);
    set(gca, 'XTick', [], 'FontSize', FONTSIZE - 10, 'FontName', FONTNAME);
    yticks([-AMPL_4 -AMPL_3 -AMPL_2 -AMPL_1 0 AMPL_1 AMPL_2 AMPL_3 AMPL_4]);
    set(gca, 'YGrid', 'on', 'XGrid', 'off');
    yticklabels({'-A3', '-A2', '-A1', '-A0', '0', 'A0', 'A1', 'A2', 'A3'});
end

% plot modulation
syms x;
y = piecewise( ...
    0 <= x < 1, AMPL_1*sin(FREQ*(x-0)*pi + pi/4), ...
    1 <= x < 2, AMPL_2*sin(FREQ*(x-1)*pi + 3*pi/4), ...
    2 <= x < 3, AMPL_4*sin(FREQ*(x-2)*pi + 5*pi/4), ...
    3 <= x < 4, AMPL_2*sin(FREQ*(x-3)*pi + 5*pi/4), ...
    4 <= x < 5, AMPL_4*sin(FREQ*(x-4)*pi + pi/4), ...
    5 <= x < 6, AMPL_2*sin(FREQ*(x-5)*pi + 7*pi/4) ...
    );

figure;
fplot(y, 'LineWidth', LINEWIDTH, 'color', LINECOLOR);
ylim([-AMPL_4 AMPL_4]);
xlim([0 6]);
set(gca, 'YGrid', 'off', 'XGrid', 'on');
yticks([-AMPL_4 -AMPL_3 -AMPL_2 -AMPL_1 0 AMPL_1 AMPL_2 AMPL_3 AMPL_4]);
xticks((1:8));
yticklabels({'-A3', '-A2', '-A1', '-A0', '0', 'A0', 'A1', 'A2', 'A3'});
xticklabels({ ...
    '0000','0101','1011', ...
    '1001','0011','1101', ...
    });
set(gca, 'FontSize', FONTSIZE, 'FontName', FONTNAME);
end