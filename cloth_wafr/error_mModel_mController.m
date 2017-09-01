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
file_error_1 = 'mModel_mController/to_test/control_error_realtime.txt';
file_error_2 = 'mModel_mController/to_test/control_error_realtime.txt';
file_error_3 = 'mModel_mController/to_test/control_error_realtime.txt';

% file_t_dm = 'dModel_mController/cos04/control_time.txt';
% file_t_D_wo = 'dModel_dController_woSC/control_time.txt';
% file_t_D_w = 'dModel_dController_wSC/control_time.txt';
file_t_1 = 'mModel_mController/to_test/control_time.txt';
file_t_2 = 'mModel_mController/to_test/control_time.txt';
file_t_3 = 'mModel_mController/to_test/control_time.txt';

fig_path_dm = 'mModel_mController/to_test/controlling_error_DM.pdf';
fig_path_dd_wo = 'mModel_mController/to_test/controlling_error_D_wo.pdf';
fig_path_dd_w = 'mModel_mController/to_test/controlling_error_D_w.pdf';
fig_path_1 = 'mModel_mController/to_test/controlling_error_MM.pdf';
fig_path_2 = 'mModel_mController/to_test/controlling_error_MM.pdf';
fig_path_3 = 'mModel_mController/to_test/controlling_error_MM.pdf';


parameter_set_dm = 'DM cos 0.4';
parameter_set_dd_wo = 'DD wo SC';
parameter_set_dd_w = 'DD w SC';
parameter_set_1 = 'MM cos 0.4';
parameter_set_2 = 'strething cos 0.4';
parameter_set_3 = 'strething cos 0.4';

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
fig_path_mm = 'mModel_mController/to_test/controlling_error_MM.pdf';
fig_path_mm_integral = 'mModel_mController/to_test/integral_error_MM.pdf';
fig_path_min_ind = 'mModel_mController/to_test/min_error_ind_MM.pdf';
fig_path_relative_error = 'mModel_mController/to_test/relative_error_MM.pdf';
fig_path_integral_relative_error = 'mModel_mController/to_test/integral_relative_error_MM.pdf';

%%%%%%%%%%%%%%%%%%%% show all in two plots: %%%%%%%%%%%%%%%%%%
fig_1 = figure;
plot(t_mm, mean_error_mm, t_dm, mean_error_dm, t_dd_wo, mean_error_dd_wo)
legend(parameter_set_mm, parameter_set_dm, parameter_set_dd_wo)
title('MM, MD, DD without SC')
xlabel('time')
ylabel('control error')
saveas(fig_1 ,fig_path_mm)

sum_ind = 1:length(t_mm);
% sum_ind = 100 : 300;
sum_mean_error_mm = sum(mean_error_mm(sum_ind));
sum_mean_error_dm = sum(mean_error_dm(sum_ind));
sum_mean_error_dd_wo = sum(mean_error_dd_wo(sum_ind));

format long
disp('MM')
disp(sum_mean_error_mm);
disp('DM')
disp(sum_mean_error_dm);
disp('DD')
disp(sum_mean_error_dd_wo);


real_time_sum_mm = zeros(length(t_mm),1);
real_time_sum_dm = real_time_sum_mm;
real_time_sum_dd_wo = real_time_sum_mm;

real_time_sum_mm(1) = mean_error_mm(1); 
real_time_sum_dm(1) = mean_error_dm(1); 
real_time_sum_dd_wo(1) = mean_error_dd_wo(1);     

count_min_mm = 0;
count_min_dm = 0;
count_min_dd_wo = 0;

min_value = zeros(length(t_mm),1);
min_ind = min_value;
second_min_ind = min_value;
min_value(1) = min([mean_error_mm(1), mean_error_dm(1), mean_error_dd_wo(1)]);

for i = 2:length(t_mm)
   real_time_sum_mm(i) = real_time_sum_mm(i-1) + mean_error_mm(i); 
   real_time_sum_dm(i) = real_time_sum_dm(i-1) + mean_error_dm(i); 
   real_time_sum_dd_wo(i) = real_time_sum_dd_wo(i-1) + mean_error_dd_wo(i);     
   if mean_error_mm(i) < mean_error_dm(i)
       if mean_error_mm(i) < mean_error_dd_wo(i)
           count_min_mm = count_min_mm + 1;
           min_value(i) = mean_error_mm(i);
           min_ind(i) = 1;
           if mean_error_dm(i) > mean_error_dd_wo(i)
               second_min_ind(i) = 3;
           else 
               second_min_ind(i) = 2;
           end
       elseif mean_error_mm(i) > mean_error_dd_wo(i)
           count_min_dd_wo = count_min_dd_wo + 1;
           min_value(i) = mean_error_dd_wo(i);
           min_ind(i) = 3;
           second_min_ind(i) = 1;
       else
           count_min_mm = count_min_mm + 1;
           count_min_dd_wo = count_min_dd_wo + 1;
           min_value(i) = mean_error_mm(i);
           min_ind(i) = 1;
           second_min_ind(i) = 3;
       end
   elseif mean_error_mm(i) > mean_error_dm(i)
       if mean_error_dm(i) < mean_error_dd_wo(i)
           count_min_dm = count_min_dm + 1;
           min_value(i) = mean_error_dm(i);
           min_ind(i) = 2;
           if mean_error_mm(i) > mean_error_dd_wo(i)
               second_min_ind(i) = 3;
           else 
               second_min_ind(i) = 1;
           end
       elseif mean_error_dm(i) > mean_error_dd_wo(i)
           count_min_dd_wo = count_min_dd_wo + 1;
           min_value(i) = mean_error_dd_wo(i);
           min_ind(i) = 3;
           second_min_ind(i) = 2;
       else
           count_min_dm = count_min_dm + 1;
           count_min_dd_wo = count_min_dd_wo + 1;
           min_value(i) = mean_error_dm(i);
           min_ind(i) = 2;
           second_min_ind(i) = 3;
       end        
   elseif mean_error_mm(i) > mean_error_dd_wo(i)
       count_min_dd_wo = count_min_dd_wo + 1;
       min_value(i) = mean_error_dd_wo(i);
       min_ind(i) = 3;
       second_min_ind(i) = 1;
   else
       count_min_dm = count_min_dm + 1;
       count_min_mm = count_min_mm + 1;
       min_value(i) = mean_error_dm(i);
       min_ind(i) = 1;
       second_min_ind(i) = 2;
   end
end

fig_2 = figure;
plot(t_mm, real_time_sum_mm, t_dm, real_time_sum_dm, ...
    t_dd_wo, real_time_sum_dd_wo)
legend(parameter_set_mm, parameter_set_dm, parameter_set_dd_wo)
title('integral of error')
xlabel('time')
ylabel('control integral error')
saveas(fig_2 ,fig_path_mm)

show_ind = 1:length(t_mm);
%show_ind = 350:750;
fig_3 = figure;
plot(t_mm(show_ind), min_ind(show_ind), '.', ...
    t_mm(show_ind(1)), 0.5, 'w.',t_mm(show_ind(1)), 3.5, 'w.');
legend('min ind')
% plot(t_mm(show_ind), min_ind(show_ind), '.', ...
%     t_mm(show_ind), second_min_ind(show_ind), 'r.',...
%     t_mm(show_ind(1)), 0.5, 'w.',t_mm(show_ind(1)), 3.5, 'w.');
% legend('min ind', 'second min ind')
title('min ind and second min ind')
xlabel('time')
ylabel('indice')
saveas(fig_3 ,fig_path_min_ind)

relative_error_mm = mean_error_mm - min_value;
relative_error_dm = mean_error_dm - min_value;
relative_error_dd_wo = mean_error_dd_wo - min_value;

relative_sum_mm = zeros(length(t_mm),1);
relative_sum_dm = zeros(length(t_mm),1);
relative_sum_dd_wo = zeros(length(t_mm),1);

relative_sum_mm(1) = relative_error_mm(1);
relative_sum_dm(1) = relative_error_dm(1);
relative_sum_dd_wo(1) = relative_error_dd_wo(1);

for i = 2:length(t_mm)
    relative_sum_mm(i) = relative_sum_mm(i-1) + relative_error_mm(i); 
    relative_sum_dm(i) = relative_sum_dm(i-1) + relative_error_dm(i); 
    relative_sum_dd_wo(i) = relative_sum_dd_wo(i-1) + relative_error_dd_wo(i); 
end

show_ind = 150:300;
show_ind = 1:length(t_mm);
fig_4 = figure;
% plot(t_mm(show_ind), relative_error_mm(show_ind),...
%     t_dm(show_ind), relative_error_dm(show_ind), ...
%     t_dd_wo(show_ind), relative_error_dd_wo(show_ind))
% legend(parameter_set_mm, parameter_set_dm, parameter_set_dd_wo)
plot(t_mm(show_ind), relative_error_mm(show_ind),...
    t_dm(show_ind), relative_error_dm(show_ind))
legend(parameter_set_mm, parameter_set_dm)
title('relative error')
xlabel('time')
ylabel('relative error')
saveas(fig_4 ,fig_path_relative_error)

fig_5 = figure;
plot(t_mm(show_ind), relative_sum_mm(show_ind),...
    t_dm(show_ind), relative_sum_dm(show_ind), ...
    t_dd_wo(show_ind), relative_sum_dd_wo(show_ind))
legend(parameter_set_mm, parameter_set_dm, parameter_set_dd_wo)
% plot(t_mm(show_ind), relative_sum_mm(show_ind),...
%     t_dm(show_ind), relative_sum_dm(show_ind))
% legend(parameter_set_mm, parameter_set_dm)
title('integral relative error')
xlabel('time')
ylabel('relative error')
saveas(fig_5, fig_path_integral_relative_error)


