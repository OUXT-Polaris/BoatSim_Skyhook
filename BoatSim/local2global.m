function vGlobal = local2global( vLocal, pGlobal )
    yaw = pGlobal(3);
    
    R = [ 
        cos( yaw ), -sin( yaw );
        sin( yaw ),  cos( yaw );
    ];

    T = 1;
    Z = zeros( 2, 1 );
    
    rot = [ R, Z;Z', T ];
    vGlobal = rot * vLocal;
end