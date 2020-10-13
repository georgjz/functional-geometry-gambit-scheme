;;;-----------------------------------------------------------------------------
;;; This file is the interface to the struct BoneInfo in raylib.
;;;-----------------------------------------------------------------------------

(c-declare #<<c-declare-end

#include "raylib.h"

BoneInfo MakeBoneInfo( char *name, int parent )
{
    return (BoneInfo){ name, parent };
}

___SCMOBJ SCMOBJ_to_BONEINFO( ___PSD ___SCMOBJ src, BoneInfo *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  if ( !___PAIRP( src ) )
    ___err = ___FIX( ___UNKNOWN_ERR );
  else
    {
      ___SCMOBJ name   = ___CAR( src );
      ___SCMOBJ parent = ___CADR( src );
     
      ___BEGIN_CFUN_SCMOBJ_TO_POINTER( name, dst->name, false, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_INT( parent, dst->parent, arg_num )

      ___END_CFUN_SCMOBJ_TO_INT( parent, dst->parent, arg_num )
      ___END_CFUN_SCMOBJ_TO_POINTER( name, dst->name, false, arg_num )
    }
  return ___err;
}

___SCMOBJ BONEINFO_to_SCMOBJ( ___processor_state ___ps, BoneInfo src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  ___SCMOBJ name_obj;
  ___SCMOBJ parent_obj;

  ___BEGIN_SFUN_POINTER_TO_SCMOBJ( src.name, ___FAL, 0, name_obj, arg_num )
  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.parent, parent_obj, arg_num )

  parent_obj = ___EXT( ___make_pair ) ( ___ps, parent_obj, ___NUL );
  *dst = ___EXT( ___make_pair ) ( ___ps, name_obj, parent_obj );

  ___END_SFUN_INT_TO_SCMOBJ( src.parent, parent_obj, arg_num )
  ___END_SFUN_POINTER_TO_SCMOBJ( src.name, ___FAL, 0, name_obj, arg_num )

  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */

  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_BONEINFO(src,dst,i) \
if ((___err = SCMOBJ_to_BONEINFO (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_BONEINFO(src,dst,i) }

#define ___BEGIN_CFUN_BONEINFO_to_SCMOBJ(src,dst) \
if ((___err = BONEINFO_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_BONEINFO_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_BONEINFO_to_SCMOBJ(src,dst,i) \
if ((___err = BONEINFO_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_BONEINFO_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_BONEINFO(src,dst) \
{ ___err = SCMOBJ_to_BONEINFO (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_BONEINFO(src,dst) }

c-declare-end
)

(c-define-type bone-info "BoneInfo" "BONEINFO_to_SCMOBJ" "SCMOBJ_to_BONEINFO" #f)

(define make-bone-info 
  (c-lambda ((pointer char) int)
    bone-info "MakeBoneInfo"))
