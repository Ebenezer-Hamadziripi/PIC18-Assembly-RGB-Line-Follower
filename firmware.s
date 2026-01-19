; ==============================================================================
; PROJECT:      RGB Color-Sensing Line Follower
; PLATFORM:     Microchip PIC18F45K22
; CLOCK:        16MHz Internal Oscillator
; LANGUAGE:     PIC-AS / MPASM Assembly
;
; OVERVIEW:
; This firmware implements a state machine for an autonomous robot capable of
; distinguishing line colors (Red/Green/Blue/Black) using active LED strobing
; and ADC thresholding. Features include capacitive touch start, differential 
; PWM motor control, and adaptive sensor calibration.
; ==============================================================================

; ==============================================================================
; ** PLEASE NOTE **
; Source code is kept private for academic integrity
; ==============================================================================
    
    
    
; ==============================================================================
; SYSTEM INITIALIZATION & VARIABLES
; ==============================================================================
    processor	    18F45K22
    #include	    <xc.inc>
    #include	    "pic18f45k22.inc"

; ==============================================================================
; CONFIGURATION BITS
; ==============================================================================
#include    "config_bits.inc" 

; ==============================================================================
; VARIABLE DEFINITIONS
; ==============================================================================
#include    "variables.inc" 
    
; ==============================================================================
; RESET VECTOR
; ==============================================================================
;<editor-fold defaultstate="collapsed" desc="RESET VECTOR">    
    PSECT   code,abs
	    ORG	    0x00
	    GOTO    SETUP
;</editor-fold>

; ==============================================================================
; HARDWARE SETUP
; ==============================================================================
#include    "setup.inc"

; ==============================================================================
; SYSTEM CALIBRATION ROUTINE
; Logic Flow:
; 1. Stop Motors & Display 'C'
; 2. Wait for Button -> Calibrate ALL Sensors for RED
; 3. Wait for Button -> Calibrate ALL Sensors for GREEN
; 4. Wait for Button -> Calibrate ALL Sensors for BLUE
; 5. Proceed to Cap Touch Setup
; ==============================================================================
#include    "calibration_state.inc"
	
; ==============================================================================
; ADC POLLING ROUTINES
; ==============================================================================
#include    "adc_polling.inc" 

; ==============================================================================
; DELAY SUBROUTINES
; ==============================================================================
#include    "delay_routines.inc"

; ==============================================================================
; CAPACITIVE TOUCH LOGIC
; ==============================================================================
#include    "cap_touch.inc"
	
; ==============================================================================
; RACE MODE SELECTION
; Logic: Polls DIP switches to determine the track colour mode.
; ==============================================================================
#include    "colour_select_state.inc"
	    
; ==============================================================================
;SHIFT REGISTERS (RGB LED CONTROL)
; ==============================================================================
#include    "shift_reg.inc"
	    
; ==============================================================================
; PWM MOTOR CONTROL ROUTINE
; ==============================================================================
#include    "motor_control.inc"	
    
; ==============================================================================
; RACE MODE LOGIC FLOW
; ==============================================================================
#include    "race_state.inc"
	
	END










