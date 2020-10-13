;;;-----------------------------------------------------------------------------
;;; This file is the interface to the struct Transform in raylib.
;;;-----------------------------------------------------------------------------

(c-declare #<<c-declare-end

#include "raylib.h"

Transform MakeTransform( Vector3 translation, Quaternion rotation, Vector3 scale )
{
    return (Transform){ translation, rotation, scale };
}

___SCMOBJ SCMOBJ_to_TRANSFORM( ___PSD ___SCMOBJ src, Transform *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  if ( !___PAIRP( src ) )
    ___err = ___FIX( ___UNKNOWN_ERR );
  else
    {
      ___SCMOBJ translation = ___CAR( src );
      ___SCMOBJ rotation    = ___CADR( src );
      ___SCMOBJ scale       = ___CADDR( src );
     
      ___BEGIN_CFUN_SCMOBJ_to_VECTOR3( translation, dst->translation, arg_num )
      ___BEGIN_CFUN_SCMOBJ_to_VECTOR4( rotation, dst->rotation, arg_num )
      ___BEGIN_CFUN_SCMOBJ_to_VECTOR3( scale, dst->scale, arg_num )

      ___END_CFUN_SCMOBJ_to_VECTOR3( scale, dst->scale, arg_num )
      ___END_CFUN_SCMOBJ_to_VECTOR4( rotation, dst->rotation, arg_num )
      ___END_CFUN_SCMOBJ_to_VECTOR3( translation, dst->translation, arg_num )
    }
  return ___err;
}

___SCMOBJ TRANSFORM_to_SCMOBJ( ___processor_state ___ps, Transform src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  ___SCMOBJ translation_obj;
  ___SCMOBJ rotation_obj;
  ___SCMOBJ scale_obj;

  ___BEGIN_SFUN_VECTOR3_to_SCMOBJ( src.translation, translation_obj, arg_num )
  ___BEGIN_SFUN_VECTOR4_to_SCMOBJ( src.rotation, rotation_obj, arg_num )
  ___BEGIN_SFUN_VECTOR3_to_SCMOBJ( src.scale, scale_obj, arg_num )

  scale_obj = ___EXT( ___make_pair ) ( ___ps, scale_obj, ___NUL );
  rotation_obj = ___EXT( ___make_pair ) ( ___ps, rotation_obj, scale_obj );
  *dst = ___EXT( ___make_pair ) ( ___ps, translation_obj, rotation_obj );

  ___END_SFUN_VECTOR3_to_SCMOBJ( src.scale, scale_obj, arg_num )
  ___END_SFUN_VECTOR4_to_SCMOBJ( src.rotation, rotation_obj, arg_num )
  ___END_SFUN_VECTOR3_to_SCMOBJ( src.translation, translation_obj, arg_num )

  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */

  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_TRANSFORM(src,dst,i) \
if ((___err = SCMOBJ_to_TRANSFORM (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_TRANSFORM(src,dst,i) }

#define ___BEGIN_CFUN_TRANSFORM_to_SCMOBJ(src,dst) \
if ((___err = TRANSFORM_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_TRANSFORM_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_TRANSFORM_to_SCMOBJ(src,dst,i) \
if ((___err = TRANSFORM_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_TRANSFORM_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_TRANSFORM(src,dst) \
{ ___err = SCMOBJ_to_TRANSFORM (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_TRANSFORM(src,dst) }

c-declare-end
)

(c-define-type transform "Transform" "TRANSFORM_to_SCMOBJ" "SCMOBJ_to_TRANSFORM" #f)

(define make-transform 
  (c-lambda (vector3 quaternion vector3)
    transform "MakeTransform"))
