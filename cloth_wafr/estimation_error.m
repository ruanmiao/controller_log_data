%close all
close all
clear all

space_hold_28 = '%n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n';
space_hold_1 = '%n';
space_hold_3 = '%n %n %n';


%%%%%%%%%%% Error Analysis %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file_error_dm = 'dModel_mController/cos04/control_error_realtime.txt';
% file_error_D_wo = 'dModel_dController_woSC/control_error_realtime.txt';
% file_error_D_w = 'dModel_dController_wSC/control_error_realtime.txt';
file_error_1 = 'estimation/+0/estimation_error.txt';
file_error_2 = 'estimation/+60/estimation_error.txt';
file_error_3 = 'estimation/+90/estimation_error.txt';

% file_t_dm = 'dModel_mController/cos04/control_time.txt';
% file_t_D_wo = 'dModel_dController_woSC/control_time.txt';
% file_t_D_w = 'dModel_dController_wSC/control_time.txt';
file_t_1 = 'estimation/+0/control_time.txt';
file_t_2 = 'estimation/+60/control_time.txt';
file_t_3 = 'estimation/+90/control_time.txt';

fig_path_1 = 'estimation/estimation_error_+0.pdf';
fig_path_2 = 'estimation/estimation_error_60.pdf';
fig_path_3 = 'estimation/estimation_error_90.pdf';

parameter_set_1 = '+0';
parameter_set_2 = '+60';
parameter_set_3 = '+90';

[estimation_error_1] = textread(file_error_1, space_hold_1, 'headerlines',1);
[estimation_error_2] = textread(file_error_2, space_hold_1, 'headerlines',1);
[estimation_error_3] = textread(file_error_3, space_hold_1, 'headerlines',1);


[t_1] = textread(file_t_1, space_hold_1, 'headerlines',1);
[t_2] = textread(file_t_2, space_hold_1, 'headerlines',1);
[t_3] = textread(file_t_3, space_hold_1, 'headerlines',1);

ind_1 = 1:length(t_1);
ind_2 = 1:length(t_2);
ind_3 = 1:length(t_3);

%%%%%%%%%%%%%%%%%%%% show all in two plots: %%%%%%%%%%%%%%%%%%
fig_1 = figure;
plot(t_1, estimation_error_1, t_2, estimation_error_2, t_3, estimation_error_3)
legend(parameter_set_1, parameter_set_2, parameter_set_3)
title('estimation error')
xlabel('time')
ylabel('error')
saveas(fig_1 ,fig_path_1)

