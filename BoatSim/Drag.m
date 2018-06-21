% 粘性マトリクス
% Input
% Du        : X方向の抗力係数 (-)
% Dy        : X方向の抗力係数 (-)
% Dr        : ヨー方向の抗力係数 (-)
% Output
% D         : 抗力係数マトリクス (-)
function D = Drag( Du, Dv, Dr )
    D = diag( [ Du, Dv, Dr ] );
end