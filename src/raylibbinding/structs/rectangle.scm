;;;-----------------------------------------------------------------------------
;;; This file is the interface to the struct Rectangle in raylib.
;;;-----------------------------------------------------------------------------

(c-declare #<<c-declare-end

#include "raylib.h"

Rectangle MakeRectangle( float x, float y, float width, float height )
{
    return (Rectangle){ x, y, width, height };
}

___SCMOBJ SCMOBJ_to_RECTANGLE( ___PSD ___SCMOBJ src, Rectangle *dst, int arg_num )
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
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( caddr, dst->width, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( cadddr, dst->height, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( cadddr, dst->height, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( caddr, dst->width, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( cadr, dst->y, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( car, dst->x, arg_num )
    }
  return ___err;
}

___SCMOBJ RECTANGLE_to_SCMOBJ( ___processor_state ___ps, Rectangle src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  ___SCMOBJ x_rect_obj;
  ___SCMOBJ y_rect_obj;
  ___SCMOBJ width_rect_obj;
  ___SCMOBJ height_rect_obj;
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.x, x_rect_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.y, y_rect_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.width, width_rect_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.height, height_rect_obj, arg_num )
  height_rect_obj = ___EXT( ___make_pair ) ( ___ps, height_rect_obj, ___NUL );
  width_rect_obj = ___EXT( ___make_pair ) ( ___ps, width_rect_obj, height_rect_obj );
  y_rect_obj = ___EXT( ___make_pair ) ( ___ps, y_rect_obj, width_rect_obj );
  *dst = ___EXT( ___make_pair ) ( ___ps, x_rect_obj, y_rect_obj );
  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.height, height_rect_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.width, width_rect_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.y, y_rect_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.x, x_rect_obj, arg_num )
  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_RECTANGLE(src,dst,i) \
if ((___err = SCMOBJ_to_RECTANGLE (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_RECTANGLE(src,dst,i) }

#define ___BEGIN_CFUN_RECTANGLE_to_SCMOBJ(src,dst) \
if ((___err = RECTANGLE_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_RECTANGLE_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_RECTANGLE_to_SCMOBJ(src,dst,i) \
if ((___err = RECTANGLE_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_RECTANGLE_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_RECTANGLE(src,dst) \
{ ___err = SCMOBJ_to_RECTANGLE (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_RECTANGLE(src,dst) }

c-declare-end
)

(c-define-type rectangle "Rectangle" "RECTANGLE_to_SCMOBJ" "SCMOBJ_to_RECTANGLE" #f)

(define make-rectangle (c-lambda (float float float float) rectangle "MakeRectangle"))
