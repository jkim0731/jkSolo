% [x, y] = ValvesSection(obj, action, x, y)
%
% Section that takes care of times for the water valves, and pneumatic valve.
%
% PARAMETERS:
% -----------
%
% obj      Default object argument.
%
% action   One of:
%            'init'      To initialise the section and set up the GUI
%                        for it
%
%            'reinit'    Delete all of this section's GUIs and data,
%                        and reinit, at the same position on the same
%                        figure as the original section GUI was placed.
%
% x, y     Relevant to action = 'init'; they indicate the initial
%          position to place the GUI at, in the current figure window
%
%
% RETURNS:
% --------
%
% [x, y]   When action == 'init', returns x and y, pixel positions on
%          the current figure, updated after placing of this section's GUI. 
%

function [x, y] = ValvesSection(obj, action, x, y)
   
   GetSoloFunctionArgs;
   global valves_properties; % Defined in mystartup.m.
   
   switch action
    case 'init',
      % Save the figure and the position in the figure where we are
      % going to start adding GUI elements:
      SoloParamHandle(obj, 'my_gui_info', 'value', [x y gcf]);

      % --- Water valve times
      %EditParam(obj, 'LWaterValveTime',
      %valves_properties.rwater_valve_time, x, y);  next_row(y); 
      %EditParam(obj, 'RWaterValveTime',
      %valves_properties.lwater_valve_time, x, y);  next_row(y); 
      EditParam(obj, 'LWaterValveTime', '0.15', x, y);  next_row(y); % Edited by JK 12/30/2015 for L-R integration
      EditParam(obj, 'RWaterValveTime', '0.11', x, y);  next_row(y); % Edited by JK 12/30/2015

      SoloFunctionAddVars('make_and_upload_state_matrix', 'ro_args', {'RWaterValveTime'});
      SoloFunctionAddVars('make_and_upload_state_matrix', 'ro_args', {'LWaterValveTime'});
%       EditParam(obj, 'AirpuffTime', valves_properties.airpuff_time, x, y);  next_row(y);
%       SoloFunctionAddVars('make_and_upload_state_matrix', 'ro_args',
%       {'AirpuffTime'}); 
% 02/17/16 JK Not going to use air puff time
      EditParam(obj, 'RewardCueTime', valves_properties.reward_cue_time, x, y);  next_row(y);
      SoloFunctionAddVars('make_and_upload_state_matrix', 'ro_args', {'RewardCueTime'});
      NumeditParam(obj, 'FracNoReward', 0, x, y, 'TooltipString',...
          'On what fraction of trials should water valve be disabled -- catch trial');  
      next_row(y);
      SoloFunctionAddVars('make_and_upload_state_matrix', 'ro_args', {'FracNoReward'});
      SubheaderParam(obj, 'title', 'Valves', x, y);
      next_row(y, 1.5);
      
    case 'reinit',
      currfig = gcf; 

      % Get the original GUI position and figure:
      x = my_gui_info(1); y = my_gui_info(2); figure(my_gui_info(3));

      % Delete all SoloParamHandles who belong to this object and whose
      % fullname starts with the name of this mfile:
      delete_sphandle('owner',['^' class(obj) '$'],'fullname',['^' mfilename]);

      % Reinitialise at the original GUI position and figure:
      feval(mfilename, obj, 'init', x, y);

      % Restore the current figure:
      figure(currfig);      
   end;
   
   
      