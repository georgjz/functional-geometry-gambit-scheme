;;;-----------------------------------------------------------------------------
;;; This file is the interface to the struct Model in raylib.
;;;-----------------------------------------------------------------------------

(c-declare #<<c-declare-end

#include "raylib.h"

Model MakeModel( Matrix transform, 
                 int meshCount, int materialCount, Mesh *meshes, 
                 Material *materials, int *meshMaterial, 
                 int boneCount, BoneInfo *bones, Transform *bindPose )
{
    return (Model){ transform, meshCount, materialCount, 
                    meshes, materials, meshMaterial, 
                    boneCount, bones, bindPose };
}

___SCMOBJ SCMOBJ_to_MODEL( ___PSD ___SCMOBJ src, Model *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  if ( !___PAIRP( src ) )
    ___err = ___FIX( ___UNKNOWN_ERR );
  else
    {
      ___SCMOBJ transform       = ___CAR( src );
      ___SCMOBJ mesh_count      = ___CADR( src );
      ___SCMOBJ material_count  = ___CADDR( src );
      ___SCMOBJ meshes          = ___CADDDR( src );
      ___SCMOBJ materials       = ___CAR( ___CDDDDR( src ) );
      ___SCMOBJ mesh_material   = ___CADR( ___CDDDDR( src ) );
      ___SCMOBJ bone_count      = ___CADDR( ___CDDDDR( src ) );
      ___SCMOBJ bones           = ___CADDDR( ___CDDDDR( src ) );
      ___SCMOBJ bind_pose       = ___CAR( ___CDDDDR( ___CDDDDR( src ) ) );

      ___BEGIN_CFUN_SCMOBJ_to_MATRIX( transform, dst->transform, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_INT( mesh_count, dst->meshCount, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_INT( material_count, dst->materialCount, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_POINTER( meshes, dst->meshes, false, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_POINTER( materials, dst->materials, false, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_POINTER( mesh_material, dst->meshMaterial, false, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_INT( bone_count, dst->boneCount, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_POINTER( bones, dst->bones, false, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_POINTER( bind_pose, dst->bindPose, false, arg_num )

      ___END_CFUN_SCMOBJ_TO_POINTER( bind_pose, dst->bindPose, false, arg_num )
      ___END_CFUN_SCMOBJ_TO_POINTER( bones, dst->bones, false, arg_num )
      ___END_CFUN_SCMOBJ_TO_INT( bone_count, dst->boneCount, arg_num )
      ___END_CFUN_SCMOBJ_TO_POINTER( mesh_material, dst->meshMaterial, false, arg_num )
      ___END_CFUN_SCMOBJ_TO_POINTER( materials, dst->materials, false, arg_num )
      ___END_CFUN_SCMOBJ_TO_POINTER( meshes, dst->meshes, false, arg_num )
      ___END_CFUN_SCMOBJ_TO_INT( material_count, dst->materialCount, arg_num )
      ___END_CFUN_SCMOBJ_TO_INT( mesh_count, dst->meshCount, arg_num )
      ___END_CFUN_SCMOBJ_to_MATRIX( transform, dst->transform, arg_num )
    }
  return ___err;
}

___SCMOBJ MODEL_to_SCMOBJ( ___processor_state ___ps, Model src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
      ___SCMOBJ transform_obj;
      ___SCMOBJ mesh_count_obj;
      ___SCMOBJ meshes_obj;
      ___SCMOBJ material_count_obj;
      ___SCMOBJ materials_obj;
      ___SCMOBJ mesh_material_obj;
      ___SCMOBJ bone_count_obj;
      ___SCMOBJ bones_obj;
      ___SCMOBJ bind_pose_obj;

  ___BEGIN_SFUN_MATRIX_to_SCMOBJ( src.transform, transform_obj, arg_num )
  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.meshCount, mesh_count_obj, arg_num )
  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.materialCount, material_count_obj, arg_num )
  ___BEGIN_SFUN_POINTER_TO_SCMOBJ( src.meshes, ___FAL, 0, meshes_obj, arg_num )
  ___BEGIN_SFUN_POINTER_TO_SCMOBJ( src.materials, ___FAL, 0, materials_obj, arg_num )
  ___BEGIN_SFUN_POINTER_TO_SCMOBJ( src.meshMaterial, ___FAL, 0, mesh_material_obj, arg_num )
  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.boneCount, bone_count_obj, arg_num )
  ___BEGIN_SFUN_POINTER_TO_SCMOBJ( src.bones, ___FAL, 0, bones_obj, arg_num )
  ___BEGIN_SFUN_POINTER_TO_SCMOBJ( src.bindPose, ___FAL, 0, bind_pose_obj, arg_num )

  bind_pose_obj = ___EXT( ___make_pair ) ( ___ps, bind_pose_obj, ___NUL );
  bones_obj = ___EXT( ___make_pair ) ( ___ps, bones_obj, bind_pose_obj );
  bone_count_obj = ___EXT( ___make_pair ) ( ___ps, bone_count_obj, bones_obj );
  mesh_material_obj = ___EXT( ___make_pair ) ( ___ps, mesh_material_obj, bone_count_obj );
  materials_obj = ___EXT( ___make_pair ) ( ___ps, materials_obj, mesh_material_obj );
  material_count_obj = ___EXT( ___make_pair ) ( ___ps, material_count_obj, materials_obj );
  meshes_obj = ___EXT( ___make_pair ) ( ___ps, meshes_obj, material_count_obj );
  mesh_count_obj = ___EXT( ___make_pair ) ( ___ps, mesh_count_obj, meshes_obj );
  *dst = ___EXT( ___make_pair ) ( ___ps, transform_obj, mesh_count_obj );

  ___END_SFUN_POINTER_TO_SCMOBJ( src.bindPose, ___FAL, 0, bind_pose_obj, arg_num )
  ___END_SFUN_POINTER_TO_SCMOBJ( src.bones, ___FAL, 0, bones_obj, arg_num )
  ___END_SFUN_INT_TO_SCMOBJ( src.boneCount, bone_count_obj, arg_num )
  ___END_SFUN_POINTER_TO_SCMOBJ( src.meshMaterial, ___FAL, 0, mesh_material_obj, arg_num )
  ___END_SFUN_POINTER_TO_SCMOBJ( src.materials, ___FAL, 0, materials_obj, arg_num )
  ___END_SFUN_POINTER_TO_SCMOBJ( src.meshes, ___FAL, 0, meshes_obj, arg_num )
  ___END_SFUN_INT_TO_SCMOBJ( src.materialCount, material_count_obj, arg_num )
  ___END_SFUN_INT_TO_SCMOBJ( src.meshCount, mesh_count_obj, arg_num )
  ___END_SFUN_MATRIX_to_SCMOBJ( src.transform, transform_obj, arg_num )

  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */

  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_MODEL(src,dst,i) \
if ((___err = SCMOBJ_to_MODEL (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_MODEL(src,dst,i) }

#define ___BEGIN_CFUN_MODEL_to_SCMOBJ(src,dst) \
if ((___err = MODEL_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_MODEL_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_MODEL_to_SCMOBJ(src,dst,i) \
if ((___err = MODEL_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_MODEL_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_MODEL(src,dst) \
{ ___err = SCMOBJ_to_MODEL (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_MODEL(src,dst) }

c-declare-end
)

(c-define-type model "Model" "MODEL_to_SCMOBJ" "SCMOBJ_to_MODEL" #f)

(define make-model 
  (c-lambda (matrix 
             int 
             int
             (pointer mesh)
             (pointer material)
             (pointer int)
             int 
             (pointer bone-info)
             (pointer transform))
    model "MakeModel"))

;;; Selectors 
(define model-transform (lambda (m) (car m)))

(define model-mesh-count (lambda (m) (cadr m)))

(define model-material-count (lambda (m) (caddr m)))

(define model-meshes (lambda (m) (cadddr m)))

(define model-mesh 
  (lambda (m n)
    (mesh-array-deref (model-meshes m) n)))

(define model-materials (lambda (m) (car (cddddr m))))

(define model-mesh-material (lambda (m) (cadr (cddddr m))))

(define model-bone-count (lambda (m) (caddr (cddddr m))))

(define model-bones (lambda (m) (cadddr (cddddr m))))

(define model-bind-pose (lambda (m) (car (cddddr (cddddr m)))))