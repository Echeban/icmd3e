// Example 6.1
mode(0) //prints everything not suppressed with ;
exec('C:/Users/EJB/OneDrive/Scilab/CLT.sci',0);//include CLT.sci
// from Example 5.1 
E1 = 19981; E2 = 11389; G12 = 3789; v12 = 0.274; v23 = 0.385;
// calculate
Q = buildQ(E1,E2,G12,v12)
G23 = E2/2/(1+v23);
G13 = G12;
rotateQ(Q,55)// @ 55
rotateQ(Q,-55)// @ -55
thickness = [0.635,0.635];//mm
orientation = [55,-55];//degrees
[A,B,D] = buildABD(Q,thickness,orientation)
Qast = [[G23,0];[0,G13]]
rotateQast(Qast,55)// @ 55
rotateQast(Qast,-55)// @ -55
H = buildH(Qast,thickness,orientation)




