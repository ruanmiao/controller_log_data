%close all
close all
clear all

space_hold_28 = '%n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n';
space_hold_1 = '%n';

%%%%%%%%%%% Error Analysis %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
file_error_D = 'Along_D/error_realtime.txt';
file_error_1 = 'Along_parameter/along_20_3_20/error_realtime.txt';
file_error_2 = 'Along_parameter/along_20_3_20/error_realtime.txt';
file_error_3 = 'Along_parameter/along_20_3_20/error_realtime.txt';

file_t_D = 'Along_D/time_test.txt';
file_t_1 = 'Along_parameter/along_20_3_20/time_test.txt';
file_t_2 = 'Along_parameter/along_20_3_20/time_test.txt';
file_t_3 = 'Along_parameter/along_20_3_20/time_test.txt';

parameter_set_D = 'D';
parameter_set_1 = '20000,4,7';
parameter_set_2 = '5000,4,7';
parameter_set_3 = '20,3,20';

error_D = readData_fn(file_error_D, space_hold_28);
error_1 = readData_fn(file_error_1, space_hold_28);
error_2 = readData_fn(file_error_2, space_hold_28);
error_3 = readData_fn(file_error_3, space_hold_28);

mean_error_D = mean(error_D,2);
mean_error_1 = mean(error_1,2);
mean_error_2 = mean(error_2,2);
mean_error_3 = mean(error_3,2);

%{
t_D = generateTime_fn(mean_error_D);
t_1 = generateTime_fn(mean_error_1);
t_2 = generateTime_fn(mean_error_2);
t_3 = generateTime_fn(mean_error_3);
%}

t_D = readTime(file_t_D);
t_1 = readTime(file_t_1);
t_2 = readTime(file_t_2);
t_3 = readTime(file_t_3);

ind_D = 1:length(t_D);
ind_1 = 1:length(t_1);
ind_2 = 1:length(t_2);
ind_3 = 1:length(t_3);

%%%%%%%%%%%%%%%%%%%%%% select the parameter set showing whole data %%%%
show_error = error_2;
show_t = t_2;
show_ind = ind_2;
show_legend = parameter_set_2;

%%%%%%%%%%%%%%%%%%%%%% Show all in one plot
%{
figure
plot(show_t,show_error(show_ind,3), show_t,show_error(show_ind,5),...
    show_t,show_error(show_ind,7), show_t,show_error(show_ind,9),...
    show_t,show_error(show_ind,11), show_t,show_error(show_ind,12),...
    show_t,show_error(show_ind,13), show_t,show_error(show_ind,14),...
    show_t,show_error(show_ind,16), show_t,show_error(show_ind,18),...
    show_t,show_error(show_ind,19), show_t,show_error(show_ind,20),...
    show_t,show_error(show_ind,22), show_t,show_error(show_ind,24),...
    show_t,show_error(show_ind,26), show_t,show_error(show_ind,28)) 
legend('3', '5','7', '9', '11', '12' ,'13','14','16','18', '19', '20','22',...
    '24', '26', '28')
title('Predicted p dot error for new model')
xlabel(show_legend)
ylabel('Meter')
%}

%%%%%%%%%%%%%%%%%%%% show all in two plots: %%%%%%%%%%%%%%%%%%
figure
plot(show_t,show_error(show_ind,3), show_t,show_error(show_ind,4),...
    show_t,show_error(show_ind,5), show_t,show_error(show_ind,6),...
    show_t,show_error(show_ind,7), show_t,show_error(show_ind,8))
legend('3','4','5','6','7','8')
title('Predicted p dot error for new model. 1')
xlabel(show_legend)
ylabel('Meter')

figure
plot(show_t,show_error(show_ind,8), show_t,show_error(show_ind,9),...
    show_t,show_error(show_ind,10), show_t,show_error(show_ind,11),...
    show_t,show_error(show_ind,12), show_t,show_error(show_ind,13))
legend('8','9','10','11','12','13')
title('Predicted p dot error for new model. 2')
xlabel(show_legend)
ylabel('Meter')

%{
figure
plot(show_t,show_error(show_ind,13), show_t,show_error(show_ind,14),...
    show_t,show_error(show_ind,15), show_t,show_error(show_ind,16),...
    show_t,show_error(show_ind,17), show_t,show_error(show_ind,18)) 
legend('13','14','15','16','17','18')
title('Predicted p dot error for new model. 3')
xlabel(show_legend)
ylabel('Meter')

figure
plot(show_t,show_error(show_ind,18),...
    show_t,show_error(show_ind,19), show_t,show_error(show_ind,20),...
    show_t,show_error(show_ind,22), show_t,show_error(show_ind,24),...
    show_t,show_error(show_ind,26), show_t,show_error(show_ind,28)) 
legend('18','19', '20','22',...
    '24', '26', '28')
title('Predicted p dot error for new model. 4')
xlabel(show_legend)
ylabel('Meter')
%}
%%%%%%%%%%%%%%%%%%%%%%% End of showing mutiple plots %%%%%%%%%%%%%%%5


%{
figure
plot(show_t,show_error(:,3), show_t,show_error(:,5), show_t,show_error(:,7),...
    show_t,show_error(:,9), show_t,show_error(:,11), show_t,show_error(:,12),...
    show_t,show_error(:,13), show_t,show_error(:,14), show_t,show_error(:,16),...
    show_t,show_error(:,18), show_t,show_error(:,19), show_t,show_error(:,20),...
    show_t,show_error(:,22), show_t,show_error(:,24), show_t,show_error(:,26),...
    show_t,show_error(:,28)) 
legend('3', '5', '9', '11', '12' ,'13','14','16','18', '19', '20','22',...
    '24', '26', '28','mean')
title('Predicted p dot error for new model')
xlabel('t step')
ylabel('Meter')
%}

%start_ind = 40;
%end_ind = 160;
%show_ind=start_ind:end_ind;
%t_show_ind = 1:(end_ind-start_ind+1);
figure
plot(t_D, mean_error_D, ...
    t_2, mean_error_2,'LineWidth',4)
legend('Optimal predicted result among old models',...
    'Optimal predicted result of new model')
%title('mean error with paramters pool')
xlabel('time (s)')
ylabel('error of predicted object motion')

%{
figure
plot(t_D, mean_error_D, t_1, mean_error_1, t_2, mean_error_2, ...
    t_3, mean_error_3)
legend(parameter_set_D, parameter_set_1, parameter_set_2, parameter_set_3)
title('mean error with paramters pool')
xlabel('t step')
ylabel('Meter')
%}

