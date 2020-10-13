;;;-----------------------------------------------------------------------------
;;; This file is the interface to the struct Color in raylib.
;;;-----------------------------------------------------------------------------

(c-declare #<<c-declare-end

#include "raylib.h"

Color MakeColor( unsigned char r, 
                 unsigned char g, 
                 unsigned char b,
                 unsigned char a )
{
    return (Color){ r, g, b, a };
}

___SCMOBJ SCMOBJ_to_COLOR( ___PSD ___SCMOBJ src, Color *dst, int arg_num )
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
      ___BEGIN_CFUN_SCMOBJ_TO_U8( car, dst->r, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_U8( cadr, dst->g, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_U8( caddr, dst->b, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_U8( cadddr, dst->a, arg_num )
      ___END_CFUN_SCMOBJ_TO_U8( cadddr, dst->a, arg_num )
      ___END_CFUN_SCMOBJ_TO_U8( caddr, dst->b, arg_num )
      ___END_CFUN_SCMOBJ_TO_U8( cadr, dst->g, arg_num )
      ___END_CFUN_SCMOBJ_TO_U8( car, dst->r, arg_num )
    }
  return ___err;
}

___SCMOBJ COLOR_to_SCMOBJ( ___processor_state ___ps, Color src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  ___SCMOBJ r_color_obj;
  ___SCMOBJ g_color_obj;
  ___SCMOBJ b_color_obj;
  ___SCMOBJ a_color_obj;
  ___BEGIN_SFUN_U8_TO_SCMOBJ( src.r, r_color_obj, arg_num )
  ___BEGIN_SFUN_U8_TO_SCMOBJ( src.g, g_color_obj, arg_num )
  ___BEGIN_SFUN_U8_TO_SCMOBJ( src.b, b_color_obj, arg_num )
  ___BEGIN_SFUN_U8_TO_SCMOBJ( src.a, a_color_obj, arg_num )
  a_color_obj = ___EXT( ___make_pair ) ( ___ps, a_color_obj, ___NUL );
  b_color_obj = ___EXT( ___make_pair ) ( ___ps, b_color_obj, a_color_obj );
  g_color_obj = ___EXT( ___make_pair ) ( ___ps, g_color_obj, b_color_obj );
  *dst = ___EXT( ___make_pair ) ( ___ps, r_color_obj, g_color_obj );
  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */
  ___END_SFUN_U8_TO_SCMOBJ( src.a, a_color_obj, arg_num )
  ___END_SFUN_U8_TO_SCMOBJ( src.b, b_color_obj, arg_num )
  ___END_SFUN_U8_TO_SCMOBJ( src.g, g_color_obj, arg_num )
  ___END_SFUN_U8_TO_SCMOBJ( src.r, r_color_obj, arg_num )
  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_COLOR(src,dst,i) \
if ((___err = SCMOBJ_to_COLOR (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_COLOR(src,dst,i) }

#define ___BEGIN_CFUN_COLOR_to_SCMOBJ(src,dst) \
if ((___err = COLOR_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_COLOR_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_COLOR_to_SCMOBJ(src,dst,i) \
if ((___err = COLOR_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_COLOR_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_COLOR(src,dst) \
{ ___err = SCMOBJ_to_COLOR (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_COLOR(src,dst) }

c-declare-end
)

(c-define-type color "Color" "COLOR_to_SCMOBJ" "SCMOBJ_to_COLOR" #f)

(define make-color (c-lambda (unsigned-int8 unsigned-int8 unsigned-int8 unsigned-int8)
  color "MakeColor"))
