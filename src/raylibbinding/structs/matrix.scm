;;;-----------------------------------------------------------------------------
;;; This file is the interface to the struct Matrix in raylib.
;;;-----------------------------------------------------------------------------

(c-declare #<<c-declare-end

#include "raylib.h"

// Column major for pre-multiplication
Matrix MakeMatrix( float m0, float m4, float m8, float m12, 
                   float m1, float m5, float m9, float m13, 
                   float m2, float m6, float m10, float m14, 
                   float m3, float m7, float m11, float m15 )
{
  return (Matrix){ m0, m4, m8, m12, 
                   m1, m5, m9, m13, 
                   m2, m6, m10, m14, 
                   m3, m7, m11, m15 };
}

___SCMOBJ SCMOBJ_to_MATRIX( ___PSD ___SCMOBJ src, Matrix *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  if( !___PAIRP( src ) )
    ___err = ___FIX( ___UNKNOWN_ERR );
  else
    {
      // first column
      ___SCMOBJ car    = ___CAR( src );
      ___SCMOBJ m0     = ___CAR( car );
      ___SCMOBJ m4     = ___CADR( car );
      ___SCMOBJ m8     = ___CADDR( car );
      ___SCMOBJ m12    = ___CADDDR( car );
      // second column
      ___SCMOBJ cadr   = ___CADR( src );
      ___SCMOBJ m1     = ___CAR( cadr );
      ___SCMOBJ m5     = ___CADR( cadr );
      ___SCMOBJ m9     = ___CADDR( cadr );
      ___SCMOBJ m13    = ___CADDDR( cadr );
      // third column
      ___SCMOBJ caddr  = ___CADDR( src );
      ___SCMOBJ m2     = ___CAR( caddr );
      ___SCMOBJ m6     = ___CADR( caddr );
      ___SCMOBJ m10    = ___CADDR( caddr );
      ___SCMOBJ m14    = ___CADDDR( caddr );
      // fourth column
      ___SCMOBJ cadddr = ___CADDDR( src );
      ___SCMOBJ m3     = ___CAR( cadddr );
      ___SCMOBJ m7     = ___CADR( cadddr );
      ___SCMOBJ m11    = ___CADDR( cadddr );
      ___SCMOBJ m15    = ___CADDDR( cadddr );

      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( m0, dst->m0, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( m1, dst->m1, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( m2, dst->m2, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( m3, dst->m3, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( m4, dst->m4, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( m5, dst->m5, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( m6, dst->m6, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( m7, dst->m7, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( m8, dst->m8, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( m9, dst->m9, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( m10, dst->m10, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( m11, dst->m11, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( m12, dst->m12, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( m13, dst->m13, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( m14, dst->m14, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( m15, dst->m15, arg_num )

      ___END_CFUN_SCMOBJ_TO_FLOAT( m15, dst->m15, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( m14, dst->m14, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( m13, dst->m13, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( m12, dst->m12, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( m11, dst->m11, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( m10, dst->m10, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( m9, dst->m9, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( m8, dst->m8, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( m7, dst->m7, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( m6, dst->m6, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( m5, dst->m5, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( m4, dst->m4, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( m3, dst->m3, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( m2, dst->m2, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( m1, dst->m1, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( m0, dst->m0, arg_num )

      ___EXT( ___release_scmobj ) ( car );
      ___EXT( ___release_scmobj ) ( cadr );
      ___EXT( ___release_scmobj ) ( caddr );
      ___EXT( ___release_scmobj ) ( cadddr );
    }
  return ___err;
}

___SCMOBJ MATRIX_to_SCMOBJ( ___processor_state ___ps, Matrix src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  *dst = ___NUL;
  ___SCMOBJ m0_mat_obj; ___SCMOBJ m4_mat_obj; ___SCMOBJ m8_mat_obj; ___SCMOBJ m12_mat_obj;
  ___SCMOBJ m1_mat_obj; ___SCMOBJ m5_mat_obj; ___SCMOBJ m9_mat_obj; ___SCMOBJ m13_mat_obj;
  ___SCMOBJ m2_mat_obj; ___SCMOBJ m6_mat_obj; ___SCMOBJ m10_mat_obj; ___SCMOBJ m14_mat_obj;
  ___SCMOBJ m3_mat_obj; ___SCMOBJ m7_mat_obj; ___SCMOBJ m11_mat_obj; ___SCMOBJ m15_mat_obj;

  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.m0, m0_mat_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.m1, m1_mat_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.m2, m2_mat_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.m3, m3_mat_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.m4, m4_mat_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.m5, m5_mat_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.m6, m6_mat_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.m7, m7_mat_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.m8, m8_mat_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.m9, m9_mat_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.m10, m10_mat_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.m11, m11_mat_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.m12, m12_mat_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.m13, m13_mat_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.m14, m14_mat_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.m15, m15_mat_obj, arg_num )

  // first row
  ___SCMOBJ row0_mat_obj;
  m12_mat_obj  = ___EXT( ___make_pair ) ( ___ps, m12_mat_obj, ___NUL );
  m8_mat_obj   = ___EXT( ___make_pair ) ( ___ps, m8_mat_obj, m12_mat_obj );
  m4_mat_obj   = ___EXT( ___make_pair ) ( ___ps, m4_mat_obj, m8_mat_obj );
  row0_mat_obj = ___EXT( ___make_pair ) ( ___ps, m0_mat_obj, m4_mat_obj );

  // second row
  ___SCMOBJ row1_mat_obj;
  m13_mat_obj  = ___EXT( ___make_pair ) ( ___ps, m13_mat_obj, ___NUL );
  m9_mat_obj   = ___EXT( ___make_pair ) ( ___ps, m9_mat_obj, m13_mat_obj );
  m5_mat_obj   = ___EXT( ___make_pair ) ( ___ps, m5_mat_obj, m9_mat_obj );
  row1_mat_obj = ___EXT( ___make_pair ) ( ___ps, m1_mat_obj, m5_mat_obj );

  // third row
  ___SCMOBJ row2_mat_obj;
  m14_mat_obj  = ___EXT( ___make_pair ) ( ___ps, m14_mat_obj, ___NUL );
  m10_mat_obj  = ___EXT( ___make_pair ) ( ___ps, m10_mat_obj, m14_mat_obj );
  m6_mat_obj   = ___EXT( ___make_pair ) ( ___ps, m6_mat_obj, m10_mat_obj );
  row2_mat_obj = ___EXT( ___make_pair ) ( ___ps, m2_mat_obj, m6_mat_obj );

  // fourth row
  ___SCMOBJ row3_mat_obj;
  m15_mat_obj  = ___EXT( ___make_pair ) ( ___ps, m15_mat_obj, ___NUL );
  m11_mat_obj   = ___EXT( ___make_pair ) ( ___ps, m11_mat_obj, m15_mat_obj );
  m7_mat_obj   = ___EXT( ___make_pair ) ( ___ps, m7_mat_obj, m11_mat_obj );
  row3_mat_obj = ___EXT( ___make_pair ) ( ___ps, m3_mat_obj, m7_mat_obj );

  // matrix
  row3_mat_obj = ___EXT( ___make_pair ) ( ___ps, row3_mat_obj, ___NUL );
  row2_mat_obj = ___EXT( ___make_pair ) ( ___ps, row2_mat_obj, row3_mat_obj );
  row1_mat_obj = ___EXT( ___make_pair ) ( ___ps, row1_mat_obj, row2_mat_obj );
  *dst = ___EXT( ___make_pair ) ( ___ps, row0_mat_obj, row1_mat_obj );

  ___END_SFUN_FLOAT_TO_SCMOBJ( src.m15, m15_mat_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.m14, m14_mat_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.m13, m13_mat_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.m12, m12_mat_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.m11, m11_mat_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.m10, m10_mat_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.m9, m9_mat_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.m8, m8_mat_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.m7, m7_mat_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.m6, m6_mat_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.m5, m5_mat_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.m4, m4_mat_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.m3, m3_mat_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.m2, m2_mat_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.m1, m1_mat_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.m0, m0_mat_obj, arg_num )

  // clean up extra objects 
  // ___EXT( ___release_scmobj ) ( row0_mat_obj );
  // ___EXT( ___release_scmobj ) ( row1_mat_obj );
  // ___EXT( ___release_scmobj ) ( row2_mat_obj );
  // ___EXT( ___release_scmobj ) ( row3_mat_obj );

  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */

  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_MATRIX(src,dst,i) \
if ((___err = SCMOBJ_to_MATRIX (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_MATRIX(src,dst,i) }

#define ___BEGIN_CFUN_MATRIX_to_SCMOBJ(src,dst) \
if ((___err = MATRIX_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_MATRIX_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_MATRIX_to_SCMOBJ(src,dst,i) \
if ((___err = MATRIX_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_MATRIX_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_MATRIX(src,dst) \
{ ___err = SCMOBJ_to_MATRIX (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_MATRIX(src,dst) }

c-declare-end
)

(c-define-type matrix "Matrix" "MATRIX_to_SCMOBJ" "SCMOBJ_to_MATRIX" #f)

(define make-matrix 
  (c-lambda (float float float float
             float float float float 
             float float float float 
             float float float float) 
    matrix "MakeMatrix"))

;;; TODO: Helpers Matrix from vec3s
