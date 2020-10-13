;;;-----------------------------------------------------------------------------
;;; This file is the interface to the struct ModelAnimation in raylib.
;;;-----------------------------------------------------------------------------

(c-declare #<<c-declare-end

#include "raylib.h"

ModelAnimation MakeModelAnimation( int boneCount, BoneInfo *bones,
                                   int frameCount, Transform **framePoses )
{
    return (ModelAnimation){ boneCount, bones, frameCount, framePoses };
}

___SCMOBJ SCMOBJ_to_MODELANIMATION( ___PSD ___SCMOBJ src, ModelAnimation *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  if ( !___PAIRP( src ) )
    ___err = ___FIX( ___UNKNOWN_ERR );
  else
    {
      ___SCMOBJ bone_count  = ___CAR( src );
      ___SCMOBJ bones       = ___CADR( src );
      ___SCMOBJ frame_count = ___CADDR( src );
      ___SCMOBJ frame_poses = ___CADDDR( src );

      ___BEGIN_CFUN_SCMOBJ_TO_INT( bone_count, dst->boneCount, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_POINTER( bones, dst->bones, false, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_INT( frame_count, dst->frameCount, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_POINTER( frame_poses, dst->framePoses, false, arg_num )

      ___END_CFUN_SCMOBJ_TO_POINTER( frame_poses, dst->framePoses, false, arg_num )
      ___END_CFUN_SCMOBJ_TO_INT( frame_count, dst->frameCount, arg_num )
      ___END_CFUN_SCMOBJ_TO_POINTER( bones, dst->bones, false, arg_num )
      ___END_CFUN_SCMOBJ_TO_INT( bone_count, dst->boneCount, arg_num )
    }
  return ___err;
}

___SCMOBJ MODELANIMATION_to_SCMOBJ( ___processor_state ___ps, ModelAnimation src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
      ___SCMOBJ bone_count_obj;
      ___SCMOBJ bones_obj;
      ___SCMOBJ frame_count_obj;
      ___SCMOBJ frame_poses_obj;

  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.boneCount, bone_count_obj, arg_num )
  ___BEGIN_SFUN_POINTER_TO_SCMOBJ( src.bones, ___FAL, 0, bones_obj, arg_num )
  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.frameCount, frame_count_obj, arg_num )
  ___BEGIN_SFUN_POINTER_TO_SCMOBJ( src.framePoses, ___FAL, 0, frame_poses_obj, arg_num )

  frame_poses_obj = ___EXT( ___make_pair ) ( ___ps, frame_poses_obj, ___NUL );
  frame_count_obj = ___EXT( ___make_pair ) ( ___ps, frame_count_obj, frame_poses_obj );
  bones_obj = ___EXT( ___make_pair ) ( ___ps, bones_obj, frame_count_obj );
  *dst = ___EXT( ___make_pair ) ( ___ps, bone_count_obj, bones_obj );

  ___END_SFUN_POINTER_TO_SCMOBJ( src.framePoses, ___FAL, 0, frame_poses_obj, arg_num )
  ___END_SFUN_INT_TO_SCMOBJ( src.frameCount, frame_count_obj, arg_num )
  ___END_SFUN_POINTER_TO_SCMOBJ( src.bones, ___FAL, 0, bones_obj, arg_num )
  ___END_SFUN_INT_TO_SCMOBJ( src.boneCount, bone_count_obj, arg_num )

  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */

  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_MODELANIMATION(src,dst,i) \
if ((___err = SCMOBJ_to_MODELANIMATION (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_MODELANIMATION(src,dst,i) }

#define ___BEGIN_CFUN_MODELANIMATION_to_SCMOBJ(src,dst) \
if ((___err = MODELANIMATION_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_MODELANIMATION_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_MODELANIMATION_to_SCMOBJ(src,dst,i) \
if ((___err = MODELANIMATION_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_MODELANIMATION_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_MODELANIMATION(src,dst) \
{ ___err = SCMOBJ_to_MODELANIMATION (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_MODELANIMATION(src,dst) }

c-declare-end
)

(c-define-type model-animation "ModelAnimation" "MODELANIMATION_to_SCMOBJ" "SCMOBJ_to_MODELANIMATION" #f)

(define make-model-animation 
  (c-lambda (int (pointer bone-info) int (pointer (pointer transform)))
    model-animation "MakeModelAnimation"))

(define deref-model-animation 
  (c-lambda ((pointer model-animation) unsigned-int)
     model-animation "ModelAnimation anim = ___arg1[ ___arg2 ]; ___return( anim );"))