%close all
close all
clear all

space_hold_28 = '%n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n';
space_hold_1 = '%n';

%%%%%%%%%%% Error Analysis %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
file_stretching_factor_dm = 'dModel_mController/cos04/realtime_stretching_factor.txt';
file_stretching_factor_D_wo = 'dModel_dController_woSC/realtime_stretching_factor.txt';
file_stretching_factor_D_w = 'dModel_dController_wSC/realtime_stretching_factor.txt';
file_stretching_factor_1 = 'mModel_mController/cos04_60_3_7/realtime_stretching_factor.txt';
file_stretching_factor_2 = 'mModel_mController/cos04_60_3_7/realtime_stretching_factor.txt';
file_stretching_factor_3 = 'mModel_mController/cos04_60_3_7/realtime_stretching_factor.txt';

file_t_dm = 'dModel_mController/cos04/control_time.txt';
file_t_D_wo = 'dModel_dController_woSC/control_time.txt';
file_t_D_w = 'dModel_dController_wSC/control_time.txt';
file_t_1 = 'mModel_mController/cos04_60_3_7/control_time.txt';
file_t_2 = 'mModel_mController/cos04_60_3_7/control_time.txt';
file_t_3 = 'mModel_mController/cos04_60_3_7/control_time.txt';

parameter_set_dm = 'md cos 0.4';
parameter_set_D_wo = 'dd_wo cos 0.4';
parameter_set_D_w = 'dd_w cos 0.4';
parameter_set_1 = 'mm cos 0.4';
parameter_set_2 = 'strething cos 0.4';
parameter_set_3 = 'strething cos 0.4';

stretching_factor_dm = readData_fn(file_stretching_factor_dm, space_hold_1);
stretching_factor_D_wo = readData_fn(file_stretching_factor_D_wo, space_hold_1);
stretching_factor_D_w = readData_fn(file_stretching_factor_D_w, space_hold_1);
stretching_factor_1 = readData_fn(file_stretching_factor_1, space_hold_1);
stretching_factor_2 = readData_fn(file_stretching_factor_2, space_hold_1);
stretching_factor_3 = readData_fn(file_stretching_factor_3, space_hold_1);

t_dm = readTime(file_t_dm);
t_D_wo = readTime(file_t_D_wo);
t_D_w = readTime(file_t_D_w);
t_1 = readTime(file_t_1);
t_2 = readTime(file_t_2);
t_3 = readTime(file_t_3);

ind_dm = 1:length(t_dm);
ind_D_wo = 1:length(t_D_wo);
ind_D_w = 1:length(t_D_w);
ind_1 = 1:length(t_1);
ind_2 = 1:length(t_2);
ind_3 = 1:length(t_3);

%%%%%%%%%%%%%%%%%%%%%% select the parameter set showing whole data %%%%
show_stretching_factor = stretching_factor_1;
% show_stretching_count = stretching_count_1;
show_t = t_1;
show_ind = ind_1;
show_legend = parameter_set_1;


%%%%%%%%%%%%%%%%%%%%% show stretching violation %%%%%%%%%%%%%%%%%%%%
figure
plot(t_D_wo, stretching_factor_D_wo, show_t,show_stretching_factor)
legend(parameter_set_D_wo, show_legend)
title('Stretching factor: DD without SCvs. MM')
xlabel('time')
ylabel('control error')

figure
plot(t_D_w, stretching_factor_D_w, show_t, show_stretching_factor)
legend(parameter_set_D_w, show_legend)
title('Stretching factor: DD with SC vs. MM')
xlabel('time')
ylabel('control error')

figure
% plot(t_dm, stretching_factor_dm, ...
%    show_t,show_stretching_factor,'LineWidth',4)
plot(t_dm, stretching_factor_dm, ...
    show_t,show_stretching_factor)
legend(parameter_set_dm, show_legend)
title('Stretching factor: DM vs. MM')
xlabel('time (s)')
ylabel('control error')




