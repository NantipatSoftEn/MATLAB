function [] = calculater()


S.CNT = 0;  % The number of times user pressed the pushbutton.
S.CHC = [];  % Holds the strings which represent the operations performed.
S.fh = figure('units','pixels',...
              'position',[400 400 300 130],...
              'menubar','none',...
              'name','calculater',...
              'numbertitle','off',...
              'resize','off');
COL = get(S.fh,'color');          
S.pp = uicontrol('style','pop',...
                  'unit','pix',...
                  'position',[10 20 120 30],...
                  'string',{'Add';'Multiply';'Subtract';'Divide';'Power';'mod';,'rem';'nthroot';'gcd';'lcm'});
S.ed(1) = uicontrol('style','edit',...
                    'unit','pix',...
                    'position',[10 90 70 30],...
                    'string','3');
S.tx(1) = uicontrol('style','text',...
                    'unit','pix',...
                    'position',[85 90 20 30],...
                    'string','+',...
                    'fontsize',16,...
                    'backgroundcolor',COL);                  
S.ed(2) = uicontrol('style','edit',...
                    'unit','pix',...
                    'position',[110 90 70 30],...
                    'string','2');  
S.tx(2) = uicontrol('style','text',...
                    'unit','pix',...
                    'position',[185 90 20 30],...
                    'string','=',...
                    'fontsize',16,...
                    'backgroundcolor',COL);                 
S.ed(3) = uicontrol('style','edit',...
                    'unit','pix',...
                    'position',[220 90 70 30],...
                    'string','answer');
S.pb = uicontrol('style','push',...
                  'unit','pix',...
                  'position',[160 20 120 30],...
                  'string','Calculate');
S.cm = uicontextmenu;
S.um = uimenu(S.cm,...
                 'label','Export Data to Base',...
                 'Callback', {@um_call,S});
set([S.fh,S.pp,S.ed,S.tx,S.pb],'uicontextmenu',S.cm); % Assign contextmen.         
set([S.pp,S.pb],'callback',{@pb_call,S});   % Assign callbacks.              


function [] = pb_call(varargin)
% Callback for pushbutton
S = varargin{3};  % Get the structure.
N = str2double(get(S.ed(1:2),'string'));  % The numbers to operate on.
VL = get(S.pp,{'str','value'});  % User's choice of operation.

% Now get the string updates and perform operations.
switch VL{1}{VL{2}}  % User's string choice from popup.
    case 'Add'
        A = sum(N);
        str = '+';
    case 'Multiply'
        A = prod(N);
        str = 'x';
    case 'Subtract'
        A = -diff(N);
        str = '-';
    case 'Divide'
        A = N(1)/N(2);
        str = '/';
    case 'Power'
        A = N(1).^N(2);
        str = '^';
    case 'mod'
         A = mod(N(1),N(2)); % �����������ɷ������ mod(4,-10) = 6    
        str = '%';
     case 'rem'
         A = rem(N(1),N(2)); %  rem(4,-10) = 4
        str = 'r';
     case 'nthroot'
         A = nthroot(N(1),N(2)); %  nthroot(-27, 3) = -3
        str = 'nr';
      case 'gcd'
         A = gcd(N(1),N(2)); %  ���
        str = 'g';
       case 'lcm'
         A = lcm(N(1),N(2)); %  �ù
        str = 'L';
    otherwise
        % ����������� https://www.mathworks.com/help/matlab/discrete-math.html
        % https://www.mathworks.com/matlabcentral/answers/221157-diffrence-between-rem-and-mod
end

set(S.tx(1),'string',str)  % Set the operation display.

if varargin{1}==S.pb  % This stuff we only need to do if button is pushed.
    S.CNT = S.CNT + 1;
    set(S.ed(3),'str',A)
    S.CHC{S.CNT,1} = sprintf('%2.2f %s %2.2f %s %2.2f',N(1),str,N(2),'=',A);
    set(S.pb,'callback',{@pb_call,S})
    set(S.um,'Callback', {@um_call,S}); 
end






