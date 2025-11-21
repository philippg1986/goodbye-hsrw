# Philipp sagt Tschüss!

Dieses PowerShell-Skript simuliert auf unterhaltsame Weise die **Zeit von Philipp an der Hochschule** über drei Jahre.  
Es enthält Herausforderungen aus dem Netzwerk- und Rechenzentrumsbetrieb, die Entscheidung zwischen Führung und Technik und endet mit einem persönlichen Abschiedstext inklusive eines Abschiedsgeschenks.

## Features

- Simulation der Karriere über **3 Jahre**
- **Zufällige Herausforderungen** aus IT- und Rechenzentrumsbetrieb
- Entscheidung zwischen **Führung und Technik** im 3. Jahr
- Persönliche **Abschiedsrede** mit Dank für das Geschenk
- Automatische Anpassung des Textes an die **Terminalbreite**
- Terminal wird zu Beginn geleert für eine saubere Darstellung

## Anforderungen

- Windows mit **PowerShell 5+** oder neuer
- Keine zusätzliche Software erforderlich

## Installation

1. Repo als ZIP herunterladen und entpacken

<img width="415" height="345" alt="Bildschirmfoto 2025-11-21 um 11 51 03" src="https://github.com/user-attachments/assets/600488cf-1757-420d-b41e-4e4570b6300b" />

2. Optional: Ausführungsrichtlinien anpassen, falls das Skript blockiert wird:
   ```powershell
   Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned

## Nutzung
1. Powershell öffnen
2. In das Script-Verzeichnis wechseln:
   ```powershell
   cd Ordnerpfad
3. Das Script zulassen, falls Set-ExecutionPolicy nicht ausreicht:
   ```powershell
   Unblock-File .\goodbye.ps1
4. Das Script ausführen:
   ```powershell
   .\goodbye.ps1
