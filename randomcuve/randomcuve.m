function [] = randomcuve()
SCR = get(0,'Screensize');  % ต่ำแหน่งของจุดที่เกิดโปรแกรม

%ทำให้เกิดหน้าตาโปรแกรมขึ้นมา
S.fh = figure('numbertitle','off',...
              'menubar','none',...
              'units','pixels',...
              'position',[SCR(3)/2-200 ,SCR(4)/2-200 , 400, 400],...
              'name','randomcuve',...
              'resize','off');
          
%กราฟ          
S.ax = axes('units','pixels',...
            'position',[50 100 300 230]);
        
%ปุ่ม         
S.pb1 = uicontrol('style','pushbutton',...
                  'units','pixels',...
                  'position',[50 20 300 40],...
                  'string','Plot Random Quartic Polynomial',...
                  'fontsize',12);
 % การสลับจะทำหน้าที่เป็นแท็บ      

S.tg(1) = uicontrol('style','toggle',...
                    'units','pixels',...
                    'position',[5 355 60 40],...
                    'string','PLOT',...
                    'val',1);
                
S.tg(2) = uicontrol('style','toggle',...
                    'units','pixels',...
                    'position',[65 355 60 40],...
                    'string','FIT',...
                    'value',0,...
                    'enable','off');
                
S.tg(3) = uicontrol('style','toggle',...
                    'units','pixels',...
                    'position',[125 355 60 40],...
                    'string','ABOUT',...
                    'value',0,...
                    'enable','on');
% ส่วนสำหรับแสดง about                
S.tx = uicontrol('style','text',...
                 'units','pixels',...
                 'position',[20 20 360 300],...
                 'visible','off',...
                 'string',{' ','MATLAB FOR ENGINEER ',...
                 ''},...
                 'fontsize',20,'fontweight','bold');
             
             W = {'style','edit','units','pixels','position'};  % Save some typing.   

% พิกัดต่ำแหน่งของส่วนต่างๆที่จะประกอบกัน

S.ed(5) = uicontrol(W{:},[50 100 300 30]);
S.ed(4) = uicontrol(W{:},[50 140 300 30]);
S.ed(3) = uicontrol(W{:},[50 180 300 30]);
S.ed(2) = uicontrol(W{:},[50 220 300 30]);
S.ed(1) = uicontrol(W{:},[50 260 300 30]);

% เอามาประกอบรวมกัน
set(S.pb1,'callback',{@pb_call,S})  % Set the callbacks.
set(S.tg(:),{'callback'},{{@tg_call,S}})
set(S.ed(:),'visible','off','fontsize',12,'fontweight','bold',...
    'backgroundcolor',[1 1 1])


function [] = pb_call(varargin)
% ทำงานเมื่อกดปุ่ม
x = -10:.1:10; % ตัวแปรสำหรับแสดงผลกราฟ.
plot(x,polyval(-5 + ceil(rand(1,5)*7),x));  % มีการสุ่มค่าลงในกราฟ
set(varargin{3}.tg(2),'enable','on');  % พอมีกราฟ fittap ก็จะทำงาน



function [] = tg_call(varargin)
% Callback for togglebuttons.
[h,S] = varargin{[1,3]};  % ไปเรียกโครงสร้างที่ทำไว้

if get(h,'val')==0  % Here the Toggle is already pressed.
    set(h,'val',1) % To keep the Tab-like functioning.
end

L = get(S.ax,'children');  % The line object.
% Each case of the switch has one toggle associated with it.  When a toggle
% is selected the uicontrols which belong to it are made visible, and the
% others are made invisible.  This way each toggle has, in effect, its own 
% GUI.  All uicontrols are part of the main GUI, some are simply hidden
% when each toggle is selected.  This mimics the action of tabs.
switch h
    case S.tg(1)
        set(S.tg([2,3]),'val',0)   
        set([S.ax,S.pb1,L],{'visible'},{'on'})
        set([S.ed(:);S.tx],{'visible'},{'off'})
    case S.tg(2)
        set(S.tg([1,3]),{'val'},{0})
        set(S.ed(:),{'visible'},{'on'})
        set([S.ax,S.pb1,L,S.tx],{'visible'},{'off'})
        STR = 'The x^0 coefficient is:  ';
        p = round(polyfit(get(L,'xdata'),get(L,'ydata'),4));
        for ii = 0:4
            STR(7) = num2str(ii);
            set(S.ed(5-ii),'str',[STR,num2str(p(5-ii))])
        end
    otherwise
        set(S.tg([1,2]),{'val'},{0})
        set(S.tx,'visible','on')
        set([S.ax;S.pb1;L;S.ed(:)],{'visible'},{'off'})     
end
             
              