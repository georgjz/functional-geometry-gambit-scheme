;;;-----------------------------------------------------------------------------
;;; This file is the interface to the struct MaterialMap in raylib.
;;;-----------------------------------------------------------------------------

(c-declare #<<c-declare-end

#include "raylib.h"

MaterialMap MakeMaterialMap( Texture2D texture, Color color, float value )
{
    return (MaterialMap){ texture, color, value };
}

___SCMOBJ SCMOBJ_to_MATERIALMAP( ___PSD ___SCMOBJ src, MaterialMap *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  if ( !___PAIRP( src ) )
    ___err = ___FIX( ___UNKNOWN_ERR );
  else
    {
      ___SCMOBJ texture = ___CAR( src );
      ___SCMOBJ color   = ___CADR( src );
      ___SCMOBJ value   = ___CADDR( src );
     
      ___BEGIN_CFUN_SCMOBJ_to_TEXTURE( texture, dst->texture, arg_num )
      ___BEGIN_CFUN_SCMOBJ_to_COLOR( color, dst->color, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( value, dst->value, arg_num )

      ___END_CFUN_SCMOBJ_TO_FLOAT( value, dst->value, arg_num )
      ___END_CFUN_SCMOBJ_to_COLOR( color, dst->color, arg_num )
      ___END_CFUN_SCMOBJ_to_TEXTURE( texture, dst->texture, arg_num )
    }
  return ___err;
}

___SCMOBJ MATERIALMAP_to_SCMOBJ( ___processor_state ___ps, MaterialMap src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  ___SCMOBJ texture_obj;
  ___SCMOBJ color_obj;
  ___SCMOBJ value_obj;

  ___BEGIN_SFUN_TEXTURE_to_SCMOBJ( src.texture, texture_obj, arg_num )
  ___BEGIN_SFUN_COLOR_to_SCMOBJ( src.color, color_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.value, value_obj, arg_num )

  value_obj = ___EXT( ___make_pair ) ( ___ps, value_obj, ___NUL );
  color_obj = ___EXT( ___make_pair ) ( ___ps, color_obj, value_obj );
  *dst = ___EXT( ___make_pair ) ( ___ps, texture_obj, color_obj );

  ___END_SFUN_FLOAT_TO_SCMOBJ( src.value, value_obj, arg_num )
  ___END_SFUN_COLOR_to_SCMOBJ( src.color, color_obj, arg_num )
  ___END_SFUN_TEXTURE_to_SCMOBJ( src.texture, texture_obj, arg_num )

  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */

  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_MATERIALMAP(src,dst,i) \
if ((___err = SCMOBJ_to_MATERIALMAP (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_MATERIALMAP(src,dst,i) }

#define ___BEGIN_CFUN_MATERIALMAP_to_SCMOBJ(src,dst) \
if ((___err = MATERIALMAP_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_MATERIALMAP_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_MATERIALMAP_to_SCMOBJ(src,dst,i) \
if ((___err = MATERIALMAP_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_MATERIALMAP_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_MATERIALMAP(src,dst) \
{ ___err = SCMOBJ_to_MATERIALMAP (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_MATERIALMAP(src,dst) }

c-declare-end
)

(c-define-type material-map "MaterialMap" "MATERIALMAP_to_SCMOBJ" "SCMOBJ_to_MATERIALMAP" #f)

(define make-material-map 
  (c-lambda (texture color float)
    material-map "MakeMaterialMap"))
