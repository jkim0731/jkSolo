
% Version history
% 091905:   Carlos      Initial write
% 092405:   SSP         Overwrote old file with Carlos' version from 092305
% (no observable changes)



function [dp] = DispParam(obj, parname, parval, x, y, varargin)

   if ischar(obj) && strcmp(obj, 'base'), param_owner = 'base';
   elseif isobject(obj),                  param_owner = ['@' class(obj)];
   else   error('obj must be an object or the string ''base''');
   end;
   
   pairs = { ...
       'param_owner',        param_owner            ; ...
       'param_funcowner',    determine_fullfuncname     ; ...
       'position',           gui_position(x, y)         ; ...
       'TooltipString',      ''                         ; ...
       'label',              parname                    ; ...
       'labelfraction',      0.5,                       ; ...
       'labelpos',           'right'                    ...  
   }; parseargs(varargin, pairs);
    

   dp = SoloParamHandle(obj, parname, ...
                        'type',            'disp', ...
                        'value',           parval, ...
                        'position',        position, ...
                        'TooltipString',   TooltipString, ...
                        'label',           label, ...
                        'labelfraction',   labelfraction, ...
                        'labelpos',        labelpos, ...
                        'param_owner',     param_owner, ...
                        'param_funcowner', param_funcowner);
   assignin('caller', parname, eval(parname));
   return;
   
