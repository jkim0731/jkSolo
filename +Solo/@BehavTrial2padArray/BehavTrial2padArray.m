%
%
%
%
% JK 2016/06/22.
% for 2port-angle & distance discrimination
%
%

classdef BehavTrial2padArray < handle

    properties
        mouseName = '';
        sessionName = '';
        sessionType = '';
        trim = []; % The number of trials to trim from beginning and end.  e.g. trim = [2 20];
        performanceRegion = []; % Beginning and ending behavioral trial numbers for block of trials in which mouse is performing.
        trials = {};
    end

    properties (Dependent = true)
        trialNums
        hitTrialNums
        hitTrialInds
%         hitRightTrialNums
%         hitRightTrialInds
%         hitLeftTrialNums
%         hitLeftTrialInds
        
        missTrialNums
        missTrialInds
%         missRightTrialNums
%         missRightTrialInds
%         missLeftTrialNums
%         missLeftTrialInds

        faTrialNums
        faTrialInds
%         faRightTrialNums
%         faRightTrialInds
%         faLeftTrialNums
%         faLeftTrialInds
        
        trialTypes
        trialCorrects
        trimmedTrialNums 
        fractionCorrect
    end
%     
    methods (Access = public)
        function obj = BehavTrial2padArray(x, session_name)
            %
            % function obj = BehavTrialArray(x, session_name)
            %
            % Input argument 'x' is either Solo file name string or
            % a structure from loaded Solo file.
            %
            %   For now stores ONLY DISCRIM TRIALS. IF THIS CHANGES, NEED
            %   TO MAKE DEPENDENT TRIALTYPES ACCOUNT FOR IT.  ALSO OTHER
            %   DEPENDENTS.
            %
            if nargin > 0
                if ischar(x)
                    x = load(x);
                end


                obj.mouseName = x.saved.SavingSection_MouseName;
                obj.sessionName = session_name;

                n_trials = length(x.saved_history.AnalysisSection_NumTrials);
                n=1;
                savedfields = fieldnames(x.saved_history); % to use new merge_error_saved code, which made every fields to be used from saved_history 17/04/06 JK 
                for idx_fields = 1 : length(savedfields)
                    if strfind(savedfields{idx_fields,1}, 'hit_history')
                        saved_hit_history = getfield(x.saved_history,savedfields{idx_fields,1}); % 17/04/06 JK 
                        idx_fields = length(savedfields);
                    end
                end
                for k=1:n_trials

                    % Required arguments to BehavTrial2AFC_angdist():
                    mouse_name = x.saved_history.SavingSection_MouseName{k};
                    trial_num = str2num(x.saved_history.AnalysisSection_NumTrials{k}(end-3:end));
                    trial_type = char([x.saved_history.SidesSection_previous_sides(k),x.saved_history.SidesSection_previous_dstrs(k)]); % 114 charcode for 'r', 108 for 'l'. 1 = S1 (right), 0 = S0 (left).
                    trial_correct = saved_hit_history(k); % 1 for correct, 0 for fa, -1 for miss.
                    trial_events = x.saved_history.RewardsSection_LastTrialEvents{k};
                    
                    if k==n_trials
                        next_trial_events = [];
                    else
                        next_trial_events = x.saved_history.RewardsSection_LastTrialEvents{k+1};
                    end
                    
                    % Optional arguments to BehavTrial():
                    use_flag = 0; % Should implement setting this via 'trim' property.
                    session_type = x.saved_history.SessionTypeSection_SessionType{k};
                    extra_ITI_on_error = x.saved_history.TimesSection_ExtraITIOnError{k};
                    sampling_period_time = x.saved_history.TimesSection_SamplingPeriodTime{k}; %AnswerPeriodTime is 2 sec minus SamplingPeriodTime.
                    rwater_valve_time = x.saved_history.ValvesSection_RWaterValveTime{k};
                    lwater_valve_time = x.saved_history.ValvesSection_LWaterValveTime{k};
                    if isfield(x.saved_history, 'MotorsSection_previous_pole_distances')
                        motor_distance = x.saved_history.MotorsSection_previous_pole_distances(k); % In stepper motor steps.
                    else
                        motor_distance = [];
                    end
                    if isfield(x.saved_history, 'MotorsSection_previous_pole_ap_positions')
                        ap_motor_position = x.saved_history.MotorsSection_previous_pole_ap_positions(k); % In stepper motor steps.
                    else
                        ap_motor_position = [];
                    end
                    if isfield(x.saved_history, 'MotorsSection_previous_pole_angles')
                        try
                            servo_angle = x.saved_history.MotorsSection_previous_pole_angles(k); % In stepper motor steps.
                        catch
                            servo_angle = [];
                        end
                    else
                        servo_angle = [];
                    end                    

                    if ismember(session_type, {'2port-Discrim'})  % For now limit only to Discrim trials
                         behav_trial = Solo.BehavTrial2pad(mouse_name, session_name, trial_num, trial_type,...
                            trial_correct, trial_events, next_trial_events, use_flag, session_type, extra_ITI_on_error,...
                            sampling_period_time, rwater_valve_time, lwater_valve_time,...
                            motor_distance, ap_motor_position, servo_angle);
                        
                        % In very rare cases, there are trials (a) scored as hits for which there is no
                        % answer lick and reward; or (b) with nothing but state 35 and state 40 entries. 
                        %  These are presumably due to stopping and starting Solo at odd times.
                        % Here we exclude these trials:
                        if behav_trial.trialCorrect==1 && isempty(behav_trial.answerLickTime)
                            disp(['Found trial (trial_num=' num2str(trial_num) ' scored as correct with no answerlick times---excluding.'])
                        elseif isempty(behav_trial.poleDownOnsetTime)
                            disp(['Found empty poleDownOnsetTime for trial_num=' num2str(trial_num) '---excluding.'])
                        else
                            obj.trials{n} = behav_trial;
                            n=n+1;
                        end
                    end
                end
            end
        end

        function r = length(obj)
            r = length(obj.trials);
        end
  
%         function r = subset(trial_nums)
%             r = Solo.BehavTrialArray;
%             find
%             ind = find(obj.trialNums)
%             r.trials = obj.trials
%             
%         end
        function plot_scored_trials(obj, varargin)
            %
            % USAGE:
            % 1. plot_scored_trials(obj)
            % 2. plot_scored_trials(obj, marker_size)
            % 3. plot_scored_trials(obj, marker_size, font_size)
            % default marker_size = 10, default font_size = 15
            %
            if nargin==1 % just obj
                ms = 10; fs = 15;
            elseif nargin==2
                ms = varargin{1};
                fs = 15;
            elseif nargin==3
                ms = varargin{1};
                fs = varargin{2};
            else
                error('Too many input arguments')
            end
            
            hit_rej = intersect(obj.hitTrialNums,obj.trimmedTrialNums);
            miss_rej = intersect(obj.missTrialNums,obj.trimmedTrialNums);
            fa_rej = intersect(obj.faTrialNums,obj.trimmedTrialNums);
                
            hit = setdiff(obj.hitTrialNums,obj.trimmedTrialNums);
            miss = setdiff(obj.missTrialNums,obj.trimmedTrialNums);
            fa = setdiff(obj.faTrialNums,obj.trimmedTrialNums);
                
            if ~isempty(hit)
                plot(hit,zeros(size(hit))-.1, 'go', 'MarkerSize',ms); hold on 
            end
            if ~isempty(miss)
                plot(miss,zeros(size(miss))+.1, 'ro', 'MarkerSize',ms); hold on  
            end
            if ~isempty(fa)
                plot(fa,ones(size(fa))+.1, 'ro', 'MarkerSize',ms); hold on 
            end
            
            if ~isempty(hit_rej)
                plot(hit_rej,zeros(size(hit_rej))-.1, 'ko', 'MarkerSize',ms); hold on 
            end
            if ~isempty(miss_rej)
                plot(miss_rej,zeros(size(miss_rej))+.1, 'ko', 'MarkerSize',ms); hold on  
            end
            if ~isempty(fa_rej)
                plot(fa_rej,ones(size(fa_rej))+.1, 'ko', 'MarkerSize',ms); hold on  
            end
        
            xlabel('Trial','FontSize',fs);
            set(gca,'YTick',0:1,'YTickLabel',{'Right(r)','Left(l)'},'FontSize',fs,...
                'TickDir','out','Box','off');
            set(gcf,'Color','white')
            
            % Plot title but replace underscores with dashes since former 
            % gives subscripts in title():
            s = obj.sessionName;
            s(strfind(s,'_')) = '-';
            title(s)
        end
        
        
        function plot_scored_trials_stim(obj,stimTrials, varargin) 
            % for optogenetic stimulation
            % USAGE:
            % 1. plot_scored_trials(obj)
            % 2. plot_scored_trials(obj, marker_size)
            % 3. plot_scored_trials(obj, marker_size, font_size)
            % 4. plot_scored_trials(obj, marker_size, font_size, trial_nums)
            %
            if nargin==1 % just obj
                stimTrials = obj.trialNums;
                
            elseif nargin==2
                ms = 10; fs = 15;  
                               
            elseif nargin==3
                ms = varargin{1};
                fs = 15;  
                
            elseif nargin==4
                ms = varargin{1};
                fs = varargin{2};
                
            else
                error('Too many input arguments')
            end
            
            hit_rej = intersect(obj.hitTrialNums,obj.trimmedTrialNums);
            miss_rej = intersect(obj.missTrialNums,obj.trimmedTrialNums);
            fa_rej = intersect(obj.faTrialNums,obj.trimmedTrialNums);
            
            hit = setdiff(obj.hitTrialNums,obj.trimmedTrialNums);
            miss = setdiff(obj.missTrialNums,obj.trimmedTrialNums);
            fa = setdiff(obj.faTrialNums,obj.trimmedTrialNums);
            
            hit_stim = intersect(obj.hitTrialNums,stimTrials);
            miss_stim = intersect(obj.missTrialNums,stimTrials);
            fa_stim = intersect(obj.faTrialNums,stimTrials);
            
            if ~isempty(hit)
                plot(hit,zeros(size(hit))-.1, 'go', 'MarkerSize',ms); hold on
            end
            if ~isempty(miss)
                plot(miss,zeros(size(miss))+.1, 'ro', 'MarkerSize',ms); hold on
            end
            if ~isempty(fa)
                plot(fa,ones(size(fa))+.1, 'ro', 'MarkerSize',ms); hold on
            end
            
            if ~isempty(hit_rej)
                plot(hit_rej,zeros(size(hit_rej))-.1, 'ko', 'MarkerSize',ms); hold on
            end
            if ~isempty(miss_rej)
                plot(miss_rej,zeros(size(miss_rej))+.1, 'ko', 'MarkerSize',ms); hold on
            end
            if ~isempty(fa_rej)
                plot(fa_rej,ones(size(fa_rej))+.1, 'ko', 'MarkerSize',ms); hold on
            end
           
            if ~isempty(hit_stim)
                plot(hit_stim,zeros(size(hit_stim))-.1, 'b*', 'MarkerSize',ms); hold on
            end
            if ~isempty(miss_stim)
                plot(miss_stim,zeros(size(miss_stim))+.1, 'b*', 'MarkerSize',ms); hold on
            end
            if ~isempty(fa_stim)
                plot(fa_stim,ones(size(fa_stim))+.1, 'b*', 'MarkerSize',ms); hold on
            end
            
            xlabel('Trial','FontSize',fs);
            set(gca,'YTick',0:1,'YTickLabel',{'Right','Left'},'FontSize',fs,...
                'TickDir','out','Box','off');
            set(gcf,'Color','white')
            
            % Plot title but replace underscores with dashes since former
            % gives subscripts in title():
            s = obj.sessionName;
            s(strfind(s,'_')) = '-';
            title(s)
        end
        
        function [percent_correct, varargout] = performance(obj, varargin)
            %
            % Solo.BehavTrial2AFCArray.performance
            %
            %
            % INPUT USAGES:
            % 1. [percent_correct, varargout] = performance(obj)
            %       Computes on all trials except those specified in 'trim' property.    
            % 2. [percent_correct, varargout] = performance(obj, range_of_trials)
            %       range_of_trials: Specifies range of trials on which to
            %       compute performance measures. Takes form: [first_trial_num last_trial_num].        
            %
            % OUTPUT USAGES:
            % 1. percent_correct = performance(obj)
            % 2. [percent_correct, fa_rate] = performance(obj)
            % 3. [percent_correct, fa_rate, dprime] = performance(obj)
            %
            %
            
            if nargin==1
               hit = setdiff(obj.hitTrialNums, obj.trimmedTrialNums);
%                miss = setdiff(obj.missTrialNums, obj.trimmedTrialNums);
               fa = setdiff(obj.faTrialNums, obj.trimmedTrialNums);
            elseif nargin==2
               trial_range = varargin{1}; 
               t = trial_range(1):trial_range(2);
               hit = intersect(obj.hitTrialNums, t);
%                miss = intersect(obj.missTrialNums, t);
               fa = intersect(obj.faTrialNums, t);
            else
                error('Too many input arguments')
            end
                
            percent_correct = length(hit)/(length(hit) + length(fa));
            fa_rate = 1 - percent_correct;
            
            if nargout==2
                varargout{1} = fa_rate;
            elseif nargout==3
                varargout{1} = fa_rate;
                varargout{2} = Solo.dprime(percent_correct,fa_rate,percent_correct,fa_rate);
            end
        end
        
        function maxdp = maxdprime(obj, range)
            % added by JK 2016/06/22
            %
            % Solo.BehavTrial2pad.maxdprime
            %
            %
            % INPUT USAGES:
            % maxdp = performance(obj, range) 
            % Computes the maximum d' from all trials with moving range
            
            hit = obj.hitTrialNums;
            fa = obj.faTrialNums;
            totalTrialNums = [hit,fa]; % total not-ignored (tried) trials
            totalTrialNums = sort(totalTrialNums);
            maxdp = -4; % the lowest possible (practically) d' value
            for i = range : length(totalTrialNums)
                sub_total = totalTrialNums(1,(i-range) + 1 : i);
                sub_hit = intersect(sub_total,hit);
                sub_fa = intersect(sub_total,fa);
                percent_correct = length(sub_hit)/(length(sub_hit) + length(sub_fa));
                fa_rate = 1 - percent_correct;            
                tempdp = Solo.dprime(percent_correct,fa_rate,percent_correct,fa_rate);
                if tempdp > maxdp
                    maxdp = tempdp;
                end
            end
        end
        
        function r = get_all_lick_times(obj, trial_nums, varargin)
            %
            %     r = get_all_lick_times(obj, trial_nums, varargin)
            %
            %     If trial_nums is empty matrix ([]), all trials are included.
            %
            %     varargin{1} specifies optional vector of alignment times of the same size as trial_nums.
            %       Can be empty array ([]) placeholder in order to use varargin{2}.
            %
            %     varargin{2} specifies optional time window (in seconds; inclusive) to include licks
            %       from.  Licks outside this window are ignored. Can be either an
            %       1 X 2 vector with form [startTimeInSec endTimeInSec] in which
            %       case the window is applied to all trials, or an N x 2 matrix
            %       where N = length(trial_nums) that gives a separate window
            %       for each trial in trial_nums.
            %
            %     r is an N x 3 matrix where N is the number of licks, with form:
            %           [TrialCount BehavioralTrialNumber TimeOfLick].
            %
            trial_nums = trial_nums(ismember(trial_nums, obj.trialNums));
            invalid_trial_nums = setdiff(trial_nums, obj.trialNums);
            if ~isempty(invalid_trial_nums)
                disp(['Warning: requested trials ' num2str(invalid_trial_nums) 'do not exist in this BehavTrialArray.']);
            end
            if isempty(trial_nums)
                trial_nums = obj.trialNums;
            end

            ntrials = length(trial_nums);

            if nargin > 2 && ~isempty(varargin{1})
                alignmentTimes = varargin{1};
                if length(alignmentTimes) ~= ntrials
                    error('Alignment times vector must have same length as trial_nums argument.')
                end
            else
                alignmentTimes = zeros(ntrials,1);
            end

            restrictWindow = [];
            if nargin > 3
                restrictWindow = varargin{2};
                if length(restrictWindow)==2
                    restrictWindow = repmat([restrictWindow(1) restrictWindow(2)], [1 ntrials]);
                elseif length(restrictWindow) ~= ntrials
                    error('varargin{2} must be equal length as trial_nums')
                end
            end

            if isempty(restrictWindow)
                r = [];
                for k=1:ntrials
                    ind = find(obj.trialNums==trial_nums(k));
                    st = obj.trials{ind}.beamBreakTimes;
                    if ~isempty(st)
                        r = [r; repmat(k,size(st)), repmat(obj.trials{ind}.trialNum,size(st)), st - alignmentTimes(k)];
                    end
                end
            else
                r = [];
                for k=1:ntrials
                    ind = find(obj.trialNums==trial_nums(k));
                    st = obj.trials{ind}.beamBreakTimes;
                    st = st(st >= restrictWindow{k}(1) & st <= restrictWindow{k}(2));
                    if ~isempty(st)
                        r = [r; repmat(k,size(st)), repmat(obj.trials{ind}.trialNum,size(st)), st - alignmentTimes(k)];
                    end
                end
            end

        end
        
        function handles = plot_lick_raster(obj, trial_nums, varargin)
            %
            %   Plots all beam breaks as rasterplot. Will be in register
            %   from plot generated by plot_spike_raster, so can be plotted
            %   on the same axes (e.g., after "hold on" command).
            %
            %   Returns vector of handles to line objects that make up the
            %   raster tick marks.
            %
            %     [] = plot_lick_raster(obj, trial_nums, varargin)
            %
            %     If trial_nums is empty matrix ([]), all trials are included.
            %
            %     varargin{1} is one of two strings: 'BehavTrialNum', or 'Sequential', and
            %           specifies what values to plot on the y-axis.
            %
            %     varargin{2} specifies optional vector of alignment times of the same size as trial_nums.
            %           Can be empty matrix ([]) to get access to varargin{3}.
            %
            %     varargin{3}, if the string 'lines' is given, raster is plotted with
            %           vertical lines instead of dots.  Dots are the default.
            %
            %
            if nargin==2 % default is to plot in 'Sequential' mode.
                plotTypeString = 'Sequential';
                allLickTimes = obj.get_all_lick_times(trial_nums);
                plotSymType=0;
            elseif nargin==3
                plotTypeString = varargin{1};
                allLickTimes = obj.get_all_lick_times(trial_nums);
                plotSymType=0;
            elseif nargin==4
                plotTypeString = varargin{1};
                alignmentTimes = varargin{2};
                allLickTimes = obj.get_all_lick_times(trial_nums, alignmentTimes);
                plotSymType=0;
            elseif nargin==5
                plotTypeString = varargin{1};
                alignmentTimes = varargin{2};
                plotSymString = varargin{3};
                allLickTimes = obj.get_all_lick_times(trial_nums, alignmentTimes);
                if strcmp(plotSymString,'lines')
                    plotSymType=1; % plot with lines
                else
                    plotSymType=0; % plot with dots
                end
            else
                error('Too many inputs.')
            end

            % Leave error checking to get_all_spike_times().
            %             cla;
            fs=10;
            switch plotTypeString
                case 'BehavTrialNum'
                    if ~isempty(allLickTimes)
                        if plotSymType==0
                            handles = plot(allLickTimes(:,3), allLickTimes(:,2), 'm.');
                        else
                            x=allLickTimes(:,3);
                            y=allLickTimes(:,2);
                            yy = [y-.5 y+.5]';
                            xx = [x x]';
                            handles = line(xx,yy,'Color','magenta');
                        end
                    else
                        handles = [];
                    end
                    ylabel('Behavior trial number','FontSize',fs)
                    xlabel('Sec','FontSize',fs)

                case 'Sequential'
                    if ~isempty(allLickTimes)
                        if plotSymType==0
                            handles = plot(allLickTimes(:,3), allLickTimes(:,1), 'm.');
                        else
                            x=allLickTimes(:,3);
                            y=allLickTimes(:,1);
                            yy = [y-.5 y+.5]';
                            xx = [x x]';
                            handles = line(xx,yy,'Color','magenta');
                        end
                    else
                        handles = [];
                    end
                    ylabel('Trial number','FontSize',fs)
                    xlabel('Sec','FontSize',fs)

                otherwise
                    error('Invalid string argument.')
            end
        end

        function viewer(obj,varargin)
            %
            % USAGE:    viewer
            %                    
            %   This function must be called with no arguments. Signal selection
            %       and subsequent options are then chosen through the GUI.
            %
            %   Input arguments (in varargin) are reserved for internal, recursive
            %       use of this function.
            %
            %
            %
            if nargin==1 % Called with no arguments
                objname = inputname(1); % Command-line name of this instance of a BehavTrialArray.
                h=figure('Color','white'); ht = uitoolbar(h);
                a = .20:.05:0.95; b(:,:,1) = repmat(a,16,1)'; b(:,:,2) = repmat(a,16,1); b(:,:,3) = repmat(flipdim(a,2),16,1);
                bbutton = uipushtool(ht,'CData',b,'TooltipString','Back');
                fbutton = uipushtool(ht,'CData',b,'TooltipString','Forward','Separator','on');
                set(fbutton,'ClickedCallback',[objname '.viewer(''next'')'])
                set(bbutton,'ClickedCallback',[objname '.viewer(''last'')'])
                uimenu(h,'Label','Jump to trial','Separator','on','Callback',[objname '.viewer(''jumpToTrial'')']);
                        
                g = struct('sweepNum',1,'trialList','');               
                set(h,'UserData',g);

            else
                g = get(gcf,'UserData');
                if isempty(g) 
                    g = struct('sweepNum',1,'trialList','');
                end
                for j = 1:length(varargin);
                    argString = varargin{j};
                    switch argString
                        case 'next'
                            if g.sweepNum < length(obj)
                                g.sweepNum = g.sweepNum + 1;
                            end
                        case 'last'
                            if g.sweepNum > 1
                                g.sweepNum = g.sweepNum - 1;
                            end
                        case 'jumpToTrial'
                            if isempty(g.trialList)
                                nsweeps = obj.length;
                                g.trialList = cell(1,nsweeps);
                                for k=1:nsweeps
                                    g.trialList{k} = [int2str(k) ': trialNum=' int2str(obj.trialNums(k))];
                                end
                            end
                            [selection,ok]=listdlg('PromptString','Select a trial:','ListString',...
                                g.trialList,'SelectionMode','single');
                            if ~isempty(selection) && ok==1
                                g.sweepNum = selection;
                            end
                        otherwise
                            error('Invalid string argument.')
                    end
                end                
            end
            
            cla;
            
            obj.trials{g.sweepNum}.plot_trial_events;
            
            titleHandle = get(gca,'Title');
            titleString = get(titleHandle,'String'); 
            title([int2str(g.sweepNum) '/' int2str(obj.length) ', ' titleString]);
                       
            set(gcf,'UserData',g);
        end
    end    
        
     
    methods % Dependent property methods; cannot have attributes.
        
        function value = get.trialNums(obj)
            if ~isempty(obj.trials)
%                 value = cellfun(@(x) str2num(x.trialNum(end-3:end)), obj.trials);
                value = cellfun(@(x) x.trialNum, obj.trials);
            else
                value = [];
            end
        end
        
        function value = get.trialTypes(obj)
            if ~isempty(obj.trials)
                value = cellfun(@(x) x.trialType, obj.trials);
            else
                value = [];
            end
        end
        
        function value = get.trialCorrects(obj)
            if ~isempty(obj.trials)
                value = cellfun(@(x) x.trialCorrect, obj.trials);
            else
                value = [];
            end
        end
        
        function value = get.fractionCorrect(obj)
            if ~isempty(obj.trials)
                value = mean(obj.trialCorrects);
            else
                value = [];
            end
        end
        
        function value = get.hitTrialNums(obj)
            if ~isempty(obj.trials)
                value = obj.trialNums(cellfun(@(x) x.trialCorrect==1, obj.trials));
            else
                value = [];
            end
        end
        
        function value = get.hitTrialInds(obj)
            if ~isempty(obj.trials)
                value = cellfun(@(x) x.trialCorrect==1, obj.trials);
            else
                value = [];
            end
        end
        
        function value = get.missTrialNums(obj)
            if ~isempty(obj.trials)
                value = obj.trialNums(cellfun(@(x) x.trialCorrect==-1, obj.trials));
            else
                value = [];
            end
        end
      
        function value = get.missTrialInds(obj)
            if ~isempty(obj.trials)
                value = cellfun(@(x) x.trialCorrect==-1, obj.trials);
            else
                value = [];
            end
        end
        
        function value = get.faTrialNums(obj)
            if ~isempty(obj.trials)
                value = obj.trialNums(cellfun(@(x) x.trialCorrect==0, obj.trials));
            else
                value = [];
            end
        end
        
        function value = get.faTrialInds(obj)
            if ~isempty(obj.trials)
                value = cellfun(@(x) x.trialCorrect==0, obj.trials);
            else
                value = [];
            end
        end
        
        function value = get.trimmedTrialNums(obj) % Trim trials from start and end of session if needed
            value = [];
            ntrials = length(obj.trials);
            if ~isempty(obj.trim)
                if obj.trim(1)>0 && obj.trim(2)>0
                    ind = [1:obj.trim(1), ((ntrials-obj.trim(2))+1):ntrials]; 
                    value = obj.trialNums(ind);
                elseif obj.trim(2)>0
                    ind = ((ntrials-obj.trim(2))+1):ntrials;  
                    value = obj.trialNums(ind);
                elseif obj.trim(1)>0
                    ind = 1:obj.trim(1); 
                    value = obj.trialNums(ind);
                end
            end            
        end
        
        function r = poleUpOnsetTimes(obj,varargin)
            %
            % varargin: optional vector of trial numbers.
            %
            r = cellfun(@(x) x.poleUpOnsetTime, obj.trials);
            if nargin>1
                r = r(ismember(obj.trialNums, varargin{1}));
            end
        end

        function r = poleDownOnsetTimes(obj,varargin)
            %
            % varargin: optional vector of trial numbers.
            %
            r = cellfun(@(x) x.poleDownOnsetTime, obj.trials);
            if nargin>1
                r = r(ismember(obj.trialNums, varargin{1}));
            end
        end

        function r = samplingPeriodTime(obj,varargin)
            %
            % varargin: optional vector of trial numbers.
            %
            r = cellfun(@(x) x.samplingPeriodTime, obj.trials,'UniformOutput',false);
            if nargin>1
                r = r(ismember(obj.trialNums, varargin{1}));
            end
        end
        
        function r = answerPeriodTime(obj,varargin)
            %
            % varargin: optional vector of trial numbers.
            %
            r = cellfun(@(x) x.answerPeriodTime, obj.trials,'UniformOutput',false);
            if nargin>1
                r = r(ismember(obj.trialNums, varargin{1}));
            end
        end
        
        function r = rewardTime(obj,varargin)
            %
            % varargin: optional vector of trial numbers.
            %
            r = cellfun(@(x) x.rewardTime, obj.trials,'UniformOutput',false);
            if nargin>1
                r = r(ismember(obj.trialNums, varargin{1}));
            end
        end
        
%         function r = airpuffTimes(obj,varargin)
%             %
%             % varargin: optional vector of trial numbers.
%             %
%             r = cellfun(@(x) x.airpuffTimes, obj.trials,'UniformOutput',false);
%             if nargin>1
%                 r = r(ismember(obj.trialNums, varargin{1}));
%             end
%         end
%         
        function r = drinkingTime(obj,varargin)
            %
            % varargin: optional vector of trial numbers.
            %
            r = cellfun(@(x) x.drinkingTime, obj.trials,'UniformOutput',false);
            if nargin>1
                r = r(ismember(obj.trialNums, varargin{1}));
            end
        end
        
        function r = timeoutPeriodTimes(obj,varargin)
            %
            % varargin: optional vector of trial numbers.
            %
            r = cellfun(@(x) x.timeoutPeriodTimes, obj.trials,'UniformOutput',false);
            if nargin>1
                r = r(ismember(obj.trialNums, varargin{1}));
            end
        end
        
        
    end
    
end




