close all;
clear;

dSamplingPeriod = 0.1;
dScpopeSamplingPeriod = 1;

% 艇の全長 (m)
Length = 7.0;
% 艇の全幅 (m)
Width = 2.5;
% 艇の質量 (kg)
Mass = 1500;
% 艇のYaw方向の慣性モーメント (kg.m^2)
% 密度一様の楕円体として慣性モーメントを計算
IoM = ( 1 / 5 ) * Mass * ( ( Length / 2 )^2 + ( Width / 2 )^2 );

% 艇の基準座標から重心までの位置ベクトル (m) 
rg = [ 0;0; ];

% 艇の重心から船外機の回転軸までの位置ベクトル (m)
OM(1).rb2om = [ -3;-0.5; ];
OM(2).rb2om = [ -3; 0.5; ];

% 艇の抗力（粘性）係数 (-)
% u方向
Du = 1000;
% v方向
Dv = 10000;
% r方向
Dr = 30000;

sim( 'BoatSim' );

cnt_max = length( GlobalPosition );

if ( ~exist( 'figure', 'dir' ) )
    mkdir( 'figure' );
end

TimeGain = 5;
for cnt = 1:cnt_max
    hold off;

    % 船体重心の軌跡
    plot( GlobalPosition(1:cnt,2), -GlobalPosition(1:cnt,3) ); hold on;

    % 船体位置/向き
    buff = rotation( GlobalPosition(cnt,4) ) * [ 5;0; ];
    scatter( GlobalPosition(cnt,2), -GlobalPosition(cnt,3) );
    plot( ...
        [ GlobalPosition(cnt,2);GlobalPosition(cnt,2) + buff(1) ], ...
        -[ GlobalPosition(cnt,3);GlobalPosition(cnt,3) + buff(2) ] ...
    );

    % 船外機1の位置/向き
    buff1 = rotation( GlobalPosition(cnt,4) ) * ( OM(1).rb2om );
    buff2 = rotation( GlobalPosition(cnt,4) ) * ( OM(1).rb2om + rotation( SteerAngle1(cnt,2) ) * ( - Thrust1(cnt,2:3)' / 1000 ) );
    scatter( GlobalPosition(cnt,2) + buff1(1), -( GlobalPosition(cnt,3) + buff1(2) ) );
    plot( ... 
        [ GlobalPosition(cnt,2) + buff1(1);GlobalPosition(cnt,2) + buff2(1) ], ...
        -[ GlobalPosition(cnt,3) + buff1(2);GlobalPosition(cnt,3) + buff2(2) ] ...
    );

    % 船外機1の位置/向き
    buff1 = rotation( GlobalPosition(cnt,4) ) * ( OM(2).rb2om );
    buff2 = rotation( GlobalPosition(cnt,4) ) * ( OM(2).rb2om + rotation( SteerAngle2(cnt,2) ) * ( - Thrust2(cnt,2:3)' / 1000 ) );
    scatter( GlobalPosition(cnt,2) + buff1(1), -( GlobalPosition(cnt,3) + buff1(2) ) );
    plot( ... 
        [ GlobalPosition(cnt,2) + buff1(1);GlobalPosition(cnt,2) + buff2(1) ], ...
        -[ GlobalPosition(cnt,3) + buff1(2);GlobalPosition(cnt,3) + buff2(2) ] ...
    );

    axis equal;
    axis([-5,8,-5,5]);
    pause(dScpopeSamplingPeriod/TimeGain);
%     saveas( figure(1),strcat( 'figure/', num2str( cnt ) ), 'png' );
end

