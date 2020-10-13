;;;-----------------------------------------------------------------------------
;;; This file is the interface to the struct Vector2 in raylib.
;;;-----------------------------------------------------------------------------

(c-declare #<<c-declare-end

#include "raylib.h"

Vector2 MakeVector2( float x, float y )
{
    return (Vector2){ x, y };
}

___SCMOBJ SCMOBJ_to_VECTOR2( ___PSD ___SCMOBJ src, Vector2 *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  if ( !___PAIRP( src ) )
    ___err = ___FIX( ___UNKNOWN_ERR );
  else
    {
      ___SCMOBJ car    = ___CAR( src );
      ___SCMOBJ cadr   = ___CADR( src );
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( car, dst->x, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( cadr, dst->y, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( cadr, dst->y, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( car, dst->x, arg_num )
    }
  return ___err;
}

___SCMOBJ VECTOR2_to_SCMOBJ( ___processor_state ___ps, Vector2 src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  ___SCMOBJ x_vec2_obj;
  ___SCMOBJ y_vec2_obj;
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.x, x_vec2_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.y, y_vec2_obj, arg_num )
  y_vec2_obj = ___EXT( ___make_pair ) ( ___ps, y_vec2_obj, ___NUL );
  *dst = ___EXT( ___make_pair ) ( ___ps, x_vec2_obj, y_vec2_obj );
  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.y, y_vec2_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.x, x_vec2_obj, arg_num )
  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_VECTOR2(src,dst,i) \
if ((___err = SCMOBJ_to_VECTOR2 (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_VECTOR2(src,dst,i) }

#define ___BEGIN_CFUN_VECTOR2_to_SCMOBJ(src,dst) \
if ((___err = VECTOR2_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_VECTOR2_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_VECTOR2_to_SCMOBJ(src,dst,i) \
if ((___err = VECTOR2_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_VECTOR2_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_VECTOR2(src,dst) \
{ ___err = SCMOBJ_to_VECTOR2 (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_VECTOR2(src,dst) }

c-declare-end
)

(c-define-type vector2 "Vector2" "VECTOR2_to_SCMOBJ" "SCMOBJ_to_VECTOR2" #f)

(define make-vector2 (c-lambda (float float) vector2 "MakeVector2"))
