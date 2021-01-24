@echo off

echo Raspbery Pi Pico project generator v1
echo Lena Hackworth 2021, LenaHackworth@outlook.com
echo ----------------------------------------------

:: get project name from user
set /p project_name="Set project name: "\

:: Strip spaces from name
set project_name=%project_name: =%
echo Building files for project: %project_name%

:: Makes project folders
echo Building project folders
MD %project_name%
MD %project_name%\build

echo Copying pico_sdk_import.cmake
:: copies pico cmake file
Copy pico_sdk_import.cmake %project_name%\>NUL

:: Generate CMake file with project parameters 
echo Generating CMakeLists.txt file
echo cmake_minimum_required(VERSION 3.12) > %project_name%\CMakeLists.txt
echo include(pico_sdk_import.cmake) >> %project_name%\CMakeLists.txt
echo project(%project_name%) >> %project_name%\CMakeLists.txt
echo pico_sdk_init() >> %project_name%\CMakeLists.txt
echo add_executable(%project_name% >> %project_name%\CMakeLists.txt
echo   %project_name%.c >> %project_name%\CMakeLists.txt
echo ) >> %project_name%\CMakeLists.txt
echo pico_enable_stdio_usb(%project_name% 1) >> %project_name%\CMakeLists.txt
echo pico_add_extra_outputs(%project_name%) >> %project_name%\CMakeLists.txt
echo target_link_libraries(%project_name% pico_stdlib) >> %project_name%\CMakeLists.txt


:: Generate simple Hello, World! c file
echo Generating %project_name%.c file
echo #include ^<stdio.h^> > %project_name%\%project_name%.c
echo #include "pico/stdlib.h" >> %project_name%\%project_name%.c
echo[ >> %project_name%\%project_name%.c
echo // Project features: >> %project_name%\%project_name%.c
echo // 	- printf writes to serial port at 9600bps>> %project_name%\%project_name%.c
echo // 	- blink onboard LED with 333ms delay>> %project_name%\%project_name%.c
echo int main() {>> %project_name%\%project_name%.c
echo     const uint LED_PIN = 25; // Onboard LED for Raspberry Pi Pico>> %project_name%\%project_name%.c
echo     gpio_init(LED_PIN);>> %project_name%\%project_name%.c
echo     gpio_set_dir(LED_PIN, GPIO_OUT); //Sets pin to output>> %project_name%\%project_name%.c
echo     stdio_init_all(); >> %project_name%\%project_name%.c
echo     while (true) >> %project_name%\%project_name%.c
echo     {>> %project_name%\%project_name%.c
echo         printf("Hello, World!\n"); //Writes "Hello, World!" to serial port>> %project_name%\%project_name%.c
echo         gpio_put(LED_PIN, 1); //LED on >> %project_name%\%project_name%.c
echo         sleep_ms(333);>> %project_name%\%project_name%.c
echo         gpio_put(LED_PIN, 0); // LED off>> %project_name%\%project_name%.c
echo         sleep_ms(333);>> %project_name%\%project_name%.c
echo     }>> %project_name%\%project_name%.c
echo }>> %project_name%\%project_name%.c

echo Project generated!
echo Project can be found at %CD%\%project_name%

pause