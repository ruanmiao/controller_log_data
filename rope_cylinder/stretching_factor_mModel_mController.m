%close all
close all
clear all

space_hold_28 = '%n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n';
space_hold_1 = '%n';
space_hold_3 = '%n %n %n';

%%%%%%%%%%% Error Analysis %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file_error_dm = 'dModel_mController/cos04/realtime_stretching_factor.txt';
% file_error_D_wo = 'dModel_dController_woSC/realtime_stretching_factor.txt';
% file_error_D_w = 'dModel_dController_wSC/realtime_stretching_factor.txt';
file_error_1 = 'mModel_mController/cos075_60_3_7/realtime_stretching_factor.txt';
file_error_2 = 'mModel_mController/cos075_60_3_7/realtime_stretching_factor.txt';
file_error_3 = 'mModel_mController/cos075_60_3_7/realtime_stretching_factor.txt';

% file_t_dm = 'dModel_mController/cos04/control_time.txt';
% file_t_D_wo = 'dModel_dController_woSC/control_time.txt';
% file_t_D_w = 'dModel_dController_wSC/control_time.txt';
file_t_1 = 'mModel_mController/cos075_60_3_7/control_time.txt';
file_t_2 = 'mModel_mController/cos075_60_3_7/control_time.txt';
file_t_3 = 'mModel_mController/cos075_60_3_7/control_time.txt';

fig_path_dm = 'mModel_mController/cos075_60_3_7/realtime_stretching_factor.pdf';
fig_path_dd_wo = 'mModel_mController/cos075_60_3_7/realtime_stretching_factor.pdf';
fig_path_dd_w = 'mModel_mController/cos075_60_3_7/realtime_stretching_factor.pdf';
fig_path_1 = 'mModel_mController/cos075_60_3_7/realtime_stretching_factor.pdf';
fig_path_2 = 'mModel_mController/cos075_60_3_7/realtime_stretching_factor.pdf';
fig_path_3 = 'mModel_mController/cos075_60_3_7/realtime_stretching_factor.pdf';

parameter_set_dm = 'DM cos 0.4';
parameter_set_dd_wo = 'DD wo SC';
parameter_set_dd_w = 'DD w SC';
parameter_set_1 = 'MM cos 0.4';
parameter_set_2 = 'strething cos 0.4';
parameter_set_3 = 'strething cos 0.4';

[stretching_factor_1, stretching_factor_dm, stretching_factor_dd_wo]  = readData_fn(file_error_1, space_hold_3);

[t_1] = textread(file_t_1, space_hold_1, 'headerlines',1);
t_dm = t_1;
t_dd_wo = t_1;
t_1 = readTime(file_t_1);
t_2 = readTime(file_t_2);
t_3 = readTime(file_t_3);

ind_dm = 1:length(t_dm);
ind_dd_wo = 1:length(t_dd_wo);
ind_1 = 1:length(t_1);
ind_2 = 1:length(t_2);
ind_3 = 1:length(t_3);


%%%%%%%%%%%%%%%%%%%%%% select the parameter set showing whole data %%%%
stretching_factor_mm = stretching_factor_1;
%show_stretching_count = stretching_count_1;
t_mm = t_1;
ind_mm = ind_1;
parameter_set_mm = parameter_set_1;
fig_path_mm = fig_path_1;

%%%%%%%%%%%%%%%%%%%% show all in two plots: %%%%%%%%%%%%%%%%%%
fig_1 = figure;
plot(t_mm, stretching_factor_mm, t_dm, stretching_factor_dm, t_dd_wo, stretching_factor_dd_wo)
legend(parameter_set_mm, parameter_set_dm, parameter_set_dd_wo)
title('MM, MD, DD without SC')
xlabel('time')
ylabel('control error')
saveas(fig_1 ,fig_path_mm)

sum_mean_error_mm = sum(stretching_factor_mm);
sum_mean_error_dm = sum(stretching_factor_dm);
sum_mean_error_dd_wo = sum(stretching_factor_dd_wo);

% fig_D_w = figure;
% plot(t_D_w, mean_error_D_w, show_t,show_error)
% legend(parameter_set_dd_w, show_legend)
% title('DD with SC vs. MM')
% xlabel('time')
% ylabel('control error')
% saveas(fig_D_w, fig_path_dd_w)
% 
% fig_DM = figure;
% % plot(t_dm, mean_error_dm, ...
% %    show_t,show_error,'LineWidth',4)
% plot(t_dm, mean_error_dm, ...
%     show_t,show_error)
% legend(parameter_set_dm, show_legend)
% title('DM vs. MM')
% xlabel('time (s)')
% ylabel('control error')
% saveas(fig_DM, fig_path_dm)





