%close all
close all
clear all

space_hold_28 = '%n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n';
space_hold_1 = '%n';

%%%%%%%%%%% Error Analysis %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
file_error_dm = 'dModel_mController/cos04/control_error_realtime.txt';
file_error_D_wo = 'dModel_dController_woSC/control_error_realtime.txt';
file_error_D_w = 'dModel_dController_wSC/control_error_realtime.txt';
file_error_1 = 'mModel_mController/cos04_60_3_7/control_error_realtime.txt';
file_error_2 = 'mModel_mController/cos04_60_3_7/control_error_realtime.txt';
file_error_3 = 'mModel_mController/cos04_60_3_7/control_error_realtime.txt';

file_t_dm = 'dModel_mController/cos04/control_time.txt';
file_t_D_wo = 'dModel_dController_woSC/control_time.txt';
file_t_D_w = 'dModel_dController_wSC/control_time.txt';
file_t_1 = 'mModel_mController/cos04_60_3_7/control_time.txt';
file_t_2 = 'mModel_mController/cos04_60_3_7/control_time.txt';
file_t_3 = 'mModel_mController/cos04_60_3_7/control_time.txt';

fig_path_dm = 'mModel_mController/cos04_60_3_7/controlling_error_DM.pdf';
fig_path_D_wo = 'mModel_mController/cos04_60_3_7/controlling_error_D_wo.pdf';
fig_path_D_w = 'mModel_mController/cos04_60_3_7/controlling_error_D_w.pdf';
fig_path_1 = 'mModel_mController/cos04_60_3_7/controlling_error_MM.pdf';
fig_path_2 = 'mModel_mController/cos04_60_3_7/controlling_error_MM.pdf';
fig_path_3 = 'mModel_mController/cos04_60_3_7/controlling_error_MM.pdf';

parameter_set_dm = 'DM cos 0.4';
parameter_set_D_wo = 'DD wo SC';
parameter_set_D_w = 'DD w SC';
parameter_set_1 = 'MM cos 0.4';
parameter_set_2 = 'strething cos 0.4';
parameter_set_3 = 'strething cos 0.4';

mean_error_dm = readData_fn(file_error_dm, space_hold_1);
mean_error_D_wo = readData_fn(file_error_D_wo, space_hold_1);
mean_error_D_w = readData_fn(file_error_D_w, space_hold_1);
mean_error_1 = readData_fn(file_error_1, space_hold_1);
mean_error_2 = readData_fn(file_error_2, space_hold_1);
mean_error_3 = readData_fn(file_error_3, space_hold_1);

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
show_error = mean_error_1;
%show_stretching_count = stretching_count_1;
show_t = t_1;
show_ind = ind_1;
show_legend = parameter_set_1;
show_fig_file = fig_path_1;

%%%%%%%%%%%%%%%%%%%% show all in two plots: %%%%%%%%%%%%%%%%%%
fig_D_wo = figure;
plot(t_D_wo, mean_error_D_wo, show_t,show_error)
legend(parameter_set_D_wo, show_legend)
title('DD without SC vs. MM')
xlabel('time')
ylabel('control error')
saveas(fig_D_wo, fig_path_D_wo)

fig_D_w = figure;
plot(t_D_w, mean_error_D_w, show_t,show_error)
legend(parameter_set_D_w, show_legend)
title('DD with SC vs. MM')
xlabel('time')
ylabel('control error')
saveas(fig_D_w, fig_path_D_w)

fig_DM = figure;
% plot(t_dm, mean_error_dm, ...
%    show_t,show_error,'LineWidth',4)
plot(t_dm, mean_error_dm, ...
    show_t,show_error)
legend(parameter_set_dm, show_legend)
title('DM vs. MM')
xlabel('time (s)')
ylabel('control error')
saveas(fig_DM, fig_path_dm)



