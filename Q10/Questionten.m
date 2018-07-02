load canoe256
image(Canoe)
image(Canoe+1)
negcolormapcol=linspace(1,0,256)';
colormap([negcolormapcol negcolormapcol negcolormapcol])
showgrey(Canoe,linspace(1,0,256),0,256)