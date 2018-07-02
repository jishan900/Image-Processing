function pixel = smooth(inpic)
prefilterrow = [1 2 1]/4;
prefilter = prefilterrow'*prefilterrow;
pixel = filter2(prefilter, inpic);