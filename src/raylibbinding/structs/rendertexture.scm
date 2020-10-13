;;;-----------------------------------------------------------------------------
;;; This file is the interface to the struct RenderRenderTexture in raylib.
;;;-----------------------------------------------------------------------------

(c-declare #<<c-declare-end

#include "raylib.h"

RenderTexture MakeRenderTexture( unsigned int id,
                                 Texture texture, 
                                 Texture depth,
                                 bool depthTexture )
{
    return (RenderTexture){ id, texture, depth, depthTexture };
}

___SCMOBJ SCMOBJ_to_RENDERTEXTURE( ___PSD ___SCMOBJ src, RenderTexture *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  if ( !___PAIRP( src ) )
    ___err = ___FIX( ___UNKNOWN_ERR );
  else
    {
      ___SCMOBJ id            = ___CAR( src );
      ___SCMOBJ texture       = ___CADR( src );
      ___SCMOBJ depth         = ___CADDR( src );
      ___SCMOBJ depth_texture = ___CADDDR( src );
     
      ___BEGIN_CFUN_SCMOBJ_TO_UINT( id, dst->id, arg_num )
      ___BEGIN_CFUN_SCMOBJ_to_TEXTURE( texture, dst->texture, arg_num )
      ___BEGIN_CFUN_SCMOBJ_to_TEXTURE( depth, dst->depth, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_BOOL( depth_texture, dst->depthTexture, arg_num )

      ___END_CFUN_SCMOBJ_TO_BOOL( depth_texture, dst->depthTexture, arg_num )
      ___END_CFUN_SCMOBJ_to_TEXTURE( depth, dst->depth, arg_num )
      ___END_CFUN_SCMOBJ_to_TEXTURE( texture, dst->texture, arg_num )
      ___END_CFUN_SCMOBJ_TO_UINT( id, dst->id, arg_num )
    }
  return ___err;
}

___SCMOBJ RENDERTEXTURE_to_SCMOBJ( ___processor_state ___ps, RenderTexture src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  ___SCMOBJ id_obj;
  ___SCMOBJ texture_obj;
  ___SCMOBJ depth_obj;
  ___SCMOBJ depth_texture_obj;

  ___BEGIN_SFUN_UINT_TO_SCMOBJ( src.id, id_obj, arg_num )
  ___BEGIN_SFUN_TEXTURE_to_SCMOBJ( src.texture, texture_obj, arg_num )
  ___BEGIN_SFUN_TEXTURE_to_SCMOBJ( src.depth, depth_obj, arg_num )
  ___BEGIN_SFUN_BOOL_TO_SCMOBJ( src.depthTexture, depth_texture_obj, arg_num )

  depth_texture_obj = ___EXT( ___make_pair ) ( ___ps, depth_texture_obj, ___NUL );
  depth_obj = ___EXT( ___make_pair ) ( ___ps, depth_obj, depth_texture_obj );
  texture_obj = ___EXT( ___make_pair ) ( ___ps, texture_obj, depth_obj );
  *dst = ___EXT( ___make_pair ) ( ___ps, id_obj, texture_obj);

  ___END_SFUN_BOOL_TO_SCMOBJ( src.depthTexture, depth_texture_obj, arg_num )
  ___END_SFUN_TEXTURE_to_SCMOBJ( src.depth, depth_obj, arg_num )
  ___END_SFUN_TEXTURE_to_SCMOBJ( src.texture, texture_obj, arg_num )
  ___END_SFUN_UINT_TO_SCMOBJ( src.id, id_obj, arg_num )

  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */

  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_RENDERTEXTURE(src,dst,i) \
if ((___err = SCMOBJ_to_RENDERTEXTURE (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_RENDERTEXTURE(src,dst,i) }

#define ___BEGIN_CFUN_RENDERTEXTURE_to_SCMOBJ(src,dst) \
if ((___err = RENDERTEXTURE_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_RENDERTEXTURE_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_RENDERTEXTURE_to_SCMOBJ(src,dst,i) \
if ((___err = RENDERTEXTURE_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_RENDERTEXTURE_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_RENDERTEXTURE(src,dst) \
{ ___err = SCMOBJ_to_RENDERTEXTURE (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_RENDERTEXTURE(src,dst) }

c-declare-end
)

(c-define-type render-texture "RenderTexture" "RENDERTEXTURE_to_SCMOBJ" "SCMOBJ_to_RENDERTEXTURE" #f)

(define make-render-texture 
  (c-lambda (unsigned-int texture texture bool)
    render-texture "MakeRenderTexture"))
