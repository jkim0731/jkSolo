% [x, y] = SessionTypeSection(obj, action, x, y)
%
% Section that takes care of choosing the stage of training.
%
% PARAMETERS:
% -----------
%
% obj      Default object argument.
%
% action   One of:
%            'init'      To initialise the section and set up the GUI
%                        for it.
%
%            'reinit'    Delete all of this section's GUIs and data,
%                        and reinit, at the same position on the same
%                        figure as the original section GUI was placed.
%
%            'get_session_type'  Returns string giving session type.
%
%
% RETURNS:
% --------
%
% [x, y]   When action == 'init', returns x and y, pixel positions on
%          the current figure, updated after placing of this section's GUI. 
%
% x        When action = 'get_session_type', x will be string giving name of
%          session type.
%

function [x, y] = SessionTypeSection(obj, action, x, y)
   
   GetSoloFunctionArgs;
   
   switch action
    
    case 'init',   % ------------ CASE INIT ----------------
      % Save the figure and the position in the figure where we are
      % going to start adding GUI elements:
      SoloParamHandle(obj, 'my_gui_info', 'value', [x y gcf]);

      MenuParam(obj, 'SessionType', {'Licking','2port-Discrim',...
          'LWater-Valve-Calibration','RWater-Valve-Calibration',...
          'Piezo stimulation' ... % 2017/10/01 JK
%           'Beam-Break-Indicator', ... % 2016/05/23 JK
          },'2port-Discrim', x, y);
      
      SoloFunctionAddVars('make_and_upload_state_matrix', 'ro_args', {'SessionType'});
      SoloFunctionAddVars('SidesSection', 'ro_args', {'SessionType'}); % this is for the cases of lick or pole-conditioning
      SoloFunctionAddVars('state35', 'ro_args', 'SessionType'); 
      next_row(y, 1);
      
      % The session can be either angle discrimination or radial distance
      % discrimination
      MenuParam(obj, 'TaskTarget', {'Angle', 'RadialDistance', 'Angle-Continuous', 'Angle-Discrete', 'RadialDistance-Continuous', 'RadialDistance-Discrete'},'Angle',x,y); 
      SoloFunctionAddVars('MotorsSection', 'ro_args', {'TaskTarget'});
      next_row(y,1);
      
      % Whether or not to have a distractor
      MenuParam(obj, 'Distractor', {'Discrete','Continuous','On', 'Off'},'Off',x,y); 
      SoloFunctionAddVars('MotorsSection', 'ro_args', {'Distractor'});
      SoloFunctionAddVars('SidesSection', 'ro_args', {'Distractor'});
      next_row(y,1);
      
      % For imaging
      MenuParam(obj, 'TPM_imaging', {'Normal','Block'},'Normal',x,y); 
      SoloFunctionAddVars('state35', 'ro_args', {'TPM_imaging'});
      next_row(y,1);
      
      
      
      % For the time being there will be only 'Discrete2' mode for both the
      % angle and Rdist %2016/03/27 JK
%       % The angle and radial distance can be continuous or discrete (2
%       % point) 
%       MenuParam(obj, 'AngleType', {'Discrete2', 'Continuous'},'Discrete2',x,y);
%       SoloFunctionAddVars('MotorsSection', 'ro_args', {'AngleType'});
%       next_row(y,1);
%       
%       MenuParam(obj, 'RDistType', {'Discrete2', 'Continuous'},'Discrete2',x,y);
%       SoloFunctionAddVars('MotorsSection', 'ro_args', {'RDistType'});
%       next_row(y,1);
      
      SubheaderParam(obj, 'title', 'Type of Session', x, y);

      
%     case 'get_session_type'  
%       x = value(SessionType);
      return;
       
      
    case 'reinit',   % ------- CASE REINIT -------------
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
   end;
   
   
      