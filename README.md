# 🏎️ RGB Color-Sensing Line Follower (PIC18 Assembly)

A high-performance autonomous **line-following robot** built on the **PIC18F45K22**, written entirely in **optimized Assembly language**.  
The robot uses **active RGB strobing**, **adaptive calibration**, and **PID-like differential steering** for accurate, high-speed track following.

---

## 🌟 Key Features

- **RGB Color Discrimination**  
  Active strobing of Red, Green, and Blue LEDs to distinguish **Red, Green, Blue, and Black** track lines using reflected light intensity.

- **Adaptive Calibration**  
  On-the-fly calibration samples ambient lighting and surface reflectivity to generate precise ADC thresholds.

- **Capacitive Touch Start**  
  Software-implemented capacitive touch button using charge/discharge timing for vibration-free race starts.

- **Differential Drive Control**  
  Hardware PWM enables smooth cornering and speed adjustments.

- **Visual Feedback System**  
  Bit-banged **74HC595 shift registers** drive a detailed LED status display.

---

## 🛠️ Hardware Specifications

### Microcontroller
- **MCU:** PIC18F45K22  
- **Clock:** Internal HFINTOSC @ 16 MHz  
- **Language:** MPASM / PIC-AS (XC8)

### Sensors
| Sensor | Pin | Function |
|------|----|---------|
| Center | RB3 (AN9) | Line Detection |
| Left Inner | RA1 (AN1) | Line Detection |
| Right Inner | RA2 (AN2) | Line Detection |
| Left Outer | RA3 (AN3) | Line Detection |
| Right Outer | RE2 (AN7) | Line Detection |

### RGB Illumination
| Color | Pin | Logic |
|-----|----|------|
| Red | RA4 | Active High |
| Green | RA6 | Active High |
| Blue | RA7 | Active High |

### Motors
| Motor | PWM Pin | Direction Pins |
|-----|--------|----------------|
| Left | RC1 (CCP2) | RA0, RC0 |
| Right | RB5 (CCP3) | RA5, RE1 |

### Interface
| Function | Pin |
|--------|----|
| Shift Data | RC2 |
| Shift Clock | RB7 |
| Shift Latch | RB6 |
| Capacitive Touch | RE0 |

---

## ⚙️ System Logic

### Initialization
- Configures ADC, GPIO, and PWM (Timer2).

### Calibration Mode
1. Flash **Red LED** → User presses button → Record thresholds  
2. Flash **Green LED** → User presses button → Record thresholds  
3. Flash **Blue LED** → User presses button → Record thresholds  

**Threshold Formula:**  
Threshold = Measured_Value - Safety_Margin (10)

### Start Condition
Robot waits for a finger touch on the capacitive pad (RE0), detected via charge-time measurement.

### Race Loop
1. **Strobe:** Cycle R → G → B LEDs  
2. **Sense:** Read ADC from all sensors  
3. **Process:** Compare readings against calibration thresholds  
4. **Drive:** Adjust motor PWM based on sensor error  

---

## 📈 Future Improvements

- Interrupt-driven ADC sampling
- Hardware SPI for shift registers (MSSP)
- Full PID control implementation
- Higher-speed race tuning

---

## 📜 License
MIT License (or your preferred license)

