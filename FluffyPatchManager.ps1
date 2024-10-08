# Fluffy Patch Manager - Gestion et automatisation des mises à jour Windows
# Auteur : Potate (potite_bulle)

# Chemin des logs
$logPath = "Logs\PatchManagerLog_$((Get-Date).ToString('yyyy-MM-dd_HH-mm')).txt"

# Fonction pour enregistrer les logs
function Log-Message {
    param (
        [string]$message
    )
    $formattedMessage = "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - $message"
    Add-Content -Path $logPath -Value $formattedMessage
}

# Vérifier les mises à jour Windows
function Check-WindowsUpdates {
    Write-Host "Vérification des mises à jour Windows..."
    Log-Message "Vérification des mises à jour Windows..."

    $updateSession = New-Object -ComObject Microsoft.Update.Session
    $updateSearcher = $updateSession.CreateUpdateSearcher()
    $searchResult = $updateSearcher.Search("IsInstalled=0")

    if ($searchResult.Updates.Count -eq 0) {
        Write-Host "Aucune mise à jour disponible."
        Log-Message "Aucune mise à jour disponible."
        return $null
    }

    Write-Host "$($searchResult.Updates.Count) mise(s) à jour disponible(s)."
    Log-Message "$($searchResult.Updates.Count) mise(s) à jour disponible(s)."

    return $searchResult.Updates
}

# Installer les mises à jour
function Install-Updates {
    param (
        [object]$updates
    )
    if ($updates -eq $null) {
        Write-Host "Aucune mise à jour à installer."
        Log-Message "Aucune mise à jour à installer."
        return
    }

    $updateInstaller = New-Object -ComObject Microsoft.Update.Installer
    $installationItems = New-Object -ComObject Microsoft.Update.UpdateColl

    foreach ($update in $updates) {
        $installationItems.Add($update)
    }

    try {
        $installResult = $updateInstaller.Install($installationItems)
        Write-Host "Résultat de l'installation : $($installResult.ResultCode)"
        Log-Message "Résultat de l'installation : $($installResult.ResultCode)"
    } catch {
        Write-Host "Erreur lors de l'installation des mises à jour : $($_.Exception.Message)"
        Log-Message "Erreur lors de l'installation des mises à jour : $($_.Exception.Message)"
    }

    return $installResult
}

# Fonction principale
function Main {
    $updates = Check-WindowsUpdates
    Install-Updates $updates
}

# Créer les dossiers nécessaires
if (-not (Test-Path "Logs")) {
    New-Item -ItemType Directory -Path "Logs"
}

if (-not (Test-Path "Backups")) {
    New-Item -ItemType Directory -Path "Backups"
}

# Exécution du script
Main