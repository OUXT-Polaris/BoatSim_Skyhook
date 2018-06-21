% ���S��/�R���I���͂̍�
% Input
% m     : ���� (kg)
% rg    : ����W����d�S�܂ł̈ʒu�x�N�g�� [ x, y ]' (m)
% v     : ���x�x�N�g�� [ u, v, r ]' (m/s, rad/s)
% Output
% cRB   : ���S��/�R���I���͂̍� (-)
function cRB = CentrifugalAndCoriolis( m, rg, v )
    cbuff1 = [
        -m * ( rg(1) * v(3) + v(2) );
        -m * ( rg(2) * v(3) - v(1) );
    ];
 
    cbuff2 = 0;
 
    cRB = [
        zeros( 2, 2 ), cbuff1;
        -cbuff1', cbuff2
   ];
end