function [] = Plot()


S.X = -1000:.01:1000;  % The X values for plotting.
S.fh = figure('units','pixels',...
              'position',[200 250 250 200],...
              'menubar','none',...
              'name','Plot',...
              'numbertitle','off',...
              'resize','off',...
              'closerequestfcn',{@fh_crfcn});
S.bg = uibuttongroup('units','pix',...
                     'pos',[20 70 210 90]);
S.rd(1) = uicontrol(S.bg,...
                    'style','rad',...
                    'unit','pix',...
                    'position',[20 50 70 30],...
                    'string','Linear');
S.SEL = 1;  % The selectedobject property of S.bg
S.rd(2) = uicontrol(S.bg,...
                    'style','rad',...
                    'unit','pix',...
                    'position',[20 10 70 30],...
                    'string','Quadratic');
S.rd(3) = uicontrol(S.bg,...
                    'style','rad',...
                    'unit','pix',...
                    'position',[120 50 70 30],...
                    'string','Cubic');
S.rd(4) = uicontrol(S.bg,...
                    'style','rad',...
                    'unit','pix',...
                    'position',[120 10 70 30],...
                    'string','Quartic');                               
S.pb = uicontrol('style','push',...
                 'unit','pix',...
                 'position',[75 20 100 30],...
                 'string','Plot & Get Coeffs',...
                 'callback',{@pb_call});

             
    function [] = pb_call(varargin)
    % Callback for the pushbutton.
        S.RP = round((rand(1,5)*5-rand(1,5)*5)*100)/100;  % Ran polynomial.
        sel = findobj(get(S.bg,'selectedobject'));  % See BUG note in GUI_8
        S.SEL = find(S.rd==sel);  % Store current radiobutton.
      
        
        switch sel
            case S.rd(1) % Linear
                S.RP(1:3) = 0;
                S.COL = 'r';
            case S.rd(2)  % Quadratic
                S.RP(1:2) = 0;
                S.COL = 'k';
            case S.rd(3)  % Cubic
                S.RP(1) = 0;
                S.COL = 'b';
            case S.rd(4)  % Quartic
                S.COL = 'm';
            otherwise
                % Very unlikely I think.
        end
        
        S.STR = num2str(S.RP','%3.2f');  % Get a string representation.
        
        if length(S.fh)==1  % We haven't been here before.
            % This is where we make the other two figures.
            S.fh(2) = figure('name','GUI_41_Plotter',...
                             'numbertitle','off',...
                             'closerequestfcn',{@fh_crfcn});
            S.ax = axes;
            S.fh(3) = figure('units','pixels',...
                             'position',[470 250 250 230],...
                             'name','GUI_41_Fitter',...
                             'menubar','none',...
                             'numbertitle','off',...
                             'closerequestfcn',{@fh_crfcn});
            S.tx = uicontrol('units','pixels',...
                             'style','text',...
                             'unit','pix',...
                             'position',[20 185 210 25],...
                             'string','Y = Ax^4 + Bx^3 + Cx^2 + Dx + E',...
                             'fontweight','bold',...
                             'backgroundcolor',get(S.fh(3),'color'));             
            S.ed(1) = uicontrol('units','pixels',...
                                'style','edit',...
                                'unit','pix',...
                                'position',[50 10 150 25]);
            S.ed(2) = uicontrol('units','pixels',...
                                'style','edit',...
                                'unit','pix',...
                                'position',[50 45 150 25]);
            S.ed(3) = uicontrol('units','pixels',...
                                'style','edit',...
                                'unit','pix',...
                                'position',[50 80 150 25]);
            S.ed(4) = uicontrol('units','pixels',...
                                'style','edit',...
                                'unit','pix',...
                                'position',[50 115 150 25]);
            S.ed(5) = uicontrol('units','pixels',...
                                'style','edit',...
                                'unit','pix',...
                                'position',[50 150 150 25]);  
        end
        % Display polynomial coefficients.
        set(S.ed(1),'string',['E = ',S.STR(5,:)]); 
        set(S.ed(2),'string',['D = ',S.STR(4,:)]);
        set(S.ed(3),'string',['C = ',S.STR(3,:)]);
        set(S.ed(4),'string',['B = ',S.STR(2,:)]);
        set(S.ed(5),'string',['A = ',S.STR(1,:)]);
        
        S.Y = polyval(S.RP,S.X);  % Use this convenient function.
        
        % ��� figure(S.fh(2)) ��� � f �ٵ�ͷ���÷Ѵ���139 %
        
        f = figure(S.fh(2))  % Make this figure current for plotting
        plot(S.X,S.Y,S.COL)  % And plot it.
        
        % �����ç�����(title,᡹ x,y) %
        xlabel('Axis X') % ������ͤ���᡹ x
        ylabel('Axis Y') % ������ͤ���᡹ y
       
        switch sel
            case S.rd(1) % Linear
                title('Linear');
            case S.rd(2)  % Quadratic
                title('Quadratic');
            case S.rd(3)  % Cubic
                title('Cubic');
            case S.rd(4)  % Quartic
                title('Quartic');
            otherwise
                % Very unlikely I think.
        end
        
        % ��� f ������ datacursormode
        % ���ͻŴ��ͤ��������ö���٤�Һ������
        dcm_obj = datacursormode(f);
        set(dcm_obj,'DisplayStyle','datatip',...
    'SnapToDataVertex','off','Enable','on')
    end


    function [] = fm_call(varargin)
    % Callback for the figure menu.
        switch gcbo
            case S.fm(1)
                % Get a name.
                N = inputdlg('Enter Name of Save File','FileName');
                set(S.fh(2),'userdata',S.SEL)
                hgsave(S.fh(2:3),[N{1},'.mat'],'all')
            case S.fm(2)
                fn = uigetfile('*.mat','Select Saved File');
                
                try
                    S.fh(2:3) = hgload(fn);
                    S.ax = get(S.fh(2),'children');
                    ch = get(S.fh(3),'children');
                    S.ed(5:-1:1) = ch(1:5);
                    S.SEL = get(S.fh(2),'userdata');
                    set(S.bg,'selectedobjec',S.rd(S.SEL))
                catch
                    disp('Unable to Load.  Check Name and Try Again.')
                end
            otherwise
        end
    end


    function [] = fh_crfcn(varargin)
    % Closerequestfcn for figures.
       delete(S.fh) % Delete all figures stored in structure. 
    end
end

%{
??????????????? 
??????????????? 
??????????????? 
??????????????? 
???????????????
??????????????? 
??????????????? 
??????????????
%}