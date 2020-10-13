;;;-----------------------------------------------------------------------------
;;; This file is the interface to the struct Vector3 in raylib.
;;;-----------------------------------------------------------------------------

(c-declare #<<c-declare-end

#include "raylib.h"

Vector3 MakeVector3( float x, float y, float z )
{
    return (Vector3){ x, y, z };
}

___SCMOBJ SCMOBJ_to_VECTOR3( ___PSD ___SCMOBJ src, Vector3 *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  if ( !___PAIRP( src ) )
    ___err = ___FIX( ___UNKNOWN_ERR );
  else
    {
      ___SCMOBJ car    = ___CAR( src );
      ___SCMOBJ cadr   = ___CADR( src );
      ___SCMOBJ caddr  = ___CADDR( src );
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( car, dst->x, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( cadr, dst->y, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( caddr, dst->z, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( caddr, dst->z, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( cadr, dst->y, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( car, dst->x, arg_num )
    }
  return ___err;
}

___SCMOBJ VECTOR3_to_SCMOBJ( ___processor_state ___ps, Vector3 src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  ___SCMOBJ x_vec3_obj;
  ___SCMOBJ y_vec3_obj;
  ___SCMOBJ z_vec3_obj;
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.x, x_vec3_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.y, y_vec3_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.z, z_vec3_obj, arg_num )
  z_vec3_obj = ___EXT( ___make_pair ) ( ___ps, z_vec3_obj, ___NUL );
  y_vec3_obj = ___EXT( ___make_pair ) ( ___ps, y_vec3_obj, z_vec3_obj );
  *dst = ___EXT( ___make_pair ) ( ___ps, x_vec3_obj, y_vec3_obj );
  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.z, z_vec3_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.y, y_vec3_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.x, x_vec3_obj, arg_num )
  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_VECTOR3(src,dst,i) \
if ((___err = SCMOBJ_to_VECTOR3 (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_VECTOR3(src,dst,i) }

#define ___BEGIN_CFUN_VECTOR3_to_SCMOBJ(src,dst) \
if ((___err = VECTOR3_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_VECTOR3_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_VECTOR3_to_SCMOBJ(src,dst,i) \
if ((___err = VECTOR3_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_VECTOR3_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_VECTOR3(src,dst) \
{ ___err = SCMOBJ_to_VECTOR3 (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_VECTOR3(src,dst) }

c-declare-end
)

(c-define-type vector3 "Vector3" "VECTOR3_to_SCMOBJ" "SCMOBJ_to_VECTOR3" #f)

(define make-vector3 (c-lambda (float float float) vector3 "MakeVector3"))
