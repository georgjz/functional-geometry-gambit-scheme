;;;-----------------------------------------------------------------------------
;;; This file is the interface to the struct Texture in raylib.
;;;-----------------------------------------------------------------------------

(c-declare #<<c-declare-end

#include "raylib.h"

Texture MakeTexture( unsigned int id,
                     int width, int height, 
                     int mipmaps, int format )
{
    return (Texture){ id, width, height, mipmaps, format };
}

___SCMOBJ SCMOBJ_to_TEXTURE( ___PSD ___SCMOBJ src, Texture *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  if ( !___PAIRP( src ) )
    ___err = ___FIX( ___UNKNOWN_ERR );
  else
    {
      ___SCMOBJ id      = ___CAR( src );
      ___SCMOBJ width   = ___CADR( src );
      ___SCMOBJ height  = ___CADDR( src );
      ___SCMOBJ mipmaps = ___CADDDR( src );
      ___SCMOBJ format  = ___CAR( ___CDDDDR( src ) );
     
      ___BEGIN_CFUN_SCMOBJ_TO_UINT( id, dst->id, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_INT( width, dst->width, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_INT( height, dst->height, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_INT( mipmaps, dst->mipmaps, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_INT( format, dst->format, arg_num )

      ___END_CFUN_SCMOBJ_TO_INT( format, dst->format, arg_num )
      ___END_CFUN_SCMOBJ_TO_INT( mipmaps, dst->mipmaps, arg_num )
      ___END_CFUN_SCMOBJ_TO_INT( height, dst->height, arg_num )
      ___END_CFUN_SCMOBJ_TO_INT( width, dst->width, arg_num )
      ___END_CFUN_SCMOBJ_TO_UINT( data, dst->data, arg_num )
    }
  return ___err;
}

___SCMOBJ TEXTURE_to_SCMOBJ( ___processor_state ___ps, Texture src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  ___SCMOBJ id_obj;
  ___SCMOBJ width_int_obj;
  ___SCMOBJ height_int_obj;
  ___SCMOBJ mipmaps_int_obj;
  ___SCMOBJ format_int_obj;

  ___BEGIN_SFUN_UINT_TO_SCMOBJ( src.id, id_obj, arg_num )
  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.width, width_int_obj, arg_num )
  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.height, height_int_obj, arg_num )
  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.mipmaps, mipmaps_int_obj, arg_num )
  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.format, format_int_obj, arg_num )

  format_int_obj = ___EXT( ___make_pair ) ( ___ps, format_int_obj, ___NUL );
  mipmaps_int_obj = ___EXT( ___make_pair ) ( ___ps, mipmaps_int_obj, format_int_obj );
  height_int_obj = ___EXT( ___make_pair ) ( ___ps, height_int_obj, mipmaps_int_obj );
  width_int_obj = ___EXT( ___make_pair ) ( ___ps, width_int_obj, height_int_obj );
  *dst = ___EXT( ___make_pair ) ( ___ps, id_obj, width_int_obj );

  ___END_SFUN_INT_TO_SCMOBJ( src.format, format_int_obj, arg_num )
  ___END_SFUN_INT_TO_SCMOBJ( src.mipmaps, mipmaps_int_obj, arg_num )
  ___END_SFUN_INT_TO_SCMOBJ( src.height, height_int_obj, arg_num )
  ___END_SFUN_INT_TO_SCMOBJ( src.width, width_int_obj, arg_num )
  ___END_SFUN_UINT_TO_SCMOBJ( src.id, id_obj, arg_num )

  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */

  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_TEXTURE(src,dst,i) \
if ((___err = SCMOBJ_to_TEXTURE (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_TEXTURE(src,dst,i) }

#define ___BEGIN_CFUN_TEXTURE_to_SCMOBJ(src,dst) \
if ((___err = TEXTURE_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_TEXTURE_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_TEXTURE_to_SCMOBJ(src,dst,i) \
if ((___err = TEXTURE_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_TEXTURE_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_TEXTURE(src,dst) \
{ ___err = SCMOBJ_to_TEXTURE (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_TEXTURE(src,dst) }

c-declare-end
)

(c-define-type texture "Texture" "TEXTURE_to_SCMOBJ" "SCMOBJ_to_TEXTURE" #f)

(define make-texture 
  (c-lambda (unsigned-int int int int int)
    texture "MakeTexture"))
