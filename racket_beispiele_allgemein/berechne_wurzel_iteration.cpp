#include <iostream>
#include <cassert>
#include <cmath>

double berechneMittelwert (double a, double b) {
    return (a + b) / 2.0;
}

double quadrat(double a) {
    return a * a;
}

double berechneAbsolutenWert(double a) {
    if(a < 0)
        return -a;
    else
        return a;
}
// Der Genauigkeitstest auf 0.001 funktioniert nicht für kleine werte, da dann
// 0.001 zu ungenau wird. 
// Wurzel aus 0.000025 Genauigkeit 0.001 funktioniert nicht
// Darum pruefen wir auf x / 1000.
// Wurzel aus 0.000025 Genauigkeit 0.000025 / 1000 = 0.000000025
bool gutGenug(double schaetzwert, double  x) {
    if (berechneAbsolutenWert(quadrat(schaetzwert) - x) < 0.001)
        return true;
    else
        return false;
}

// verbesserte gutGenug Funktion
bool gutGenugVerbessert(double schaetzwert, double x) {
    if (berechneAbsolutenWert(quadrat(schaetzwert) - x) < x / 1000.0)
        return true;
    else
        return false;
}

double verbessern(double schaetzwert, double x) {
    return berechneMittelwert(schaetzwert, x / schaetzwert);
}

double wurzelIter(double schaetzwert, double x) {
    //std::cout << "\n" << schaetzwert << " " << x << std::endl;
    if (gutGenugVerbessert(schaetzwert, x))
        return schaetzwert;
    else
        return wurzelIter(verbessern(schaetzwert, x), x);
}

double wurzel(double x) {
    return wurzelIter(1, x);
}
 

int main() {
    // ein paar Tests koennen nicht schaden
    assert (6 == berechneMittelwert(10, 2));
    assert (0 == berechneMittelwert(-5, 5));
    assert (5 == berechneAbsolutenWert(-5));
    assert (0 == berechneAbsolutenWert(0));
    assert (5 == berechneAbsolutenWert(5));
    //double x = wurzelIter(1, 25);
    std::cout << "Wurzel aus 25: " << wurzelIter(1, 25) << std::endl;


    std::cout << "Wurzel aus 25: " << wurzel(25) << std::endl;
    std::cout << "Wurzel aus 16: " << wurzel(16) << std::endl;

    std::cout << "Wurzel aus 0.00025 mit sqrt:   " << sqrt(0.00025) << std::endl;
    std::cout << "Wurzel aus 0.00025 mit wurzel: " << wurzel(0.00025) << std::endl;

}
