function merge_saved_data(fn_list,fn_result) %, varargin) Think about trimming later
% when merging saved data into one data
% e.g., for learning curve
% Takes file name list (fn_list) and results in a mat file (fn_result)
% varargin{1} for trimming trials in each file % to be implemented later

% Currently only for 2port_angdist
% 2016/06/29 JK

if size(fn_list,1) <= 1
    error('Need to have more than 1 files')
end

if ~strcmp(fn_result(end-3:end),'.mat')
    fn_result = [fn_result, '.mat'];
end

% if nargin > 2
%     trim_trials = varargin{1};
% end

load(fn_list(1,:))
savedfields = fieldnames(saved);
for idx_fields = 1 : length(savedfields)
    if strfind(savedfields{idx_fields,1}, 'hit_history')
        fieldname_hit_history = savedfields{idx_fields,1};
        n_done_trials = length(getfield(saved,fieldname_hit_history));
        idx_fields = length(savedfields);
    end
end

saved.SidesSection_previous_sides = saved.SidesSection_previous_sides(2:end);
if length(saved.SidesSection_previous_dstrs) > n_done_trials
    saved.SidesSection_previous_dstrs = saved.SidesSection_previous_dstrs(2:end);
end
    
if length(saved_history.AnalysisSection_NumTrials) ~= n_done_trials
    n_done_trials = length(saved_history.AnalysisSection_NumTrials);
    hit_history = getfield(saved,fieldname_hit_history);
    prompt_str = ['saved.',fieldname_hit_history,' = hit_history(1:n_done_trials);'];
    eval(prompt_str)
    saved.SidesSection_previous_sides = saved.SidesSection_previous_sides(1,1:n_done_trials);
    saved.SidesSection_previous_dstrs = saved.SidesSection_previous_dstrs(1,1:n_done_trials);
    saved_history.RewardsSection_LastTrialEvents = saved_history.RewardsSection_LastTrialEvents(1:n_done_trials);
    if length(saved.SidesSection_previous_dstrs) > n_done_trials
        saved.SidesSection_previous_dstrs = saved.SidesSection_previous_dstrs(1,1:n_done_trials);
    end
    if isfield(saved,'MotorsSection_previous_pole_distances')
        saved.MotorsSection_previous_pole_distances = saved.MotorsSection_previous_pole_distances(1,1:n_done_trials);
    end
    if isfield(saved,'MotorsSection_previous_pole_ap_positions')
        saved.MotorsSection_previous_pole_ap_positions = saved.MotorsSection_previous_pole_ap_positions(1,1:n_done_trials);
    end
    if isfield(saved,'MotorsSection_previous_pole_angles')
        saved.MotorsSection_previous_pole_angles = saved.MotorsSection_previous_pole_angles(1,1:n_done_trials);
    end
else
    saved.SidesSection_previous_sides = saved.SidesSection_previous_sides(1,1:n_done_trials);
    saved.SidesSection_previous_dstrs = saved.SidesSection_previous_dstrs(1,1:n_done_trials);
end

result_saved = saved;
result_saved_history = saved_history;

for i = 2 : size(fn_list,1)  
    load(fn_list(i,:))
    savedfields = fieldnames(saved);
    savedhistoryfields = fieldnames(saved_history);
    n_done_trials = length(getfield(saved,fieldname_hit_history));

    saved.SidesSection_previous_sides = saved.SidesSection_previous_sides(2:end);
    if length(saved.SidesSection_previous_dstrs) > n_done_trials
        saved.SidesSection_previous_dstrs = saved.SidesSection_previous_dstrs(2:end);
    end
    
    if length(saved_history.AnalysisSection_NumTrials) ~= n_done_trials
        n_done_trials = length(saved_history.AnalysisSection_NumTrials);
        hit_history = getfield(saved,fieldname_hit_history);
        prompt_str = ['saved.',fieldname_hit_history,' = hit_history(1:n_done_trials);'];
        eval(prompt_str)
        saved.SidesSection_previous_sides = saved.SidesSection_previous_sides(1,1:n_done_trials);
        saved.SidesSection_previous_dstrs = saved.SidesSection_previous_dstrs(1,1:n_done_trials);
        saved_history.RewardsSection_LastTrialEvents = saved_history.RewardsSection_LastTrialEvents(1:n_done_trials);
        if length(saved.SidesSection_previous_dstrs) > n_done_trials
            saved.SidesSection_previous_dstrs = saved.SidesSection_previous_dstrs(1:n_done_trials);
        end
        if isfield(saved,'MotorsSection_previous_pole_distances')
            saved.MotorsSection_previous_pole_distances = saved.MotorsSection_previous_pole_distances(1,1:n_done_trials);
        end
        if isfield(saved,'MotorsSection_previous_pole_ap_positions')
            saved.MotorsSection_previous_pole_ap_positions = saved.MotorsSection_previous_pole_ap_positions(1,1:n_done_trials);
        end
        if isfield(saved,'MotorsSection_previous_pole_angles')
            saved.MotorsSection_previous_pole_angles = saved.MotorsSection_previous_pole_angles(1,1:n_done_trials);
        end
    else
        saved.SidesSection_previous_sides = saved.SidesSection_previous_sides(1,1:n_done_trials);
        saved.SidesSection_previous_dstrs = saved.SidesSection_previous_dstrs(1,1:n_done_trials);
    end

    for idx_fields = 1 : length(savedfields)
        temp = getfield(saved,savedfields{idx_fields,1});
        if length(temp) == n_done_trials;
            if size(temp,1) == n_done_trials;
                prompt_str = ['result_saved.',savedfields{idx_fields,1},' = [getfield(result_saved,savedfields{idx_fields,1}); getfield(saved, savedfields{idx_fields,1})];'];
                eval(prompt_str);
            elseif size(temp,2) == n_done_trials;
                prompt_str = ['result_saved.',savedfields{idx_fields,1},' = [getfield(result_saved,savedfields{idx_fields,1}), getfield(saved, savedfields{idx_fields,1})];'];
                eval(prompt_str);
            end
        end
    end
    for idx_fields = 1 : length(savedhistoryfields)
        temp = getfield(saved_history,savedhistoryfields{idx_fields,1});
        if length(temp) == n_done_trials;
            if strfind(savedhistoryfields{idx_fields,1},'AnalysisSection_Num')
                oldnum = getfield(result_saved_history,savedhistoryfields{idx_fields,1});
                oldnum1 = []; oldnum2 = []; oldnum3 = [];
                for ii = 1 : size(oldnum,1)
                    oldnum1 = [oldnum1; str2num(oldnum{ii,1}(:,1:4))];
                    oldnum2 = [oldnum2; str2num(oldnum{ii,1}(:,7:10))];
                    oldnum3 = [oldnum3; str2num(oldnum{ii,1}(:,13:16))];
                end
                tempnum = getfield(saved_history,savedhistoryfields{idx_fields,1});
                tempnum1 = []; tempnum2 = []; tempnum3 = [];
                for ii = 1 : size(tempnum,1)
                    tempnum1 = [tempnum1; str2num(tempnum{ii,1}(:,1:4))];
                    tempnum2 = [tempnum2; str2num(tempnum{ii,1}(:,7:10))];
                    tempnum3 = [tempnum3; str2num(tempnum{ii,1}(:,13:16))];
                end
                tempnum1 = tempnum1 + max(oldnum1);
                tempnum2 = tempnum2 + max(oldnum2);
                tempnum3 = tempnum3 + max(oldnum3);
                tempnum1 = [oldnum1;tempnum1];
                tempnum2 = [oldnum2;tempnum2];
                tempnum3 = [oldnum3;tempnum3];
                tempresult = cell(size(tempnum1,1),1);
                for ii = 1 : size(tempnum1,1)
                    tempresult1 = num2str(tempnum1(ii));
                    if length(tempresult1) == 1; tempresult1 = ['000', tempresult1];
                    elseif length(tempresult1) == 2; tempresult1 = ['00', tempresult1];
                    elseif length(tempresult1) == 3; tempresult1 = ['0', tempresult1];
                    end
                    tempresult2 = num2str(tempnum2(ii));
                    if length(tempresult2) == 1; tempresult2 = ['000', tempresult2];
                    elseif length(tempresult2) == 2; tempresult2 = ['00', tempresult2];
                    elseif length(tempresult2) == 3; tempresult2 = ['0', tempresult2];
                    end
                    tempresult3 = num2str(tempnum3(ii));
                    if length(tempresult3) == 1; tempresult3 = ['000', tempresult3];
                    elseif length(tempresult3) == 2; tempresult3 = ['00', tempresult3];
                    elseif length(tempresult3) == 3; tempresult3 = ['0', tempresult3];
                    end
                    tempresult{ii,1} = [tempresult1 ,'  ', tempresult2, '  ',tempresult3];
                end
                prompt_str = ['result_saved_history.',savedhistoryfields{idx_fields,1}, ' = tempresult;'];
                eval(prompt_str);
            else
                prompt_str = ['result_saved_history.',savedhistoryfields{idx_fields,1},' = [getfield(result_saved_history,savedfields{idx_fields,1}); getfield(saved_history, savedfields{idx_fields,1})];'];
                eval(prompt_str);
            end
        end
    end
end

saved = result_saved;
saved_history = result_saved_history;
save(fn_result, 'saved', 'saved_history', 'saved_autoset');

end