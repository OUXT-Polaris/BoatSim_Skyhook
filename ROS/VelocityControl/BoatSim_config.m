close all;
clear;

dSamplingPeriod = 0.1;
dScpopeSamplingPeriod = 1;

% ���̑S�� (m)
Length = 7.0;
% ���̑S�� (m)
Width = 2.5;
% ���̎��� (kg)
Mass = 1500;
% ����Yaw�����̊������[�����g (kg.m^2)
% ���x��l�̑ȉ~�̂Ƃ��Ċ������[�����g���v�Z
IoM = ( 1 / 5 ) * Mass * ( ( Length / 2 )^2 + ( Width / 2 )^2 );

% ���̊���W����d�S�܂ł̈ʒu�x�N�g�� (m) 
rg = [ 0;0; ];

% ���̏d�S����D�O�@�̉�]���܂ł̈ʒu�x�N�g�� (m)
OM(1).rb2om = [ -3;-0.5; ];
OM(2).rb2om = [ -3; 0.5; ];

% ���̍R�́i�S���j�W�� (-)
% u����
Du = 1000;
% v����
Dv = 10000;
% r����
Dr = 30000;

% sim( 'BoatSim' );
% 
% cnt_max = length( GlobalPosition );
% 
% if ( ~exist( 'figure', 'dir' ) )
%     mkdir( 'figure' );
% end
% 
% TimeGain = 5;
% for cnt = 1:cnt_max
%     hold off;
% 
%     % �D�̏d�S�̋O��
%     plot( GlobalPosition(1:cnt,2), -GlobalPosition(1:cnt,3) ); hold on;
% 
%     % �D�̈ʒu/����
%     buff = rotation( GlobalPosition(cnt,4) ) * [ 5;0; ];
%     scatter( GlobalPosition(cnt,2), -GlobalPosition(cnt,3) );
%     plot( ...
%         [ GlobalPosition(cnt,2);GlobalPosition(cnt,2) + buff(1) ], ...
%         -[ GlobalPosition(cnt,3);GlobalPosition(cnt,3) + buff(2) ] ...
%     );
% 
%     % �D�O�@1�̈ʒu/����
%     buff1 = rotation( GlobalPosition(cnt,4) ) * ( OM(1).rb2om );
%     buff2 = rotation( GlobalPosition(cnt,4) ) * ( OM(1).rb2om + rotation( SteerAngle1(cnt,2) ) * ( - Thrust1(cnt,2:3)' / 1000 ) );
%     scatter( GlobalPosition(cnt,2) + buff1(1), -( GlobalPosition(cnt,3) + buff1(2) ) );
%     plot( ... 
%         [ GlobalPosition(cnt,2) + buff1(1);GlobalPosition(cnt,2) + buff2(1) ], ...
%         -[ GlobalPosition(cnt,3) + buff1(2);GlobalPosition(cnt,3) + buff2(2) ] ...
%     );
% 
%     % �D�O�@1�̈ʒu/����
%     buff1 = rotation( GlobalPosition(cnt,4) ) * ( OM(2).rb2om );
%     buff2 = rotation( GlobalPosition(cnt,4) ) * ( OM(2).rb2om + rotation( SteerAngle2(cnt,2) ) * ( - Thrust2(cnt,2:3)' / 1000 ) );
%     scatter( GlobalPosition(cnt,2) + buff1(1), -( GlobalPosition(cnt,3) + buff1(2) ) );
%     plot( ... 
%         [ GlobalPosition(cnt,2) + buff1(1);GlobalPosition(cnt,2) + buff2(1) ], ...
%         -[ GlobalPosition(cnt,3) + buff1(2);GlobalPosition(cnt,3) + buff2(2) ] ...
%     );
% 
%     axis equal;
%     axis([-5,8,-5,5]);
%     pause(dScpopeSamplingPeriod/TimeGain);
% %     saveas( figure(1),strcat( 'figure/', num2str( cnt ) ), 'png' );
% end

