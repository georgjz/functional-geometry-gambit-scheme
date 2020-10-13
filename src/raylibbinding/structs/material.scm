;;;-----------------------------------------------------------------------------
;;; This file is the interface to the struct Material in raylib.
;;;-----------------------------------------------------------------------------

(c-declare #<<c-declare-end

#include "raylib.h"

Material MakeMaterial( Shader shader, MaterialMap *maps, float *params )
{
    return (Material){ shader, maps, params };
}

___SCMOBJ SCMOBJ_to_MATERIAL( ___PSD ___SCMOBJ src, Material *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  if ( !___PAIRP( src ) )
    ___err = ___FIX( ___UNKNOWN_ERR );
  else
    {
      ___SCMOBJ shader = ___CAR( src );
      ___SCMOBJ maps   = ___CADR( src );
      ___SCMOBJ params = ___CADDR( src );
     
      ___BEGIN_CFUN_SCMOBJ_to_SHADER( shader, dst->shader, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_POINTER( maps, dst->maps, false, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_POINTER( params, dst->params, false, arg_num )

      ___END_CFUN_SCMOBJ_TO_POINTER( params, dst->params, false, arg_num )
      ___END_CFUN_SCMOBJ_TO_POINTER( maps, dst->maps, false, arg_num )
      ___END_CFUN_SCMOBJ_to_SHADER( shader, dst->shader, arg_num )
    }
  return ___err;
}

___SCMOBJ MATERIAL_to_SCMOBJ( ___processor_state ___ps, Material src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  ___SCMOBJ shader_obj;
  ___SCMOBJ maps_obj;
  ___SCMOBJ params_obj;

  ___BEGIN_SFUN_SHADER_to_SCMOBJ( src.shader, shader_obj, arg_num )
  ___BEGIN_SFUN_POINTER_TO_SCMOBJ( src.maps, ___FAL, 0, maps_obj, arg_num )
  ___BEGIN_SFUN_POINTER_TO_SCMOBJ( src.params, ___FAL, 0, params_obj, arg_num )

  params_obj = ___EXT( ___make_pair ) ( ___ps, params_obj, ___NUL );
  maps_obj = ___EXT( ___make_pair ) ( ___ps, maps_obj, params_obj );
  *dst = ___EXT( ___make_pair ) ( ___ps, shader_obj, maps_obj );

  ___END_SFUN_POINTER_TO_SCMOBJ( src.params, ___FAL, 0, params_obj, arg_num )
  ___END_SFUN_POINTER_TO_SCMOBJ( src.maps, ___FAL, 0, maps_obj, arg_num )
  ___END_SFUN_SHADER_to_SCMOBJ( src.shader, shader_obj, arg_num )

  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */

  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_MATERIAL(src,dst,i) \
if ((___err = SCMOBJ_to_MATERIAL (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_MATERIAL(src,dst,i) }

#define ___BEGIN_CFUN_MATERIAL_to_SCMOBJ(src,dst) \
if ((___err = MATERIAL_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_MATERIAL_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_MATERIAL_to_SCMOBJ(src,dst,i) \
if ((___err = MATERIAL_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_MATERIAL_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_MATERIAL(src,dst) \
{ ___err = SCMOBJ_to_MATERIAL (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_MATERIAL(src,dst) }

c-declare-end
)

(c-define-type material "Material" "MATERIAL_to_SCMOBJ" "SCMOBJ_to_MATERIAL" #f)

(define make-material 
  (c-lambda (shader (pointer material-map) (pointer float))
    material "MakeMaterial"))

(define deref-material
  (c-lambda ((pointer material) unsigned-int)
    (pointer material) 
    "Material* ptr = &___arg1[ ___arg2 ];
     ___return( ptr );"))
