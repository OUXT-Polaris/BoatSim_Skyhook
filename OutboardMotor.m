% �D�O�@�ɂ���/���[�����g
% Input
% Thrust        : �X���X�g�x�N�g�� [ T, 0 ]' (N)
% SteerAngle    : �X�e�A�����O�p (rad)
% rg            : ����W����d�S�܂ł̈ʒu�x�N�g�� [ x, y ]' (m)
% rb2om         : ���̏d�S����D�O�@�̉�]���܂ł̈ʒu�x�N�g�� (m)
% Output
% ThrustVector  : �X���X�g�ɂ��D�̂̏d�S����ɍ�p�����/���[�����g (N, N.m)
function ThrustVector = OutboardMotor( Thrust, SteerAngle, rg, rb2om )
    % �D�O�@���W����D�̍��W�ւ̉�]�s��
    R = [ 
        cos( SteerAngle ), -sin( SteerAngle );
        sin( SteerAngle ),  cos( SteerAngle );
    ];
    
    % �D�̂��猩���͂̌���
    ForceVector = R * Thrust;
    % �D�̂��猩���͂̍�p�_
    PositionVector = rb2om - rg;
    
    % ��/���[�����g�̌v�Z
    ThrustVector = [
        ForceVector;
        PositionVector(1) * ForceVector(2) - PositionVector(2) * ForceVector(1); % 2�����ł̃N���X��
    ];
end