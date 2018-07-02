load canoe256
image(Canoe)
negtransf=(255:-1:0)';
showgrey(Canoe)
neg3=compose(negtransf,Canoe+1);
diff=neg3-neg2;