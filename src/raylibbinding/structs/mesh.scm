;;;-----------------------------------------------------------------------------
;;; This file is the interface to the struct Mesh in raylib.
;;;-----------------------------------------------------------------------------

(c-declare #<<c-declare-end

#include "raylib.h"

Mesh MakeMesh( int vertexCount, int triangleCount, 
               float *vertices, float *texcoords, float *texcoords2,
               float *normals, float *tangents, 
               unsigned char *colors,
               unsigned char *indices,
               float *animVertices, float *animNormals,
               int *boneIds, float *boneWeights,
               unsigned int vaoId, unsigned int *vboId )
{
    return (Mesh){ vertexCount, triangleCount, vertices,
                   texcoords, texcoords2, normals, tangents,
                   colors, indices, animVertices, animNormals,
                   boneIds, boneWeights, vaoId, vboId };
}

___SCMOBJ SCMOBJ_to_MESH( ___PSD ___SCMOBJ src, Mesh *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  if ( !___PAIRP( src ) )
    ___err = ___FIX( ___UNKNOWN_ERR );
  else
    {
      ___SCMOBJ vertex_count    = ___CAR( src );
      ___SCMOBJ triangle_count  = ___CADR( src );
      ___SCMOBJ vertices        = ___CADDR( src );
      ___SCMOBJ texcoords       = ___CADDDR( src );
      ___SCMOBJ texcoords2      = ___CAR( ___CDDDDR( src ) );
      ___SCMOBJ normals         = ___CADR( ___CDDDDR( src ) );
      ___SCMOBJ tangents        = ___CADDR( ___CDDDDR( src ) );
      ___SCMOBJ colors          = ___CADDDR( ___CDDDDR( src ) );
      ___SCMOBJ indices         = ___CAR( ___CDDDDR( ___CDDDDR( src ) ) );
      ___SCMOBJ anim_vertices   = ___CADR( ___CDDDDR( ___CDDDDR( src ) ) );
      ___SCMOBJ anim_normals    = ___CADDR( ___CDDDDR( ___CDDDDR( src ) ) );
      ___SCMOBJ bone_ids        = ___CADDDR( ___CDDDDR( ___CDDDDR( src ) ) );
      ___SCMOBJ bone_weights    = ___CAR( ___CDDDDR( ___CDDDDR( ___CDDDDR( src ) ) ) );
      ___SCMOBJ vao_id          = ___CADR( ___CDDDDR( ___CDDDDR( ___CDDDDR( src ) ) ) );
      ___SCMOBJ vbo_id          = ___CADDR( ___CDDDDR( ___CDDDDR( ___CDDDDR( src ) ) ) );

      ___BEGIN_CFUN_SCMOBJ_TO_INT( vertex_count, dst->vertexCount, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_INT( triangle_count, dst->triangleCount, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_POINTER( vertices, dst->vertices, false, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_POINTER( texcoords, dst->texcoords, false, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_POINTER( texcoords2, dst->texcoords2, false, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_POINTER( normals, dst->normals, false, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_POINTER( tangents, dst->tangents, false, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_POINTER( colors, dst->colors, false, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_POINTER( indices, dst->indices, false, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_POINTER( anim_vertices, dst->animVertices, false, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_POINTER( anim_normals, dst->animNormals, false, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_POINTER( bone_ids, dst->boneIds, false, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_POINTER( bone_weights, dst->boneWeights, false, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_INT( vao_id, dst->vaoId, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_POINTER( vbo_id, dst->vboId, false, arg_num )

      ___END_CFUN_SCMOBJ_TO_POINTER( vbo_id, dst->vboId, false, arg_num )
      ___END_CFUN_SCMOBJ_TO_INT( vao_id, dst->vaoId, arg_num )
      ___END_CFUN_SCMOBJ_TO_POINTER( bone_weights, dst->boneWeights, false, arg_num )
      ___END_CFUN_SCMOBJ_TO_POINTER( bone_ids, dst->boneIds, false, arg_num )
      ___END_CFUN_SCMOBJ_TO_POINTER( anim_normals, dst->animNormals, false, arg_num )
      ___END_CFUN_SCMOBJ_TO_POINTER( anim_vertices, dst->animVertices, false, arg_num )
      ___END_CFUN_SCMOBJ_TO_POINTER( indices, dst->indices, false, arg_num )
      ___END_CFUN_SCMOBJ_TO_POINTER( colors, dst->colors, false, arg_num )
      ___END_CFUN_SCMOBJ_TO_POINTER( tangents, dst->tangents, false, arg_num )
      ___END_CFUN_SCMOBJ_TO_POINTER( normals, dst->normals, false, arg_num )
      ___END_CFUN_SCMOBJ_TO_POINTER( texcoords2, dst->texcoords2, false, arg_num )
      ___END_CFUN_SCMOBJ_TO_POINTER( texcoords, dst->texcoords, false, arg_num )
      ___END_CFUN_SCMOBJ_TO_POINTER( vertices, dst->vertices, false, arg_num )
      ___END_CFUN_SCMOBJ_TO_INT( triangle_count, dst->triangleCount, arg_num )
      ___END_CFUN_SCMOBJ_TO_INT( vertex_count, dst->vertexCount, arg_num )
    }
  return ___err;
}

___SCMOBJ MESH_to_SCMOBJ( ___processor_state ___ps, Mesh src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  ___SCMOBJ vertex_count_int_obj;
  ___SCMOBJ triangle_count_int_obj;
  ___SCMOBJ vertices_obj;
  ___SCMOBJ texcoords_obj;
  ___SCMOBJ texcoords2_obj;
  ___SCMOBJ normals_obj;
  ___SCMOBJ tangents_obj;
  ___SCMOBJ colors_obj;
  ___SCMOBJ indices_obj;
  ___SCMOBJ anim_vertices_obj;
  ___SCMOBJ anim_normals_obj;
  ___SCMOBJ bone_ids_obj;
  ___SCMOBJ bone_weights_obj;
  ___SCMOBJ vao_id_int_obj;
  ___SCMOBJ vbo_id_obj;

  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.vertexCount, vertex_count_int_obj, arg_num )
  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.vertexCount, triangle_count_int_obj, arg_num )
  ___BEGIN_SFUN_POINTER_TO_SCMOBJ( src.vertices, ___FAL, 0,vertices_obj, arg_num )
  ___BEGIN_SFUN_POINTER_TO_SCMOBJ( src.texcoords, ___FAL, 0, texcoords_obj, arg_num )
  ___BEGIN_SFUN_POINTER_TO_SCMOBJ( src.texcoords2, false ,false, texcoords2_obj, arg_num )
  ___BEGIN_SFUN_POINTER_TO_SCMOBJ( src.normals, ___FAL, 0, normals_obj, arg_num )
  ___BEGIN_SFUN_POINTER_TO_SCMOBJ( src.tangents, ___FAL, 0, tangents_obj, arg_num )
  ___BEGIN_SFUN_POINTER_TO_SCMOBJ( src.colors, ___FAL, 0, colors_obj, arg_num )
  ___BEGIN_SFUN_POINTER_TO_SCMOBJ( src.indices, false,false, indices_obj, arg_num )
  ___BEGIN_SFUN_POINTER_TO_SCMOBJ( src.animVertices, ___FAL, 0, anim_vertices_obj, arg_num )
  ___BEGIN_SFUN_POINTER_TO_SCMOBJ( src.animNormals, ___FAL, 0, anim_normals_obj, arg_num )
  ___BEGIN_SFUN_POINTER_TO_SCMOBJ( src.boneIds, ___FAL, 0, bone_ids_obj, arg_num )
  ___BEGIN_SFUN_POINTER_TO_SCMOBJ( src.boneWeights, ___FAL, 0, bone_weights_obj, arg_num )
  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.vaoId, vao_id_int_obj, arg_num )
  ___BEGIN_SFUN_POINTER_TO_SCMOBJ( src.vboId, ___FAL, 0, vbo_id_obj, arg_num )

  vbo_id_obj = ___EXT( ___make_pair ) ( ___ps, vbo_id_obj, ___NUL );
  vao_id_int_obj = ___EXT( ___make_pair ) ( ___ps, vao_id_int_obj, vbo_id_obj );
  bone_weights_obj = ___EXT( ___make_pair ) ( ___ps, bone_weights_obj, vao_id_int_obj );
  bone_ids_obj = ___EXT( ___make_pair ) ( ___ps, bone_ids_obj, bone_weights_obj );
  anim_normals_obj = ___EXT( ___make_pair ) ( ___ps, anim_normals_obj, bone_ids_obj );
  anim_vertices_obj = ___EXT( ___make_pair ) ( ___ps, anim_vertices_obj, anim_normals_obj );
  indices_obj = ___EXT( ___make_pair ) ( ___ps, indices_obj, anim_vertices_obj );
  colors_obj = ___EXT( ___make_pair ) ( ___ps, colors_obj, indices_obj );
  tangents_obj = ___EXT( ___make_pair ) ( ___ps, tangents_obj, colors_obj );
  normals_obj = ___EXT( ___make_pair ) ( ___ps, normals_obj, tangents_obj );
  texcoords2_obj = ___EXT( ___make_pair ) ( ___ps, texcoords2_obj, normals_obj );
  texcoords_obj = ___EXT( ___make_pair ) ( ___ps, texcoords_obj, texcoords2_obj );
  vertices_obj = ___EXT( ___make_pair ) ( ___ps, vertices_obj, texcoords_obj );
  triangle_count_int_obj = ___EXT( ___make_pair ) ( ___ps, triangle_count_int_obj, vertices_obj );
  *dst = ___EXT( ___make_pair ) ( ___ps, vertex_count_int_obj, triangle_count_int_obj );

  ___END_SFUN_POINTER_TO_SCMOBJ( src.vboId, ___FAL, 0, vbo_id_obj, arg_num )
  ___END_SFUN_INT_TO_SCMOBJ( src.vaoId, vao_id_int_obj, arg_num )
  ___END_SFUN_POINTER_TO_SCMOBJ( src.boneWeights, ___FAL, 0, bone_weights_obj, arg_num )
  ___END_SFUN_POINTER_TO_SCMOBJ( src.boneIds, ___FAL, 0, bone_ids_obj, arg_num )
  ___END_SFUN_POINTER_TO_SCMOBJ( src.animNormals, ___FAL, 0, anim_normals_obj, arg_num )
  ___END_SFUN_POINTER_TO_SCMOBJ( src.animVertices, ___FAL, 0, anim_vertices_obj, arg_num )
  ___END_SFUN_POINTER_TO_SCMOBJ( src.indices, ___FAL, 0, indices_obj, arg_num )
  ___END_SFUN_POINTER_TO_SCMOBJ( src.colors, ___FAL, 0, colors_obj, arg_num )
  ___END_SFUN_POINTER_TO_SCMOBJ( src.tangents, ___FAL, 0, tangents_obj, arg_num )
  ___END_SFUN_POINTER_TO_SCMOBJ( src.normals, ___FAL, 0, normals_obj, arg_num )
  ___END_SFUN_POINTER_TO_SCMOBJ( src.texcoords2, ___FAL, 0, texcoords2_obj, arg_num )
  ___END_SFUN_POINTER_TO_SCMOBJ( src.texcoords, ___FAL, 0, texcoords_obj, arg_num )
  ___END_SFUN_POINTER_TO_SCMOBJ( src.vertices, ___FAL, 0, vertices_obj, arg_num )
  ___END_SFUN_INT_TO_SCMOBJ( src.vertexCount, triangle_count_int_obj, arg_num )
  ___END_SFUN_INT_TO_SCMOBJ( src.vertexCount, vertex_count_int_obj, arg_num )

  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */



  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_MESH(src,dst,i) \
if ((___err = SCMOBJ_to_MESH (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_MESH(src,dst,i) }

#define ___BEGIN_CFUN_MESH_to_SCMOBJ(src,dst) \
if ((___err = MESH_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_MESH_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_MESH_to_SCMOBJ(src,dst,i) \
if ((___err = MESH_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_MESH_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_MESH(src,dst) \
{ ___err = SCMOBJ_to_MESH (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_MESH(src,dst) }

c-declare-end
)

(c-define-type mesh "Mesh" "MESH_to_SCMOBJ" "SCMOBJ_to_MESH" #f)

(define make-mesh 
  (c-lambda (int 
             int 
             (pointer float)
             (pointer float)
             (pointer float)
             (pointer float)
             (pointer float)
             (pointer unsigned-int8)
             (pointer unsigned-int8)
             (pointer float)
             (pointer float)
             (pointer int)
             (pointer float)
             unsigned-int
             (pointer unsigned-int))
    mesh "MakeMesh"))

(define mesh-deref 
  (c-lambda ((pointer mesh))
    mesh "Mesh m = *___arg1;"
         "___return( m )"))

(define mesh-array-deref 
  (c-lambda ((pointer mesh) i)
    mesh "Mesh m = ___arg1[___arg2];"
         "___return( m );"))
