; ============================================================================
; CapsLock Vim Layer — AutoHotkey v2
; ============================================================================
;
; MODIFIED: CapsLock is now a TOGGLE modifier instead of a hold modifier.
; Press CapsLock once to enable the layer, press again to disable it.
; When the layer is enabled, Escape sends Alt+F4.
; When the layer is disabled, Escape works normally.
;
; ============================================================================

#Requires AutoHotkey v2.0

; Track whether the Vim layer is active
vimLayerActive := false

; Force CapsLock state permanently off so the LED never lights up
SetCapsLockState "AlwaysOff"

; CapsLock toggles the Vim layer on/off
*CapsLock:: {
    global vimLayerActive
    vimLayerActive := !vimLayerActive
    if vimLayerActive
        ToolTip("Vim Layer: ON")
    else
        ToolTip("Vim Layer: OFF")
    SetTimer(() => ToolTip(), -2000)
}

; -- Context: everything below only fires while Vim layer is active --------
#HotIf vimLayerActive

; -- Escape → Alt+F4 -------------------------------------------------------
*Escape:: Send "!{F4}"

; -- Arrow Movement --------------------------------------------------------
*h:: Send "{Blind}{Left}"
*j:: Send "{Blind}{Down}"
*k:: Send "{Blind}{Up}"
*l:: Send "{Blind}{Right}"

; -- Word Navigation -------------------------------------------------------
*w:: Send "{Blind}^{Right}"
*b:: Send "{Blind}^{Left}"

; -- Page Navigation -------------------------------------------------------
*u:: Send "{Blind}{PgUp}"
*d:: Send "{Blind}{PgDn}"

; -- Line Home/End ---------------------------------------------------------
*2:: Send "{Blind}{End}"
*0:: Send "{Blind}{Home}"

; -- Clipboard Operations --------------------------------------------------
*x:: Send "{Blind}^x"    ; Cut
*y:: Send "{Blind}^c"    ; Copy (yank)
*p:: Send "{Blind}^v"    ; Paste (put)

; -- Insert New Line -------------------------------------------------------
*o:: Send "{Blind}{End}{Enter}"

; -- End context ----------------------------------------------------------─
#HotIf