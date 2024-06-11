#!/bin/bash

# Skrypt instalujący i konfigurujący system Debian

# Funkcja wyświetlająca pytanie i oczekująca na odpowiedź użytkownika
ask_question() {
    local answer
    printf "\e[33m%s\e[0m (t/n): " "$1"
    while true; do
        read -rsn1 answer
        if [[ $answer =~ ^[tTnN]$ ]]; then
            printf "%s " "$answer"  # wypisanie odpowiedzi bez przenoszenia do nowej linii
            break
        fi
    done
    echo ""  # przechodzi do nowej linii
    if [[ $answer == [Tt] ]]; then
        return 0
    else
        return 1
    fi
}

# Pytania użytkownika


clear
printf "\e[34m%s\e[0m\n" "Konfiguracja Debiana"

if ask_question "Czy skonfigurować kodeki audio/wideo?"; then
    codecs=true
fi
read -rsn1 -p "Naciśnij Enter aby kontynuować..."
clear
printf "\e[34m%s\e[0m\n" "Konfiguracja Debiana"

if ask_question "Czy Zainstalować narzędzia do kompilacji?"; then
    compilation=true
fi
read -rsn1 -p "Naciśnij Enter aby kontynuować..."

clear
printf "\e[34m%s\e[0m\n" "Konfiguracja Debiana"

if ask_question "Czy skonfigurować multimedia?"; then
    multimedia=true
fi
read -rsn1 -p "Naciśnij Enter aby kontynuować..."
clear
printf "\e[34m%s\e[0m\n" "Konfiguracja Debiana"

if ask_question "Czy skonfigurować dodatkowe elementy?"; then
    extra=true
fi
read -rsn1 -p "Naciśnij Enter aby kontynuować..."
clear


# Uruchomienie odpowiednich skryptów
if [[ $codecs ]]; then
    echo "Uruchamiam codecs.sh"
    ./codecs.sh
fi
if [[ $compilation ]]; then
    echo "Uruchamiam kompilacja.sh"
    ./kompilacja.sh
fi
if [[ $multimedia ]]; then
    echo "Uruchamiam multimedia.sh"
    ./multimedia.sh
fi
if [[ $extra ]]; then
    echo "Uruchamiam extra.sh"
    ./extra.sh
fi

echo "Konfiguracja zakończona."
