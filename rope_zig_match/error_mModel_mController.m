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
file_error_1 = 'mModel_mController/cos075_60_3_7/control_error_realtime.txt';
file_error_2 = 'mModel_mController/cos075_60_3_7/control_error_realtime.txt';
file_error_3 = 'mModel_mController/cos075_60_3_7/control_error_realtime.txt';

% file_t_dm = 'dModel_mController/cos04/control_time.txt';
% file_t_D_wo = 'dModel_dController_woSC/control_time.txt';
% file_t_D_w = 'dModel_dController_wSC/control_time.txt';
file_t_1 = 'mModel_mController/cos075_60_3_7/control_time.txt';
file_t_2 = 'mModel_mController/cos075_60_3_7/control_time.txt';
file_t_3 = 'mModel_mController/cos075_60_3_7/control_time.txt';

fig_path_dm = 'mModel_mController/cos075_60_3_7/controlling_error_DM.pdf';
fig_path_dd_wo = 'mModel_mController/cos075_60_3_7/controlling_error_D_wo.pdf';
fig_path_dd_w = 'mModel_mController/cos075_60_3_7/controlling_error_D_w.pdf';
fig_path_1 = 'mModel_mController/cos075_60_3_7/controlling_error_MM.pdf';
fig_path_2 = 'mModel_mController/cos075_60_3_7/controlling_error_MM.pdf';
fig_path_3 = 'mModel_mController/cos075_60_3_7/controlling_error_MM.pdf';

parameter_set_dm = 'DM cos 0.75';
parameter_set_dd_wo = 'DD wo SC';
parameter_set_dd_w = 'DD w SC';
parameter_set_1 = 'MM cos 0.75';
parameter_set_2 = 'strething cos 0.75';
parameter_set_3 = 'strething cos 0.75';

[mean_error_1, mean_error_dm, mean_error_dd_wo]  = readData_fn(file_error_1, space_hold_3);

% mean_error_D_wo = readData_fn(file_error_D_wo, space_hold_1);
% mean_error_D_w = readData_fn(file_error_D_w, space_hold_1);
% mean_error_1 = readData_fn(file_error_1, space_hold_1);
% mean_error_2 = readData_fn(file_error_2, space_hold_1);
% mean_error_3 = readData_fn(file_error_3, space_hold_1);

[t_1] = textread(file_t_1, space_hold_1, 'headerlines',1);
t_dm = t_1;
t_dd_wo = t_1;
% t_D_wo = readTime(file_t_D_wo);
% t_D_w = readTime(file_t_D_w);
t_1 = readTime(file_t_1);
t_2 = readTime(file_t_2);
t_3 = readTime(file_t_3);

ind_dm = 1:length(t_dm);
ind_dd_wo = 1:length(t_dd_wo);
% ind_mm = 1:length(t_mm);
% ind_dd_w = 1:length(t_dd_w);
ind_1 = 1:length(t_1);
ind_2 = 1:length(t_2);
ind_3 = 1:length(t_3);


%%%%%%%%%%%%%%%%%%%%%% select the parameter set showing whole data %%%%
mean_error_mm = mean_error_1;
%show_stretching_count = stretching_count_1;
t_mm = t_1;
ind_mm = ind_1;
parameter_set_mm = parameter_set_1;
fig_path_mm = 'mModel_mController/cos075_60_3_7/controlling_error_MM.pdf';;
fig_path_mm_integral = 'mModel_mController/cos075_60_3_7/integral_error_MM.pdf';

%%%%%%%%%%%%%%%%%%%% show all in two plots: %%%%%%%%%%%%%%%%%%
fig_1 = figure;
plot(t_mm, mean_error_mm, t_dm, mean_error_dm, t_dd_wo, mean_error_dd_wo)
legend(parameter_set_mm, parameter_set_dm, parameter_set_dd_wo)
title('MM, MD, DD without SC')
xlabel('time')
ylabel('control error')
saveas(fig_1 ,fig_path_mm)

sum_mean_error_mm = sum(mean_error_mm);
sum_mean_error_dm = sum(mean_error_dm);
sum_mean_error_dd_wo = sum(mean_error_dd_wo);

real_time_sum_mm = zeros(length(t_mm),1);
real_time_sum_dm = real_time_sum_mm;
real_time_sum_dd_wo = real_time_sum_mm;

real_time_sum_mm(1) = mean_error_mm(1); 
real_time_sum_dm(1) = mean_error_dm(1); 
real_time_sum_dd_wo(1) = mean_error_dd_wo(1);     

count_min_mm = 0;
count_min_dm = 0;
count_min_dd_wo = 0;

for i = 2:length(t_mm)
   real_time_sum_mm(i) = real_time_sum_mm(i-1) + mean_error_mm(i); 
   real_time_sum_dm(i) = real_time_sum_dm(i-1) + mean_error_dm(i); 
   real_time_sum_dd_wo(i) = real_time_sum_dd_wo(i-1) + mean_error_dd_wo(i);     
   if mean_error_mm(i) < mean_error_dm(i)
       if mean_error_mm(i) < mean_error_dd_wo(i)
           count_min_mm = count_min_mm + 1;
       elseif mean_error_mm(i) > mean_error_dd_wo(i)
           count_min_dd_wo = count_min_dd_wo + 1;
       end
   elseif mean_error_mm(i) > mean_error_dm(i)
       if mean_error_dm(i) < mean_error_dd_wo(i)
           count_min_dm = count_min_dm + 1;
       elseif mean_error_dm(i) > mean_error_dd_wo(i)
           count_min_dd_wo = count_min_dd_wo + 1;
       end        
   elseif mean_error_mm(i) > mean_error_dd_wo(i)
       count_min_dd_wo = count_min_dd_wo + 1;
   end
end

fig_2 = figure;
plot(t_mm, real_time_sum_mm, t_dm, real_time_sum_dm, t_dd_wo, real_time_sum_dd_wo)
legend(parameter_set_mm, parameter_set_dm, parameter_set_dd_wo)
title('MM, MD, DD without SC')
xlabel('time')
ylabel('control integral error')
saveas(fig_2 ,fig_path_mm)

format long
disp(sum_mean_error_mm);
disp(sum_mean_error_dm);
disp(sum_mean_error_dd_wo);

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



