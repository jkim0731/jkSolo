
mice = {'JK025','JK027','JK030'};
base_dir = 'Z:\Data\2p\soloData\';

for i = 1 : length(mice)
    d = [base_dir mice{i} '\'];
    cd(d)    
    merge_error_saved_dir
    flist = dir('data_@*x.mat');
    
    b = cell(1,length(flist));
    for j = 1 : length(flist)            
        b{j} = Solo.BehavTrial2padArray(flist(j).name);
    end    
    save('behavior.mat','b')
end