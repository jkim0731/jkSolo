% [x, y] = AnalysisSection(obj, action, x, y)
%
% For doing online analysis of behavior.
%
%
% PARAMETERS:
% -----------
%
% obj      Default object argument.
%
% action   One of:
%            'init'      To initialise the section and set up the GUI
%                        for it;
%
%            'reinit'    Delete all of this section's GUIs and data,
%                        and reinit, at the same position on the same
%                        figure as the original section GUI was placed.
%           
%            Several other actions are available (see code of this file).
%
% x, y     Relevant to action = 'init'; they indicate the initial
%          position to place the GUI at, in the current figure window
%
% RETURNS:
% --------
%
% [x, y]   When action == 'init', returns x and y, pixel positions on
%          the current figure, updated after placing of this section's GUI.
%
% x        When action = 'get_next_side', x will be either 'l' for
%          left or 'r' for right.
%

function [x, y] = AnalysisSection(obj, action, x, y)

GetSoloFunctionArgs;

switch action

    case 'init',   % ------------ CASE INIT ----------------
        % Save the figure and the position in the figure where we are
        % going to start adding GUI elements:
        SoloParamHandle(obj, 'my_gui_info', 'value', [x y gcf]); next_row(y,1.5);


        MenuParam(obj, 'analysis_show', {'view', 'hide'}, 'view', x, y, 'label', 'Analysis', 'TooltipString', 'Online behavior analysis');
        set_callback(analysis_show, {mfilename,'hide_show'});
        next_row(y);
        
        MenuParam(obj, 'email_enable', {'yes', 'no'}, 'no', x, y, 'label', 'e-mail?', 'TooltipString', 'Toggle for e-mailing when the mouse is done');
        next_row(y);
        EditParam(obj, 'emailad', 'jkimkj@gmail.com', x, y);
        next_row(y);
        EditParam(obj, 'nummiss', '5', x, y);
        next_row(y);
        PushButtonParam(obj, 'resetemail', x, y, 'label', 'Reset Email');
        set_callback(resetemail, {mfilename, 'resetemail'});
        next_row(y);
        SubheaderParam(obj, 'sectiontitle', 'Analysis', x, y);

        parentfig_x = x; parentfig_y = y;

        % ---  Make new window for online analysis
        SoloParamHandle(obj, 'analysisfig', 'saveable', 0);
        analysisfig.value = figure('Position', [500 500 800 200], 'Menubar', 'none',...
            'Toolbar', 'none','Name','Analysis','NumberTitle','off');

        x = 1; y = 1;

        % Whole trials
        DispParam(obj, 'NumTrials', 0, x, y); next_row(y);
        DispParam(obj, 'NumRewards', 0, x, y); next_row(y);
        DispParam(obj, 'PercentCorrect', 0, x, y); next_row(y);
        DispParam(obj, 'HR', 0, x, y); next_row(y);
        DispParam(obj, 'FAR', 0, x, y); next_row(y);
        DispParam(obj, 'HRMinusFAR', 0, x, y); next_row(y);
        DispParam(obj, 'Dprime', 0, x, y); next_row(y);
        DispParam(obj, 'Dprime60', 0, x, y); next_row(y);

        % For normal trials only (_N)
        next_column(x); y = 1;
        DispParam(obj, 'NumTrials_N', 0, x, y); next_row(y);
        DispParam(obj, 'NumRewards_N', 0, x, y); next_row(y);
        DispParam(obj, 'PercentCorrect_N', 0, x, y); next_row(y);
        DispParam(obj, 'HR_N', 0, x, y); next_row(y);
        DispParam(obj, 'FAR_N', 0, x, y); next_row(y);
        DispParam(obj, 'HRMinusFAR_N', 0, x, y); next_row(y);
        DispParam(obj, 'Dprime_N', 0, x, y); next_row(y);
        DispParam(obj, 'Dprime60_N', 0, x, y); next_row(y);

        % For fooling with protraction touch (_FP)
        next_column(x); y = 1;
        DispParam(obj, 'NumTrials_FP', 0, x, y); next_row(y);
        DispParam(obj, 'NumRewards_FP', 0, x, y); next_row(y);
        DispParam(obj, 'PercentCorrect_FP', 0, x, y); next_row(y);
        DispParam(obj, 'HR_FP', 0, x, y); next_row(y);
        DispParam(obj, 'FAR_FP', 0, x, y); next_row(y);
        DispParam(obj, 'HRMinusFAR_FP', 0, x, y); next_row(y);
        DispParam(obj, 'Dprime_FP', 0, x, y); next_row(y);
        DispParam(obj, 'Dprime60_FP', 0, x, y); next_row(y);

        % For fooling with retraction touch (_FR)
        next_column(x); y = 1;
        DispParam(obj, 'NumTrials_FR', 0, x, y); next_row(y);
        DispParam(obj, 'NumRewards_FR', 0, x, y); next_row(y);
        DispParam(obj, 'PercentCorrect_FR', 0, x, y); next_row(y);
        DispParam(obj, 'HR_FR', 0, x, y); next_row(y);
        DispParam(obj, 'FAR_FR', 0, x, y); next_row(y);
        DispParam(obj, 'HRMinusFAR_FR', 0, x, y); next_row(y);
        DispParam(obj, 'Dprime_FR', 0, x, y); next_row(y);
        DispParam(obj, 'Dprime60_FR', 0, x, y); next_row(y);
                
        AnalysisSection(obj,'hide_show');
                
        x = parentfig_x; y = parentfig_y;
        set(0,'CurrentFigure',value(myfig));
        return;

   
    case 'update' 
        suffix = {'','_N','_FP','_FR'};
        correct = hit_history;
        s1 = (previous_sides(1:(end-1)) == 114)'; % 114 charcode for 'r', 108 for 'l'
        for ii = 4 : -1 : 1 % 1 for whole, 2 for normal, 3 for fooling protraction, 4 for fooling retraction
            switch ii 
                case 1
                    s2 = ones(size(correct,1), size(correct,2));
                otherwise
                    s2 = (previous_types(1:(end-1)) == ((ii-1)*2))' + (previous_types(1:(end-1)) == ((ii-1)*2-1))';
            end
            idx = find(s2 == 1);
            trials = [s1(idx) correct(idx)];
            if isempty(trials)
                trials = [s1(1), correct(1)];
            end

            %---------------------------------------------------
            fa = find(trials(:,1)==0 & trials(:,2)==0);    
            hit = find(trials(:,1)==1 & trials(:,2)==1);
            miss = find(trials(:,1)==1 & trials(:,2)==0);
            cr = find(trials(:,1)==0 & trials(:,2)==1);

            num_s1 = length(hit) + length(miss);
            num_s0 = length(fa) + length(cr);
            ntrials = num_s1 + num_s0;

            if isempty(fa)
                far = 0;
            else
                far = length(fa)/num_s0;
            end

            if isempty(hit)
                hr = 0;
            else
                hr = length(hit)/num_s1;
            end

            dp = dprime(hr, far, num_s1, num_s0);

            eval(['NumTrials', suffix{ii}, '.value = ntrials;'])
            eval(['NumRewards', suffix{ii}, '.value = length(hit);'])
            eval(['PercentCorrect', suffix{ii}, '.value = (length(hit) + length(cr))/ntrials;'])
            eval(['HR', suffix{ii}, '.value = hr;'])
            eval(['FAR', suffix{ii}, '.value = far;'])
            eval(['HRMinusFAR', suffix{ii}, '.value = hr-far;'])
            eval(['Dprime', suffix{ii}, '.value = dp;'])

            %---------------------------------------------------
            if (size(trials,1) >= 60)
                fa = find(trials(end-59:end,1)==0 & trials(end-59:end,2)==0);    
                hit = find(trials(end-59:end,1)==1 & trials(end-59:end,2)==1);
                miss = find(trials(end-59:end,1)==1 & trials(end-59:end,2)==0);
                cr = find(trials(end-59:end,1)==0 & trials(end-59:end,2)==1);

                num_s1 = length(hit) + length(miss);
                num_s0 = length(fa) + length(cr);
                ntrials = num_s1 + num_s0;

                if isempty(fa)
                    far = 0;
                else
                    far = length(fa)/num_s0;
                end

                if isempty(hit)
                    hr = 0;
                else
                    hr = length(hit)/num_s1;
                end

                dp = dprime(hr, far, num_s1, num_s0);
                
                eval(['Dprime60', suffix{ii}, '.value = dp;'])
            end
        end
        
        
        
      % send e-mail in case when the mouse is done when you are not attending the training 
      % Send e-mail just once, when there were 5 (or adjustable # of)
      % consecutive ignores
      % 2016/11/21 JK
      
      if strcmpi(value(email_enable), 'yes')            
        if length(hit_history) > 100 % at least 100 trials...
        if length(miss) > value(nummiss) % 
            if length(hit) > 0
              if miss(end-value(nummiss) + 1) > hit(end) % consecutive nummiss misses.
                  global mailsent % defined in obj file.
                  if mailsent == 0 
                        setpref('Internet','SMTP_Username','hireslabmouse@gmail.com')
                        setpref('Internet','SMTP_Password','hlabmouse')
                        setpref('Internet','SMTP_Server','smtp.gmail.com');
                        setpref('Internet','E_mail','hireslabmouse@gmail.com')
                        props = java.lang.System.getProperties;
                        props.setProperty('mail.smtp.auth','true')
                        props.setProperty('mail.smtp.socketFactory.class','javax.net.ssl.SSLSocketFactory');
                        props.setProperty('mail.smtp.socketFactory.port','465')
                      sendmail(value(emailad),'Your mouse is done in rig 3.', 'Come save me..')
                      mailsent = 1; 
                  end
              end
            end
        end
        end
      end     
        
        
    case 'hide_show'
        if strcmpi(value(analysis_show), 'hide')
            set(value(analysisfig), 'Visible', 'off');
        elseif strcmpi(value(analysis_show),'view')
            set(value(analysisfig),'Visible','on');
        end;
        return;


    case 'reinit'
        currfig = gcf;

        % Get the original GUI position and figure:
        x = my_gui_info(1); y = my_gui_info(2); figure(my_gui_info(3));

        delete(value(myaxes));

        % Delete all SoloParamHandles who belong to this object and whose
        % fullname starts with the name of this mfile:
        delete_sphandle('owner', ['^@' class(obj) '$'], ...
            'fullname', ['^' mfilename]);

        % Reinitialise at the original GUI position and figure:
        [x, y] = feval(mfilename, obj, 'init', x, y);

        % Restore the current figure:
        figure(currfig);
        return;
    case 'resetemail'
        global mailsent
        mailsent = 0;
end


