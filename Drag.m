% �S���}�g���N�X
% Input
% Du        : X�����̍R�͌W�� (-)
% Dy        : X�����̍R�͌W�� (-)
% Dr        : ���[�����̍R�͌W�� (-)
% Output
% D         : �R�͌W���}�g���N�X (-)
function D = Drag( Du, Dv, Dr )
    D = diag( [ Du, Dv, Dr ] );
end