;;;-----------------------------------------------------------------------------
;;; This file is the interface to the struct Image in raylib.
;;;-----------------------------------------------------------------------------

(c-declare #<<c-declare-end

#include "raylib.h"

Image MakeImage( void *data, 
                 int width, int height, 
                 int mipmaps, int format )
{
    return (Image){ data, width, height, mipmaps, format };
}

___SCMOBJ SCMOBJ_to_IMAGE( ___PSD ___SCMOBJ src, Image *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  if ( !___PAIRP( src ) )
    ___err = ___FIX( ___UNKNOWN_ERR );
  else
    {
      ___SCMOBJ data    = ___CAR( src );
      ___SCMOBJ width   = ___CADR( src );
      ___SCMOBJ height  = ___CADDR( src );
      ___SCMOBJ mipmaps = ___CADDDR( src );
      ___SCMOBJ format  = ___CAR( ___CDDDDR( src ) );
     
      ___BEGIN_CFUN_SCMOBJ_TO_POINTER( data, dst->data, false, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_INT( width, dst->width, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_INT( height, dst->height, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_INT( mipmaps, dst->mipmaps, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_INT( format, dst->format, arg_num )

      ___END_CFUN_SCMOBJ_TO_INT( format, dst->format, arg_num )
      ___END_CFUN_SCMOBJ_TO_INT( mipmaps, dst->mipmaps, arg_num )
      ___END_CFUN_SCMOBJ_TO_INT( height, dst->height, arg_num )
      ___END_CFUN_SCMOBJ_TO_INT( width, dst->width, arg_num )
      ___END_CFUN_SCMOBJ_TO_POINTER( data, dst->data, false, arg_num )
    }
  return ___err;
}

___SCMOBJ IMAGE_to_SCMOBJ( ___processor_state ___ps, Image src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  ___SCMOBJ data_obj;
  ___SCMOBJ width_int_obj;
  ___SCMOBJ height_int_obj;
  ___SCMOBJ mipmaps_int_obj;
  ___SCMOBJ format_int_obj;

  ___BEGIN_SFUN_POINTER_TO_SCMOBJ( src.data, ___FAL, 0, data_obj, arg_num );
  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.width, width_int_obj, arg_num )
  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.height, height_int_obj, arg_num )
  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.mipmaps, mipmaps_int_obj, arg_num )
  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.format, format_int_obj, arg_num )

  format_int_obj = ___EXT( ___make_pair ) ( ___ps, format_int_obj, ___NUL );
  mipmaps_int_obj = ___EXT( ___make_pair ) ( ___ps, mipmaps_int_obj, format_int_obj );
  height_int_obj = ___EXT( ___make_pair ) ( ___ps, height_int_obj, mipmaps_int_obj );
  width_int_obj = ___EXT( ___make_pair ) ( ___ps, width_int_obj, height_int_obj );
  *dst = ___EXT( ___make_pair ) ( ___ps, data_obj, width_int_obj );

  ___END_SFUN_INT_TO_SCMOBJ( src.format, format_int_obj, arg_num )
  ___END_SFUN_INT_TO_SCMOBJ( src.mipmaps, mipmaps_int_obj, arg_num )
  ___END_SFUN_INT_TO_SCMOBJ( src.height, height_int_obj, arg_num )
  ___END_SFUN_INT_TO_SCMOBJ( src.width, width_int_obj, arg_num )
  ___END_SFUN_POINTER_TO_SCMOBJ( src.data, ___FAL, 0, data_obj, arg_num )

  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */

  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_IMAGE(src,dst,i) \
if ((___err = SCMOBJ_to_IMAGE (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_IMAGE(src,dst,i) }

#define ___BEGIN_CFUN_IMAGE_to_SCMOBJ(src,dst) \
if ((___err = IMAGE_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_IMAGE_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_IMAGE_to_SCMOBJ(src,dst,i) \
if ((___err = IMAGE_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_IMAGE_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_IMAGE(src,dst) \
{ ___err = SCMOBJ_to_IMAGE (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_IMAGE(src,dst) }

c-declare-end
)

(c-define-type image "Image" "IMAGE_to_SCMOBJ" "SCMOBJ_to_IMAGE" #f)

(define make-image 
  (c-lambda ((pointer void) int int int int)
    image "MakeImage"))
