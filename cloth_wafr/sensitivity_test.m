%close all
close all
clear all

space_hold_28 = '%n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n';
space_hold_1 = '%n';
space_hold_2 = '%n %n';
space_hold_3 = '%n %n %n';


%%%%%%%%%%% Error Analysis %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file_error_dm = 'dModel_mController/cos04/control_error_realtime.txt';
% file_error_D_wo = 'dModel_dController_woSC/control_error_realtime.txt';
% file_error_D_w = 'dModel_dController_wSC/control_error_realtime.txt';
real_motion_1 = 'sensitivity/+0/real_object_motion.txt';
estimate_change_1 = 'sensitivity/+0/states_estimation_diff.txt';

% file_t_dm = 'dModel_mController/cos04/control_time.txt';
% file_t_D_wo = 'dModel_dController_woSC/control_time.txt';
% file_t_D_w = 'dModel_dController_wSC/control_time.txt';
file_t_1 = 'sensitivity/+0/control_time.txt';

fig_path_1 = 'sensitivity/sensitivity_analysis.pdf';

parameter_set_1 = '+0';

[real_change] = textread(real_motion_1, space_hold_1, 'headerlines',1);
[estimation_change] = textread(estimate_change_1, space_hold_1, 'headerlines',1);
[t_1] = textread(file_t_1, space_hold_1, 'headerlines',1);

ind_1 = 1:length(t_1);

%%%%%%%%%%%%%%%%%%%% show all in two plots: %%%%%%%%%%%%%%%%%%
fig_1 = figure;
plot(t_1, real_change, t_1, estimation_change)
legend('real change', 'estimation change')
title('sensitivity')
xlabel('time')
ylabel('change')
saveas(fig_1 ,fig_path_1)

