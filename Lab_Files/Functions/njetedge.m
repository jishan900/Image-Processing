function edgecurves = njetedge(inpic, scale, threshold, shape)
    
if (nargin == 3)
    shape = 'same';
    Lv = lab3_2ab(inpic, shape);
    Lv = ((Lv-threshold)>0);
else
    shape = 'same';
    Lv = lab3_2ab(inpic, shape);
    
if (nargin < 3)
    shape = 'same';
    Lvvtild = lab3_3b(inpic, shape);
    curves = zerocrosscurves(inpic,Lvvtild);
    pixels = lab3_2ab(inpic, shape);