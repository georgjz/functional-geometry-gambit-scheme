;;;-----------------------------------------------------------------------------
;;; This file is the interface to the struct Vector4 in raylib.
;;;-----------------------------------------------------------------------------

(c-declare #<<c-declare-end

#include "raylib.h"

Vector4 MakeVector4( float x, float y, float z, float w )
{
    return (Vector4){ x, y, z, w };
}

___SCMOBJ SCMOBJ_to_VECTOR4( ___PSD ___SCMOBJ src, Vector4 *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  if ( !___PAIRP( src ) )
    ___err = ___FIX( ___UNKNOWN_ERR );
  else
    {
      ___SCMOBJ car    = ___CAR( src );
      ___SCMOBJ cadr   = ___CADR( src );
      ___SCMOBJ caddr  = ___CADDR( src );
      ___SCMOBJ cadddr = ___CADDDR( src );
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( car, dst->x, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( cadr, dst->y, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( caddr, dst->z, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( cadddr, dst->w, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( cadddr, dst->w, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( caddr, dst->z, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( cadr, dst->y, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( car, dst->x, arg_num )
    }
  return ___err;
}

___SCMOBJ VECTOR4_to_SCMOBJ( ___processor_state ___ps, Vector4 src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  ___SCMOBJ x_vec4_obj;
  ___SCMOBJ y_vec4_obj;
  ___SCMOBJ z_vec4_obj;
  ___SCMOBJ w_vec4_obj;
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.x, x_vec4_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.y, y_vec4_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.z, z_vec4_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.w, w_vec4_obj, arg_num )
  w_vec4_obj = ___EXT( ___make_pair ) ( ___ps, w_vec4_obj, ___NUL );
  z_vec4_obj = ___EXT( ___make_pair ) ( ___ps, z_vec4_obj, w_vec4_obj );
  y_vec4_obj = ___EXT( ___make_pair ) ( ___ps, y_vec4_obj, z_vec4_obj );
  *dst = ___EXT( ___make_pair ) ( ___ps, x_vec4_obj, y_vec4_obj );
  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.w, w_vec4_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.z, z_vec4_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.y, y_vec4_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.x, x_vec4_obj, arg_num )
  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_VECTOR4(src,dst,i) \
if ((___err = SCMOBJ_to_VECTOR4 (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_VECTOR4(src,dst,i) }

#define ___BEGIN_CFUN_VECTOR4_to_SCMOBJ(src,dst) \
if ((___err = VECTOR4_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_VECTOR4_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_VECTOR4_to_SCMOBJ(src,dst,i) \
if ((___err = VECTOR4_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_VECTOR4_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_VECTOR4(src,dst) \
{ ___err = SCMOBJ_to_VECTOR4 (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_VECTOR4(src,dst) }

c-declare-end
)

(c-define-type vector4 "Vector4" "VECTOR4_to_SCMOBJ" "SCMOBJ_to_VECTOR4" #f)

(define make-vector4 (c-lambda (float float float float) vector4 "MakeVector4"))
