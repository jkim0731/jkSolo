
mice = {'JK074', 'JK075', 'JK076'};
base_dir = 'Y:\Whiskernas\JK\SoloData\';
% merge_error_saved_bysessionnumber_mice(base_dir,mice)

for i = 1 : length(mice)
    d = [base_dir mice{i} '\'];
    cd(d)    
    flist = dir('data_JK*.mat');
    
    b = cell(1,length(flist));
    for j = 1 : length(flist)            
        b{j} = Solo.BehavTrial2padArray(flist(j).name);
    end
    save(['behavior_', mice{i}, '.mat'],'b')
end