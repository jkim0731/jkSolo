
mice = {'JK025','JK027','JK030','JK036','JK037','JK038','JK039','JK041'};
% mice = {'JK036','JK037','JK038','JK039','JK041'};
% mice = {'JK036','JK039'};
base_dir = 'Y:\Whiskernas\JK_temp\SoloData\';


for i = 1 : length(mice)
    d = [base_dir mice{i} '\'];
    cd(d)    
%     merge_error_saved_bysessionnumber_mice(base_dir,mice)
    flist = dir('data_JK*.mat');
    
    b = cell(1,length(flist));
    for j = 1 : length(flist)            
        b{j} = Solo.BehavTrial2padArray(flist(j).name);
    end    
    save(['behavior_', mice{i}, '.mat'],'b')
end