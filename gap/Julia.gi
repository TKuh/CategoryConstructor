# SPDX-License-Identifier: GPL-2.0-or-later
# CategoryConstructor: Construct categories out of given ones
#
# Implementations
#

##
InstallOtherMethod( PreCompose,
        "for a julia object",
        [ IsJuliaObject ],
        
  function( L )
    
    return PreCompose( ConvertJuliaToGAP( L ) );
    
end );

##
InstallOtherMethod( CanCompute,
        "for a julia object",
        [ IsCapCategory, IsJuliaObject ],
        
  function( C, oper )
    
    return CanCompute( C, ConvertJuliaToGAP( oper ) );
    
end );
