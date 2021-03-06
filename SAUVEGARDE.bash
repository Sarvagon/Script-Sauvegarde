su - #(ce connecter en tant que root, mdp: P@ssword24)

mysqldump -u root -p > glpi_sav.sql #(faire la sauvegarde de la base de donnée glpi)

cd /savglpi/ #(pour se placer dans le dossier de sauvegarde pour simplifier les prochaines actions)

dar -c <nomSauvegardeComplète> -R /data #(-c permet de creer une sauvegarde vierge et -R permet d aller chercher des données à sauvegarder)

touch /data/fic5 #(on créé le nouveau fichier pour faire la sauvegarde différencielle)

dar -c <nomSauvegardeDifferencielle> -A <nomSauvegardeComplète> -R /data #(-A permet de faire référence à une autre sauvegarde, et, quand utilisée avec -c, permet de n enregister que la différence entre la sauvegarde et le dossier de données)

dar -+ <nomSauvegardeIncrémental> -A <nomSauvegardeDeReference> -@ <nomSauvegardeDifferencielle> #(-+ permet de créer une sauvegarde qui sera la fusion (merge) 
#d une ou deux autre sauvegardes, -A prend la référence du premier fichier [la sauvegarde de référence est soit la complète, soit la dernière sauvegarde Incrémentale] 
#et -@ la référence du deuxième [On utilisera toujours la sauvegarde différencielle faite en dernier], on obtient donc la somme des deux)

# Correction créaton sauvegarde différencielle
dar -c /sav/backupfichiersdif1 -A /sav/backupfichiers -R /data 

# Affiche les sauvegardes du fichiers backupfichiers
dar -l /sav/backupfichiersdif1


