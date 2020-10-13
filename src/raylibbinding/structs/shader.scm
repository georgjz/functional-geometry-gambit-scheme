;;;-----------------------------------------------------------------------------
;;; This file is the interface to the struct Shader in raylib.
;;;-----------------------------------------------------------------------------

(c-declare #<<c-declare-end

#include "raylib.h"

Shader MakeShader( unsigned int id, int *locs )
{
    return (Shader){ id, locs };
}

___SCMOBJ SCMOBJ_to_SHADER( ___PSD ___SCMOBJ src, Shader *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  if ( !___PAIRP( src ) )
    ___err = ___FIX( ___UNKNOWN_ERR );
  else
    {
      ___SCMOBJ id   = ___CAR( src );
      ___SCMOBJ locs = ___CADR( src );

      ___BEGIN_CFUN_SCMOBJ_TO_UINT( id, dst->id, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_POINTER( locs, dst->locs, false, arg_num )

      ___END_CFUN_SCMOBJ_TO_POINTER( locs, dst->locs, false, arg_num )
      ___END_CFUN_SCMOBJ_TO_UINT( id, dst->id, arg_num )
    }
  return ___err;
}

___SCMOBJ SHADER_to_SCMOBJ( ___processor_state ___ps, Shader src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  ___SCMOBJ id_int_obj;
  ___SCMOBJ locs_obj;

  ___BEGIN_SFUN_UINT_TO_SCMOBJ( src.id, id_int_obj, arg_num )
  ___BEGIN_SFUN_POINTER_TO_SCMOBJ( src.locs, ___FAL, 0, locs_obj, arg_num )

  locs_obj = ___EXT( ___make_pair ) ( ___ps, locs_obj, ___NUL );
  *dst = ___EXT( ___make_pair ) ( ___ps, id_int_obj, locs_obj );

  ___END_SFUN_POINTER_TO_SCMOBJ( src.locs, ___FAL, 0, locs_obj, arg_num )
  ___END_SFUN_UINT_TO_SCMOBJ( src.id, id_int_obj, arg_num )

  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */

  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_SHADER(src,dst,i) \
if ((___err = SCMOBJ_to_SHADER (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_SHADER(src,dst,i) }

#define ___BEGIN_CFUN_SHADER_to_SCMOBJ(src,dst) \
if ((___err = SHADER_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SHADER_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SHADER_to_SCMOBJ(src,dst,i) \
if ((___err = SHADER_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_SHADER_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_SHADER(src,dst) \
{ ___err = SCMOBJ_to_SHADER (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_SHADER(src,dst) }

c-declare-end
)

(c-define-type shader "Shader" "SHADER_to_SCMOBJ" "SCMOBJ_to_SHADER" #f)

(define make-shader
  (c-lambda (unsigned-int (pointer int))
    shader "MakeShader"))
