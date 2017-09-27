function [] = Setline()



x = 0:.1:100;  % สร้างตัวเลขขึ้นมาสำหรับทำกราฟ
f = figure;  % ให้ f = โปรแกรมเริ่มต้น
plot(x,sin(x));

xlim([0,pi]);  % Set the beginning x/y limits.
ylim([-1,1])

set(gca,'tag','axes1');
% This string will serve as a callback string.
cbs = ['set(findobj(''tag'',''axes1''),''xlim'',',...
       '[0 get(gcbo,''val'')],''ylim'',[-1,1]);'];  % Callback string.
    S.fh = figure('units','pixels',...
              'position',[400 400 220 40],...
              'menubar','none',...
              'name','Setline',...
              'numbertitle','off',...
              'resize','off');
          