% 遠心力/コリオリ力の項
% Input
% m     : 質量 (kg)
% rg    : 基準座標から重心までの位置ベクトル [ x, y ]' (m)
% v     : 速度ベクトル [ u, v, r ]' (m/s, rad/s)
% Output
% cRB   : 遠心力/コリオリ力の項 (-)
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