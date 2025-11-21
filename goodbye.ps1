# Philipp Karriere-Simulator in PowerShell

Clear-Host

# Initialisierung
$philipp = @{
    Name = "Philipp"
    Role = ""
    History = @()
    Gifts = @()
}

function Assign-Role {
    param($Person, $Role)
    Write-Host "`n➡ $($Person.Name) übernimmt die Rolle: $Role"
    $Person.Role = $Role
    $Person.History += $Role
    Start-Sleep -Seconds 1
}

function Face-Challenge {
    $challenges = @(
        "Server stürzt ab",
        "Netzwerksegment fällt aus",
        "Storage-System meldet kritischen Fehler",
        "Software-Update verursacht Inkonsistenzen",
        "Backup läuft nicht durch",
        "Firewall blockiert legitimen Traffic",
        "Klimaanlage im Rechenzentrum fällt aus",
        "Technik fordert ständige Aufmerksamkeit",
        "Datenbank-Cluster verliert Knoten",
        "USV meldet Batteriewarnung"
    )
    $challenge = Get-Random -InputObject $challenges
    Write-Host "⚠ Herausforderung: $challenge"
    Start-Sleep -Seconds 1
}

function Make-Decision {
    param($Person, $Options, $Year)
    Write-Host "`n`n❓ Entscheidung erforderlich: $Options"
    Start-Sleep -Seconds 3
    if ($Year -eq 3 -and $Options -contains "Technik") {
        $choice = "Technik"
    } else {
        $choice = Get-Random -InputObject $Options
    }
    Write-Host "`n`n✅ $($Person.Name) entscheidet sich für: $choice"
    Start-Sleep -Seconds 3
    return $choice
}

function Receive-Gift {
    param($Person, $Gift, $Occasion="Abschiedsgeschenk")
    Write-Host "`n`n🎁 $($Person.Name) erhält ein $Occasion" -NoNewline
    Write-Host ": $Gift"
    $Person.Gifts += $Gift
    Start-Sleep -Seconds 4
}

function Farewell {
    param($Person)

    $width = $Host.UI.RawUI.BufferSize.Width

    $text = @"
Hallo Zusammen,

wie ihr alle wisst, endet meine Zeit an der Hochschule nach etwas mehr als drei Jahren zum 30.11.2025.
Man sagt ja: „Zeit vergeht schneller, wenn man Spaß hat… (oder wenn ständig irgendetwas Unerwartetes kaputt geht).“ In diesem Sinne: Die Jahre sind verflogen ;-)

Die Aufgabe als Abteilungsleiter war für mich eine neue und spannende Rolle. Mit der Zeit habe ich jedoch festgestellt, dass die Technik sich nicht damit zufriedengibt, „nebenbei“ mitzulaufen, sondern täglich laut und deutlich Aufmerksamkeit einfordert. Dadurch blieb für die eigentliche Führungsarbeit weniger Raum, als ich mir gewünscht hätte. Am Ende musste ich mich entscheiden: Technik oder Führung? - Surprise: Die Technik hat gewonnen.
Deshalb werde ich in die Wirtschaft zurückkehren und künftig wieder als Senior IT-Administrator arbeiten.

Ich möchte mich außerdem herzlich für den Gutschein bedanken, über den ich mich - auch wenn ich ausdrücklich darum gebeten hatte, nichts zu sammeln (aber wann hat das jemals funktioniert) - wirklich sehr gefreut habe. Das Eckregal, das daraus entstanden ist, hilft mir nun dabei, zumindest den Eindruck von Ordnung zu vermitteln.
Man nimmt, was man kriegen kann.

Es war eine spannende Zeit mit euch, und ich habe die Zusammenarbeit trotz gelegentlicher kleiner IT-Katastrophen wirklich geschätzt. Ich wünsche euch stabile Systeme, kurze Ticketqueues und möglichst wenig „kannst du mal eben kurz…“.

Bis dahin und alles Gute!

Philipp
"@

    # Text in Absätze splitten
    $paragraphs = $text -split "`n`n"

    foreach ($para in $paragraphs) {
        $words = $para -split " "
        $line = ""
        foreach ($word in $words) {
            if (($line.Length + $word.Length + 1) -lt $width) {
                if ($line -eq "") {
                    $line = $word
                } else {
                    $line += " " + $word
                }
            } else {
                Write-Host $line
                $line = $word
            }
        }
        if ($line -ne "") { Write-Host $line }
        Write-Host ""  # Leerzeile zwischen Absätzen
    }

    # Geschenke und Rollenhistorie
    Write-Host "Gesammelte Geschenke: $($Person.Gifts -join ', ')"
    Write-Host "Rollenhistorie: $($Person.History -join ', ')"
}


function Simulate-Career {
    param($Person, $Years)
    Write-Host "🎓 Karriere-Simulation für $($Person.Name) ($Years Jahre)"
    Start-Sleep -Seconds 1

    Assign-Role -Person $Person -Role "Abteilungsleiter"

    for ($year=1; $year -le $Years; $year++) {
        Write-Host "`n--- Jahr $year ---"
        Start-Sleep -Seconds 1
        $numChallenges = Get-Random -Minimum 3 -Maximum 6
        for ($i=0; $i -lt $numChallenges; $i++) {
            Face-Challenge
        }
        if ($year -eq 3) {
            $finalChoice = Make-Decision -Person $Person -Options @("Führung","Technik") -Year $year
            if ($finalChoice -eq "Technik") {
                Assign-Role -Person $Person -Role "Senior IT-Administrator"
            }
        }
    }

    Receive-Gift -Person $Person -Gift "Gutschein -> Eckregal" -Occasion "Abschiedsgeschenk"
    Farewell -Person $Person
}

# Simulation starten
Simulate-Career -Person $philipp -Years 3
