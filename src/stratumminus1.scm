;;;;;; This is the lowest stratum of this program. Here are the bindings for raylib.
;;;;;; These are mostly bindings to external libraries and means of converting 
;;;;;; between C and Scheme objects. Note that only the functions used in this 
;;;;;; program are bound; raylib offers a lot more than is used/shown here.
;;;;;; See README.md for more.

;;; Raylib uses two structs to represent colors and two-dimensional vectors. For
;;; simplicity, they are both represented as (proper) lists in this program. The
;;; next section of code uses the Gambit Scheme C Interface to convert between 
;;; C and Scheme objects.

;;; Color. I added a simple make-color function to create Colors from four int 
;;; RGBA values (raylib lacks that for some reason)
(c-declare #<<c-declare-end

#include "raylib.h"

Color MakeColor( unsigned char r, 
                 unsigned char g, 
                 unsigned char b,
                 unsigned char a )
{
    return (Color){ r, g, b, a };
}

___SCMOBJ SCMOBJ_to_COLOR( ___PSD ___SCMOBJ src, Color *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  if ( !___PAIRP( src ) )
    ___err = ___FIX( ___UNKNOWN_ERR );
  else
    {
      ___SCMOBJ car    = ___CAR( src );
      ___SCMOBJ cadr   = ___CADR( src );
      ___SCMOBJ caddr  = ___CADDR( src );
      ___SCMOBJ cadddr = ___CADDDR( src );
      ___BEGIN_CFUN_SCMOBJ_TO_U8( car, dst->r, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_U8( cadr, dst->g, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_U8( caddr, dst->b, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_U8( cadddr, dst->a, arg_num )
      ___END_CFUN_SCMOBJ_TO_U8( cadddr, dst->a, arg_num )
      ___END_CFUN_SCMOBJ_TO_U8( caddr, dst->b, arg_num )
      ___END_CFUN_SCMOBJ_TO_U8( cadr, dst->g, arg_num )
      ___END_CFUN_SCMOBJ_TO_U8( car, dst->r, arg_num )
    }
  return ___err;
}

___SCMOBJ COLOR_to_SCMOBJ( ___processor_state ___ps, Color src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  ___SCMOBJ r_color_obj;
  ___SCMOBJ g_color_obj;
  ___SCMOBJ b_color_obj;
  ___SCMOBJ a_color_obj;
  ___BEGIN_SFUN_U8_TO_SCMOBJ( src.r, r_color_obj, arg_num )
  ___BEGIN_SFUN_U8_TO_SCMOBJ( src.g, g_color_obj, arg_num )
  ___BEGIN_SFUN_U8_TO_SCMOBJ( src.b, b_color_obj, arg_num )
  ___BEGIN_SFUN_U8_TO_SCMOBJ( src.a, a_color_obj, arg_num )
  a_color_obj = ___EXT( ___make_pair ) ( ___ps, a_color_obj, ___NUL );
  b_color_obj = ___EXT( ___make_pair ) ( ___ps, b_color_obj, a_color_obj );
  g_color_obj = ___EXT( ___make_pair ) ( ___ps, g_color_obj, b_color_obj );
  *dst = ___EXT( ___make_pair ) ( ___ps, r_color_obj, g_color_obj );
  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */
  ___END_SFUN_U8_TO_SCMOBJ( src.a, a_color_obj, arg_num )
  ___END_SFUN_U8_TO_SCMOBJ( src.b, b_color_obj, arg_num )
  ___END_SFUN_U8_TO_SCMOBJ( src.g, g_color_obj, arg_num )
  ___END_SFUN_U8_TO_SCMOBJ( src.r, r_color_obj, arg_num )
  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_COLOR(src,dst,i) \
if ((___err = SCMOBJ_to_COLOR (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_COLOR(src,dst,i) }

#define ___BEGIN_CFUN_COLOR_to_SCMOBJ(src,dst) \
if ((___err = COLOR_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_COLOR_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_COLOR_to_SCMOBJ(src,dst,i) \
if ((___err = COLOR_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_COLOR_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_COLOR(src,dst) \
{ ___err = SCMOBJ_to_COLOR (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_COLOR(src,dst) }

c-declare-end
)

(c-define-type Color "Color" "COLOR_to_SCMOBJ" "SCMOBJ_to_COLOR" #f)

(define make-color 
  (c-lambda (unsigned-int8 unsigned-int8 unsigned-int8 unsigned-int8)
    Color "MakeColor"))

;;; Vector2
(c-declare #<<c-declare-end

#include "raylib.h"

Vector2 MakeVector2( float x, float y )
{
    return (Vector2){ x, y };
}

___SCMOBJ SCMOBJ_to_VECTOR2( ___PSD ___SCMOBJ src, Vector2 *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  if ( !___PAIRP( src ) )
    ___err = ___FIX( ___UNKNOWN_ERR );
  else
    {
      ___SCMOBJ car    = ___CAR( src );
      ___SCMOBJ cadr   = ___CADR( src );
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( car, dst->x, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( cadr, dst->y, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( cadr, dst->y, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( car, dst->x, arg_num )
    }
  return ___err;
}

___SCMOBJ VECTOR2_to_SCMOBJ( ___processor_state ___ps, Vector2 src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  ___SCMOBJ x_vec2_obj;
  ___SCMOBJ y_vec2_obj;
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.x, x_vec2_obj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.y, y_vec2_obj, arg_num )
  y_vec2_obj = ___EXT( ___make_pair ) ( ___ps, y_vec2_obj, ___NUL );
  *dst = ___EXT( ___make_pair ) ( ___ps, x_vec2_obj, y_vec2_obj );
  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.y, y_vec2_obj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.x, x_vec2_obj, arg_num )
  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_VECTOR2(src,dst,i) \
if ((___err = SCMOBJ_to_VECTOR2 (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_VECTOR2(src,dst,i) }

#define ___BEGIN_CFUN_VECTOR2_to_SCMOBJ(src,dst) \
if ((___err = VECTOR2_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_VECTOR2_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_VECTOR2_to_SCMOBJ(src,dst,i) \
if ((___err = VECTOR2_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_VECTOR2_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_VECTOR2(src,dst) \
{ ___err = SCMOBJ_to_VECTOR2 (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_VECTOR2(src,dst) }

c-declare-end
)

(c-define-type Vector2 "Vector2" "VECTOR2_to_SCMOBJ" "SCMOBJ_to_VECTOR2" #f)

;;; To render lines and curves to the screen, we need to access the following 
;;; functions imported from raylib:
;;; Include raylib header
(c-declare #<<c-declare-end

#include "raylib.h"

c-declare-end
)

;;; These three functions simplify managing the OpenGL render context
;; void InitWindow(int width, int height, const char *title);
(define init-window 
  (c-lambda (int int char-string)
    void "InitWindow"))

;; void SetTargetFPS(int fps);
(define set-target-fps 
  (c-lambda (int)
    void "SetTargetFPS"))

;; void ClearBackground(Color color);
(define clear-background 
  (c-lambda (Color)
    void "ClearBackground"))

;; bool WindowShouldClose(void); 
(define window-should-close 
  (c-lambda ()
    bool "WindowShouldClose"))

;; void CloseWindow(void);
(define close-window 
  (c-lambda ()
    void "CloseWindow"))

;;; May be useful when it comes to scaling the picture(s) to match the render context
;; int GetScreenWidth(void);
(define get-screen-width 
  (c-lambda ()
    int "GetScreenWidth"))

;; int GetScreenHeight(void);
(define get-screen-height 
  (c-lambda ()
    int "GetScreenHeight"))

;;; These functions actually draw onto the render context
;; void BeginDrawing();
(define begin-drawing 
  (c-lambda ()
    void "BeginDrawing"))

;; void EndDrawing();
(define end-drawing 
  (c-lambda ()
    void "EndDrawing"))

;; void DrawLineEx(Vector2 startPos, Vector2 endPos, float thick, Color color);
(define draw-line-ex 
  (c-lambda (Vector2 Vector2 float Color)
    void "DrawLineEx"))

;; void DrawLineBezier(Vector2 startPos, Vector2 endPos, float thick, Color color);
(define draw-line-bezier 
  (c-lambda (Vector2 Vector2 float Color)
    void "DrawLineBezier"))

;;; This function will create a minimal raylib app and render the given picture
(define render (lambda () 'implement-me))