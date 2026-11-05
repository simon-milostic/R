library(tidyverse)
##########################################################################
# RAZPREDELNICE
##########################################################################

# ========================================================================
# Imena in razpredelnice 
# ========================================================================

matematika <- c("Ana" = 4, "Sara" = 2, "Andraž" = 5, "Blaž" = 3)
opisne_ocene <- c("manj uspešno", "uspešno", "zelo uspešno")
telovadba <- c("manj uspešno", "zelo uspešno", "uspešno", "uspešno")
Telovadba <- factor(telovadba, levels = opisne_ocene, ordered = TRUE)

# S funkcijo `data.frame` lahko podatke iz vektorjev spravimo v razpredelnico.
Sola <- data.frame(matematika, 
                   sportna_vzgoja = Telovadba)

# Navadno ne želimo imeti poimenovanih vrstic, raje temu namenimo dodaten stolpec
Sola <- data.frame(ime = names(matematika),
                   matematika, 
                   sportna_vzgoja = Telovadba)
rownames(Sola) = NULL


# Uporabimo lahko tudi funkcijo `tibble` iz knjižnice `tibble`
library(tibble)
Sola.t <- tibble(ime = names(matematika),
                 matematika, 
                 sportna_vzgoja = Telovadba)
Sola.t <- as_tibble(Sola)
Sola.t


# Kaj delajo funkcije `rownames`, `colnames`, `names`, `nrow`, `ncol` in `dim`?
rownames(Sola)
colnames(Sola)
names(Sola)
nrow(Sola)
ncol(Sola)
dim(Sola)


# Iz razpredelnice lahko dobimo posamezne vrstice in stolpce oziroma celice.
Sola[, "matematika"]
Sola[Sola$ime == "Ana", "sportna_vzgoja"]

Sola[c(1, 3), "matematika"] # 1. in 3. vrstica, stolpec matematika
Sola[c(1, 3), 1]

Sola$matematika
Sola[["matematika"]]

Sola[1:2, "matematika"]
Sola[1:2, "matematika", drop = FALSE]
Sola.t[1:2, "matematika"]

# Imena stolpcev in vrstic lahko spreminjamo
colnames(Sola) <- c("ime", "mat", "sport")
colnames(Sola)[2] <- c("matematika")


# Indeksiramo lahko tudi z logičnim pogojem
Sola[Sola$matematika >= 3, ]

Sola[Sola$matematika >= 3, 1]
Sola[Sola$matematika >= 3, ]$matematika
Sola[Sola$matematika >= 3, "matematika"]

# Negativni indeksi
Sola[,-1]

# Funkcija `summary`
summary(Sola)

# ========================================================================
# 1. Sestavite vektor `otoki`, ki vsebuje iste podatke kot vektor `islands`,
# le da so površine izražene v kvadratnih kilometrih.
# ========================================================================

islands # podatki so v kvadratnih miljah
otoki <- 1.609344^2 * islands
otoki

# ========================================================================
# 2. Uporabi podatke iz vektorjev `islands` in `otoki ter sestavi 
# razpredelnico `Otoki` s stolpci `ime_otoka`, `kvadratni_kilometri`, 
# `kvadratne_milje` in `kategorija`, pri čemer je zadnja urejenostna 
# spremenljivka z vrednostmi

# * `"celina"`, če je površina otoka nad 5000 km^2,
# * `"velik otok"`, če je površina med 100 km^2 in 5000 km^2,
# * `"majhen otok"`, če je površina pod 100 km^2.
 
# Velikosti v kvadratnih kilometrih naj bodo zaokrožene na celo število.
# ========================================================================

kategorija <- cut (round(unname(otoki)), breaks = c(-Inf, 100, 5000, Inf),
                      right = TRUE, labels = c("mali otok", "veliki otok", "celina"))

Otoki <- data.frame(ime_otoka = names(islands), kvadratni_kilometri = unname(otoki), 
                    kvadratne_milje = unname(islands), kategorija = kategorija)

Otoki

# ========================================================================
# 3. Rapredelnico `Otoki` uredi v naraščajočem vrstnem redu glede na stolpec 
# `kategorija`.
# Namig: uporabi funkcijo `order`.
# ========================================================================

kategorija <- cut (round(unname(otoki)), breaks = c(-Inf, 100, 5000, Inf),
                   right = TRUE, labels = c("mali otok", "veliki otok", "celina"))

Otoki_Novi <- Otoki[rev(order(Otoki$kvadratni_kilometri)), ]
rownames(Otoki_Novi) = NULL 
Otoki_Novi

# ========================================================================
# 4. Rapredelnico `Otoki` uredi v padajočem vrstnem redu glede na stolpec 
# `kvadratni_kilometri`.
# ========================================================================

Otoki_Novi_2 <- Otoki[order(Otoki$kvadratni_kilometri), ]
Otoki_Novi_2

# ========================================================================
# 5. Poišči vse otoke katerih površina v kvadratnih miljah je manjša od 100.
# Zanimata nas samo stolpca `ime_otoka` in `kvadratne_milje`.
# ========================================================================

Otoki[Otoki$kvadratne_milje < 100, c("ime_otoka", "kvadratne_milje")]

# ========================================================================
# 6. Kolikšna je maksimalna/minimalna/povprečna vrednost stolpca 
# `kvadratni_kilometri`?
# ========================================================================

summary(Otoki$kvadratni_kilometri)[c(1,4,6)]

# ========================================================================
# 7. Razpredenici `Otoki` dodaj nov stolpec `delez` v katerem naj bo 
# izračunan delež površine posameznega otoka glede na površino vseh otokov
# ========================================================================

povrsina <- sum(unname(otoki))
delez <- Otoki$kvadratni_kilometri / povrsina  
Otoki[["delez"]] <- delez
Otoki

# ========================================================================
# 8. V datoteki izidi.xlsx (https://kt.ijs.si/~ljupco/lectures/appr/izidi.xlsx)
# je preglednica s podatki o numeričnih izidih uporabe dveh različnih 
# terapij na treh pacientih. Prazne celice ustrezajo neznanim vrednostim 
# izidov. Napiši program v R-ju, ki prebere podatke iz preglednice in iz 
# njih sestavi podatkovno tabelo z urejenimi podatki. 

# Namig: rabiš sestaviti eno tabelo z dvema dimenzijskima in eno merjeno 
# spremenljivko.
# ========================================================================

library(readxl)
izidi <- read_excel("izidi.xlsx")
colnames(izidi) <- c("ime_priimek", "A", "B")
izidi

# ========================================================================
# 9.
# V nekem bistroju poimenovanem Mafija strežejo tri vrste kavnih napitkov: 
# črno kavo, kavo z mlekom in kavo s smetano. Pri izdelavi letne bilance si 
# zapišejo koliko skodelic vsake vrste kavnega napitka so postregli v 
# opazovanem letu. 
# Spodnja tabela podaja podatke o petih letnih bilancah bistroja Mafija:
kava <- tibble("vrsta_kavnega_napitka" = c("Črna kava", "Kava z mlekom", "Kava s smetano"),
               "leto2018" = c(23100, 18300, 11500),
               "leto2019" = c(3500, 2800, 1600),
               "leto2020" = c(6200, 4900, 3400),
               "leto2021" = c(18700, 14000, 7600),
               "leto2022" = c(21400, 18000, 11100))

# Premisli kako bi iz zgornje tabele sestavili podatkovne tabele urejenih 
# podatkov. Sestavi ustrezne podatkovne tabele v R-ju
# ========================================================================
list(kava)[[1]][[1]]
kava <- transpose(kava)
kava[[1]]


