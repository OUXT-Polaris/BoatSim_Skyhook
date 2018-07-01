% �����}�g���N�X
% Input
% m     : ���� (kg)
% iom   : �������[�����g (kg.m^2)
% rg    : ����W����d�S�܂ł̈ʒu�x�N�g�� [ x, y ]' (m)
% Output
% mRB   : �����}�g���N�X (-)
function mRB = Inertia( m, iom, rg )
    mbuff = [
        -m * rg(2);
        m * rg(1);
    ];
 
    mRB = [
        m * eye( 2 ), mbuff;
        mbuff', iom;
    ];
end