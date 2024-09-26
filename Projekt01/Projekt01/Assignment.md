
Die App dient dazu, dass User zu jeder Tageszeit ihre aktuelle Stimmung erfassen können.
Zusätzlich können sie über ein Textfeld eintragen, wofür sie gerade dankbar sind.
Grundlegende Features

## View 1: Übersicht

- Liste aller Einträge :weißes_häkchen:
- Anzeige der jeweiligen Stimmung bzw. Notiz
- Button zum Anlegen eines neuen Eintrags

## View 2: Neuer Eintrag

- Auswahl der Stimmung (mit Icons oder Emojis)
- Textfeld zur mehrzeiligen Eingabe, wofür der User dankbar ist
- Button zum Speichern (inkl. Rückkehr zur Übersicht)
- Einträge in SwiftData speichern (inkl. Datum)
- Einträge in Übersicht laden
- Eintrag aus SwiftData löschen
- Optionale Features
- Personalisierung für die einzelnen Icons
- Statistik, welche Einträge gemacht wurden
- Foto pro Eintrag speichern


## Tickets
Feels

# Feels App (TeamProject)
Die App dient dazu, dass User zu jeder Tageszeit ihre aktuelle Stimmung erfassen können.
Zusätzlich können sie über ein Textfeld eintragen, wofür sie gerade dankbar sind.
Grundlegende Features
## View 1: Übersicht
- Liste aller Einträge :weißes_häkchen:
- Anzeige der jeweiligen Stimmung bzw. Notiz :weißes_häkchen:
- Button zum Anlegen eines neuen Eintrags :weißes_häkchen:

## View 2: Neuer Eintrag
- Auswahl der Stimmung (mit Icons oder Emojis) :weißes_häkchen:
- Textfeld zur mehrzeiligen Eingabe, wofür der User dankbar ist :weißes_häkchen:
- Button zum Speichern (inkl. Rückkehr zur Übersicht) :weißes_häkchen:
- Einträge in SwiftData speichern (inkl. Datum) :weißes_häkchen:
- Einträge in Übersicht laden :weißes_häkchen:
- Eintrag aus SwiftData löschen :weißes_häkchen:
- Optionale Features :weißes_häkchen: (Auswertungen übers Wetter, Diagramme)
- Personalisierung für die einzelnen Icons :weißes_häkchen:
- Statistik, welche Einträge gemacht wurden :weißes_häkchen:
- Foto pro Eintrag speichern :weißes_häkchen:

# Vorüberlegungen:
Feels: App zum Sammeln und Auswerten von Stimmungseinträgen

## Screens:

### Login Screen

### HomeScreen (Tab Bar)

* mit Abmeldebutton (für Logout)

* View: Neuen Eintrag erstellen mit Speichern Button

  * Slider von 0-1 (mies bis hervorragend)
  * Textfield: Wofür bin ich dankbar?
  * Textfield: Welches Emoji beschreibt Deine Stimmung gerade am besten?
  * Picker: Wetterfaktoren
  
### EntriesScreen (Tab Bar)


* Liste der Einträge (mit Löschen Swipe) (mit NavigationLinks zu:
* Detailansicht eines Eintrags mit Speichern Button
* Diagrammansicht monatlich / wöchentlich ( evtl. täglich )

### SettingsScreen (Tab Bar)

* Persönliche Daten bearbeiten
  * Profilfoto hochladen
* App Einstellungen bearbeiten (z.B. Dark Mode)

# Tickets:

Auf Basis das wir jeden Woche machen mit Tickets
Tag 1:
Ticket 1: Grundstruktur der App erstellen
    •    Erstelle das SwiftUI-Projekt in Xcode.
    •    Lege die Grundstruktur für deine Moody-App an: erstelle die Haupt-Views und setze das Grundlayout.
    •    Implementiere die Datenmodelle für User, MoodEntry, MoodFactor und Weather mit SwiftData.
Ticket 2: Benutzerprofil-Ansicht
    •    Implementiere die UserView, in der die Benutzerdaten (Name, E-Mail, etc.) angezeigt und bearbeitet werden können.
    •    Füge ein Formular zur Bearbeitung des Profils hinzu.
    •    Implementiere eine Speichern-Funktion, die die Daten in der Datenbank aktualisiert.
Ticket 3: Datenbank einrichten
    •    Füge die notwendigen Datenbanken (MoodEntry, MoodFactor, User) in Xcode hinzu.
    •    Konfiguriere den @ModelContainer in der App-Struktur, um die Datenbank zu verbinden.
Tag 2:
Ticket 4: Mood-Entry Ansicht
    •    Implementiere die Ansicht für Mood-Einträge (MoodEntryView).
    •    Füge eine Liste hinzu, die alle bisherigen Mood-Einträge anzeigt.
    •    Implementiere eine Möglichkeit, neue Mood-Einträge hinzuzufügen.
Ticket 5: Mood-Eintrag erstellen
    •    Erstelle eine Ansicht, in der der Benutzer neue Mood-Einträge hinzufügen kann.
    •    Füge Felder für das Datum, die Stimmung (Slider) und die Auswahl eines MoodFactor hinzu.
    •    Implementiere eine Speichern-Funktion, die den neuen Eintrag in die Datenbank speichert.
Ticket 6: Navigation und Tab-View
    •    Implementiere eine Tab-Navigation, die zwischen den Ansichten wechselt.
    •    Füge Tabs für UserView, MoodEntryView und Settings hinzu.
Tag 3:
Ticket 7: Mood-Einträge filtern und sortieren
    •    Implementiere die Filterung der Mood-Einträge nach Datum und Stimmung.
    •    Füge eine Sortierfunktion hinzu, um Einträge nach Datum oder Stimmung zu sortieren.
Ticket 8: Visualisierung der Mood-Daten
    •    Implementiere eine Ansicht, die die Mood-Daten grafisch darstellt (z.B. in einem Diagramm).
    •    Zeige die durchschnittliche Stimmung der letzten Woche an.
    •    Implementiere eine Funktion zur Anzeige der häufigsten Mood-Faktoren.
Ticket 9: Detailansicht für Mood-Einträge
    •    Implementiere eine Detailansicht, die weitere Informationen zu einem Mood-Eintrag anzeigt.
    •    Füge eine Bearbeitungs- und Löschfunktion für den Eintrag hinzu.
Tag 4:
Ticket 10: Einstellungen und Benutzerpräferenzen
    •    Implementiere eine SettingsView, in der der Benutzer App-Einstellungen ändern kann (z.B. Farbmodus, Benachrichtigungen).
    •    Speichere die Benutzerpräferenzen in der Datenbank.
Ticket 11: Fehlerbehebung und Optimierung
    •    Überprüfe den gesamten Code auf Fehler.
    •    Optimiere die Performance der App.
    •    Teste die App
Ticket 12: Dokumentation und finale Überprüfung
    •    Füge Kommentare im Code hinzu, um die Funktionalität zu erklären.
    •    Führe eine finale Überprüfung durch und bereite die App für die Abgabe oder das Review vor.




