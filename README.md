# PWr - Układy cyfrowe i systemy wbudowane 2 P
Projekt z kursu UCiSW2 u doktora Sugiera - obsługa magnetometru HMC5883L i wykorzystanie go jako kompas wyświetlający pomiary na monitorze za pomocą wyjścia VGA. Implementacja projektu została wykonana na własnej płytce ZRtech Espier III z układem FPGA Xilinx Spartan-6 XC6SLX9 i sygnałem zegarowym o częstotliwości 48 MHz.    

Kontrolerem magnetometru jest moduł Magneto_Drv, komunikujący się z urządzeniem za pomocą modułu I2C_Master napisanego i udostępnionego przez doktora na stronie kursu. Za wyświetlanie kompasu na monitorze odpowiada moduł VGACompass generujący obraz o rozdzielczości 800x600 i częstotliwości odświeżania (około) 75 Hz. Moduł Display4x7S służy do wyświetlania pomiarów w osi Z (niewykorzystywanej przez kompas) na wyświetlaczu 7-segmentowym jako liczbę w systemie U16 - i jest klonem modułu o tej samej nazwie napisanego przez doktora dla laboratoryjnych płytek CPLD. Do ustawiania częstotliwości pomiarów według trybów z dokumentacji magnetometru służą przyciski S1-S3 (wciśnięcie - 1), nowe ustawienie obowiązuje od resetu układu (przycisk S4). Dioda D2 sygnalizuje nowy pomiar (DRDY), dioda D5 błąd w komunikacji I2C (NACK, zgaśnięcie - 1).  
Film przedstawiający działanie projektu: www.youtube.com/watch?v=9VuPkd-sqCk