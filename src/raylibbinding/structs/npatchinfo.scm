;;;-----------------------------------------------------------------------------
;;; This file is the interface to the struct RenderNPatchInfo in raylib.
;;;-----------------------------------------------------------------------------

(c-declare #<<c-declare-end

#include "raylib.h"

NPatchInfo MakeNPatchInfo( Rectangle sourceRec,
                           int left, int top,
                           int right, int bottom,
                           int type )
{
    return (NPatchInfo){ sourceRec, left, top, right, bottom, type };
}

___SCMOBJ SCMOBJ_to_NPATCHINFO( ___PSD ___SCMOBJ src, NPatchInfo *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  if ( !___PAIRP( src ) )
    ___err = ___FIX( ___UNKNOWN_ERR );
  else
    {
      ___SCMOBJ source_rec    = ___CAR( src );
      ___SCMOBJ left          = ___CADR( src );
      ___SCMOBJ top           = ___CADDR( src );
      ___SCMOBJ right         = ___CADDDR( src );
      ___SCMOBJ bottom        = ___CAR( ___CDDDDR( src ) );
      ___SCMOBJ type          = ___CADR( ___CDDDDR( src ) );
     
      ___BEGIN_CFUN_SCMOBJ_to_RECTANGLE( source_rec, dst->sourceRec, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_INT( left, dst->left, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_INT( top, dst->top, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_INT( right, dst->right, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_INT( bottom, dst->bottom, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_INT( type, dst->type, arg_num )

      ___END_CFUN_SCMOBJ_TO_INT( bottom, dst->bottom, arg_num )
      ___END_CFUN_SCMOBJ_TO_INT( right, dst->right, arg_num )
      ___END_CFUN_SCMOBJ_TO_INT( top, dst->top, arg_num )
      ___END_CFUN_SCMOBJ_TO_INT( type, dst->type, arg_num )
      ___END_CFUN_SCMOBJ_TO_INT( left, dst->left, arg_num )
      ___END_CFUN_SCMOBJ_to_RECTANGLE( source_rec, dst->sourceRec, arg_num )

    }
  return ___err;
}

___SCMOBJ NPATCHINFO_to_SCMOBJ( ___processor_state ___ps, NPatchInfo src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  ___SCMOBJ source_rec_obj;
  ___SCMOBJ left_obj;
  ___SCMOBJ top_obj;
  ___SCMOBJ right_obj;
  ___SCMOBJ bottom_obj;
  ___SCMOBJ type_obj;

  ___BEGIN_SFUN_RECTANGLE_to_SCMOBJ( src.sourceRec, source_rec_obj, arg_num )
  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.left, left_obj, arg_num )
  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.top, top_obj, arg_num )
  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.right, right_obj, arg_num )
  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.bottom, bottom_obj, arg_num )
  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.type, type_obj, arg_num )

  type_obj = ___EXT( ___make_pair ) ( ___ps, type_obj, ___NUL );
  bottom_obj = ___EXT( ___make_pair ) ( ___ps, bottom_obj, type_obj );
  right_obj = ___EXT( ___make_pair ) ( ___ps, right_obj, bottom_obj );
  top_obj = ___EXT( ___make_pair ) ( ___ps, top_obj, right_obj );
  *dst = ___EXT( ___make_pair ) ( ___ps, left_obj, top_obj );

  ___END_SFUN_INT_TO_SCMOBJ( src.type, type_obj, arg_num )
  ___END_SFUN_INT_TO_SCMOBJ( src.bottom, bottom_obj, arg_num )
  ___END_SFUN_INT_TO_SCMOBJ( src.right, right_obj, arg_num )
  ___END_SFUN_INT_TO_SCMOBJ( src.top, top_obj, arg_num )
  ___END_SFUN_INT_TO_SCMOBJ( src.left, left_obj, arg_num )
  ___END_SFUN_RECTANGLE_to_SCMOBJ( src.sourceRec, source_rec_obj, arg_num )

  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */

  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_NPATCHINFO(src,dst,i) \
if ((___err = SCMOBJ_to_NPATCHINFO (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_NPATCHINFO(src,dst,i) }

#define ___BEGIN_CFUN_NPATCHINFO_to_SCMOBJ(src,dst) \
if ((___err = NPATCHINFO_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_NPATCHINFO_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_NPATCHINFO_to_SCMOBJ(src,dst,i) \
if ((___err = NPATCHINFO_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_NPATCHINFO_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_NPATCHINFO(src,dst) \
{ ___err = SCMOBJ_to_NPATCHINFO (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_NPATCHINFO(src,dst) }

c-declare-end
)

(c-define-type n-patch-info "NPatchInfo" "NPATCHINFO_to_SCMOBJ" "SCMOBJ_to_NPATCHINFO" #f)

(define make-n-patch-info 
  (c-lambda (rectangle int int int int int)
    n-patch-info "MakeNPatchInfo"))
