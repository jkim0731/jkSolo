mice = {'AH0648', 'AH0650', 'AH0651', 'AH0652', 'AH0653'};
base_dir = 'Z:\Data\2p\soloData\';
for i = 1 : length(mice)
    d = [base_dir mice{i} '\'];
    cd(d)    
%     merge_error_dir
    flist = dir('data_@*x.mat');
    
    b = cell(1,length(flist));
    for j = 1 : length(flist)
        session_name = sprintf('S%02d',j-1);
        b{j} = Solo.BehavTrial2padArray(flist(j).name, session_name);
    end    
    save('behavior.mat','b')
end