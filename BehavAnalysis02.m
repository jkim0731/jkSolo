flist = ls('*x.mat'); % these are sorted in ASCII dictionary order, so the sessions denoted by dates will be sorted.

% Want to draw full session-length change of (1)percent correct, (2)d', (3)
% max d'(60).
% Plus, want to have total length trials concatenated with informations
% about session numbers, to draw the learning curve along with # sessions
% Need to have pre-reward lick rate and reward-time lick rate to compare 
% licking behavior between mice

% total_pc = zeros(size(flist,1),1);
% total_dp = zeros(size(flist,1),1);
% total_maxdp = zeros(size(flist,1),1);
total_prelick = zeros(size(flist,1),1);
total_rewardlick = zeros(size(flist,1),1);
for i = 1 : size(flist,1)
    fn = flist(i,:);
    session_name = fn(end-10:end-5);
    b = Solo.BehavTrial2padArray(fn, session_name);
%     [pc, ~, dp] = performance(b);
%     maxdp = maxdprime(b,60);
    
    dt = drinkingTime(b,b.hitTrialNums);
    rewardlick = get_all_lick_times(b, b.hitTrialNums, [], dt);
    spt = samplingPeriodTime(b);
    prelick = get_all_lick_times(b, [], [], spt);
    
    
    spt_mat = cell2mat(spt');
    mean_prelick_time = mean(spt_mat(:,2) - spt_mat(:,1));
    mean_prelick = length(prelick)/mean_prelick_time/length(b.trialNums); % licks/s % need to modify!! Not sure if it is correct yet. 2016/06/23 JK
    dt_mat = cell2mat(dt');
    mean_rewardlick_time = mean(dt_mat(:,2) - dt_mat(:,1));
    mean_rewardlick = length(rewardlick)/mean_rewardlick_time/length(b.hitTrialNums);
    
%     total_pc(i) = pc;
%     total_dp(i) = dp;
%     total_maxdp(i) = maxdp;
    total_prelick(i) = mean_prelick;
    total_rewardlick(i) = mean_rewardlick;

end

% save result_1.mat total_dp total_maxdp total_pc