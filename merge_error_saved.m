function merge_error_saved(date)
% Sometimes, because of bControl error, there are more than 2 different 
% saved files, usually having different alphabet at the end of the file 
% name (e.g., 1111111a.mat, 11111111b.mat, ...)
% This function is designed to merge those saved files into one for further
% analysis. The resulting file will have alphabet 'x' at the end (e.g.,
% 1111111x.mat). Practically, there will be 2-3 files max. 

% This also fixes another error occuring sometimes: n_done_trials mismatch
% Therefore, it is recommended to run this function for every saved files
% at least once.
% SidesSection_previous_sides are always having +1 or +2 indices, which
% makes it erroneous for merging, and this function makes the number of
% components same.
%
% Input argument date defines saved date, shown at the file name.
% 
% Make every data into #trials X 1 matrix. As a convention. _previous_
% parameters should be transposed. Make every data in this convention in
% the future.
%
% Numbers in AnalysisSection will be preserved. Actual values should be
% re-calculated based on *_hit_history if you want to use them.

%% IMPORTANT! FOR angdist protocol. 2017/03/16 JK
% MotorsSection_previous_* will be different before AH0653 (~2017/03/30) and
% after that. Should have considered for trial #1 before. 
% current remedy: when saving *_x.mat, add one at the beginning, with just
% the first value. 

%% Treatment of fields having 'previous' in it
% For some reason (that I don't know), *_hit_history, SidesSection_previous_* (and
% MotorsSection_previous_* in case of angdist protocol) are saved in
% "saved", not in "saved_history". It is more convenient when these fields
% are saved in "saved_history", so I'll copy them. The resulting file will
% have the full-length stitched *_previous_* only in "saved_history", and
% "saved" will be same as the LAST "saved" one. These data will be in
% double format instead of cell. If you want everything in cell format for
% consistency, use num2cell at the end.

% SO BE CAREFUL WHEN BUILDING THE BEHAVIOR ARRAY

%%
% Assume at most 1 session in a day.

% Currently only for 2port_angdist
% 2016/06/22 JK

% Changed to work for every protocol
% 2017/03/14 JK

if isnumeric(date)
    date = num2str(date);
end
    
full_list = ls;
list = []; % files matching to the date information
for i = 1 : length(full_list)
    if strfind(full_list(i,:),date)
        if isempty(strfind(full_list(i,:),'autosave'))
            list = [list; full_list(i,:)];
        end
    end
end
% the resulting list will be sorted already.
% the saved fields can differ between files: merge with both fields in
% every session. 2017/03/14 JK
% need to merge only saved and saved_history structs
savefn = [list(1,1:end-5), 'x.mat'];
for i = 1 : size(list,1)
    if strfind(list(i,:),savefn);
        sprintf('%s is already post-processed',savefn)
        return
    end
end
num_file = size(list,1);
savedfields = cell(1,num_file);
n_done_trials = zeros(1,num_file);

% getting fieldnames for *_hit_history and *_n_done_trials
load(list(1,:))
savedfields{1} = fieldnames(saved); % this is going to be a cell in a cell
for idx_fields = 1 : length(savedfields{1})
    if strfind(savedfields{1}{idx_fields,1}, 'hit_history')
        fieldname_hit_history = savedfields{1}{idx_fields,1};
        n_done_trials(1) = length(getfield(saved,fieldname_hit_history));
        break
    end
end
for idx_fields = 1 : length(savedfields{1})
    if strfind(savedfields{1}{idx_fields,1}, 'n_done_trials')
        fieldname_n_done_trials = savedfields{1}{idx_fields,1};
        break
    end
end

% compare every hit_history with it's one previous hit_history to see if
% they are saved after previous one is closed (flushed), or if there is
% redundancy in the saved files

all_hit_history = cell(1,num_file);
for i = 1 : num_file
    load(list(i,:))
    all_hit_history{1,i} = getfield(saved,fieldname_hit_history);
end
keep_line = [];
for i = 1 : num_file - 1
    if (length(all_hit_history{i+1}) >= length(all_hit_history{i})) && ...
            isequal(all_hit_history{i+1}(1:length(all_hit_history{i})), all_hit_history{i})
    else
        keep_line = [keep_line; i];
    end
end
keep_line = [keep_line;num_file];
list = list(keep_line,:);

% assign all saved fields and n_done_trials from every saved files
savedfields = cell(1,size(list,1)); % just the names of fields. This is same for saved and saved_history
n_done_trials = zeros(1,size(list,1));
result_saved_history = struct;
for i = 1 : size(keep_line,1)
    load(list(i,:))
    savedfields{i} = fieldnames(saved);
    n_done_trials(i) = min(getfield(saved,fieldname_n_done_trials), size(getfield(saved, fieldname_hit_history),1));
    for j = 1 : numel(savedfields{i})
        if ~isempty(saved_history.(savedfields{i}{j}))
            if size(saved_history.(savedfields{i}{j}),1) < n_done_trials(i)
                n_done_trials(i) = size(saved_history.(savedfields{i}{j}),1);
            end
        end
    % remedy for having different fields between saved files. the blank
    % will be 0 with the appropriate number of elements
    % (sum(n_done_trials(1:size(keep_line,1))) - (size(keep_line,1)-1))

        if ~isfield(result_saved_history,savedfields{i}{j})
            if ~isempty(saved_history.(savedfields{i}{j})) || ~isempty(saved.(savedfields{i}{j}))
                result_saved_history.(savedfields{i}{j}) = {};
            end
        end
    end
end

result_savedfields = fieldnames(result_saved_history);


%% merging
% The first trial is a kind of dummy.
% But we need to keep them to match the trial numbers.
% Depending on the reason and timing of RPbox error, number of recorded
% history might differ between fields in saved_history. The importance
% of fields vary, so here we'll take the most conservative method -
% among those fields having more than 0 length, take the lowest length 
% and just save that length. 
% To compare trial numbers with others, this will save where the stitching
% occurred. So far, whisker video and tpm are recording from trial #2, so
% at stitching, the first trial of following sessions (saved files) will be
% deleted. This is to make the resulting file look like from one session,
% just as same as other sessions.
% 2017/03/16 JK

for i = 1 : size(list,1)  
    load(list(i,:))
    
    if i == 1
        for j = 1 : numel(result_savedfields)
            if ~isempty(strfind(result_savedfields{j},'_hit_history')) || ~isempty(strfind(result_savedfields{j},'_previous_')) % move every history data into saved_history
                saved_history.(result_savedfields{j}) = saved.(result_savedfields{j});
            end
            % WILL BE REMOVED AFTER ~ 03/30/17 JK
            % temporary remedy for not having MotorsSection_previous_* for trial #1
            if str2num(date) < 170401
                if strfind(result_savedfields{j},'MotorsSection_previous')
                    saved_history.(result_savedfields{j}) = [saved_history.(result_savedfields{j})(1), saved_history.(result_savedfields{j})];
                end
            end

            if isfield(saved_history,result_savedfields{j})
                if ~isempty(saved_history.(result_savedfields{j}))
                    if length(saved_history.(result_savedfields{j})) < n_done_trials(1)
                        sprintf('An error at calculating n_done_trials of trial #1');
                        return;
                    else
                        if size(saved_history.(result_savedfields{j}),1) == 1 % transpose when 1 X #trials
                            result_saved_history.(result_savedfields{j}) = saved_history.(result_savedfields{j})(1:n_done_trials(1))';
                        else
                            result_saved_history.(result_savedfields{j}) = saved_history.(result_savedfields{j})(1:n_done_trials(1));
                        end
                    end
                end
            else
                result_saved_history.(result_savedfields{j}) = num2cell(zeros(n_done_trials(i),1));
            end
        end
    else
        for j = 1 : numel(result_savedfields)
            if ~isempty(strfind(result_savedfields{j},'_hit_history')) || ~isempty(strfind(result_savedfields{j},'_previous_')) % move every history data into saved_history
                saved_history.(result_savedfields{j}) = saved.(result_savedfields{j});
            end
            % WILL BE REMOVED AFTER ~ 03/30/17 JK
            % temporary remedy for not having MotorsSection_previous_* for trial #1
            if str2num(date) < 170401
                if strfind(result_savedfields{j},'MotorsSection_previous')
                    saved_history.(result_savedfields{j}) = [saved_history.(result_savedfields{j})(1), saved_history.(result_savedfields{j})];
                end
            end

            if isfield(saved_history,result_savedfields{j})
                if ~isempty(saved_history.(result_savedfields{j})) 
                    if length(saved_history.(result_savedfields{j})) < n_done_trials(i)
                        sprintf('An error at calculating n_done_trials of trial #%d', i);
                        return
                    else
                        if size(saved_history.(result_savedfields{j}),1) == 1
                            result_saved_history.(result_savedfields{j}) = [result_saved_history.(result_savedfields{j}); saved_history.(result_savedfields{j})(2:n_done_trials(i))']; % following stitches are from the 2nd trial
                        else
                            result_saved_history.(result_savedfields{j}) = [result_saved_history.(result_savedfields{j}); saved_history.(result_savedfields{j})(2:n_done_trials(i))]; % following stitches are from the 2nd trial
                        end
                    end
                end
            else
                result_saved_history.(result_savedfields{j}) = [result_saved_history.(result_savedfields{j}); zeros(n_done_trials(i)-1,1)];
            end
        end
    end
end

saved_history = result_saved_history;
save(savefn, 'saved', 'saved_history', 'saved_autoset'); % 'saved' will be that from the last session.

end