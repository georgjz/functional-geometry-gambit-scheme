;;;-----------------------------------------------------------------------------
;;; This file is the interface to the struct Camera2D in raylib.
;;;-----------------------------------------------------------------------------

(c-declare #<<c-declare-end

#include "raylib.h"

Camera2D MakeCamera2D( Vector2 offset, 
                       Vector2 target, 
                       float rotation, 
                       float zoom )
{
    return (Camera2D){ offset, target, rotation, zoom };
}

___SCMOBJ SCMOBJ_to_CAMERA2D( ___PSD ___SCMOBJ src, Camera2D *dst, int arg_num )
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
      ___BEGIN_CFUN_SCMOBJ_to_VECTOR2( car, dst->offset, arg_num )
      ___BEGIN_CFUN_SCMOBJ_to_VECTOR2( cadr, dst->target, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( caddr, dst->rotation, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( cadddr, dst->zoom, arg_num )

      ___END_CFUN_SCMOBJ_TO_FLOAT( cadddr, dst->zoom, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( caddr, dst->rotation, arg_num )
      ___END_CFUN_SCMOBJ_to_VECTOR2( cadr, dst->target, arg_num )
      ___END_CFUN_SCMOBJ_to_VECTOR2( car, dst->offset, arg_num )
    }
  return ___err;
}

___SCMOBJ CAMERA2D_to_SCMOBJ( ___processor_state ___ps, Camera2D src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  ___SCMOBJ offset_vec2_obj;
  ___SCMOBJ target_vec2_obj;
  ___SCMOBJ rotation_float_obj;
  ___SCMOBJ zoom_float_obj;
  
  // get data
  ___BEGIN_SFUN_VECTOR2_to_SCMOBJ( src.offset, offset_vec2_obj, arg_num )
  ___BEGIN_SFUN_VECTOR2_to_SCMOBJ( src.target, target_vec2_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.rotation, rotation_float_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.zoom, zoom_float_obj, arg_num )

  // create list
  zoom_float_obj = ___EXT( ___make_pair ) ( ___ps, zoom_float_obj, ___NUL );
  rotation_float_obj = ___EXT( ___make_pair ) ( ___ps, rotation_float_obj, zoom_float_obj );
  target_vec2_obj = ___EXT( ___make_pair ) ( ___ps, target_vec2_obj, rotation_float_obj );
  *dst = ___EXT( ___make_pair ) ( ___ps, offset_vec2_obj, target_vec2_obj );

  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */

  // clear data
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.zoom, zoom_float_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.rotation, rotation_float_obj, arg_num )
  ___END_SFUN_VECTOR2_to_SCMOBJ( src.target, target_vec2_obj, arg_num )
  ___END_SFUN_VECTOR2_to_SCMOBJ( src.offset, offset_vec2_obj, arg_num )

  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_CAMERA2D(src,dst,i) \
if ((___err = SCMOBJ_to_CAMERA2D (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_CAMERA2D(src,dst,i) }

#define ___BEGIN_CFUN_CAMERA2D_to_SCMOBJ(src,dst) \
if ((___err = CAMERA2D_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_CAMERA2D_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_CAMERA2D_to_SCMOBJ(src,dst,i) \
if ((___err = CAMERA2D_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_CAMERA2D_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_CAMERA2D(src,dst) \
{ ___err = SCMOBJ_to_CAMERA2D (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_CAMERA2D(src,dst) }

c-declare-end
)

(c-define-type camera-2d "Camera2D" "CAMERA2D_to_SCMOBJ" "SCMOBJ_to_CAMERA2D" #f)

(define make-camera-2d
  (c-lambda (vector2 vector2 float float) 
    camera-2d "MakeCamera2D"))