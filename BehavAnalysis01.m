%% 2017/04/12 Plotting total hit/wrong/miss, correct rate (100), learning EM, and session division
behavior_base_dir = 'Y:\Whiskernas\JK_temp\SoloData\';
mice = {'JK025','JK027','JK030', 'JK036', 'JK039'};
% mice = {'JK036','JK039'};
last_training_session = [21,28];
hf = cell(1,length(mice)); 
correct_rate_100 = cell(1,length(mice));
session_lengths = cell(1,length(mice));
session_lengths_nomiss = cell(1,length(mice));
for mouse = 1 : length(mice)
    d = [behavior_base_dir mice{mouse} '\'];
    cd(d)
%     load('behavior.mat') % loading b of the mouse (all the sessions)
    load(['behavior_',mice{mouse},'.mat']) % loading b of the mouse (all the sessions)    
    hfm = []; % hit fa miss
    session_names = cellfun(@(x) x.sessionName, b, 'UniformOutput', false);
    session_names = cellfun(@(x) str2double(x(2:3)),session_names);
    session_names = sort(session_names);
    session_lengths{mouse} = zeros(max(session_names),1);
    session_lengths_nomiss{mouse} = zeros(max(session_names),1);
    
    for ii = 1 : length(session_names)
        if session_names(ii) > 0 
            for i = 1 : length(b)
                if str2double(b{i}.sessionName(2:3)) == session_names(ii)
                    hfm = [hfm; b{i}.hitTrialInds' + b{i}.faTrialInds' * 2 + b{i}.missTrialInds' * 3];
                    session_lengths{mouse}(i) = length(b{i}.hitTrialInds);
                    session_lengths_nomiss{mouse}(i) = length(b{i}.hitTrialNums) + length(b{i}.faTrialNums);
                end
            end
        end
    end
    hf{mouse} = hfm; % hit & fa
    for i = length(hfm):-1:1
        if hfm(i) == 3
            hf{mouse}(i) = [];
        end
    end
    hf{mouse} = abs(hf{mouse}-2); % 1 for hit, 0 for miss    
%     hfm = repmat(hfm,1,500);
%     hfmws = zeros(length(hfm),700); % hit fa miss with sessions
%     hfmws(:,201:end) = hfm+2;
%     sessions = [];
% 
%     for i = 1 : length(session_lengths{mouse})
%         if mod(i,2) == 1
%             sessions = [sessions; ones(session_lengths{mouse}(i),1)];
%         else
%             sessions = [sessions; ones(session_lengths{mouse}(i),1)*2];
%         end
%     end
%     hfmws(:,1:200) = repmat(sessions,1,200);
% 
%     hfm_image = ind2rgb(hfmws,[0 0 0; 1 1 1; 0 1 0.5; 1 0 0.7; 0.8, 0.8, 0.8]);
%     figure, imshow(hfm_image)
    correct_rate_100{mouse} = zeros(length(hf{mouse}),1);
    for i = 100 : length(hf{mouse})
        correct_rate_100{mouse}(i) = sum(hf{mouse}(i-99:i));
    end
%     LearningEM(hf{mouse},ones(length(hf{mouse}),1),ones(length(hf{mouse}),1)/2);    
%     LearningEM(hf{mouse}(1:sum(session_lengths_nomiss{mouse}(1:last_training_session(mouse)))),1,0.5);
%     LearningEM(hf{mouse},1,0.5);
    
end
%%
figure, hold all
for i = 1 : length(mice)
%     plot(1:length(hf{i}),correct_rate_100{i},'Color', [1 1 1] * (i/length(mice))* 0.5);
    plot(1:length(hf{i}),correct_rate_100{i},'Color', circshift([0.8 0.3 0.1], [0, i]), 'LineWidth', 2);
end
xlim([101 max(cellfun(@(x) length(x),correct_rate_100))]), legend(mice{1}, mice{2})
ax = gca; ax.LineWidth = 3; ax.FontWeight = 'bold'; ax.FontSize = 15; box off
    xlabel('Trials'), ylabel('Correct rate (100 trials window)')
%%
close all
sessions = [18, 7, 20, 16, 20];
for trial_num = 1:length(mice)
    figure('Units', 'normalized', 'Position', [trial_num/10 trial_num/10 0.5 0.1]), plot(1:length(hf{trial_num}),smooth(correct_rate_100{trial_num}),'k-','LineWidth',2), hold on
    plot(1:length(hf{trial_num}),ones(1,length(hf{trial_num}))*50,':','Color',[0.5 0.5 0.5])
    for i = 2 : length(session_lengths_nomiss{trial_num})
        plot(ones(1,100)*sum(session_lengths_nomiss{trial_num}(1:i-1)),1:100,'b:','LineWidth',2)
    end
    ylim([30 100]), xlim([100 sum(session_lengths_nomiss{trial_num}(1:sessions(trial_num)))]), xlabel('Trial #'), ylabel('Correct (%)')
end
%%
save('20170413.mat', 'session_lengths', 'session_lengths_nomiss','-append')
%%
% flist = ls('*x.mat'); % these are sorted in ASCII dictionary order, so the sessions denoted by dates will be sorted.
% for now, just pick up the last saved ones
max_trial_per_session = 1024; % maximum available trial per session. Might change.
flist_temp = ls('data*.mat'); 
base_name = flist_temp(1,1:end-11);
session_names = [];
for i = 1 : size(flist_temp,1)
    session_names = [session_names; str2num(flist_temp(i,end-10:end-5))];
end
save_error = unique(session_names);
save_error_occurrence = zeros(size(save_error));
for i = 1 : length(save_error)
    save_error_occurrence(i) = sum(ismember(session_names, save_error(i)));
end
flist = [];
for i = 1 : length(save_error)
    switch save_error_occurrence(i)
        case 1
            flist = [flist; strcat(base_name, num2str(save_error(i)),'a.mat')];
        case 2
            flist = [flist; strcat(base_name, num2str(save_error(i)),'b.mat')];
        case 3
            flist = [flist; strcat(base_name, num2str(save_error(i)),'c.mat')];
        case 4
            flist = [flist; strcat(base_name, num2str(save_error(i)),'d.mat')];
        case 5
            flist = [flist; strcat(base_name, num2str(save_error(i)),'e.mat')];
    end
end
%%
% Want to draw full session-length change of (1)percent correct, (2)d', (3)
% max d'(60).
% Plus, want to have total length trials concatenated with informations
% about session numbers, to draw the learning curve along with # sessions
% Need to have pre-reward lick rate and reward-time lick rate to compare 
% licking behavior between mice

total_pc = zeros(size(flist,1),1);
total_dp = zeros(size(flist,1),1);
total_maxdp = zeros(size(flist,1),1);
% total_prelick = zeros(size(flist,1),1);
% total_rewardlick = zeros(size(flist,1),1);
whole_trial = zeros(size(flist,1),maxtrialpersession);
for i = 1 : size(flist,1)
    fn = flist(i,:);
    
    b = Solo.BehavTrial2padArray(fn);
    [pc, ~, dp] = performance(b);
    maxdp = maxdprime(b,60);
    
%     
%     dt = drinkingTime(b,b.hitTrialNums);
%     rewardlick = get_all_lick_times(b, b.hitTrialNums, [], dt);
%     spt = samplingPeriodTime(b);
%     prelick = get_all_lick_times(b, [], [], spt);
%     
%     
%     spt_mat = cell2mat(spt');
%     mean_prelick_time = mean(spt_mat(:,2) - spt_mat(:,1));
%     mean_prelick = length(prelick)/mean_prelick_time/length(b.trialNums); % licks/s % need to modify!! Not sure if it is correct yet. 2016/06/23 JK
%     dt_mat = cell2mat(dt');
%     mean_rewardlick_time = mean(dt_mat(:,2) - dt_mat(:,1));
%     mean_rewardlick = length(rewardlick)/mean_rewardlick_time/length(b.hitTrialNums);
    
    total_pc(i) = pc;
    total_dp(i) = dp;
    total_maxdp(i) = maxdp;
%     total_prelick(i) = mean_prelick;
%     total_rewardlick(i) = mean_rewardlick;

%     whole_trial(i,1:length(b.trilaNums)) = 

end

save result_1.mat total_dp total_maxdp total_pc