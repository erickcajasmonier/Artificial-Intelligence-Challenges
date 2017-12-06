function inputPanel(action)
    global write;
    matDim = 16;

    if nargin == 0
        action = 'start';
    end

    switch(action)
    case 'start',
        clf;
        figure(1);
        t = title('Ericks Team');
        t.Color='red';
        axis([0 matDim 0 matDim]); 
        box on;                    
        set(gcf, 'WindowButtonDownFcn', 'inputPanel down'); 
    case 'down',
        set(gcf, 'WindowButtonMotionFcn', 'inputPanel move');   
        set(gcf, 'WindowButtonUpFcn', 'inputPanel up');         
    case 'move',
        currPt = get(gca, 'CurrentPoint');
        x = fix(currPt(1,1));
        y = fix(currPt(1,2));
        write(x+1, y+1) = 1;
        plot(x, y, 'o', 'MarkerSize', 15, 'LineWidth', 15);
        axis([0 matDim 0 matDim]);
        hold on;
    case 'up',
        set(gcf, 'WindowButtonMotionFcn', '');  
        set(gcf, 'WindowButtonUpFcn', '');      
    end