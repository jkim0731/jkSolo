function lh1 = lunghao1(a)

global private_lunghao1_list;

if nargin==0,
    generic_rp = rp_machine;
    
    lh1 = struct(...
    'StateMatrix',    zeros(128,1), ...
    'TimDurMatrix',   zeros(64,1), ...
    'DIO_Out',        zeros(64,1), ...
    'DIO_Bypass1',    struct('timer', timer, 'active', 0), ...
    'DIO_Bypass2',    0, ...
    'Dio_Hi_Dur',     6000, ...   % this is defined in sixths of a ms, the frame rate of the real RP box
    'Dio_Hi_Bits',    1, ...
    'Bits_HighVal',   1, ...
    'DOut',           0, ...
    'AO_Out',         zeros(64,1), ...
    'AO_Bypass',      0, ...
    'AOBits_HighVal', 1, ...
    'AOut1',          0, ...
    'AOut2',          0, ...
    'pc_is_ready_fg', 0, ...
    'StateIndex',     0, ...
    'StateNow',       0, ...
    'GoNextState',    0, ...
    'RightOut',       0, ...
    'RightIn',        0, ...
    'LeftOut',        0, ...
    'LeftIn',         0, ...
    'CenterOut',      0, ...
    'CenterIn',       0, ...
    'EventCounter',   0, ...
    'Event',          zeros(1,100000), ....
    'EventTime',      zeros(1, 100000), ...
    'Timer',          0, ...
    'running',        0, ...
    'starttime',      0, ...
    'timers',         [timer; timer], ...
    'timerid',        1, ...
    'list_position',  0, ...
    'statechange_callback',  [], ...
    'doutchange_callback',   [], ...
    'aoutchange_callback',   [], ...
    'UserData',       []);

    lh1 = class(lh1, 'lunghao1', generic_rp);
    lh1.list_position = length(private_lunghao1_list)+1;
    set(lh1.timers, 'TimerFcn', {@lunghao1_timer_fcn, lh1.list_position}, 'BusyMode', 'queue');

    if isempty(private_lunghao1_list), 
        private_lunghao1_list = {lh1};
    else    
        private_lunghao1_list = [private_lunghao1_list ; {lh1}];
    end;
    
    
    
    return;
    
elseif isa(a, 'lunghao1'),
    lh1 = a;
    return;
    
else
    error('Don''t understand this argument for creation of a lunghao1');
end;

