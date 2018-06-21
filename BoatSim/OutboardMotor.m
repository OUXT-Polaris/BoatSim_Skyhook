% 船外機による力/モーメント
% Input
% Thrust        : スラストベクトル [ T, 0 ]' (N)
% SteerAngle    : ステアリング角 (rad)
% rg            : 基準座標から重心までの位置ベクトル [ x, y ]' (m)
% rb2om         : 艇の重心から船外機の回転軸までの位置ベクトル (m)
% Output
% ThrustVector  : スラストにより船体の重心周りに作用する力/モーメント (N, N.m)
function ThrustVector = OutboardMotor( Thrust, SteerAngle, rg, rb2om )
    % 船外機座標から船体座標への回転行列
    R = [ 
        cos( SteerAngle ), -sin( SteerAngle );
        sin( SteerAngle ),  cos( SteerAngle );
    ];
    
    % 船体から見た力の向き
    ForceVector = R * Thrust;
    % 船体から見た力の作用点
    PositionVector = rb2om - rg;
    
    % 力/モーメントの計算
    ThrustVector = [
        ForceVector;
        PositionVector(1) * ForceVector(2) - PositionVector(2) * ForceVector(1); % 2次元でのクロス積
    ];
end