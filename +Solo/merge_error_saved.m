function merge_error_saved(date)
% Sometimes, because of bControl error, there is 2 different saved files,
% usually having different alphabet at the end of the file name (e.g.,
% 1111111a.mat, 11111111b.mat, ...)
% This function is designed to merge those saved files into one for further
% analysis. The resulting file will have alphabet 'x' at the end (e.g.,
% 1111111x.mat). Practically, there will be 2-3 files max. 

% This also fixes another error sometimes occuring: n_done_trials mismatch
% Therefore, it is recommended to run this function for every saved files
% at least once.
% SidesSection_previous_sides are always having +1 or +2 indices, which
% makes it erroneous for merging, and this function makes the number of
% components same.
%
% Input argument date defines saved date, shown at the file name.
% 

% Assume at most 1 session in a day.

% Currently only for 2port_angdist
% 2016/06/22 JK

if isnumeric(date)
    date = num2str(date);
end
    
full_list = ls;
list = []; % files matching to the date information
for i = 1 : length(full_list)
    if strfind(full_list(i,:),date)
        if strfind(full_list(i,:),'autosave')
        else
            list = [list; full_list(i,:)];
        end
    end
end
% the resulting list will be sorted already.
% assume that the saved fields will be same across different files
% need to merge only saved and saved_history structs
savefn = [list(1,1:end-5), 'x.mat'];
for i = 1 : size(list,1)
    if strfind(list(i,:),savefn);
        sprintf('%s is already post-processed',savefn)
        return
    end
end

load(list(1,:))
if length(saved_history.AnalysisSection_Numtrials) ~= saved.n_done_trials
    saved.n_done_trials = length(saved_history.AnalysisSection_Numtrials);
    saved.hit_history = saved.hit_history(1:saved.n_done_trials,1);
    saved.SidesSection_previous_sides = saved.SidesSection_previous_sides(1:saved.n_done_trials,1);
    saved.SidesSection_previous_dstrs = saved.SidesSection_previous_dstrs(1:saved.n_done_trials,1);
    saved.MotorsSection_previous_pole_distances = saved.MotorsSection_previous_pole_distances(1,1:saved.n_done_trials);
    saved.MotorsSection_previous_pole_ap_positions = saved.MotorsSection_previous_pole_ap_positions(1,1:saved.n_done_trials);
    saved.MotorsSection_previous_pole_angles = saved.MotorsSection_previous_pole_angles(1,1:saved.n_done_trials);
end
saved.SidesSection_previous_sides = saved.SidesSection_previous_sides(1,1:saved.n_done_trials);
% save(list(1,:),'saved', 'saved_history','saved_autoset'); % Don't change
% the original saved file. It's too risky.

savedfields = fieldnames(saved);
result_saved = saved;
result_saved_history = saved_history;

if size(list,1) > 1
    for i = 2 : size(list,1)  
        load(list(i,:))
        if length(saved_history.AnalysisSection_Numtrials) ~= saved.n_done_trials
            saved.n_done_trials = length(saved_history.AnalysisSection_Numtrials);
            saved.hit_history = saved.hit_history(1:saved.n_done_trials,1);
            saved.SidesSection_previous_sides = saved.SidesSection_previous_sides(1:saved.n_done_trials,1);
            saved.SidesSection_previous_dstrs = saved.SidesSection_previous_dstrs(1:saved.n_done_trials,1);
            saved.MotorsSection_previous_pole_distances = saved.MotorsSection_previous_pole_distances(1,1:saved.n_done_trials);
            saved.MotorsSection_previous_pole_ap_positions = saved.MotorsSection_previous_pole_ap_positions(1,1:saved.n_done_trials);
            saved.MotorsSection_previous_pole_angles = saved.MotorsSection_previous_pole_angles(1,1:saved.n_done_trials);
        end
        saved.SidesSection_previous_sides = saved.SidesSection_previous_sides(1,1:saved.n_done_trials);
    %     save(list(i,:),'saved', 'saved_history','saved_autoset');% Don't change
    % the original saved file. It's too risky.

        for idx_fields = 1 : length(savedfields)
            temp = getfield(saved,savedfields(idx_fields));
            if length(temp) == saved.n_done_trials;
                if size(temp,1) == saved.n_done_trials;
                    setfield(result_saved, savedfields(idx_fields), [getfield(result_saved,savedfields(idx_fields)); getfield(saved, savedfields(idx_fields))]);
                elseif size(temp,2) == saved.n_done_trias;
                    setfield(result_saved, savedfields(idx_fields), [getfield(result_saved,savedfields(idx_fields)), getfield(saved, savedfields(idx_fields))]);
                end
            end
            temp = getfield(saved_history,savedfields(idx_fields));
            if length(temp) == saved.n_done_trials;
                if size(temp,1) == saved.n_done_trials;
                    setfield(result_saved_history, savedfields(idx_fields), [getfield(result_saved_history,savedfields(idx_fields)); getfield(saved_history, savedfields(idx_fields))]);
                elseif size(temp,2) == saved.n_done_trias;
                    setfield(result_saved_history, savedfields(idx_fields), [getfield(result_saved_history,savedfields(idx_fields)), getfield(saved_history, savedfields(idx_fields))]);
                end
            end
        end
    end
end
saved = result_saved;
saved_history = result_saved_history;
save(savefn, 'saved', 'saved_history', 'saved_autoset');

end