% 慣性マトリクス
% Input
% m     : 質量 (kg)
% iom   : 慣性モーメント (kg.m^2)
% rg    : 基準座標から重心までの位置ベクトル [ x, y ]' (m)
% Output
% mRB   : 慣性マトリクス (-)
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