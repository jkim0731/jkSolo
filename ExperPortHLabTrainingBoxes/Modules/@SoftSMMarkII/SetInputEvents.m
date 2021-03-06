% sm = SetInputEvents(sm, scalar, string_ai_or_dio)
% sm = SetInputEvents(sm, vector, string_ai_or_dio)
%                Specifies the input events that are caught by the state
%                machine and how they relate to the state matrix.
%                The first simple usage of this function just tells the 
%                state machine that there are SCALAR number of input
%                events, so there should be this many columns used in the
%                state matrix for input events. 
%
%                The second usage of this function actually specifies how
%                the state machine should route input channels (buttons) to 
%                state matrix columns.  Each position in the vector 
%                corresponds to a state matrix column, and the value of 
%                each vector position is the channel number to use for that
%                column.  Positive values indicate a rising edge event, and
%                negative indicate a falling edge event (or OUT event). A
%                value of 0 indicates that this is a 'virtual event' that
%                gets its input from the Scheduled Wave specification.
%
%                So [1, -1, 2, -2, 3, -3] tells the state machine to route
%                channel 1 to the first column as a rising edge input
%                event, channel 1 to the second column as a falling edge
%                input event, channel 2 to the third column as a rising
%                edge input event, and so on.  Each scalar in the vector
%                indicates a channel id, and its sign whether the input
%                event is rising edge or falling edge.  Note that channel
%                id's are numbered from 1, unlike the internal id's NI
%                boards would use (they are numbered from 0), so keep that
%                in mind as your id's might be offset by 1 if you are used
%                to thinking about channel id's as 0-indexed.
%    
%                
%                The first usage of this function is shorthand and will
%                create a vector that contains SCALAR entries as follows:
%                [1, -1, 2, -2, ... SCALAR/2, -(SCALAR/2) ] 
%
%                Note: this new input event mapping does not take effect
%                immediately and requires a call to SetStateMatrix().
%
%                string_ai_or_dio  must be one of 'ai' or 'dio'. For
%                the SoftSMMarkII, this entry is irrelevant and is
%                ignored; but it is included here to match the input
%                param requirements of @RTLSM/SetInputEvents.m
%

function sm = SetInputEvents(sm, val, string_ai_or_dio)

   if nargin<3, string_ai_or_dio = 'ai'; end;
   if ~ismember(string_ai_or_dio, {'ai' 'dio'}),
      error(sprintf(['string_ai_or_dio must be one of ''ai'' or ''dio''.\n' ...
                     '   (note that this parameter is irrelevant for ' ...
                     '@SoftSMMarkII, but is required for @RTLSM)']));
   end;
   
    mat = [];

    if isscalar(val)

        if (val < 0),
          error(['Invalid argument to SetInputEvents: the scalar' ...
                 ' should be non-negative!']); 
        end;

        mat = zeros(1,val);

        for i = 1:(val)
            c = -1;
            if (mod(i,2)) c = 1; end;
            val(1,i) = ceil(i/2) * c;
        end;
 
    end;
 
    mat = val;

    [m,n] = size(mat);

    if (m > 1), error('Specified matrix is invalid -- it neets to be a 1 x n vector!'); end;

    
    sm = get(sm.Fig, 'UserData');
    sm.UpAndComingInputEvents = mat;
    set(sm.Fig, 'UserData', sm);

    return;

