;;;-----------------------------------------------------------------------------
;;; This is the Raylib main file. It contains most of the important macros,
;;; data structures, and function bindings.
;;;-----------------------------------------------------------------------------

;;; Include raylib header
(c-declare #<<c-declare-end

#include "raylib.h"

c-declare-end
)


;    ▄████████     ███        ▄████████ ███    █▄   ▄████████     ███     
;   ███    ███ ▀█████████▄   ███    ███ ███    ███ ███    ███ ▀█████████▄ 
;   ███    █▀     ▀███▀▀██   ███    ███ ███    ███ ███    █▀     ▀███▀▀██ 
;   ███            ███   ▀  ▄███▄▄▄▄██▀ ███    ███ ███            ███   ▀ 
; ▀███████████     ███     ▀▀███▀▀▀▀▀   ███    ███ ███            ███     
;          ███     ███     ▀███████████ ███    ███ ███    █▄      ███     
;    ▄█    ███     ███       ███    ███ ███    ███ ███    ███     ███     
;  ▄████████▀     ▄████▀     ███    ███ ████████▀  ████████▀     ▄████▀   
;                            ███    ███                                   

;;; Structure definitions, code is spliced in
(include    "structs/vector2.scm")
(include    "structs/vector3.scm")
(include    "structs/vector4.scm")
(include    "structs/quaternion.scm")
(include    "structs/matrix.scm")
(include    "structs/color.scm")
(include    "structs/rectangle.scm")

(include    "structs/image.scm")

(include    "structs/texture.scm")

(include    "structs/rendertexture.scm")
(include    "structs/npatchinfo.scm")
(c-define-type char-info          "CharInfo")
(c-define-type font               "Font")

(include    "structs/camera.scm")
(include    "structs/camera2d.scm")
(include    "structs/mesh.scm")
(include    "structs/shader.scm")
(include    "structs/materialmap.scm")
(include    "structs/material.scm")
(include    "structs/transform.scm")
(include    "structs/boneinfo.scm")
(include    "structs/model.scm")
(include    "structs/modelanimation.scm")
(c-define-type ray                "Ray")
(c-define-type ray-hit-info       "RayHitInfo")
(c-define-type bounding-box       "BoundingBox")

(c-define-type wave               "Wave")
(c-define-type sound              "Sound")
(c-define-type music              "Music")
(c-define-type audio-stream       "AudioStream")
(c-define-type r-audio-buffer     "rAudioBuffer")

(c-define-type vr-device-info     "VrDeviceInfo")

;-------------------------------------------------------------------------------
;;;;;; These are helper functions to make using some of raylib's data structures 
;;;;;; more convenient to use. These functions are NOT part of raylib.
;-------------------------------------------------------------------------------

; ; TODO: figure out the float alignment
; ; (define make-matrix 
;   ; (c-lambda ()))

(define make-color
  (lambda (r g b a)
    (get-color 
     (bitwise-ior (arithmetic-shift r 24)
                  (arithmetic-shift g 16)
                  (arithmetic-shift b 8)
                  a))))

; ; TODO: Check if struct conversion/aliases work

; ; TODO: fix types
; ; (define make-mesh 
; ;   (c-lambda (int 
; ;              int 
; ;              (pointer float)
; ;              (pointer float)
; ;              (pointer float)
; ;              (pointer float)
; ;              (pointer float)
; ;              (pointer unsigned-int32)
; ;              (pointer int8)
; ;              (pointer float)
; ;              (pointer float)
; ;              (pointer int)
; ;              (pointer float)
; ;              unsigned-int
; ;              (pointer unsigned-int))
; ;     mesh "Mesh mesh = (Mesh){ ___arg1, ___arg2, ___arg3, ___arg4, ___arg5 
; ;                               ___arg6, ___arg7, ___arg8, ___arg9, ___arg10
; ;                               ___arg11, ___arg12, ___arg13, ___arg14, ___arg15 };
; ;           ___return( mesh );"))

; TODO:
; (define make-vr-device-info
  ; (c-lambda () 'implement-me))
;-------------------------------------------------------------------------------


;  ▄████████  ▄██████▄     ▄████████    ▄████████ 
; ███    ███ ███    ███   ███    ███   ███    ███ 
; ███    █▀  ███    ███   ███    ███   ███    █▀  
; ███        ███    ███  ▄███▄▄▄▄██▀  ▄███▄▄▄     
; ███        ███    ███ ▀▀███▀▀▀▀▀   ▀▀███▀▀▀     
; ███    █▄  ███    ███ ▀███████████   ███    █▄  
; ███    ███ ███    ███   ███    ███   ███    ███ 
; ████████▀   ▀██████▀    ███    ███   ██████████ 
;                         ███    ███              
     
;;;-----------------------------------------------------------------------------
;;; These are the functions defined in the core module of raylib.
;;;-----------------------------------------------------------------------------
;;; Initialize window and OpenGL context
(define init-window
  (c-lambda (int int char-string)
    void "InitWindow"))

;;; Check if KEY_ESCAPE pressed or Close icon pressed
(define window-should-close
  (c-lambda ()
    bool "WindowShouldClose"))

;;; Close window and unload OpenGL context
(define close-window
  (c-lambda ()
    void "CloseWindow"))

;;; Check if window has been initialized successfully
(define is-window-ready
  (c-lambda ()
    bool "IsWindowReady"))

;;; Check if window has been minimized (or lost focus)
(define is-window-minimized
  (c-lambda ()
    bool "IsWindowMinimized"))

;;; Check if window has been resized
(define is-window-resized
  (c-lambda ()
    bool "IsWindowResized"))

;;; Check if window is currently hidden
(define is-window-hidden
  (c-lambda ()
    bool "IsWindowHidden"))

;;; Check if window is currently fullscreen
(define is-window-fullscreen
  (c-lambda ()
    bool "IsWindowFullscreen"))

;;; Toggle fullscreen mode (only PLATFORM_DESKTOP)
(define toggle-fullscreen
  (c-lambda ()
    void "ToggleFullscreen"))

;;; Show the window
(define unhide-window
  (c-lambda ()
    void "UnhideWindow"))

;;; Hide the window
(define hide-window
  (c-lambda ()
    void "HideWindow"))

;;; Set icon for window (only PLATFORM_DESKTOP)
(define set-window-icon
  (c-lambda (image)
    void "SetWindowIcon"))

;;; Set title for window (only PLATFORM_DESKTOP)
(define set-window-title
  (c-lambda (char-string)
    void "SetWindowTitle"))

;;; Set window position on screen (only PLATFORM_DESKTOP)
(define set-window-position
  (c-lambda (int int)
    void "SetWindowPosition"))

;;; Set monitor for the current window (fullscreen mode)
(define set-window-monitor
  (c-lambda (int)
    void "SetWindowMonitor"))

;;; Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
(define set-window-min-size
  (c-lambda (int int)
    void "SetWindowMinSize"))

;;; Set window dimensions
(define set-window-size
  (c-lambda (int int)
    void "SetWindowSize"))

;;; Get native window handle
(define get-window-handle
  (c-lambda ()
    (pointer void) "GetWindowHandle"))

;;; Get current screen width
(define get-screen-width
  (c-lambda ()
    int "GetScreenWidth"))

;;; Get current screen height
(define get-screen-height
  (c-lambda ()
    int "GetScreenHeight"))

;;; Get number of connected monitors
(define get-monitor-count
  (c-lambda ()
    int "GetMonitorCount"))

;;; Get primary monitor width
(define get-monitor-width
  (c-lambda (int)
    int "GetMonitorWidth"))

;;; Get primary monitor height
(define get-monitor-height
  (c-lambda (int)
    int "GetMonitorHeight"))

;;; Get primary monitor physical width in millimetres
(define get-monitor-physical-width
  (c-lambda (int)
    int "GetMonitorPhysicalWidth"))

;;; Get primary monitor physical height in millimetres
(define get-monitor-physical-height
  (c-lambda (int)
    int "GetMonitorPhysicalHeight"))

;;; Get window position XY on monitor
(define get-window-position
  (c-lambda ()
    vector2 "GetWindowPosition"))

;;; Get the human-readable, UTF-8 encoded name of the primary monitor
(define get-monitor-name
  (c-lambda (int)
    char-string "GetMonitorName"))

;;; Get clipboard text content
(define get-clipboard-text
  (c-lambda ()
    char-string "GetClipboardText"))

;;; Set clipboard text content
(define set-clipboard-text
  (c-lambda (char-string)
    void "SetClipboardText"))

;;; Shows cursor
(define show-cursor
  (c-lambda ()
    void "ShowCursor"))

;;; Hides cursor
(define hide-cursor
  (c-lambda ()
    void "HideCursor"))

;;; Check if cursor is not visible
(define is-cursor-hidden
  (c-lambda ()
    bool "IsCursorHidden"))

;;; Enables cursor (unlock cursor)
(define enable-cursor
  (c-lambda ()
    void "EnableCursor"))

;;; Disables cursor (lock cursor)
(define disable-cursor
  (c-lambda ()
    void "DisableCursor"))

;;; Set background color (framebuffer clear color)
(define clear-background
  (c-lambda (color)
    void "ClearBackground"))

;;; Setup canvas (framebuffer) to start drawing
(define begin-drawing
  (c-lambda ()
    void "BeginDrawing"))

;;; End canvas drawing and swap buffers (double buffering)
(define end-drawing
  (c-lambda ()
    void "EndDrawing"))

;;; Initialize 2D mode with custom camera (2D)
(define begin-mode-2d
  (c-lambda (camera-2d)
    void "BeginMode2D"))

;;; Ends 2D mode with custom camera
(define end-mode-2d
  (c-lambda ()
    void "EndMode2D"))

;;; Initializes 3D mode with custom camera (3D)
(define begin-mode-3d
  (c-lambda (camera)
    void "BeginMode3D"))

;;; Ends 3D mode and returns to default 2D orthographic mode
(define end-mode-3d
  (c-lambda ()
    void "EndMode3D"))

;;; Initializes render texture for drawing
(define begin-texture-mode
  (c-lambda (render-texture)
    void "BeginTextureMode"))

;;; Ends drawing to render texture
(define end-texture-mode
  (c-lambda ()
    void "EndTextureMode"))

;;; Begin scissor mode (define screen area for following drawing)
(define begin-scissor-mode
  (c-lambda (int int int int)
    void "BeginScissorMode"))

;;; End scissor mode
(define end-scissor-mode
  (c-lambda ()
    void "EndScissorMode"))

;;; Returns a ray trace from mouse position
(define get-mouse-ray
  (c-lambda (vector2 camera)
    ray "GetMouseRay"))

;;; Returns camera transform matrix (view matrix)
(define get-camera-matrix
  (c-lambda (camera)
    matrix "GetCameraMatrix"))

;;; Returns camera 2d transform matrix
(define get-camera-matrix-2d
  (c-lambda (camera-2d)
    matrix "GetCameraMatrix2D"))

;;; Returns the screen space position for a 3d world space position
(define get-world-to-screen
  (c-lambda (vector3 camera)
    vector2 "GetWorldToScreen"))

;;; Returns size position for a 3d world space position
(define get-world-to-screen-ex
  (c-lambda (vector3 camera int int)
    vector2 "GetWorldToScreenEx"))

;;; Returns the screen space position for a 2d camera world space position
(define get-world-to-screen-2d
  (c-lambda (vector2 camera-2d)
    vector2 "GetWorldToScreen2D"))

;;; Returns the world space position for a 2d camera screen space position
(define get-screen-to-world-2d
  (c-lambda (vector2 camera-2d)
    vector2 "GetScreenToWorld2D"))

;;; Set target FPS (maximum)
(define set-target-fps
  (c-lambda (int)
    void "SetTargetFPS"))

;;; Returns current FPS
(define get-fps
  (c-lambda ()
    int "GetFPS"))

;;; Returns time in seconds for last frame drawn
(define get-frame-time
  (c-lambda ()
    float "GetFrameTime"))

;;; Returns elapsed time in seconds since InitWindow()
(define get-time
  (c-lambda ()
    double "GetTime"))

;;; Returns hexadecimal value for a Color
(define color-to-int
  (c-lambda (color)
    int "ColorToInt"))

;;; Returns color normalized as float [0..1]
(define color-normalize
  (c-lambda (color)
    vector4 "ColorNormalize"))

;;; Returns color from normalized values [0..1]
(define color-from-normalized
  (c-lambda (vector4)
    color "ColorFromNormalized"))

;;; Returns HSV values for a Color
(define color-to-hsv
  (c-lambda (color)
    vector3 "ColorToHSV"))

;;; Returns a Color from HSV values
(define color-from-hsv
  (c-lambda (float float float)
    color "ColorFromHSV"))

;;; Returns a Color struct from hexadecimal value
(define get-color
  (c-lambda (unsigned-int32)
    color "GetColor"))

;;; Color fade-in or fade-out, alpha goes from 0.0f to 1.0f
(define fade
  (c-lambda (color float)
    color "Fade"))

;;; Setup window configuration flags (view FLAGS)
(define set-config-flags
  (c-lambda (unsigned-int)
    void "SetConfigFlags"))

;;; Set the current threshold (minimum) log level
(define set-trace-log-level
  (c-lambda (int)
    void "SetTraceLogLevel"))

;;; Set the exit threshold (minimum) log level
(define set-trace-log-exit
  (c-lambda (int)
    void "SetTraceLogExit"))

;;; BUG: (Callback type) Set a trace log callback to enable custom logging
; (define set-trace-log-callback
;   (c-lambda (TraceLogCallback)
;     void "SetTraceLogCallback"))

;;; BUG: (Argument count) Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR)
; (define trace-log
;   (c-lambda (int char-string)
;     void "TraceLog"))

;;; Takes a screenshot of current screen (saved a .png)
(define take-screenshot
  (c-lambda (char-string)
    void "TakeScreenshot"))

;;; Returns a random value between min and max (both included)
(define get-random-value
  (c-lambda (int int)
    int "GetRandomValue"))

;;; Load file data as byte array (read)
(define load-file-data
  (c-lambda (char-string (pointer int))
    (pointer unsigned-char) "LoadFileData"))

;;; Save data to file from byte array (write)
(define save-file-data
  (c-lambda (char-string (pointer void) int)
    void "SaveFileData"))

;;; Load text data from file (read), returns a ' ' terminated string
(define load-file-text
  (c-lambda (char-string)
    (pointer char) "LoadFileText"))

;;; Save text data to file (write), string must be ' ' terminated    
(define save-file-text
  (c-lambda (char-string (pointer char))
    void "SaveFileText"))

;;; Check if file exists
(define file-exists
  (c-lambda (char-string)
    bool "FileExists"))

;;; Check file extension
(define is-file-extension
  (c-lambda (char-string char-string)
    bool "IsFileExtension"))

;;; Check if a directory path exists
(define directory-exists
  (c-lambda (char-string)
    bool "DirectoryExists"))

;;; Get pointer to extension for a filename string
(define get-extension
  (c-lambda (char-string)
    char-string "GetExtension"))

;;; Get pointer to filename for a path string
(define get-file-name
  (c-lambda (char-string)
    char-string "GetFileName"))

;;; Get filename string without extension (uses static string)
(define get-file-name-without-ext
  (c-lambda (char-string)
    char-string "GetFileNameWithoutExt"))

;;; Get full path for a given fileName with path (uses static string)
(define get-directory-path
  (c-lambda (char-string)
    char-string "GetDirectoryPath"))

;;; Get previous directory path for a given path (uses static string)
(define get-prev-directory-path
  (c-lambda (char-string)
    char-string "GetPrevDirectoryPath"))

;;; Get current working directory (uses static string)
(define get-working-directory
  (c-lambda ()
    char-string "GetWorkingDirectory"))

;;; Get filenames in a directory path (memory should be freed)
(define get-directory-files
  (c-lambda (char-string (pointer int))
    (pointer (pointer char)) "GetDirectoryFiles"))

;;; Clear directory files paths buffers (free memory)
(define clear-directory-files
  (c-lambda ()
    void "ClearDirectoryFiles"))

;;; Change working directory, returns true if success
(define change-directory
  (c-lambda (char-string)
    bool "ChangeDirectory"))

;;; Check if a file has been dropped into window
(define is-file-dropped
  (c-lambda ()
    bool "IsFileDropped"))

;;; Get dropped files names (memory should be freed)
(define get-dropped-files
  (c-lambda ((pointer int))
    (pointer (pointer char)) "GetDroppedFiles"))

;;; Clear dropped files paths buffer (free memory)
(define clear-dropped-files
  (c-lambda ()
    void "ClearDroppedFiles"))

;;; Get file modification time (last write time)
(define get-file-mod-time
  (c-lambda (char-string)
    long "GetFileModTime"))

;;; Compress data (DEFLATE algorythm)
(define compress-data
  (c-lambda ((pointer unsigned-char) int (pointer int))
    (pointer unsigned-char) "CompressData"))

;;; Decompress data (DEFLATE algorythm)
(define decompress-data
  (c-lambda ((pointer unsigned-char) int (pointer int))
    (pointer unsigned-char) "DecompressData"))

;;; Load integer value from storage file (from defined position)
(define load-storage-value
  (c-lambda (int)
    int "LoadStorageValue"))

;;; Save integer value to storage file (to defined position)
(define save-storage-value
  (c-lambda (int int)
    void "SaveStorageValue"))

;;; Open URL with default system browser (if available)
(define open-url
  (c-lambda (char-string)
    void "OpenURL"))

;;; Detect if a key has been pressed once
(define is-key-pressed
  (c-lambda (int)
    bool "IsKeyPressed"))

;;; Detect if a key is being pressed
(define is-key-down
  (c-lambda (int)
    bool "IsKeyDown"))

;;; Detect if a key has been released once
(define is-key-released
  (c-lambda (int)
    bool "IsKeyReleased"))

;;; Detect if a key is NOT being pressed
(define is-key-up
  (c-lambda (int)
    bool "IsKeyUp"))

;;; Get latest key pressed
(define get-key-pressed
  (c-lambda ()
    int "GetKeyPressed"))

;;; Set a custom key to exit program (default is ESC)
(define set-exit-key
  (c-lambda (int)
    void "SetExitKey"))

;;; Detect if a gamepad is available
(define is-gamepad-available
  (c-lambda (int)
    bool "IsGamepadAvailable"))

;;; Check gamepad name (if available)
(define is-gamepad-name
  (c-lambda (int char-string)
    bool "IsGamepadName"))

;;; Return gamepad internal name id
(define get-gamepad-name
  (c-lambda (int)
    char-string "GetGamepadName"))

;;; Detect if a gamepad button has been pressed once
(define is-gamepad-button-pressed
  (c-lambda (int int)
    bool "IsGamepadButtonPressed"))

;;; Detect if a gamepad button is being pressed
(define is-gamepad-button-down
  (c-lambda (int int)
    bool "IsGamepadButtonDown"))

;;; Detect if a gamepad button has been released once
(define is-gamepad-button-released
  (c-lambda (int int)
    bool "IsGamepadButtonReleased"))

;;; Detect if a gamepad button is NOT being pressed
(define is-gamepad-button-up
  (c-lambda (int int)
    bool "IsGamepadButtonUp"))

;;; Get the last gamepad button pressed
(define get-gamepad-button-pressed
  (c-lambda ()
    int "GetGamepadButtonPressed"))

;;; Return gamepad axis count for a gamepad
(define get-gamepad-axis-count
  (c-lambda (int)
    int "GetGamepadAxisCount"))

;;; Return axis movement value for a gamepad axis
(define get-gamepad-axis-movement
  (c-lambda (int int)
    float "GetGamepadAxisMovement"))

;;; Detect if a mouse button has been pressed once
(define is-mouse-button-pressed
  (c-lambda (int)
    bool "IsMouseButtonPressed"))

;;; Detect if a mouse button is being pressed
(define is-mouse-button-down
  (c-lambda (int)
    bool "IsMouseButtonDown"))

;;; Detect if a mouse button has been released once
(define is-mouse-button-released
  (c-lambda (int)
    bool "IsMouseButtonReleased"))

;;; Detect if a mouse button is NOT being pressed
(define is-mouse-button-up
  (c-lambda (int)
    bool "IsMouseButtonUp"))

;;; Returns mouse position X
(define get-mouse-x
  (c-lambda ()
    int "GetMouseX"))

;;; Returns mouse position Y
(define get-mouse-y
  (c-lambda ()
    int "GetMouseY"))

;;; Returns mouse position XY
(define get-mouse-position
  (c-lambda ()
    vector2 "GetMousePosition"))

;;; Set mouse position XY
(define set-mouse-position
  (c-lambda (int int)
    void "SetMousePosition"))

;;; Set mouse offset
(define set-mouse-offset
  (c-lambda (int int)
    void "SetMouseOffset"))

;;; Set mouse scaling
(define set-mouse-scale
  (c-lambda (float float)
    void "SetMouseScale"))

;;; Returns mouse wheel movement Y
(define get-mouse-wheel-move
  (c-lambda ()
    int "GetMouseWheelMove"))

;;; Returns touch position X for touch point 0 (relative to screen size)
(define get-touch-x
  (c-lambda ()
    int "GetTouchX"))

;;; Returns touch position Y for touch point 0 (relative to screen size)
(define get-touch-y
  (c-lambda ()
    int "GetTouchY"))

;;; Returns touch position XY for a touch point index (relative to screen size)
(define get-touch-position
  (c-lambda (int)
    vector2 "GetTouchPosition"))

;;; Enable a set of gestures using flags
(define set-gestures-enabled
  (c-lambda (unsigned-int)
    void "SetGesturesEnabled"))

;;; Check if a gesture have been detected
(define is-gesture-detected
  (c-lambda (int)
    bool "IsGestureDetected"))

;;; Get latest detected gesture
(define get-gesture-detected
  (c-lambda ()
    int "GetGestureDetected"))

;;; Get touch points count
(define get-touch-points-count
  (c-lambda ()
    int "GetTouchPointsCount"))

;;; Get gesture hold time in milliseconds
(define get-gesture-hold-duration
  (c-lambda ()
    float "GetGestureHoldDuration"))

;;; Get gesture drag vector
(define get-gesture-drag-vector
  (c-lambda ()
    vector2 "GetGestureDragVector"))

;;; Get gesture drag angle
(define get-gesture-drag-angle
  (c-lambda ()
    float "GetGestureDragAngle"))

;;; Get gesture pinch delta
(define get-gesture-pinch-vector
  (c-lambda ()
    vector2 "GetGesturePinchVector"))

;;; Get gesture pinch angle
(define get-gesture-pinch-angle
  (c-lambda ()
    float "GetGesturePinchAngle"))

;;; Set camera mode (multiple camera modes available)
(define set-camera-mode
  (c-lambda (camera int)
    void "SetCameraMode"))

;;; Update camera position for selected mode
(define update-camera
  (c-lambda ((pointer camera))
    void "UpdateCamera"))

;;; Set camera pan key to combine with mouse movement (free camera)
(define set-camera-pan-control
  (c-lambda (int)
    void "SetCameraPanControl"))

;;; Set camera alt key to combine with mouse movement (free camera)
(define set-camera-alt-control
  (c-lambda (int)
    void "SetCameraAltControl"))

;;; Set camera smooth zoom key to combine with mouse (free camera)
(define set-camera-smooth-zoom-control
  (c-lambda (int)
    void "SetCameraSmoothZoomControl"))

;;; Set camera move controls (1st person and 3rd person cameras)
(define set-camera-move-controls
  (c-lambda (int int int int int int)
    void "SetCameraMoveControls"))


;    ▄████████    ▄█    █▄       ▄████████    ▄███████▄    ▄████████    ▄████████ 
;   ███    ███   ███    ███     ███    ███   ███    ███   ███    ███   ███    ███ 
;   ███    █▀    ███    ███     ███    ███   ███    ███   ███    █▀    ███    █▀  
;   ███         ▄███▄▄▄▄███▄▄   ███    ███   ███    ███  ▄███▄▄▄       ███        
; ▀███████████ ▀▀███▀▀▀▀███▀  ▀███████████ ▀█████████▀  ▀▀███▀▀▀     ▀███████████ 
;          ███   ███    ███     ███    ███   ███          ███    █▄           ███ 
;    ▄█    ███   ███    ███     ███    ███   ███          ███    ███    ▄█    ███ 
;  ▄████████▀    ███    █▀      ███    █▀   ▄████▀        ██████████  ▄████████▀  

;;;-----------------------------------------------------------------------------
;;; These are the functions defined in the shapes module of raylib.
;;;-----------------------------------------------------------------------------
;;; Draw a pixel
(define draw-pixel
  (c-lambda (int int color)
    void "DrawPixel"))

;;; Draw a pixel (Vector version)
(define draw-pixel-v
  (c-lambda (vector2 color)
    void "DrawPixelV"))

;;; Draw a line
(define draw-line
  (c-lambda (int int int int color)
    void "DrawLine"))

;;; Draw a line (Vector version)
(define draw-line-v
  (c-lambda (vector2 vector2 color)
    void "DrawLineV"))

;;; Draw a line defining thickness
(define draw-line-ex
  (c-lambda (vector2 vector2 float color)
    void "DrawLineEx"))

;;; Draw a line using cubic-bezier curves in-out
(define draw-line-bezier
  (c-lambda (vector2 vector2 float color)
    void "DrawLineBezier"))

;;; Draw lines sequence
(define draw-line-strip
  (c-lambda ((pointer vector2) int color)
    void "DrawLineStrip"))

;;; Draw a color-filled circle
(define draw-circle
  (c-lambda (int int float color)
    void "DrawCircle"))

;;; Draw a piece of a circle
(define draw-circle-sector
  (c-lambda (vector2 float int int int color)
    void "DrawCircleSector"))

;;; Draw circle sector outline
(define draw-circle-sector-lines
  (c-lambda (vector2 float int int int color)
    void "DrawCircleSectorLines"))

;;; Draw a gradient-filled circle
(define draw-circle-gradient
  (c-lambda (int int float color color)
    void "DrawCircleGradient"))

;;; Draw a color-filled circle (Vector version)
(define draw-circle-v
  (c-lambda (vector2 float color)
    void "DrawCircleV"))

;;; Draw circle outline
(define draw-circle-lines
  (c-lambda (int int float color)
    void "DrawCircleLines"))

;;; Draw ellipse
(define draw-ellipse
  (c-lambda (int int float float color)
    void "DrawEllipse"))

;;; Draw ellipse outline
(define draw-ellipse-lines
  (c-lambda (int int float float color)
    void "DrawEllipseLines"))

;;; Draw ring
(define draw-ring
  (c-lambda (vector2 float float int int int color)
    void "DrawRing"))

;;; Draw ring outline
(define draw-ring-lines
  (c-lambda (vector2 float float int int int color)
    void "DrawRingLines"))

;;; Draw a color-filled rectangle
(define draw-rectangle
  (c-lambda (int int int int color)
    void "DrawRectangle"))

;;; Draw a color-filled rectangle (Vector version)
(define draw-rectangle-v
  (c-lambda (vector2 vector2 color)
    void "DrawRectangleV"))

;;; Draw a color-filled rectangle
(define draw-rectangle-rec
  (c-lambda (rectangle color)
    void "DrawRectangleRec"))

;;; Draw a color-filled rectangle with pro parameters
(define draw-rectangle-pro
  (c-lambda (rectangle vector2 float color)
    void "DrawRectanglePro"))

;;; Draw a vertical-gradient-filled rectangle
(define draw-rectangle-gradient-v
  (c-lambda (int int int int color color)
    void "DrawRectangleGradientV"))

;;; Draw a horizontal-gradient-filled rectangle
(define draw-rectangle-gradient-h
  (c-lambda (int int int int color color)
    void "DrawRectangleGradientH"))

;;; Draw a gradient-filled rectangle with custom vertex colors
(define draw-rectangle-gradient-ex
  (c-lambda (rectangle color color color color)
    void "DrawRectangleGradientEx"))

;;; Draw rectangle outline
(define draw-rectangle-lines
  (c-lambda (int int int int color)
    void "DrawRectangleLines"))

;;; Draw rectangle outline with extended parameters
(define draw-rectangle-lines-ex
  (c-lambda (rectangle int color)
    void "DrawRectangleLinesEx"))

;;; Draw rectangle with rounded edges
(define draw-rectangle-rounded
  (c-lambda (rectangle float int color)
    void "DrawRectangleRounded"))

;;; Draw rectangle with rounded edges outline
(define draw-rectangle-rounded-lines
  (c-lambda (rectangle float int int color)
    void "DrawRectangleRoundedLines"))

;;; Draw a color-filled triangle (vertex in counter-clockwise order!)
(define draw-triangle
  (c-lambda (vector2 vector2 vector2 color)
    void "DrawTriangle"))

;;; Draw triangle outline (vertex in counter-clockwise order!)
(define draw-triangle-lines
  (c-lambda (vector2 vector2 vector2 color)
    void "DrawTriangleLines"))

;;; Draw a triangle fan defined by points (first vertex is the center)
(define draw-triangle-fan
  (c-lambda ((pointer vector2) int color)
    void "DrawTriangleFan"))

;;; Draw a triangle strip defined by points
(define draw-triangle-strip
  (c-lambda ((pointer vector2) int color)
    void "DrawTriangleStrip"))

;;; Draw a regular polygon (Vector version)
(define draw-poly
  (c-lambda (vector2 int float float color)
    void "DrawPoly"))

;;; Draw a polygon outline of n sides
(define draw-poly-lines
  (c-lambda (vector2 int float float color)
    void "DrawPolyLines"))

;;; Check collision between two rectangles
(define check-collision-recs
  (c-lambda (rectangle rectangle)
    bool "CheckCollisionRecs"))

;;; Check collision between two circles
(define check-collision-circles
  (c-lambda (vector2 float vector2 float)
    bool "CheckCollisionCircles"))

;;; Check collision between circle and rectangle
(define check-collision-circle-rec
  (c-lambda (vector2 float rectangle)
    bool "CheckCollisionCircleRec"))

;;; Get collision rectangle for two rectangles collision
(define get-collision-rec
  (c-lambda (rectangle rectangle)
    rectangle "GetCollisionRec"))

;;; Check if point is inside rectangle
(define check-collision-point-rec
  (c-lambda (vector2 rectangle)
    bool "CheckCollisionPointRec"))

;;; Check if point is inside circle
(define check-collision-point-circle
  (c-lambda (vector2 vector2 float)
    bool "CheckCollisionPointCircle"))

;;; Check if point is inside a triangle
(define check-collision-point-triangle
  (c-lambda (vector2 vector2 vector2 vector2)
    bool "CheckCollisionPointTriangle"))


;     ███        ▄████████ ▀████    ▐████▀     ███     ███    █▄     ▄████████    ▄████████ 
; ▀█████████▄   ███    ███   ███▌   ████▀  ▀█████████▄ ███    ███   ███    ███   ███    ███ 
;    ▀███▀▀██   ███    █▀     ███  ▐███       ▀███▀▀██ ███    ███   ███    ███   ███    █▀  
;     ███   ▀  ▄███▄▄▄        ▀███▄███▀        ███   ▀ ███    ███  ▄███▄▄▄▄██▀  ▄███▄▄▄     
;     ███     ▀▀███▀▀▀        ████▀██▄         ███     ███    ███ ▀▀███▀▀▀▀▀   ▀▀███▀▀▀     
;     ███       ███    █▄    ▐███  ▀███        ███     ███    ███ ▀███████████   ███    █▄  
;     ███       ███    ███  ▄███     ███▄      ███     ███    ███   ███    ███   ███    ███ 
;    ▄████▀     ██████████ ████       ███▄    ▄████▀   ████████▀    ███    ███   ██████████ 
;                                                                   ███    ███              

;;;-----------------------------------------------------------------------------
;;; These are the functions defined in the texture module of raylib.
;;;-----------------------------------------------------------------------------
;;; Load image from file into CPU memory (RAM)
(define load-image
  (c-lambda (char-string)
    image "LoadImage"))

; ;;; Load image from Color array data (RGBA - 32bit)
; (define load-image-ex
;   (c-lambda ((pointer color) int int)
;     image "LoadImageEx"))

; ;;; Load image from raw data with parameters
; (define load-image-pro
;   (c-lambda ((pointer void) int int int)
;     image "LoadImagePro"))

; ;;; Load image from RAW file data
; (define load-image-raw
;   (c-lambda (char-string int int int int)
;     image "LoadImageRaw"))

; ;;; Unload image from CPU memory (RAM)
; (define unload-image
;   (c-lambda (image)
;     void "UnloadImage"))

; ;;; Export image data to file
; (define export-image
;   (c-lambda (image char-string)
;     void "ExportImage"))

; ;;; Export image as code file defining an array of bytes
; (define export-image-as-code
;   (c-lambda (image char-string)
;     void "ExportImageAsCode"))

; ;;; Get pixel data from image as a Color struct array
; (define get-image-data
;   (c-lambda (image)
;     (pointer color) "GetImageData"))

; ;;; Get pixel data from image as Vector4 array (float normalized)
; (define get-image-data-normalized
;   (c-lambda (image)
;     (pointer vector4) "GetImageDataNormalized"))

; ;;; Generate image: plain color
; (define gen-image-color
;   (c-lambda (int int color)
;     image "GenImageColor"))

; ;;; Generate image: vertical gradient
; (define gen-image-gradient-v
;   (c-lambda (int int color color)
;     image "GenImageGradientV"))

; ;;; Generate image: horizontal gradient
; (define gen-image-gradient-h
;   (c-lambda (int int color color)
;     image "GenImageGradientH"))

; ;;; Generate image: radial gradient
; (define gen-image-gradient-radial
;   (c-lambda (int int float color color)
;     image "GenImageGradientRadial"))

; ;;; Generate image: checked
(define gen-image-checked
  (c-lambda (int int int int color color)
    image "GenImageChecked"))

; ;;; Generate image: white noise
; (define gen-image-white-noise
;   (c-lambda (int int float)
;     image "GenImageWhiteNoise"))

; ;;; Generate image: perlin noise
; (define gen-image-perlin-noise
;   (c-lambda (int int int int float)
;     image "GenImagePerlinNoise"))

; ;;; Generate image: cellular algorithm. Bigger tileSize means bigger cells
; (define gen-image-cellular
;   (c-lambda (int int int)
;     image "GenImageCellular"))

; ;;; Create an image duplicate (useful for transformations)
; (define image-copy
;   (c-lambda (image)
;     image "ImageCopy"))

; ;;; Create an image from another image piece
; (define image-from-image
;   (c-lambda (image rectangle)
;     image "ImageFromImage"))

; ;;; Create an image from text (default font)
; (define image-text
;   (c-lambda (char-string int color)
;     image "ImageText"))

; ;;; Create an image from text (custom sprite font)
; (define image-text-ex
;   (c-lambda (font char-string float float color)
;     image "ImageTextEx"))

; ;;; Convert image to POT (power-of-two)
; (define image-to-pot
;   (c-lambda ((pointer image) color)
;     void "ImageToPOT"))

; ;;; Convert image data to desired format
; (define image-format
;   (c-lambda ((pointer image) int)
;     void "ImageFormat"))

; ;;; Apply alpha mask to image
; (define image-alpha-mask
;   (c-lambda ((pointer image) image)
;     void "ImageAlphaMask"))

; ;;; Clear alpha channel to desired color
; (define image-alpha-clear
;   (c-lambda ((pointer image) color float)
;     void "ImageAlphaClear"))

; ;;; Crop image depending on alpha value
; (define image-alpha-crop
;   (c-lambda ((pointer image) float)
;     void "ImageAlphaCrop"))

; ;;; Premultiply alpha channel
; (define image-alpha-premultiply
;   (c-lambda ((pointer image))
;     void "ImageAlphaPremultiply"))

; ;;; Crop an image to a defined rectangle
; (define image-crop
;   (c-lambda ((pointer image) rectangle)
;     void "ImageCrop"))

; ;;; Resize image (Bicubic scaling algorithm)
; (define image-resize
;   (c-lambda ((pointer image) int int)
;     void "ImageResize"))

; ;;; Resize image (Nearest-Neighbor scaling algorithm)
; (define image-resize-nn
;   (c-lambda ((pointer image) int int)
;     void "ImageResizeNN"))

; ;;; Resize canvas and fill with color
; (define image-resize-canvas
;   (c-lambda ((pointer image) int int int int color)
;     void "ImageResizeCanvas"))

; ;;; Generate all mipmap levels for a provided image
; (define image-mipmaps
;   (c-lambda ((pointer image))
;     void "ImageMipmaps"))

; ;;; Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
; (define image-dither
;   (c-lambda ((pointer image) int int int int)
;     void "ImageDither"))

; ;;; Flip image vertically
; (define image-flip-vertical
;   (c-lambda ((pointer image))
;     void "ImageFlipVertical"))

; ;;; Flip image horizontally
; (define image-flip-horizontal
;   (c-lambda ((pointer image))
;     void "ImageFlipHorizontal"))

; ;;; Rotate image clockwise 90deg
; (define image-rotate-cw
;   (c-lambda ((pointer image))
;     void "ImageRotateCW"))

; ;;; Rotate image counter-clockwise 90deg
; (define image-rotate-ccw
;   (c-lambda ((pointer image))
;     void "ImageRotateCCW"))

; ;;; Modify image color: tint
; (define image-color-tint
;   (c-lambda ((pointer image) color)
;     void "ImageColorTint"))

; ;;; Modify image color: invert
; (define image-color-invert
;   (c-lambda ((pointer image))
;     void "ImageColorInvert"))

; ;;; Modify image color: grayscale
; (define image-color-grayscale
;   (c-lambda ((pointer image))
;     void "ImageColorGrayscale"))

; ;;; Modify image color: contrast (-100 to 100)
; (define image-color-contrast
;   (c-lambda ((pointer image) float)
;     void "ImageColorContrast"))

; ;;; Modify image color: brightness (-255 to 255)
; (define image-color-brightness
;   (c-lambda ((pointer image) int)
;     void "ImageColorBrightness"))

; ;;; Modify image color: replace color
; (define image-color-replace
;   (c-lambda ((pointer image) color color)
;     void "ImageColorReplace"))

; ;;; Extract color palette from image to maximum size (memory should be freed)
; (define image-extract-palette
;   (c-lambda (image int (pointer int))
;     (pointer color) "ImageExtractPalette"))

; ;;; Get image alpha border rectangle
; (define get-image-alpha-border
;   (c-lambda (image float)
;     rectangle "GetImageAlphaBorder"))

; ;;; Clear image background with given color
; (define image-clear-background
;   (c-lambda ((pointer image) color)
;     void "ImageClearBackground"))

; ;;; Draw pixel within an image
; (define image-draw-pixel
;   (c-lambda ((pointer image) int int color)
;     void "ImageDrawPixel"))

; ;;; Draw pixel within an image (Vector version)
; (define image-draw-pixel-v
;   (c-lambda ((pointer image) vector2 color)
;     void "ImageDrawPixelV"))

; ;;; Draw line within an image
; (define image-draw-line
;   (c-lambda ((pointer image) int int int int color)
;     void "ImageDrawLine"))

; ;;; Draw line within an image (Vector version)
; (define image-draw-line-v
;   (c-lambda ((pointer image) vector2 vector2 color)
;     void "ImageDrawLineV"))

; ;;; Draw circle within an image
; (define image-draw-circle
;   (c-lambda ((pointer image) int int int color)
;     void "ImageDrawCircle"))

; ;;; Draw circle within an image (Vector version)
; (define image-draw-circle-v
;   (c-lambda ((pointer image) vector2 int color)
;     void "ImageDrawCircleV"))

; ;;; Draw rectangle within an image
; (define image-draw-rectangle
;   (c-lambda ((pointer image) int int int int color)
;     void "ImageDrawRectangle"))

; ;;; Draw rectangle within an image (Vector version)
; (define image-draw-rectangle-v
;   (c-lambda ((pointer image) vector2 vector2 color)
;     void "ImageDrawRectangleV"))

; ;;; Draw rectangle within an image 
; (define image-draw-rectangle-rec
;   (c-lambda ((pointer image) rectangle color)
;     void "ImageDrawRectangleRec"))

; ;;; Draw rectangle lines within an image
; (define image-draw-rectangle-lines
;   (c-lambda ((pointer image) rectangle int color)
;     void "ImageDrawRectangleLines"))

; ;;; Draw a source image within a destination image (tint applied to source)
; (define image-draw
;   (c-lambda ((pointer image) image rectangle rectangle color)
;     void "ImageDraw"))

; ;;; Draw text (default font) within an image (destination)
; (define image-draw-text
;   (c-lambda ((pointer image) vector2 char-string int color)
;     void "ImageDrawText"))

; ;;; Draw text (custom sprite font) within an image (destination)
; (define image-draw-text-ex
;   (c-lambda ((pointer image) vector2 font char-string float float color)
;     void "ImageDrawTextEx"))

; ;;; Load texture from file into GPU memory (VRAM)
(define load-texture
  (c-lambda (char-string)
    texture "LoadTexture"))

; ;;; Load texture from image data
(define load-texture-from-image
  (c-lambda (image)
    texture "LoadTextureFromImage"))

; ;;; Load cubemap from image, multiple image cubemap layouts supported
; (define load-texture-cubemap
;   (c-lambda (image int)
;     texture-cubemap "LoadTextureCubemap"))

; ;;; Load texture for rendering (framebuffer)
; (define load-render-texture
;   (c-lambda (int int)
;     render-texture-2d "LoadRenderTexture"))

; ;;; Unload texture from GPU memory (VRAM)
(define unload-texture
  (c-lambda (texture)
    void "UnloadTexture"))

; ;;; Unload render texture from GPU memory (VRAM)
; (define unload-render-texture
;   (c-lambda (render-texture-2d)
;     void "UnloadRenderTexture"))

; ;;; BUG: (const void pointer)Update GPU texture with new data
; (define update-texture
;   (c-lambda (texture-2d (nonnull-pointer void))
;     void "UpdateTexture"))

; ;;; Unload render texture from GPU memory (VRAM)
; (define unload-render-texture
;   (c-lambda (render-texture-2d)
;     void "UnloadRenderTexture"))

; ;;; Update GPU texture with new data
; (define update-texture
;   (c-lambda (texture-2d (nonnull-pointer void))
;     void "UpdateTexture"))

; ;;; Get pixel data from GPU texture and return an Image
; (define get-texture-data
;   (c-lambda (texture-2d)
;     image "GetTextureData"))

; ;;; Get pixel data from screen buffer and return an Image (screenshot)
; (define get-screen-data
;   (c-lambda ()
;     image "GetScreenData"))

; ;;; Generate GPU mipmaps for a texture
; (define gen-texture-mipmaps
;   (c-lambda ((pointer texture-2d))
;     void "GenTextureMipmaps"))

; ;;; Set texture scaling filter mode
; (define set-texture-filter
;   (c-lambda (texture-2d int)
;     void "SetTextureFilter"))

; ;;; Set texture wrapping mode
; (define set-texture-wrap
;   (c-lambda (texture-2d int)
;     void "SetTextureWrap"))

; ;;; Draw a Texture2D
(define draw-texture
  (c-lambda (texture int int color)
    void "DrawTexture"))

; ;;; Draw a Texture2D with position defined as Vector2
; (define draw-texture-v
;   (c-lambda (texture-2d vector2 color)
;     void "DrawTextureV"))

; ;;; Draw a Texture2D with extended parameters
; (define draw-texture-ex
;   (c-lambda (texture-2d vector2 float float color)
;     void "DrawTextureEx"))

; ;;; Draw a part of a texture defined by a rectangle
; (define draw-texture-rec
;   (c-lambda (texture-2d rectangle vector2 color)
;     void "DrawTextureRec"))

; ;;; Draw texture quad with tiling and offset parameters
; (define draw-texture-quad
;   (c-lambda (texture-2d vector2 vector2 rectangle color)
;     void "DrawTextureQuad"))

; ;;; Draw a part of a texture defined by a rectangle with 'pro' parameters
; (define draw-texture-pro
;   (c-lambda (texture-2d rectangle rectangle vector2 float color)
;     void "DrawTexturePro"))

; ;;; Draws a texture (or part of it) that stretches or shrinks nicely
; (define draw-texture-n-patch
;   (c-lambda (texture-2d n-patch-info rectangle vector2 float color)
;     void "DrawTextureNPatch"))

; ;;; Get pixel data size in bytes (image or texture)
; (define get-pixel-data-size
;   (c-lambda (int int int)
;     int "GetPixelDataSize"))


;     ███        ▄████████ ▀████    ▐████▀     ███     
; ▀█████████▄   ███    ███   ███▌   ████▀  ▀█████████▄ 
;    ▀███▀▀██   ███    █▀     ███  ▐███       ▀███▀▀██ 
;     ███   ▀  ▄███▄▄▄        ▀███▄███▀        ███   ▀ 
;     ███     ▀▀███▀▀▀        ████▀██▄         ███     
;     ███       ███    █▄    ▐███  ▀███        ███     
;     ███       ███    ███  ▄███     ███▄      ███     
;    ▄████▀     ██████████ ████       ███▄    ▄████▀   
                                                     
;;;-----------------------------------------------------------------------------
;;; These are the functions defined in the text module of raylib.
;;;-----------------------------------------------------------------------------
;;; Get the default Font
(define get-font-default
  (c-lambda ()
    font "GetFontDefault"))

;;; Load font from file into GPU memory (VRAM)
(define load-font
  (c-lambda (char-string)
    font "LoadFont"))

;;; Load font from file with extended parameters
(define load-font-ex
  (c-lambda (char-string int (pointer int) int)
    font "LoadFontEx"))

;;; Load font from Image (XNA style)
(define load-font-from-image
  (c-lambda (image color int)
    font "LoadFontFromImage"))

;;; Load font data for further use
(define load-font-data
  (c-lambda (char-string int (pointer int) int int)
    (pointer char-info) "LoadFontData"))

;;; Generate image font atlas using chars info
(define gen-image-font-atlas
  (c-lambda ((pointer char-info) (pointer (pointer rectangle)) int int int int)
    image "GenImageFontAtlas"))

;;; Unload Font from GPU memory (VRAM)
(define unload-font
  (c-lambda (font)
    void "UnloadFont"))

;;; Shows current FPS
(define draw-fps
  (c-lambda (int int)
    void "DrawFPS"))

;;; Draw text (using default font)
(define draw-text
  (c-lambda (char-string int int int color)
    void "DrawText"))

;;; Draw text using font and additional parameters
(define draw-text-ex
  (c-lambda (font char-string vector2 float float color)
    void "DrawTextEx"))

;;; Draw text using font inside rectangle limits
(define draw-text-rec
  (c-lambda (font char-string rectangle float float bool color)
    void "DrawTextRec"))

;;; Draw text using font inside rectangle limits with support for text selection
(define draw-text-rec-ex
  (c-lambda (font char-string rectangle float float bool color int int color color)
    void "DrawTextRecEx"))

;;; Draw one character (codepoint)
(define draw-text-codepoint
  (c-lambda (font int vector2 float color)
    void "DrawTextCodepoint"))

;;; Measure string width for default font
(define measure-text
  (c-lambda (char-string int)
    int "MeasureText"))

;;; Measure string size for Font
(define measure-text-ex
  (c-lambda (font char-string float float)
    vector2 "MeasureTextEx"))

;;; Get index position for a unicode character on font
(define get-glyph-index
  (c-lambda (font int)
    int "GetGlyphIndex"))

;;; Copy one string to another, returns bytes copied
(define text-copy
  (c-lambda ((pointer char) char-string)
    int "TextCopy"))

;;; Check if two text string are equal
(define text-is-equal
  (c-lambda (char-string char-string)
    bool "TextIsEqual"))

;;; Get text length, checks for ' ' ending
(define text-length
  (c-lambda (char-string)
    unsigned-int "TextLength"))

;;; BUG: (Argument number) Text formatting with variables (sprintf style)
; (define text-format
;   (c-lambda (char-string)
;     char-string "TextFormat"))

;;; Get a piece of a text string
(define text-subtext
  (c-lambda (char-string int int)
    char-string "TextSubtext"))

;;; Replace text string (memory must be freed!)
(define text-replace
  (c-lambda ((pointer char) char-string char-string)
    (pointer char) "TextReplace"))

;;; Insert text in a position (memory must be freed!)
(define text-insert
  (c-lambda (char-string char-string int)
    (pointer char) "TextInsert"))

;;; Join text strings with delimiter
(define text-join
  (c-lambda ((pointer char-string) int char-string)
    char-string "TextJoin"))

;;; Split text into multiple strings
(define text-split
  (c-lambda (char-string char (pointer int))
    (pointer char-string) "TextSplit"))

;;; Append text at specific position and move cursor!
(define text-append
  (c-lambda ((pointer char) char-string (pointer int))
    void "TextAppend"))

;;; Find first text occurrence within a string
(define text-find-index
  (c-lambda (char-string char-string)
    int "TextFindIndex"))

;;; Get upper case version of provided string
(define text-to-upper
  (c-lambda (char-string)
    char-string "TextToUpper"))

;;; Get lower case version of provided string
(define text-to-lower
  (c-lambda (char-string)
    char-string "TextToLower"))

;;; Get Pascal case notation version of provided string
(define text-to-pascal
  (c-lambda (char-string)
    char-string "TextToPascal"))

;;; Get integer value from text (negative values not supported)
(define text-to-integer
  (c-lambda (char-string)
    int "TextToInteger"))

;;; Encode text codepoint into utf8 text (memory must be freed!)
(define text-to-utf8
  (c-lambda ((pointer int) int)
    (pointer char) "TextToUtf8"))

;;; Get all codepoints in a string, codepoints count returned by parameters
(define get-codepoints
  (c-lambda (char-string (pointer int))
    (pointer int) "GetCodepoints"))

;;; Get total number of characters (codepoints) in a UTF8 encoded string
(define get-codepoints-count
  (c-lambda (char-string)
    int "GetCodepointsCount"))

;;; Returns next codepoint in a UTF8 encoded string; 0x3f('?') is returned on failure
(define get-next-codepoint
  (c-lambda (char-string (pointer int))
    int "GetNextCodepoint"))

;;; Encode codepoint into utf8 text (char array length returned as parameter)
(define codepoint-to-utf8
  (c-lambda (int (pointer int))
    char-string "CodepointToUtf8"))


;    ▄▄▄▄███▄▄▄▄    ▄██████▄  ████████▄     ▄████████  ▄█          ▄████████ 
;  ▄██▀▀▀███▀▀▀██▄ ███    ███ ███   ▀███   ███    ███ ███         ███    ███ 
;  ███   ███   ███ ███    ███ ███    ███   ███    █▀  ███         ███    █▀  
;  ███   ███   ███ ███    ███ ███    ███  ▄███▄▄▄     ███         ███        
;  ███   ███   ███ ███    ███ ███    ███ ▀▀███▀▀▀     ███       ▀███████████ 
;  ███   ███   ███ ███    ███ ███    ███   ███    █▄  ███                ███ 
;  ███   ███   ███ ███    ███ ███   ▄███   ███    ███ ███▌    ▄    ▄█    ███ 
;   ▀█   ███   █▀   ▀██████▀  ████████▀    ██████████ █████▄▄██  ▄████████▀  
;                                                     ▀                      

;;;-----------------------------------------------------------------------------
;;; These are the functions defined in the models module of raylib.
;;;-----------------------------------------------------------------------------
;;; Draw a line in 3D world space
(define draw-line-3d
  (c-lambda (vector3 vector3 color)
    void "DrawLine3D"))

;;; Draw a point in 3D space, actually a small line
(define draw-point-3d
  (c-lambda (vector3 color)
    void "DrawPoint3D"))

;;; Draw a circle in 3D world space
(define draw-circle-3d
  (c-lambda (vector3 float vector3 float color)
    void "DrawCircle3D"))

;;; Draw cube
(define draw-cube
  (c-lambda (vector3 float float float color)
    void "DrawCube"))

;;; Draw cube (Vector version)
(define draw-cube-v
  (c-lambda (vector3 vector3 color)
    void "DrawCubeV"))

;;; Draw cube wires
(define draw-cube-wires
  (c-lambda (vector3 float float float color)
    void "DrawCubeWires"))

;;; Draw cube wires (Vector version)
(define draw-cube-wires-v
  (c-lambda (vector3 vector3 color)
    void "DrawCubeWiresV"))

;;; Draw cube textured
(define draw-cube-texture
  (c-lambda (texture vector3 float float float color)
    void "DrawCubeTexture"))

;;; Draw sphere
(define draw-sphere
  (c-lambda (vector3 float color)
    void "DrawSphere"))

;;; Draw sphere with extended parameters
(define draw-sphere-ex
  (c-lambda (vector3 float int int color)
    void "DrawSphereEx"))

;;; Draw sphere wires
(define draw-sphere-wires
  (c-lambda (vector3 float int int color)
    void "DrawSphereWires"))

;;; Draw a cylinder/cone
(define draw-cylinder
  (c-lambda (vector3 float float float int color)
    void "DrawCylinder"))

;;; Draw a cylinder/cone wires
(define draw-cylinder-wires
  (c-lambda (vector3 float float float int color)
    void "DrawCylinderWires"))

;;; Draw a plane XZ
(define draw-plane
  (c-lambda (vector3 vector2 color)
    void "DrawPlane"))

;;; Draw a ray line
(define draw-ray
  (c-lambda (ray color)
    void "DrawRay"))

;;; Draw a grid (centered at (0, 0, 0))
(define draw-grid
  (c-lambda (int float)
    void "DrawGrid"))

;;; Draw simple gizmo
(define draw-gizmo
  (c-lambda (vector3)
    void "DrawGizmo"))

;;; Load model from files (meshes and materials)
(define load-model
  (c-lambda (char-string)
    model "LoadModel"))

;;; Load model from generated mesh (default material)
(define load-model-from-mesh
  (c-lambda (mesh)
    model "LoadModelFromMesh"))

;;; Unload model from memory (RAM and/or VRAM)
(define unload-model
  (c-lambda (model)
    void "UnloadModel"))

;;; Load meshes from model file
(define load-meshes
  (c-lambda (char-string (pointer int))
    (pointer mesh) "LoadMeshes"))

;;; Export mesh data to file
(define export-mesh
  (c-lambda (mesh char-string)
    void "ExportMesh"))

;;; Unload mesh from memory (RAM and/or VRAM)
(define unload-mesh
  (c-lambda (mesh)
    void "UnloadMesh"))

;;; Load materials from model file
(define load-materials
  (c-lambda (char-string (pointer int))
    (pointer material) "LoadMaterials"))

;;; Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
(define load-material-default
  (c-lambda ()
    material "LoadMaterialDefault"))

;;; Unload material from GPU memory (VRAM)
(define unload-material
  (c-lambda (material)
    void "UnloadMaterial"))

;;; Set texture for a material map type (MAP_DIFFUSE, MAP_SPECULAR...)
(define set-material-texture
  (c-lambda ((pointer material) int texture)
    void "SetMaterialTexture"))

;;; Set material for a mesh
(define set-model-mesh-material
  (c-lambda ((pointer model) int int)
    void "SetModelMeshMaterial"))

;;; Load model animations from file
(define load-model-animations
  (c-lambda (char-string (pointer int))
    (pointer model-animation) "LoadModelAnimations"))

;;; Update model animation pose
(define update-model-animation
  (c-lambda (model model-animation int)
    void "UpdateModelAnimation"))

;;; Unload animation data
(define unload-model-animation
  (c-lambda (model-animation)
    void "UnloadModelAnimation"))

;;; Check model animation skeleton match
(define is-model-animation-valid
  (c-lambda (model model-animation)
    bool "IsModelAnimationValid"))

;;; Generate polygonal mesh
(define gen-mesh-poly
  (c-lambda (int float)
    mesh "GenMeshPoly"))

;;; Generate plane mesh (with subdivisions)
(define gen-mesh-plane
  (c-lambda (float float int int)
    mesh "GenMeshPlane"))

;;; Generate cuboid mesh
(define gen-mesh-cube
  (c-lambda (float float float)
    mesh "GenMeshCube"))

;;; Generate sphere mesh (standard sphere)
(define gen-mesh-sphere
  (c-lambda (float int int)
    mesh "GenMeshSphere"))

;;; Generate half-sphere mesh (no bottom cap)
(define gen-mesh-hemi-sphere
  (c-lambda (float int int)
    mesh "GenMeshHemiSphere"))

;;; Generate cylinder mesh
(define gen-mesh-cylinder
  (c-lambda (float float int)
    mesh "GenMeshCylinder"))

;;; Generate torus mesh
(define gen-mesh-torus
  (c-lambda (float float int int)
    mesh "GenMeshTorus"))

;;; Generate trefoil knot mesh
(define gen-mesh-knot
  (c-lambda (float float int int)
    mesh "GenMeshKnot"))

;;; Generate heightmap mesh from image data
(define gen-mesh-heightmap
  (c-lambda (image vector3)
    mesh "GenMeshHeightmap"))

;;; Generate cubes-based map mesh from image data
(define gen-mesh-cubicmap
  (c-lambda (image vector3)
    mesh "GenMeshCubicmap"))

;;; Compute mesh bounding box limits
(define mesh-bounding-box
  (c-lambda (mesh)
    bounding-box "MeshBoundingBox"))

;;; Compute mesh tangents
(define mesh-tangents
  (c-lambda ((pointer mesh))
    void "MeshTangents"))

;;; Compute mesh binormals
(define mesh-binormals
  (c-lambda ((pointer mesh))
    void "MeshBinormals"))

;;; Draw a model (with texture if set)
(define draw-model
  (c-lambda (model vector3 float color)
    void "DrawModel"))

;;; Draw a model with extended parameters
(define draw-model-ex
  (c-lambda (model vector3 vector3 float vector3 color)
    void "DrawModelEx"))

;;; Draw a model wires (with texture if set)
(define draw-model-wires
  (c-lambda (model vector3 float color)
    void "DrawModelWires"))

;;; Draw a model wires (with texture if set) with extended parameters
(define draw-model-wires-ex
  (c-lambda (model vector3 vector3 float vector3 color)
    void "DrawModelWiresEx"))

;;; Draw bounding box (wires)
(define draw-bounding-box
  (c-lambda (bounding-box color)
    void "DrawBoundingBox"))

;;; Draw a billboard texture
(define draw-billboard
  (c-lambda (camera texture vector3 float color)
    void "DrawBillboard"))

;;; Draw a billboard texture defined by sourceRec
(define draw-billboard-rec
  (c-lambda (camera texture rectangle vector3 float color)
    void "DrawBillboardRec"))

;;; Detect collision between two spheres
(define check-collision-spheres
  (c-lambda (vector3 float vector3 float)
    bool "CheckCollisionSpheres"))

;;; Detect collision between two bounding boxes
(define check-collision-boxes
  (c-lambda (bounding-box bounding-box)
    bool "CheckCollisionBoxes"))

;;; Detect collision between box and sphere
(define check-collision-box-sphere
  (c-lambda (bounding-box vector3 float)
    bool "CheckCollisionBoxSphere"))

;;; Detect collision between ray and sphere
(define check-collision-ray-sphere
  (c-lambda (ray vector3 float)
    bool "CheckCollisionRaySphere"))

;;; Detect collision between ray and sphere, returns collision point
(define check-collision-ray-sphere-ex
  (c-lambda (ray vector3 float (pointer vector3))
    bool "CheckCollisionRaySphereEx"))

;;; Detect collision between ray and box
(define check-collision-ray-box
  (c-lambda (ray bounding-box)
    bool "CheckCollisionRayBox"))

;;; Get collision info between ray and model
(define get-collision-ray-model
  (c-lambda (ray model)
    ray-hit-info "GetCollisionRayModel"))

;;; Get collision info between ray and triangle
(define get-collision-ray-triangle
  (c-lambda (ray vector3 vector3 vector3)
    ray-hit-info "GetCollisionRayTriangle"))

;;; Get collision info between ray and ground plane (Y-normal plane)
(define get-collision-ray-ground
  (c-lambda (ray float)
    ray-hit-info "GetCollisionRayGround"))


;    ▄████████    ▄█    █▄       ▄████████ ████████▄     ▄████████    ▄████████    ▄████████ 
;   ███    ███   ███    ███     ███    ███ ███   ▀███   ███    ███   ███    ███   ███    ███ 
;   ███    █▀    ███    ███     ███    ███ ███    ███   ███    █▀    ███    ███   ███    █▀  
;   ███         ▄███▄▄▄▄███▄▄   ███    ███ ███    ███  ▄███▄▄▄      ▄███▄▄▄▄██▀   ███        
; ▀███████████ ▀▀███▀▀▀▀███▀  ▀███████████ ███    ███ ▀▀███▀▀▀     ▀▀███▀▀▀▀▀   ▀███████████ 
;          ███   ███    ███     ███    ███ ███    ███   ███    █▄  ▀███████████          ███ 
;    ▄█    ███   ███    ███     ███    ███ ███   ▄███   ███    ███   ███    ███    ▄█    ███ 
;  ▄████████▀    ███    █▀      ███    █▀  ████████▀    ██████████   ███    ███  ▄████████▀  
;                                                                    ███    ███              

;;;-----------------------------------------------------------------------------
;;; These are the functions defined in the text module of raylib.
;;;-----------------------------------------------------------------------------
;;; Load chars array from text file
(define load-text
  (c-lambda (char-string)
    (pointer char) "LoadText"))

;;; Load shader from files and bind default locations
(define load-shader
  (c-lambda (char-string char-string)
    shader "LoadShader"))

;;; Load shader from code strings and bind default locations
(define load-shader-code
  (c-lambda ((pointer char) (pointer char))
    shader "LoadShaderCode"))

;;; Unload shader from GPU memory (VRAM)
(define unload-shader
  (c-lambda (shader)
    void "UnloadShader"))

;;; Get default shader
(define get-shader-default
  (c-lambda ()
    shader "GetShaderDefault"))

;;; Get default texture
(define get-texture-default
  (c-lambda ()
    texture "GetTextureDefault"))

;;; Get texture to draw shapes
(define get-shapes-texture
  (c-lambda ()
    texture "GetShapesTexture"))

;;; Get texture rectangle to draw shapes
(define get-shapes-texture-rec
  (c-lambda ()
    rectangle "GetShapesTextureRec"))

;;; Define default texture used to draw shapes
(define set-shapes-texture
  (c-lambda (texture rectangle)
    void "SetShapesTexture"))

;;; Get shader uniform location
(define get-shader-location
  (c-lambda (shader char-string)
    int "GetShaderLocation"))

;;; Set shader uniform value
(define set-shader-value
  (c-lambda (shader int (nonnull-pointer void) int)
    void "SetShaderValue"))

;;; Set shader uniform value vector
(define set-shader-value-v
  (c-lambda (shader int (nonnull-pointer void) int int)
    void "SetShaderValueV"))

;;; Set shader uniform value (matrix 4x4)
(define set-shader-value-matrix
  (c-lambda (shader int matrix)
    void "SetShaderValueMatrix"))

;;; Set shader uniform value for texture
(define set-shader-value-texture
  (c-lambda (shader int texture)
    void "SetShaderValueTexture"))

;;; Set a custom projection matrix (replaces internal projection matrix)
(define set-matrix-projection
  (c-lambda (matrix)
    void "SetMatrixProjection"))

;;; Set a custom modelview matrix (replaces internal modelview matrix)
(define set-matrix-modelview
  (c-lambda (matrix)
    void "SetMatrixModelview"))

;;; Get internal modelview matrix
(define get-matrix-modelview
  (c-lambda ()
    matrix "GetMatrixModelview"))

;;; Get internal projection matrix
(define get-matrix-projection
  (c-lambda ()
    matrix "GetMatrixProjection"))

;;; Begin custom shader drawing
(define begin-shader-mode
  (c-lambda (shader)
    void "BeginShaderMode"))

;;; End custom shader drawing (use default shader)
(define end-shader-mode
  (c-lambda ()
    void "EndShaderMode"))

;;; Begin blending mode (alpha, additive, multiplied)
(define begin-blend-mode
  (c-lambda (int)
    void "BeginBlendMode"))

;;; End blending mode (reset to default: alpha blending)
(define end-blend-mode
  (c-lambda ()
    void "EndBlendMode"))

;;; Init VR simulator for selected device parameters
(define init-vr-simulator
  (c-lambda ()
    void "InitVrSimulator"))

;;; Close VR simulator for current device
(define close-vr-simulator
  (c-lambda ()
    void "CloseVrSimulator"))

;;; Update VR tracking (position and orientation) and camera
(define update-vr-tracking
  (c-lambda ((pointer camera))
    void "UpdateVrTracking"))

;;; Set stereo rendering configuration parameters 
(define set-vr-configuration
  (c-lambda (vr-device-info shader)
    void "SetVrConfiguration"))

;;; Detect if VR simulator is ready
(define is-vr-simulator-ready
  (c-lambda ()
    bool "IsVrSimulatorReady"))


;    ▄████████ ███    █▄  ████████▄   ▄█   ▄██████▄  
;   ███    ███ ███    ███ ███   ▀███ ███  ███    ███ 
;   ███    ███ ███    ███ ███    ███ ███▌ ███    ███ 
;   ███    ███ ███    ███ ███    ███ ███▌ ███    ███ 
; ▀███████████ ███    ███ ███    ███ ███▌ ███    ███ 
;   ███    ███ ███    ███ ███    ███ ███  ███    ███ 
;   ███    ███ ███    ███ ███   ▄███ ███  ███    ███ 
;   ███    █▀  ████████▀  ████████▀  █▀    ▀██████▀  
                                                   
;;;-----------------------------------------------------------------------------
;;; These are the functions defined in the audio module of raylib.
;;;-----------------------------------------------------------------------------
;;; Initialize audio device and context
(define init-audio-device
  (c-lambda ()
    void "InitAudioDevice"))

;;; Close the audio device and context (and music stream)
(define close-audio-device
  (c-lambda ()
    void "CloseAudioDevice"))

;;; Check if audio device is ready
(define is-audio-device-ready
  (c-lambda ()
    bool "IsAudioDeviceReady"))

;;; Set master volume (listener)
(define set-master-volume
  (c-lambda (float)
    void "SetMasterVolume"))

;;; Load wave data from file
(define load-wave
  (c-lambda (char-string)
    wave "LoadWave"))

;;; BUG: Converting Wave to void* not working properly
;;; Load wave data from raw array data
; (define load-wave-ex
;   (c-lambda ((pointer void) int int int int)
;     wave "LoadWaveEx"))

;;; Load sound from file
(define load-sound
  (c-lambda (char-string)
    sound "LoadSound"))

;;; Load sound from wave data
(define load-sound-from-wave
  (c-lambda (wave)
    sound "LoadSoundFromWave"))

;;; Update sound buffer with new data
(define update-sound
  (c-lambda (sound (nonnull-pointer void) int)
    void "UpdateSound"))

;;; Unload wave data
(define unload-wave
  (c-lambda (wave)
    void "UnloadWave"))

;;; Unload sound
(define unload-sound
  (c-lambda (sound)
    void "UnloadSound"))

;;; Export wave data to file
(define export-wave
  (c-lambda (wave char-string)
    void "ExportWave"))

;;; Export wave sample data to code (.h)
(define export-wave-as-code
  (c-lambda (wave char-string)
    void "ExportWaveAsCode"))

;;; Play a sound
(define play-sound
  (c-lambda (sound)
    void "PlaySound"))

;;; Stop playing a sound
(define stop-sound
  (c-lambda (sound)
    void "StopSound"))

;;; Pause a sound
(define pause-sound
  (c-lambda (sound)
    void "PauseSound"))

;;; Resume a paused sound
(define resume-sound
  (c-lambda (sound)
    void "ResumeSound"))

;;; Play a sound (using multichannel buffer pool)
(define play-sound-multi
  (c-lambda (sound)
    void "PlaySoundMulti"))

;;; Stop any sound playing (using multichannel buffer pool)
(define stop-sound-multi
  (c-lambda ()
    void "StopSoundMulti"))

;;; Get number of sounds playing in the multichannel
(define get-sounds-playing
  (c-lambda ()
    int "GetSoundsPlaying"))

;;; Check if a sound is currently playing
(define is-sound-playing
  (c-lambda (sound)
    bool "IsSoundPlaying"))

;;; Set volume for a sound (1.0 is max level)
(define set-sound-volume
  (c-lambda (sound float)
    void "SetSoundVolume"))

;;; Set pitch for a sound (1.0 is base level)
(define set-sound-pitch
  (c-lambda (sound float)
    void "SetSoundPitch"))

;;; Convert wave data to desired format
(define wave-format
  (c-lambda ((pointer wave) int int int)
    void "WaveFormat"))

;;; Copy a wave to a new wave
(define wave-copy
  (c-lambda (wave)
    wave "WaveCopy"))

;;; Crop a wave to defined samples range
(define wave-crop
  (c-lambda ((pointer wave) int int)
    void "WaveCrop"))

;;; Get samples data from wave as a floats array
(define get-wave-data
  (c-lambda (wave)
    (pointer float) "GetWaveData"))

;;; Load music stream from file
(define load-music-stream
  (c-lambda (char-string)
    music "LoadMusicStream"))

;;; Unload music stream
(define unload-music-stream
  (c-lambda (music)
    void "UnloadMusicStream"))

;;; Start music playing
(define play-music-stream
  (c-lambda (music)
    void "PlayMusicStream"))

;;; Updates buffers for music streaming
(define update-music-stream
  (c-lambda (music)
    void "UpdateMusicStream"))

;;; Stop music playing
(define stop-music-stream
  (c-lambda (music)
    void "StopMusicStream"))

;;; Pause music playing
(define pause-music-stream
  (c-lambda (music)
    void "PauseMusicStream"))

;;; Resume playing paused music
(define resume-music-stream
  (c-lambda (music)
    void "ResumeMusicStream"))

;;; Check if music is playing
(define is-music-playing
  (c-lambda (music)
    bool "IsMusicPlaying"))

;;; Set volume for music (1.0 is max level)
(define set-music-volume
  (c-lambda (music float)
    void "SetMusicVolume"))

;;; Set pitch for a music (1.0 is base level)
(define set-music-pitch
  (c-lambda (music float)
    void "SetMusicPitch"))

;;; BUG: can't find reference
;;; Set music loop count (loop repeats)
; (define set-music-loop-count
;   (c-lambda (music int)
;     void "SetMusicLoopCount"))

;;; Get music time length (in seconds)
(define get-music-time-length
  (c-lambda (music)
    float "GetMusicTimeLength"))

;;; Get current music time played (in seconds)
(define get-music-time-played
  (c-lambda (music)
    float "GetMusicTimePlayed"))

;;; Init audio stream (to stream raw audio pcm data)
(define init-audio-stream
  (c-lambda (unsigned-int unsigned-int unsigned-int)
    audio-stream "InitAudioStream"))

;;; Update audio stream buffers with data
(define update-audio-stream
  (c-lambda (audio-stream (nonnull-pointer void) int)
    void "UpdateAudioStream"))

;;; Close audio stream and free memory
(define close-audio-stream
  (c-lambda (audio-stream)
    void "CloseAudioStream"))

;;; Check if any audio stream buffers requires refill
(define is-audio-stream-processed
  (c-lambda (audio-stream)
    bool "IsAudioStreamProcessed"))

;;; Play audio stream
(define play-audio-stream
  (c-lambda (audio-stream)
    void "PlayAudioStream"))

;;; Pause audio stream
(define pause-audio-stream
  (c-lambda (audio-stream)
    void "PauseAudioStream"))

;;; Resume audio stream
(define resume-audio-stream
  (c-lambda (audio-stream)
    void "ResumeAudioStream"))

;;; Check if audio stream is playing
(define is-audio-stream-playing
  (c-lambda (audio-stream)
    bool "IsAudioStreamPlaying"))

;;; Stop audio stream
(define stop-audio-stream
  (c-lambda (audio-stream)
    void "StopAudioStream"))

;;; Set volume for audio stream (1.0 is max level)
(define set-audio-stream-volume
  (c-lambda (audio-stream float)
    void "SetAudioStreamVolume"))

;;; Set pitch for audio stream (1.0 is base level)
(define set-audio-stream-pitch
  (c-lambda (audio-stream float)
    void "SetAudioStreamPitch"))
