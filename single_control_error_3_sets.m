%close all
close all
clear all

space_hold_28 = '%n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n';
space_hold_1 = '%n';
space_hold_3 = '%n %n %n';

%%%%%%%%%%% Error Analysis %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
file_error_dm = 'mModel_mController/stretching/DM/control_error_realtime.txt';
file_error_dd_wo = 'mModel_mController/stretching/DD/control_error_realtime.txt';
file_error_dd_w = 'mModel_mController/stretching/DD/control_error_realtime.txt';
file_error_1 = 'mModel_mController/stretching/MM/control_error_realtime.txt';
file_error_2 = 'mModel_mController/stretching/MM/control_error_realtime.txt';
file_error_3 = 'mModel_mController/stretching/MM/control_error_realtime.txt';

file_t_dm = 'mModel_mController/stretching/DM/control_time.txt';
file_t_dd_wo = 'mModel_mController/stretching/DD/control_time.txt';
file_t_dd_w = 'mModel_mController/stretching/DD/control_time.txt';
file_t_1 = 'mModel_mController/stretching/MM/control_time.txt';
file_t_2 = 'mModel_mController/stretching/MM/control_time.txt';
file_t_3 = 'mModel_mController/stretching/MM/control_time.txt';

fig_path_dm = 'mModel_mController/stretching/DM/control_error_realtime.pdf';
fig_path_dd_wo = 'mModel_mController/stretching/DD/control_error_realtime.pdf';
fig_path_dd_w = 'mModel_mController/stretching//DD/control_error_realtime.pdf';
fig_path_1 = 'mModel_mController/stretching/MM/control_error_realtime.pdf';
fig_path_2 = 'mModel_mController/stretching/MM/control_error_realtime.pdf';
fig_path_3 = 'mModel_mController/stretching/MM/control_error_realtime.pdf';

fig_path_realtime_integral_stretching = 'mModel_mController/stretching/single_control_error_realtime.pdf';

parameter_set_dm = 'DM cos 0.4';
parameter_set_dd_wo = 'DD wo SC';
parameter_set_dd_w = 'DD w SC';
parameter_set_1 = 'MM cos 0.4';
parameter_set_2 = 'strething cos 0.4';
parameter_set_3 = 'strething cos 0.4';

stretching_factor_1  = textread(file_error_1, space_hold_1, 'headerlines',1);
stretching_factor_dm  = textread(file_error_dm, space_hold_1, 'headerlines',1);
stretching_factor_dd_wo  = textread(file_error_dd_wo, space_hold_1, 'headerlines',1);

[t_1] = textread(file_t_1, space_hold_1, 'headerlines',1);
t_dm = textread(file_t_dm, space_hold_1, 'headerlines',1);
t_dd_wo = textread(file_t_dd_wo, space_hold_1, 'headerlines',1);
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
title('single control error realtime')
xlabel('time')
ylabel('control error')
saveas(fig_1 ,fig_path_mm)

% stretching_up_bound = 1.167;
 stretching_up_bound = 1.25;

% sum_mean_error_mm = sum(stretching_factor_mm(stretching_factor_mm > stretching_up_bound));
% sum_mean_error_dm = sum(stretching_factor_dm(stretching_factor_dm > stretching_up_bound));
% sum_mean_error_dd_wo = sum(stretching_factor_dd_wo(stretching_factor_dd_wo > stretching_up_bound));

sum_mean_error_mm = 0;
sum_mean_error_dm = 0;
sum_mean_error_dd_wo = 0;

real_time_stretching_integral_mm = zeros(length(t_mm),1);
real_time_stretching_integral_dm = zeros(length(t_mm),1);
real_time_stretching_integral_dd_wo = zeros(length(t_mm),1);

sum_range = 1:length(t_mm)-1;
%sum_range = 1:400;
for i = sum_range
   
    real_time_stretching_integral_mm(i+1) = real_time_stretching_integral_mm(i);
    real_time_stretching_integral_dm(i+1) = real_time_stretching_integral_dm(i);
    real_time_stretching_integral_dd_wo(i+1) = real_time_stretching_integral_dd_wo(i);
   
    if stretching_factor_mm(i) > stretching_up_bound
       if stretching_factor_mm(i+1) > stretching_factor_mm(i)
           sum_mean_error_mm = sum_mean_error_mm + ...
               (stretching_factor_mm(i+1) - stretching_factor_mm(i));
           real_time_stretching_integral_mm(i+1) = sum_mean_error_mm;
       end
    end
    if stretching_factor_dm(i) > stretching_up_bound
       if stretching_factor_dm(i+1) > stretching_factor_dm(i)
           sum_mean_error_dm = sum_mean_error_dm + ...
               (stretching_factor_dm(i+1) - stretching_factor_dm(i));
           real_time_stretching_integral_dm(i+1) = sum_mean_error_dm;
       end
    end
    if stretching_factor_dd_wo(i) > stretching_up_bound
       if stretching_factor_dd_wo(i+1) > stretching_factor_dd_wo(i)
           sum_mean_error_dd_wo = sum_mean_error_dd_wo + ...
               (stretching_factor_dd_wo(i+1) - stretching_factor_dd_wo(i));
           real_time_stretching_integral_dd_wo(i+1) = sum_mean_error_dd_wo;
       end
    end
end

disp('MM')
disp(sum_mean_error_mm);
disp('DM')
disp(sum_mean_error_dm);
disp('DD')
disp(sum_mean_error_dd_wo);

fig_2 = figure;
plot(t_mm, real_time_stretching_integral_mm, ...
    t_dm, real_time_stretching_integral_dm, ...
    t_dd_wo, real_time_stretching_integral_dd_wo)
legend(parameter_set_mm, parameter_set_dm, parameter_set_dd_wo)
title('single control error realtime')
xlabel('time')
ylabel('control error')
saveas(fig_2 ,fig_path_realtime_integral_stretching)
