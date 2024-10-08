# Fluffy_Patch_Manager

Outil d'automatisation développé en PowerShell, conçu pour gérer efficacement les mises à jour Windows dans un environnement professionnel ou personnel. Il permet de vérifier, télécharger, installer les mises à jour, et de générer un rapport détaillé des résultats. Il offre également la possibilité d'envoyer le rapport par email et de planifier automatiquement les mises à jour via le planificateur de tâches Windows.


## Fonctionnalités

- Vérification des mises à jour Windows : Le script récupère les mises à jour disponibles (sécurité, critiques, etc.) qui ne sont pas encore installées.

- Téléchargement et installation : Télécharge et installe automatiquement les mises à jour non installées.

- Génération de rapports : Crée un fichier texte détaillant les mises à jour disponibles et les résultats de l'installation dans le dossier `Logs`.

- Envoi de notifications par email : Possibilité d'envoyer le rapport des mises à jour par email.

- Planification automatique : Le script peut être planifié pour une exécution régulière via le Planificateur de tâches Windows.

## Prérequis

- Windows PowerShell 5.0 ou supérieur.

- Droits d’administrateur·ice pour exécuter le script (certaines mises à jour nécessitent des privilèges élevés).


## Installation

- Placez le script sur votre machine Windows.
- Ouvrez PowerShell en tant qu'administrateur.

- Exécutez le script :
```
.\FluffyPatchManager.ps1
```

## Structure des dossiers
- `Logs` : Le dossier Logs est automatiquement créé pour stocker les rapports de mises à jour.
- Les rapports sont enregistrés sous forme de fichiers texte : `(UpdateReport_YYYYMMDD.txt).`

## Exemple de rapport
Voici un exemple de rapport généré par Fluffy Patch Manager:

```
Rapport de mise à jour - 2024-10-08
------------------------------------------------
Mise à jour : Mise à jour cumulative pour Windows 10 Version 21H2 (KB5005565)
Description : Mise à jour de sécurité pour Windows 10
Importance : Critique
------------------------------------------------
Mise à jour : Mise à jour de la pile de maintenance pour Windows 10 Version 21H2 (KB5005030)
Description : Mise à jour de la pile de maintenance
Importance : Critique
------------------------------------------------
Résultat de l'installation :
Mise à jour : KB5005565 - Installée avec succès
Mise à jour : KB5005030 - Installée avec succès
```

## Contribuer
Les contributions sont les bienvenues ! Si vous avez des idées d'améliorations ou si vous trouvez des bugs, n'hésitez pas à ouvrir une `issue` ou à soumettre une `pull request`.

## Licence
Ce projet est sous licence MIT. Consultez le fichier [LICENSE](https://github.com/PotiteBulle/Fluffy_Patch_Manager/blob/main/LICENSE) pour plus d’informations.