mice = {'JK017','JK018','JK020'};
base_dir = 'Z:\Data\2p\soloData\';
for i = 1 : length(mice)
% for i = 2
    d = [base_dir mice{i} '\'];
    cd(d)    
    merge_error_saved_dir
    flist = dir('data_@*x.mat');
    
    b = cell(1,length(flist));
%     if i == 4 % just for AH0652, there was an error
%         for j = 1 : length(flist)
%             if j == 1
%                 session_name = sprintf('S%02d',j-1);
%             else
%                 session_name = sprintf('S%02d',j); 
%             end
%             b{j} = Solo.BehavTrial2padArray(flist(j).name, session_name);
%         end    
%     elseif i == 2 % for AH0650, S12 is lost.
%         for j = 1 : length(flist)
%             if j < 13
%                 session_name = sprintf('S%02d',j-1);
%             else
%                 session_name = sprintf('S%02d',j); 
%             end
%             b{j} = Solo.BehavTrial2padArray(flist(j).name, session_name);
%         end
%         
%     else
        for j = 1 : length(flist)            
%             session_name = sprintf('S%02d',j-1);
            b{j} = Solo.BehavTrial2padArray(flist(j).name);
        end    
%     end
        
    save('behavior.mat','b')
end