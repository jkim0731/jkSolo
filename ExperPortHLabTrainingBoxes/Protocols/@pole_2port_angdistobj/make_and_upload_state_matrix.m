function [] = make_and_upload_state_matrix(obj, action)

GetSoloFunctionArgs;


switch action
 case 'init'
   clear global autosave_session_id;
   SoloParamHandle(obj, 'state_matrix');
   
   SoloParamHandle(obj, 'RealTimeStates', 'value', struct(...
     'bitcode', 0, ...  
     'pretrial_pause', 0, ...  
     'sampling_period', 0, ... 
     'preanswer_pause',  0, ...
     'answer_epoch', 0,...
     'miss',0, ...
     'posttrial_pause', 0, ...
     'punish', 0, ...
     'reward_left', 0, ...
     'reward_right',0, ...
     'second_chance',0, ...
     'reward_cue',0, ...
     'reward_catch_trial', 0, ...
     'reward_collection',0, ...
     'withdraw_lickport_sample',0, ...
     'withdraw_lickport_preans',0, ...
     'present_lickport', 0, ...
     'restart_delay', 0));

   SoloFunctionAddVars('RewardsSection', 'ro_args', 'RealTimeStates');
   SoloFunctionAddVars('MotorsSection', 'ro_args', 'RealTimeStates');
   
   make_and_upload_state_matrix(obj, 'next_matrix');

   return;
   
 case 'next_matrix',
   % SAVE EVERYTHING before anything else is done!
   %autosave(value(MouseName));
   SavingSection(obj, 'autosave');
   
   % ----------------------------------------------------------------------
   % - Set parameters used in matrix:
   % ----------------------------------------------------------------------
   % Setting Andrew
%    jnk = 2^0
%    jnk =2^1
%    Festo =2^2
%    jnk =2^3
%    jnk =2^4
%    jnk =2^5
%    watervalve=2^6
%    watervalve=2^7
% R = mouse right
% L = mouse left
%    
   % Settings S. Peron
   wvLid = 2^6; % water valve (left) % CHANGE PER BOX!!!!
   durid = 2^1; % used right before sending state matrix to RPbox. for duration of TPM and whisker video 2016/07/05 JK
   wvRid = 2^7; % water valve (right) % CHANGE PER BOX!!!!
   pzscid = 2^0; % piezo sound cue 2016/05/24 JK.
   pvid = 2^2; % Pneumatic (Festo) valve ID.
   etid = 2^4; % EPHUS (electrophysiology) trigger ID.
   slid = 2^5; % Signal line for signaling trial numbers and fiducial marks. % to scanbox 2016/07/05 JK + video starting point 2016/08/29
   rcid = 2^3; % Reward cue ID (sound), used for bitcodes to servo 2016/05/23 JK.
   
   puffid = 0; % Airpuff valve ID. 
   
   rwvtm = RWaterValveTime; % Defined in ValvesSection.m.  
   lwvtm = LWaterValveTime; % Defined in ValvesSection.m.  
   
   % Compute answer period time as 2 sec minus SamplingPeriodTime (from TimesSection.m) , 
   % unless SamplingPeriodTime is > 1 s (for training purposes), in which case it is 1 sec.
   % MOVED THIS PART TO TIMESECTION. - NX 4/9/09
      
       
      
   % program starts in state 40 (41st row)
   stm = [0 0 0 0 40 0.01  0 0];
   stm = [stm ; zeros(40-rows(stm), 8)];
   stm(36,:) = [35 35 35 35 35 1   0 0];
   b = rows(stm); % b = 40
   
% Alexis 9-3-14 MUST BE RENAMED BASED ON 2-PORT DISCRIM TO MAKE SURE HITS
% AND INCORRECTS ARE MONITORED (refer to assignment of state times in
% parse_trial in RewardsSection in state35 in state RPbox via the send
% matrix line in this m-file--> this is done in the pstruct variable
% struct). 
%
% Assigned unused states names with unused state numbers (DO NOT ASSIGN <--
% fills in areas of the pstruct that we do not currently want filled
   RealTimeStates.bitcode = b; 
   RealTimeStates.pretrial_pause = b+1;
   RealTimeStates.sampling_period = b+2;
   RealTimeStates.preanswer_pause = b+3;
   RealTimeStates.answer_epoch = b+12;%4;
   RealTimeStates.miss = b+4;%5;
   RealTimeStates.posttrial_pause = b+5;%6;
   RealTimeStates.punish = b+6;%7;
   RealTimeStates.reward_left = b+7;%8;
   RealTimeStates.reward_right = b+8;%9;     
   RealTimeStates.second_chance = b+13;%10; % if RewardOnWrong
   RealTimeStates.reward_cue = b+14;%11;
   RealTimeStates.reward_catch_trial = b+9;%12;
   RealTimeStates.reward_collection = b+10;%13;
   RealTimeStates.withdraw_lickport_sample = b+15;%14;
   RealTimeStates.withdraw_lickport_preans = b+16;%15;
   RealTimeStates.present_lickport = b+17;%16;
   RealTimeStates.restart_delay = b+11;%17;   
   
   next_side = SidesSection(obj, 'get_next_side');
   
   % ----------------------------------------------------------------------
   % - Build matrix:
   % ----------------------------------------------------------------------
   switch SessionType % determined by SessionTypeSection
        
      case 'LWater-Valve-Calibration'
             % On beam break (eg, by hand), trigger ndrops water deliveries
             % with delay second delays.
             ndrops = 100; delay = 0.5;
             openLvalve = [b+1 b+1 b+1 b+1 b+2 lwvtm wvLid 0]; 
             closeLvalve = [b+1 b+1 b+1 b+1 b+2 delay 0 0];
             oneLcycle = [openLvalve; closeLvalve];
             m = repmat(oneLcycle, ndrops, 1);    
             x = [repmat((0:(2*ndrops-1))',1,5) zeros(2*ndrops,3)];
             m = m+x; m = [b+1 b b+1 b 35 999 0 0; m];
             m(end,5) = 35; stm = [stm; m];
       
       case 'RWater-Valve-Calibration'
             % On beam break (eg, by hand), trigger ndrops water deliveries
             % with delay second delays.
             ndrops = 100; delay = 0.5;
             openRvalve = [b+1 b+1 b+1 b+1 b+2 rwvtm wvRid 0]; 
             closeRvalve = [b+1 b+1 b+1 b+1 b+2 delay 0 0];
             oneRcycle = [openRvalve; closeRvalve];
             m = repmat(oneRcycle, ndrops, 1);    
             x = [repmat((0:(2*ndrops-1))',1,5) zeros(2*ndrops,3)];
             m = m+x; m = [b+1 b b+1 b 35 999 0 0; m];
             m(end,5) = 35; stm = [stm; m];
             
       case 'Licking'
           %Lin     Lout  Rin Rout   Tup  Tim  Dou Aou  (Dou is bitmask format)
%            stm = [stm ;
%                b+1   b    b+2  b     35  999    0     0  ; ... % wait for lick  (This is state 40)
%                b+1   b+1  b+1  b+1   35  lwvtm  wvLid     0  ; ... % licked left -- reward left
%                b+2   b+2  b+2  b+2   35  rwvtm  wvRid   0  ; ... % licked right -- reward right
%                ];
          stm = [stm ;
               b+2   b    b+1  b     35  999    0     0  ; ... % wait for lick  (This is state 40)
               b+2   b+1  b+1  b+1   35  rwvtm  wvRid   0  ; ... % licked right -- reward right
               b+2   b+2  b+1  b+2   35  lwvtm  wvLid   0  ; ... % licked left -- reward left
               ];
        
       case 'Piezo stimulation' % 10 Hz 2 sec for now 2017/10/03
           stm = [stm;
               b    b   b   b   b+1 5    0       0   ; ... % 5 sec baseline
               b+1  b+1 b+1 b+1 35 4   slid+durid    0   ]; % ephus stimulation by slid, TTL0 by slid and TTL1 by durid for TPM
               
%        case 'Beam-Break-Indicator'
%            stm = [stm ;
%                b+1   b  b+2 b    35  999  0      0  ; ...
%                b+1   b  b+1 b    35  999  ledLid  0  ; ...
%                b+2   b  b+2 b    35  999  ledRid  0  ; ...
%                ];
% 2016/05/23 JK, to use ledLid as a sound cue for pole rising. 
           

        % 2 port task
        case '2port-Discrim' 
            
           % ---- labeling of states
           sBC = b; % bitcode
           sPrTP = b+1; % pretrial pause
           sPMS = b+2; % pole move & sample period
           sPrAP = b+3; % preanswer pause
           sLoMi = b+4; % log miss/ignore
           sPoTP = b+5; % posttrial pause
           sPun = b+6; % punish (be it airpuff, timeout, or whatev)  
           sRwL = b+7; % reward left
           sRwR = b+8; % reward right
           sRCaT = b+9;%12; % to log unrewarded correct trals (catch)
           sRCol = b+10;%13; % give animal time to collect reward         
           sRDel = b+11;%17 ; % restart delay         
           sWrong = b+12;%18 ; % Additional state after pole went down to match the timing between wrong and right       
           
           % ---- assign gui variables
           ap_t = value(AnswerPeriodTime);
           sp_t = SamplingPeriodTime;
           eto_t = max(.01,ExtraITIOnError);
           pr_t = PoleRetractTime;
%            pa_t = PreAnswerTime;
           prep_t = PreTrialPauseTime;
           postp_t = PostTrialPauseTime;
           rc_t = RewardCueTime;
           rcoll_t = RewardCollectTime;
%            lpt_t = LickportTravelTime;
           puw_t = PoleUpOnWrongTime;
%            puff_t = AirpuffTime;
           
%            wdraw_t = 0.3; % how long to stay in withdraw state and allow its detection
           
           % Check for (min,max) PreAnswerTime
%            if (~isnumeric(pa_t)) % assume format is correct!
%               comIdx = find(pa_t == ',');
%               if (length(comIdx) > 0)
%                   minValuePAT = str2num(pa_t(2:comIdx-1));
%                   maxValuePAT = str2num(pa_t(comIdx+1:end-1));
%                   pa_t = minValuePAT + ((maxValuePAT-minValuePAT)*rand(1));
%               else 
%                   disp('Bad format ; settig PreAnswerTime to 0');
%                   pa_t= 0;
%               end
%            end 
% 02/17/16 JK Don't use min,max format for pa_t
              
           % puff disabled? can't have 0 time or RT freaks; set valve id
           % off instead
%            if (puff_t == 0)
%                puff_t = 0.01;
%                puffid = 0;
%            else
%                disp('*** At this time, airpuff is disabled. ***');
%            end
% 02/17/16 JK Not using air puff
            
           % Reward cue disabled? turn off valve, but must be at least
           % minimal time long
           if (rc_t == 0)
               rc_t = 0.01;
%                rcid = 0;
           end
           
           % Adjust prepause based on bitcode, initial trigger
           prep_t = prep_t - 0.01 - 0.084; % 2 ms bit, 5 ms interbit, 12 bits = 84 ms = .084 s
           
           % Adjust prepause based on bitcode for sending angles
           prep_t = max([prep_t - 0.32, 0.001]); % 20 ms bit, 20 ms interbit, 8 bits = 320 ms = .32 s

           % Adjust postpause based on bitcode for sending 90 degrees angle
           postp_t = max([postp_t - 0.32, 0.001]); % 20 ms bit, 20 ms interbit, 8 bits = 320 ms = .32 s

                % Alexis 9-2-14 DECLARE A WRONG
                pps = sPoTP; % post-punish state default is post trial pause

           onLickS = sPMS;

           % Adjust extra time out based on airpuf time
%            eto_t = eto_t - puff_t; % JK 01/29/16 We are not giving air puff
%            eto_t = max(eto_t,.01);

           if next_side=='r' % 'r' means right trial.
               onlickL = sPun; % incorrect
               onlickR = sRwR; % correct
               water_t = RWaterValveTime; % Defined in ValvesSection.m.  
           else %left 
               onlickR = sPun; % punish
               onlickL = sRwL; % water to left port
               water_t = LWaterValveTime; % Defined in ValvesSection.m.  
           end  
           
           % Disable reward?  If so, do it by setting wv
           pas = sPoTP;
           if (FracNoReward > 0)
               rvReward = rand;
               if (rvReward < FracNoReward)
                   disp('Random cancellation of reward.')
                   wvLid = 0;
                   wvRid = 0;
                   pas = sRCaT;
               end
           end

           if puw_t < 0
               puw_t = 0;
           end
           
           if rcoll_t - puw_t > 0           
               stm = [stm ;
                   %LinSt   LoutSt   RinSt    RoutSt   TimeupSt Time            Dou             Aou  (Dou is bitmask format)
                   % line b (sBC = b = 40 @ 41st row of the final stm)
                   sBC      sBC      sBC      sBC      101      .01             slid            0; ... % 40 sBC: bitcode. slid will evoke TTL0 signal to scanbox. concurrent with durid evoking up event of TTL1 (resulting in event type 3 in scanbox) 
    %                sPrTP    sPrTP    sPrTP    sPrTP    sPMS     prep_t          0               0; ... % 41 sPrPT: pretrial pause / pzscid for piezo buzzer 2016/05/29 JK -> removed on 2017/10/16. Effective from 2017/10/17.
                   sPrTP    sPrTP    sPrTP    sPrTP    sPMS     prep_t          pzscid          0; ... % 41 sPrPT: pretrial pause / pzscid for piezo buzzer 2016/05/29 JK -> removed on 2017/10/16. Effective from 2017/10/17.               
                   onLickS  onLickS  onLickS  onLickS  sPrAP    pr_t+sp_t       pvid            0; ... % 42 sPMS: pole move & sample period % onLickS = sPMS @ line 235
                   onlickL  onlickL  onlickR  onlickR  sLoMi    ap_t            pvid            0; ... % 43 sPrAP: Answer period time
                   sLoMi    sLoMi    sLoMi    sLoMi    sPoTP    0.001           0               0; ... % 44 sLoMi: log miss/ignore
                   sPoTP    sPoTP    sPoTP    sPoTP    201      postp_t         0               0; ... % 45 sPoTP: posttrial pause; 201 is for turning the pole 90 again after each trial.
    %                sPun     sPun     sPun     sPun     sWrong   puw_t           pvid+pzscid     0; ... % 46 sPun: punish & pps = sPoTP @ line 203 Piezo sound cue to let the animal know that it was wrong. 2017/10/17.
                   sPun     sPun     sPun     sPun     sWrong   puw_t+water_t   pvid            0; ... % 46 sPun: punish & pps = sPoTP @ line 203 Piezo sound cue to let the animal know that it was wrong. 2017/10/17.               
                   sRwL     sRwL     sRwL     sRwL     sRCol    water_t         pvid+wvLid      0; ... % 47 sRwL: reward left
                   sRwR     sRwR     sRwR     sRwR     sRCol    water_t         pvid+wvRid      0; ... % 48 sRwR: reward right                      
                   sRCaT    sRCaT    sRCaT    sRCaT    sPoTP    0.001           pvid            0; ... % 49 sRCaT: to log unrewarded correct trials              
                   sRCol    sRCol    sRCol    sRCol    sPoTP    rcoll_t         pvid            0; ... % 50 sRCol: give animal time to collect reward              
                   sRDel    sRDel    sRDel    sRDel    sPun     0.001           pvid            0; ... % 51 sRDel: restart delay              
                   sWrong   sWrong   sWrong   sWrong   pps      rcoll_t-puw_t   0               0; ... % 52 sWrong: Additional state after pole went down to match the timing between wrong and right. 
                   ];
           else
               stm = [stm ;
                   %LinSt   LoutSt   RinSt    RoutSt   TimeupSt Time            Dou             Aou  (Dou is bitmask format)
                   % line b (sBC = b = 40 @ 41st row of the final stm)
                   sBC      sBC      sBC      sBC      101      .01             slid            0; ... % 40 sBC: bitcode. slid will evoke TTL0 signal to scanbox. concurrent with durid evoking up event of TTL1 (resulting in event type 3 in scanbox) 
                   sPrTP    sPrTP    sPrTP    sPrTP    sPMS     prep_t          pzscid          0; ... % 41 sPrPT: pretrial pause / pzscid for piezo buzzer 2016/05/29 JK -> removed on 2017/10/16. Effective from 2017/10/17.               
                   onLickS  onLickS  onLickS  onLickS  sPrAP    pr_t+sp_t       pvid            0; ... % 42 sPMS: pole move & sample period % onLickS = sPMS @ line 235
                   onlickL  onlickL  onlickR  onlickR  sLoMi    ap_t            pvid            0; ... % 43 sPrAP: Answer period time
                   sLoMi    sLoMi    sLoMi    sLoMi    sPoTP    0.001           0               0; ... % 44 sLoMi: log miss/ignore
                   sPoTP    sPoTP    sPoTP    sPoTP    201      postp_t         0               0; ... % 45 sPoTP: posttrial pause; 201 is for turning the pole 90 again after each trial.
                   sPun     sPun     sPun     sPun     pps      puw_t+water_t-0.001   pvid            0; ... % 46 sPun: punish & pps = sPoTP @ line 203 Piezo sound cue to let the animal know that it was wrong. 2017/10/17.               
                   sRwL     sRwL     sRwL     sRwL     sRCol    water_t         pvid+wvLid      0; ... % 47 sRwL: reward left
                   sRwR     sRwR     sRwR     sRwR     sRCol    water_t         pvid+wvRid      0; ... % 48 sRwR: reward right                      
                   sRCaT    sRCaT    sRCaT    sRCaT    sPoTP    0.001           pvid            0; ... % 49 sRCaT: to log unrewarded correct trials              
                   sRCol    sRCol    sRCol    sRCol    sPoTP    rcoll_t         pvid            0; ... % 50 sRCol: give animal time to collect reward              
                   sRDel    sRDel    sRDel    sRDel    sPun     0.001           pvid            0; ... % 51 sRDel: restart delay              
                   ];               
           end
    
           %------ Signal trial number on digital output given by 'slid':
           % Requires that states 101 through 101+2*numbits be reserved
           % for giving bit signal.
           
           trialnum = n_done_trials + 1;
           
           bittm = 0.002; % bit time
           gaptm = 0.005; % gap (inter-bit) time
           numbits = 12; %2^11=2048 possible trial nums

%            x = double(dec2binvec(trialnum)');
%            x = double(dec2binvec(trialnum * 2 + 1)'); % + 1 bit for
%            arrival indication 02/22/16 JK for scanbox

           x = double(dec2binvec(trialnum * 2)'); % insert 0 before start, 
%            because slid was on when pole is up and it did not turn to 0
%            yet. 2017/05/18 JK. No ambiguity about bitcode arrival for
%            now, because the scanbox is receiving 3 for pole up and 2 for
%            pole down. First gap time is 10 ms (sBC TimeupSt).

           % + 1 before LSB to signal when the code has been sent %
           % 02/22/16 JK for scanbox 

           if length(x) < numbits
               x = [x; repmat(0, [numbits-length(x) 1])];
           end
           % x is now 10-bit vector giving trial num, LSB first (at top).
           % + 1 before LSB to signal when the code has been sent %
           % 02/22/16 JK for scanbox 
           x(x==1) = slid;
           
           % Insert a gap state between bits, to make reading bit pattern clearer:
           x=[x zeros(size(x))]';
           x=reshape(x,numel(x),1);
           
           y = (101:(100+2*numbits))';
           t = repmat([bittm; gaptm],[numbits 1]);
           m = [y y y y y+1 t x zeros(size(y))];
           m(end,5) = 151; % jump to arduino angle defining bitcodes
           
           stm = [stm; zeros(101-rows(stm),8)];
           stm = [stm; m]; % m starts at 102nd row of the final stm (sending bitcode)
           
           % Move the pole with the target angle before pole up
           R_bittm = 0.02;
           R_gaptm = 0.02;
          
           
           R_numbits = 8; 
           R_x = double([1,dec2binvec(double(next_absolute_angle),R_numbits)]');   
           disp(['next absolute angle = ', num2str(double(next_absolute_angle))])
           R_x(R_x==1) = rcid;
           R_x = [R_x zeros(size(R_x))]';
           R_x = reshape(R_x,numel(R_x),1);
           R_y = (151:(150+2*(R_numbits+1)))';
           R_t = repmat([R_bittm; R_gaptm],[R_numbits+1 1]);
           R_m = [R_y R_y R_y R_y R_y+1 R_t R_x zeros(size(R_y))];
           R_m(end,5) = sPrTP; % jump back to PREPAUSE.
           stm = [stm; zeros(151-rows(stm),8)];
           stm = [stm; R_m];
           

           % Move the pole down and turn it to 90 
                      
           R_numbits = 8; 
           R_x = double([1,dec2binvec(double(90),R_numbits)]');   
           R_x(R_x==1) = rcid;
           R_x = [R_x zeros(size(R_x))]';
           R_x = reshape(R_x,numel(R_x),1);
           R_y = (201:(200+2*(R_numbits+1)))';
           R_t = repmat([R_bittm; R_gaptm],[R_numbits+1 1]);
           R_m = [R_y R_y R_y R_y R_y+1 R_t R_x zeros(size(R_y))];
           R_m(end,5) = 35; % jump to state 35.
           stm = [stm; zeros(201-rows(stm),8)];
           stm = [stm; R_m];
          
                    
       otherwise
           error('Invalid training session type')
   end
   
   stm = [stm; zeros(512-rows(stm),8)];
   if strcmp(SessionType,'2port-Discrim')
    stm(sBC:end,7) = stm(sBC:end,7) + durid; % pad all Dout with durid, except for state 35 and 0. sBC = 40; Indicating duration of whisker video imaging.
   end
   
   rpbox('send_matrix', stm);
   state_matrix.value = stm;

   %    %for test 02/23/16 JK
   % Sending this info after rpbox('send_matrix', stm) is better for
   % calculating trialnum indexing of whisker tracking video files
   % 2016/07/03 JK

%                temp_stm_name = strcat('stm','_',num2str(trialnum));
%                eval([temp_stm_name, '= stm;'])
%                if exist('test_sm.mat')
%                    eval(['save ''test_sm.mat'' ', temp_stm_name, ' -append'])
%                else
%                    eval(['save ''test_sm.mat'' ', temp_stm_name])
%                end
%                disp('saving stm')
%            end
           
          % send the trial number to scanbox as a message
%         if exist('trialnum')
%            trialnumstr = strcat('M',int2str(trialnum));
%            judp('SEND', 7000, '68.181.112.192', [int8(trialnumstr) 10])
%            judp('SEND', 7000, '68.181.114.170', [int8(trialnumstr) 10])           
%            sprintf('trial num %d sent',trialnum)
%         end
   
    return;
   
 case 'reinit',
      % Delete all SoloParamHandles who belong to this object and whose
      % fullname starts with the name of this mfile:
      delete_sphandle('owner', ['^@' class(obj) '$'], ...
                      'fullname', ['^' mfilename]);

      % Reinitialise 
      feval(mfilename, obj, 'init');
   
   
 otherwise
   error('Invalid action!!');
   
end;

   