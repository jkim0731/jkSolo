function merge_error_saved_bysessionnumber_mice(base_dir,mice)

% input settings
% base_dir = 'Y:\Whiskernas\JK_temp\SoloData\';
% mice = {'JK036','JK037','JK038','JK039','JK041'};
% mice = {'JK030'};
max_n_pre = 2; % maximum # of pre sessions in these mice
max_n_s = 40; % maximum # of training sessions in these mice

%
snames = {};
for i = 1 : max_n_pre
    snames{end+1} = sprintf('pre%d',i);
end
for i = 1 : max_n_s
    snames{end+1} = sprintf('S%02d',i);
end
    

for i = 1 : length(mice)
     cd([base_dir,mice{i}])
    for j = 1 : length(snames)
        merge_error_saved_bysessionnumber(snames{j});
    end
end
        