# Mohr circle problems
# Functions
$pi = 4*atan2(1,1);
sub Mohr{
    # Mohr circle of stress
    my $sx = @_[0]; # sigma_x
    my $sy = @_[1]; # sigma_y
    my $sxy = @_[2]; # tau_xy
    my $C = ($sx + $sy)/2;
    my $D = ($sx - $sy)/2;
    my $R = $D**2 + $sxy**2 ;
    if ($R != 0) {
        $R = sqrt($R);
    };
    my $s1 = $C + $R;
    my $s2 = $C - $R;
    my $phip = $pi/4; # if D==0, then on circle: 2*phip=pi/2
    if ($D != 0) {
        $phip = atan2($sxy,$D) / 2; #divide by 2 to take to stress element
    }
    my $phis = $pi/4 + $phip; # angle to max. shear
    my @ans = ($s1,$s2,$R,$phip*180/$pi,$phis*180/$pi);
    return @ans;
};
# data
$sx = 400;
$sy = 100;
$sxy = -200;

# Answers
my @ans = Mohr($sx,$sy,$sxy);
my $s1 = @ans[0];
my $s2 = @ans[1];
my $R = @ans[2];
my $phip = @ans[3];
my $phis = @ans[4];

# Rounded to display answers after the due date
$s1_fmtd = sprintf("%.4f", $s1);
$s2_fmtd = sprintf("%.4f", $s2);
$R_fmtd = sprintf("%.4f", $R);
$phip_fmtd = sprintf("%.4f", $phip);
$phis_fmtd = sprintf("%.4f", $phis);
print "$s1_fmtd, $s2_fmtd, $R_fmtd, $phip_fmtd";
