# How To Use INA219  

## Set Up Calibration Register  

1. Determination V_ShuntMax and R_Shunt.(In this time, the parameters are set to 40mV and 0.01Ω, respectively.)
2. Calculate Imax.(0.040V / 0.01Ω = 4A)
3. Calculate LSB_Current.(Imax / 2^15 < LSB_Current < Imax / 2^12 -> LSB_Current = 128uA ~ Imax / 2^15)  
4. Set the calibration register.(0.04096 / (LSB_Current * R_Shunt) = 32768 = 0x8000)(@0x04, 2Bytes)  

## Set Up Configureation Register  

1. Determination V_LSB_Shunt and V_LSB_Bus.(In this time, the parameters are set to 40mV/4096=10uV and 16V/4096=4mV, respectively.)(BRNG = 0b0(16V), PG = 0b00(40mV))  
2. Determination SADC and BADC.(0b1000, respectively.)(12bit, 532us)  
3. Determination Mode(0b121, Shunt / Bus Voltage, Continuous)  

## Measure V_Shunt and I_Shunt  

1. Read the register of Shunt_Voltage_Register.(@0x01, 2Bytes)
2. V_Shunt = Shunt_Voltage_Register * V_LSB_Shunt (2Byte, int16)
3. Read the register of Current_Register.(@0x04, 2Bytes)
4. I_Shunt = Current_Register * LSB_Current  (2Byte, int16)

## Compute Maximum Shunt Voltage / Current before Overflow

1. Imax_calc = LSB_Current * (2^15-1)
2. Imax_OVF = Imax_calc if Imax_calc < Imax else Imax
3. V_ShuntMax_calc = Imax_OVF * R_Shunt
4. V_ShuntMax_OVF = V_ShuntMax_calc if V_ShuntMax_calc < V_ShuntMax else V_ShuntMax  

http://cdwilson.us/articles/understanding-the-INA219/  
https://www.ti.com/lit/ds/symlink/ina219.pdf
