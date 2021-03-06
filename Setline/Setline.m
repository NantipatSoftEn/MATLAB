function [] = Setline()



x = 0:.1:1000;  % ���ҧ����Ţ���������Ѻ�ӡ�ҿ
f = figure;  % ��� f = ������������
plot(x,sin(x));    %���ҧ��ҿ�����

xlabel('Axis X') % ������ͤ���᡹ x
ylabel('Axis Y') % ������ͤ���᡹ y

title('Graph of Sine and Cosine Between -2\pi and 2\pi') % ��ҹ��

dcm_obj = datacursormode(f);
xlim([0,pi]);  % Set the beginning x/y limits.
ylim([-1,1])
set(dcm_obj,'DisplayStyle','datatip',...
    'SnapToDataVertex','off','Enable','on')

set(gca,'tag','axes1');  % This axes will be controlled.

% This string will serve as a callback string.
cbs = ['set(findobj(''tag'',''axes1''),''xlim'',',...
       '[0 get(gcbo,''val'')],''ylim'',[-1,1]);'];  % Callback string.
   
   S.fh = figure('units','pixels',...
              'position',[400 400 220 40],...
              'menubar','none',...
              'name','Setline',...
              'numbertitle','off',...
              'resize','off');
   
          
 S.sl = uicontrol('style','slide',...
                 'unit','pixel',...
                 'position',[10 10 200 20],...
                 'min',1,'value',pi,'max',1000,...
                 'callback',cbs,...
                 'deletefcn',{@delete,f});
set(f,'deletef',{@delete,S.fh})  % Closing one closes the other. 
