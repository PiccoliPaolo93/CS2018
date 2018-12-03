A=[6 1 -2 2 1;1 3 1 -2 0;-2 1 4 -1 -1;2 -2 -1 4 2;1 0 -1 2 3]
b=[15;2;3;21;21]

R=myCholeski(A);

y=forSub(R',b);
x=backSub(R,y)