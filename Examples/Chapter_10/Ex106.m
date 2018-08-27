% Example 10.5, ISBN 1420079159

YZ = [20 0;0 0; 0 20.001]; %nodal coordinates
conect = [1 2 0;2 3 1];    %segment connectivity and contributions
ti = [2 2]; %mm
Ei = [1 1]*210E3; %MPa
nui = [.3 .3];

nn = length(YZ(:,1));      %# of nodes
ns = length(conect(:,1));  %# of segments
Gi = Ei/2./(1+nui);

for i = 1:ns    %for each segment
    no = conect(i,1); %initial node for segment i
    nf = conect(i,2); %final node
    dY = YZ(nf,1)-YZ(no,1);
    dZ = YZ(nf,2)-YZ(no,2);
    bi(i) = ((dY)^2+(dZ)^2)^(1/2);  %length of segment
    alphai(i) = atan(dZ/dY);        %angle of segment
    yi_(i) = (YZ(no,1)+YZ(nf,1))/2; %centroid of each segment
    zi_(i) = (YZ(no,2)+YZ(nf,2))/2;
end

Ai = Ei.*ti     %extension
Bi = [0 0]      %coupling
ebi = Bi./Ai    %neutral axis of bending for the segment
Di = Ei.*ti.^3/12   %bending
Di_ = Di-ebi.^2.*Ai %shifted to neutral axis of bending
Fi = Gi.*ti
Ci = [0 0]
Hi = Gi.*ti.^3/12
eqi = Ci./Fi
Hi_ = Hi-eqi.^2.*Ci %shifted to neutral axis of torsion
EIsi = Di_.*bi      %bending stiffness of segment
EIri = Ai.*bi.^3/12
EIsri = [0 0]       %mechanical product of inertia

m = cos(alphai)
n = sin(alphai)
EIyi = m.^2.*EIsi + n.^2.*EIri
EIzi = n.^2.*EIsi + m.^2.*EIri
EIyzi = (EIri-EIsi).*m.*n %1st ed.

EA  = sum(Ai.*bi)
GJR = 4*sum(Hi_.*bi)
EQy = sum(zi_.*Ai.*bi)
EQz = sum(yi_.*Ai.*bi)

yG_ = EQz/EA
zG_ = EQy/EA

yi = yi_-yG_
zi = zi_-zG_

EIyy = sum(EIyi+Ai.*bi.*(zi+ebi.*m).^2)
EIzz = sum(EIzi+Ai.*bi.*(yi-ebi.*n).^2)
EIyz = sum(EIyzi+Ai.*bi.*(zi+ebi.*m).*(yi-ebi.*n))

theta = 1/2*atan(2*EIyz/(EIzz-EIyy)); %1st ed.
disp(['theta ',num2str(theta*180/pi)])
EInn = 1/2*(EIyy+EIzz) + sqrt((EIyy-EIzz)^2/4+EIyz^2)
EIqq = 1/2*(EIyy+EIzz) - sqrt((EIyy-EIzz)^2/4+EIyz^2)
