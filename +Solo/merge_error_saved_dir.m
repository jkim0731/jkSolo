function merge_error_saved_dir

% perform solo.merge_error_session in the entire data in the current
% directory. if the one has already '*x.mat', then it skips that one
% because it's already done

% Assume at most 1 session in a day.

% merge_error_session(date) is currently only for 2port_angdist
% 2016/06/22 JK


full_list = ls;
data_list = []; % files that are not autosaved
for i = 1 : length(full_list)
    if strfind(full_list(i,:),'autosave')
    else
        data_list = [data_list; full_list(i,:)];
    end
end

for i = 1 : size(data_list,1)
    date = data_list(i,end-10:end-5);
    solo.merge_error_saved(date);
end