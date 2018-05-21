INTERIORS = {
    -- HOPITAL
    [1] = {id = 1, x = 275.46, y = -1361.22, z = 24.53, h = 50.37, name = "Hopîtal", destination = {2,3}},
    [2] = {id = 2, x = 343.47, y = -1398.81, z = 32.51, h = 49.13, name = "Sortie principale", destination = {1,3}},
    [3] = {id = 3, x = 335.16, y = -1432.06, z = 46.51, h = 141.75, name = "Sortie de service", destination = {1,2}},
	
    -- FIB
    [4] = {id = 4, x = -545.31, y = -203.80, z = 38.21, h = 225.505, name = "Etage 1", destination = {5,56}},
    [5] = {id = 5, x = 136.25, y = -761.49, z = 242.15, h = 160.31, name = "Etage 49", destination = {4,56}},
    [56] = {id = 56, x = -75.66, y = -827.06, z = 243.38, h = 67.00, name = "Etage 21", destination = {5,4}},

    -- FIB GARAGE
    [6] = {id = 6, x = 142.06883239746, y = -768.97241210938, z = 45.752010345459, h = 72.884956359863, name = "FIB Building", destination = {7}},
    [7] = {id = 7, x = 176.67442321777, y = -728.77349853516, z = 39.403667449951, h = 248.2452545166, name = "Garage", destination = {6}},

    -- BAHMAS MAMAS
    [8] = {id = 8, x = -1387.00, y = -588.00, z = 29.90, h = 202.00, name = "Entrer", destination = {9}},
    [9] = {id = 9, x = -1388.00, y = -586.00, z = 29.90, h = 33.00, name = "Sortir", destination = {8}},

    -- HUMANE LABS
    [10] = {id = 10, x = 3540.859375, y = 3675.7958984375, z = 28.121143341064, h = 166.72660827637, name = "Etage n°-1", destination = {11}},
    [11] = {id = 11, x = 3540.8566894531, y = 3676.0424804688, z = 20.991781234741, h = 173.42085266113, name = "Etage n°-3", destination = {10}},
	
	-- BAHMAS MAMAS bar 1
    [12] = {id = 12, x = -1390.00, y = -610.00, z = 30.00, h = 325.00, name = "Sortir Bar", destination = {13}},
    [13] = {id = 13, x = -1387.00, y = -609.00, z = 30.00, h = 37.00, name = "Entrer Bar", destination = {12}},
	
	-- BAHMAS MAMAS bar 2
    [14] = {id = 14, x = -1382.00, y = -632.00, z = 30.50, h = 298.00, name = "Sortir Bar", destination = {15}},
    [15] = {id = 15, x = -1372.00, y = -626.00, z = 30.50, h = 292.00, name = "Entrer Bar", destination = {14}},
	
	-- BUREAU AVOCAT
    [16] = {id = 16, x = -1911.00, y = -576.50, z = 18.80, h = 320.00, name = "Sortir", destination = {17}},
    [17] = {id = 17, x = -1910.00, y = -575.50, z = 18.80, h = 141.00, name = "Entrer", destination = {16}},
	
	-- ACCES TRAITEMENT METH
    [18] = {id = 18, x = 1529.00, y = 3795.00, z = 34.00, h = 121.00, name = "Sortir", destination = {19}},
    [19] = {id = 19, x = 997.35, y = -3200.00, z = -36.70, h = 92.00, name = "Entrer", destination = {18}},
	
	-- JOURNALISTE REUNION
    [20] = {id = 20, x = -1047.00, y = -238.00, z = 43.70, h = 301.00, name = "Entrer", destination = {21}},
    [21] = {id = 21, x = -1048.30, y = -237.80, z = 43.70, h = 120.00, name = "Sortir", destination = {20}},
		
	-- VENDEUR ARMES ILLEGAL (sous sol)
    [22] = {id = 22, x = 244.00, y = 373.00, z = 104.90, h = 334.00, name = "Sortir", destination = {23}},
    [23] = {id = 23, x = 999.00, y = -3158.00, z = -39.30, h = 345.00, name = "Entrer", destination = {22}},
				
	-- COMICO (deplacement dans la terrasse)
    [26] = {id = 26, x = 458.00, y = -1008.00, z = 28.00, h = 85.00, name = "Sortir", destination = {27}},
    [27] = {id = 27, x = 464.00, y = -1012.00, z = 32.70, h = 177.00, name = "Entrer", destination = {26}},
	
	-- PORTE D'ENTREE DU RANCH
    [28] = {id = 28, x = 1398.00, y = 1142.00, z = 113.90, h = 258.00, name = "Entrer", destination = {29}},
    [29] = {id = 29, x = 1395.00, y = 1142.00, z = 114.30, h = 87.00, name = "Sortir", destination = {28}},
	
	-- ACCES SALLE INTERROGATOIRE LSPD
    [30] = {id = 30, x = 452.00, y = -984.00, z = 26.00, h = 358.00, name = "Sortir", destination = {31}},
    [31] = {id = 31, x = 1173.00, y = -3196.00, z = -39.00, h = 270.00, name = "Entrer", destination = {30}},
	
	-- ACCES AU BUREAU COAST GUARDS - SALON
    [32] = {id = 32, x = -1249.00, y = -3404.50, z = 13.60, h = 225.00, name = "Entrer", destination = {33}},
    [33] = {id = 33, x = -1251.00, y = -3403.00, z = 13.60, h = 53.00, name = "Sortir", destination = {32}},
	
	-- ACCES TRAITEMENT WEED
	[34] = {id = 34, x = 1065.00, y = -3183.00, z = -39.60, h = 267.00, name = "Entrer", destination = {35}},
    [35] = {id = 35, x = 1558.00, y = 2162.00, z = 78.30, h = 232.00, name = "Sortir", destination = {34}},
	
	-- SUNSET LIFEINVADER ASCENCEUR
    [36] = {id = 36, x = -1078.00, y = -254.00, z = 37.40, h = 28.00, name = "RDC", destination = {37,38,39,40,41}},
    [37] = {id = 37, x = -1078.00, y = -254.00, z = 43.70, h = 41.00, name = "Niveau Bureaux", destination = {36,38,39,40,41}},
    [38] = {id = 38, x = -1056.00, y = -237.00, z = 53.30, h = 300.00, name = "3° Etage", destination = {36,37,39,40,41}},
	[39] = {id = 39, x = -1062.00, y = -240.00, z = 57.80, h = 118.00, name = "4° Etage", destination = {36,37,38,40,41}},
	[40] = {id = 40, x = -1068.00, y = -240.30, z = 61.65, h = 33.00, name = "Niveau Héliport", destination = {36,37,38,39,41}},
	[41] = {id = 41, x = -1072.50, y = -246.80, z = 62.20, h = 202.00, name = "Chambre privée", destination = {36,37,38,39,40}},
	
	-- ACCES TRAITEMENT COKE
	[42] = {id = 42, x = 1088.50, y = -3190.00, z = -39.00, h = 178.00, name = "Entrer", destination = {43}},
    [43] = {id = 43, x = 471.00, y = 3553.00, z = 32.80, h = 353.00, name = "Sortir", destination = {42}},
		
	-- CASERNE DES FIREGUARDS- ACCES AU TOIT DES HELICO
	[44] = {id = 44, x = 1196.00, y = -1484.00, z = 44.80, h = 272.00, name = "NIV -1", destination = {45}},
    [45] = {id = 45, x = 1209.00, y = -1467.00, z = 35.00, h = 90.00, name = "NIV 0", destination = {44}},
	
	-- MAISON DU GOUVERNEUR ASCENCEUR
    [46] = {id = 46, x = -334.00, y = 1115.00, z = 330.10, h = 205.00, name = "RDC", destination = {47,48,49,50}},
    [47] = {id = 47, x = -333.00, y = 1115.00, z = 325.10, h = 205.00, name = "Niveau -1", destination = {46,48,49,50}},
    [48] = {id = 48, x = -333.00, y = 1115.00, z = 320.10, h = 205.00, name = "Niveau -2", destination = {46,47,49,50}},
	[49] = {id = 49, x = -333.00, y = 1115.00, z = 315.10, h = 205.00, name = "Niveau -3", destination = {46,47,48,50}},
	[50] = {id = 50, x = -333.00, y = 1115.00, z = 310.10, h = 205.00, name = "Niveau -4", destination = {46,47,48,49,50}},
	
	-- MAISON DU GOUVERNEUR ASCENCEUR - DERNIER NIVEAU A
	[52] = {id = 52, x = -339.00, y = 1104.00, z = 310.10, h = 280.00, name = "NIV -4", destination = {53}},
    [53] = {id = 53, x = -339.00, y = 1104.00, z = 304.10, h = 280.00, name = "NIV -5", destination = {52}},

	-- MAISON DU GOUVERNEUR ASCENCEUR - DERNIER NIVEAU B
	[54] = {id = 54, x = -322.00, y = 1110.00, z = 310.10, h = 79.00, name = "NIV -4", destination = {55}},
    [55] = {id = 55, x = -322.00, y = 1110.00, z = 302.10, h = 79.00, name = "NIV -5", destination = {54}},
}