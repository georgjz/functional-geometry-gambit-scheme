;;;-----------------------------------------------------------------------------
;;; This file is the interface to the struct Quaternion in raylib.
;;;-----------------------------------------------------------------------------

(c-declare #<<c-declare-end

#include "raylib.h"

Quaternion MakeQuaternion( float x, float y, float z, float w )
{
    return (Vector4){ x, y, z, w };
}

c-declare-end
)

(c-define-type quaternion "Quaternion" "VECTOR4_to_SCMOBJ" "SCMOBJ_to_VECTOR4" #f)

(define make-quaternion (c-lambda (float float float float) quaternion "MakeQuaternion"))
