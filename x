
    // include the library code:
        #include <LiquidCrystal.h>
        // initialize the library with the numbers of the interface pins
        // LiquidCrystal (RS, E, D4,D5,D6,D7)
        LiquidCrystal lcd(12, 11, 5, 4, 3, 2);
        #define LCD_LIGHT_PIN A4 // The number of the pin where anode of the display backlight is
        #define BUTTON_PIN A5    // The number of the push-button pin.
        #define LCD_LIGHT_ON_TIME 6000 // How long (in milliseconds) should lcd light stay on?
        unsigned int currentLcdLightOnTime = 0;
        // For calculating the lcd light on time.
        unsigned long lcdLightOn_StartMillis;
        boolean isLcdLightOn;
        // For checking push-button state.
        int buttonState = 0;
     
    
    void setup() {
            // set up the LCD's number of columns and rows: 
           lcd.begin(16, 2);
           // Print a message to the LCD.
           lcd.print("Test LCD + light");
           // Set the push-button pin as an input.
           pinMode(BUTTON_PIN, INPUT);
           // Set the lcd display backlight anode pin as an output.
           pinMode(LCD_LIGHT_PIN, OUTPUT);
           // Set the lcd display backlight anode pin to low - lcd light off.
           digitalWrite(LCD_LIGHT_PIN, LOW);
           isLcdLightOn = false;
        }
        
void loop() {
           // Check the state of the push-button.
           buttonState = digitalRead(BUTTON_PIN);
           if (buttonState == HIGH){
              // Button pressed.
              lcd.setCursor(0,0);
              lcd.print("FAST              ");
    
              lcdLightOn_StartMillis = millis();
              currentLcdLightOnTime = 0;
              isLcdLightOn = true;
              digitalWrite(LCD_LIGHT_PIN, HIGH);
           } else {
              // Button not pressed.
              lcd.setCursor(0,0);
              lcd.print("SLOW             ");
    
              if(isLcdLightOn){
                 currentLcdLightOnTime = millis() - lcdLightOn_StartMillis;
                 if(currentLcdLightOnTime > LCD_LIGHT_ON_TIME){
                    isLcdLightOn = false;
                    digitalWrite(LCD_LIGHT_PIN, LOW);
                 }
              }
           }
        
          
        }
        
