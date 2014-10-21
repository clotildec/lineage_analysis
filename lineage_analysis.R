####LINEAGE ANALYSIS
# permet d'importer un set de données toutes de la même condition,
# de calculer les différents paramètres pour la suite de l'analyse
# et de finir en sauvant une dataframe avec toutes les info


#paramètres de la manip à remplir à chaque fois:
time_resolution <- 10 # min
 

#export des données
data <- cbind2 (read.csv2('Classeur1.csv'),read.csv2 ('Classeur2.csv'))
#là, il faut que tu mettes les noms qu'on avait indiqués dans la data frame mais avec le bon ordre qui est celui 
# que tu obtiens sur matlab
colnames (data) <- c("nom1","nom2","nom4")

#ajouter une colonne avec les conditions à changer à chaque fois
data$cond_height <- # mettre le nombre
data$cond_micro_pattern <- "nom du pattern" # mettre la forme
data$cond_cell_type <- "cell_mito-RFP" #indiquer type cellulaire
data$cond_date <- "mettre la date" #nécessaire si il n'y a pas le ROI avec le "ID" de la cellule (si analyse sur matlab)

# pour calculer delta-t (cell cycle length), delta-V et deltaV/delta-t taux de croissance des deux cellules filles
data$d1_DT  <- (data$d1_time_f - data$d1_time_i) * time_resolution
data$d2_DT  <- (data$d2_time_f - data$d2_time_i) * time_resolution
data$d1_DV <- (data$d1_vol_f - data$d1_vol_i) * cross_section
data$volgained_small <- (data$d2_vol_f - data$d2_vol_i) * cross_section
data$d1_GR <- (data$d1_DV / data$d1_DT)
data$d2_GR <- (data$d2_DV / data$d2_DT)

# rapport volume/mtc
data$ratio_vol <- (data$d1_vol_i / data$d2_vol_i)
data$ratio_mtc <- (data$d1_mtc_i / data$d2_mtc_i)

# pour comparer la petite et la grosse selon un paramètre donné

