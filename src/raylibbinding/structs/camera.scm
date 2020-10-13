;;;-----------------------------------------------------------------------------
;;; This file is the interface to the struct Camera in raylib.
;;;-----------------------------------------------------------------------------

(c-declare #<<c-declare-end

#include "raylib.h"

Camera MakeCamera( Vector3 position, 
                   Vector3 target, 
                   Vector3 up, 
                   float fovy, 
                   int type )
{
    return (Camera){ position, target, up, fovy, type };
}

___SCMOBJ SCMOBJ_to_CAMERA( ___PSD ___SCMOBJ src, Camera *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  if ( !___PAIRP( src ) )
    ___err = ___FIX( ___UNKNOWN_ERR );
  else
    {
      ___SCMOBJ car     = ___CAR( src );
      ___SCMOBJ cadr    = ___CADR( src );
      ___SCMOBJ caddr   = ___CADDR( src );
      ___SCMOBJ cadddr  = ___CADDDR( src );
      ___SCMOBJ caddddr = ___CAR( ___CDDDDR( src ) );
      ___BEGIN_CFUN_SCMOBJ_to_VECTOR3( car, dst->position, arg_num )
      ___BEGIN_CFUN_SCMOBJ_to_VECTOR3( cadr, dst->target, arg_num )
      ___BEGIN_CFUN_SCMOBJ_to_VECTOR3( caddr, dst->up, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( cadddr, dst->fovy, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_INT( caddddr, dst->type, arg_num )

      ___END_CFUN_SCMOBJ_TO_INT( caddddr, dst->type, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( cadddr, dst->fovy, arg_num )
      ___END_CFUN_SCMOBJ_to_VECTOR3( caddr, dst->up, arg_num )
      ___END_CFUN_SCMOBJ_to_VECTOR3( cadr, dst->target, arg_num )
      ___END_CFUN_SCMOBJ_to_VECTOR3( car, dst->position, arg_num )
    }
  return ___err;
}

___SCMOBJ CAMERA_to_SCMOBJ( ___processor_state ___ps, Camera src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  ___SCMOBJ pos_vec3_obj;
  ___SCMOBJ target_vec3_obj;
  ___SCMOBJ up_vec3_obj;
  ___SCMOBJ fovy_float_obj;
  ___SCMOBJ type_int_obj;
  
  // get data
  ___BEGIN_SFUN_VECTOR3_to_SCMOBJ( src.position, pos_vec3_obj, arg_num )
  ___BEGIN_SFUN_VECTOR3_to_SCMOBJ( src.target, target_vec3_obj, arg_num )
  ___BEGIN_SFUN_VECTOR3_to_SCMOBJ( src.up, up_vec3_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.fovy, fovy_float_obj, arg_num )
  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.type, type_int_obj, arg_num )

  // create list
  type_int_obj = ___EXT( ___make_pair ) ( ___ps, type_int_obj, ___NUL );
  fovy_float_obj = ___EXT( ___make_pair ) ( ___ps, fovy_float_obj, type_int_obj );
  up_vec3_obj = ___EXT( ___make_pair ) ( ___ps, up_vec3_obj, fovy_float_obj );
  target_vec3_obj = ___EXT( ___make_pair ) ( ___ps, target_vec3_obj, up_vec3_obj );
  *dst = ___EXT( ___make_pair ) ( ___ps, pos_vec3_obj, target_vec3_obj );

  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */

  // clear data
  ___END_SFUN_INT_TO_SCMOBJ( src.type, type_int_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.fovy, fovy_float_obj, arg_num )
  ___END_SFUN_VECTOR3_to_SCMOBJ( src.up, up_vec3_obj, arg_num )
  ___END_SFUN_VECTOR3_to_SCMOBJ( src.target, target_vec3_obj, arg_num )
  ___END_SFUN_VECTOR3_to_SCMOBJ( src.position, pos_vec3_obj, arg_num )

  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_CAMERA(src,dst,i) \
if ((___err = SCMOBJ_to_CAMERA (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_CAMERA(src,dst,i) }

#define ___BEGIN_CFUN_CAMERA_to_SCMOBJ(src,dst) \
if ((___err = CAMERA_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_CAMERA_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_CAMERA_to_SCMOBJ(src,dst,i) \
if ((___err = CAMERA_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_CAMERA_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_CAMERA(src,dst) \
{ ___err = SCMOBJ_to_CAMERA (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_CAMERA(src,dst) }

c-declare-end
)

(c-define-type camera "Camera" "CAMERA_to_SCMOBJ" "SCMOBJ_to_CAMERA" #f)

(define make-camera 
  (c-lambda (vector3 vector3 vector3 float int) 
    camera "MakeCamera"))