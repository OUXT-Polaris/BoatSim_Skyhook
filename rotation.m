function R = rotation( angle )
    R = [ 
        cos( angle ), -sin( angle );
        sin( angle ),  cos( angle );
    ];
end