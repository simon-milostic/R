##########################################################################
# OSNOVNI PODATKOVNI TIPI
##########################################################################

##########################################################################
# VEKTORJI
##########################################################################

# Osnovna podatkovna struktura v R-ju so vektorji. Ti predstavljajo sezname 
# elementov enakega tipa, na primer seznam samih števil ali samih nizov. 

# ========================================================================
# Osnovni gradniki vektorjev 
# ========================================================================

# Osnovne vektorje pišemo kot `c(x1, x2, ...)`.
c(1, 2, 3, 4, 5, 6, 7)


# V resnici je `c` ukaz, ki več vektorjev stakne v enega, in zgornji zapis
# predstavlja le stikanje več vektorjev dolžine 1.
c(c(1, 2, 3), c(4, 5, 6))


# Za ustvarjanje novih vektorjev nam je na voljo veliko ukazov.
1:10        # števila od 1 do 10
10:1        # števila od 10 do 1
seq(1, 10, 2) # števila od 1 do 10 z razmakom 2
rep(5, 10)    # 10 kopij števila 5


# Če izpis vektorja sega čez rob okna, nam številka v oglatih oklepajih na
# začetku vsake vrstice pove trenutni indeks. Sedaj veste, kaj pomeni `[1]`.
1:100


# Običajne matematične operacije brez sprememb delujejo tudi na vektorjih.
2 * (1:10)
3 + rep(5, 10)
1:5 + seq(50, 10, -10)
(1:10) ^ 2
(-5:5) > 0


# Če je en vektor krajši od drugega, se ciklično dopolni do daljše dolžine.
# V primeru, ko daljša dolžina ni večkratnik krajše, dobimo opozorilo.
c(1, 2, 3, 4) + c(10, 20)
c(1, 2, 3, 4) + c(10, 20, 10, 20)
c(1, 2, 3, 4) + c(10, 20, 30)


# R pozna ogromno funkcij, ki delujejo na vektorjih. Kaj počnejo?
sum(1:36)
prod(1:10)
mean(c(4, 3, 2, 4, 3, 3, 5))


# =======================================================================
# 1. Izračunajte vsoto kvadratov prvih n naravnih števil 
#  `1^2 + 2^2 + ... + n^2` za n = 100. 
# =======================================================================




# =======================================================================
# 2. Za vektor `v = 2, 5, 1, 7` s pomočjo obravnavanih metod poiščite vektor,
# ki ima na lihih mestih enake vrednosti kot `v`, na sodih pa nasprotne.
# Želimo torej dobiti vektor `2, -5, 1, -7`.
# Namig: vektor `v` pomnožite z ustreznim vektorjem. 
# =======================================================================
v <- c(2, 5, 1, 7)



# ========================================================================
# Indeksi
# ========================================================================

# Do komponent vektorjev dostopamo z indeksi tako, da v oglatih
# oklepajih za vektorjem lahko naštejemo vektor želenih indeksov.
x <- 20:30
x[c(1, 2, 7)] # 1., 2. in 7. element
x[c(1, 2, 7, 5, 1)] # 1., 2., 7., 5. in 1. element


# Funkcija `order` vrne vektor mest, na katera spadajo posamezne
# komponente v vektorju, urejenem po velikosti. Po korakih izvedite
# spodnje tri ukaze. Kaj je rezultat zadnjega?
y <- c(3, 7, 1, 5, 9)
order(y)
y[order(y)]


# Če so indeksi negativni, naštejemo neželene elemente.
x[c(-1, -2, -7)] # Vsi elementi razen 1., 2. in 7. elementa


# Če podamo vektor logičnih vrednosti, se izberejo tisti elementi, kjer je
# pripadajoča vrednost enaka `TRUE`.
x[c(TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE)]


# Namen logičnih vektorjev v indeksih je izbor elementov, ki zadoščajo
# danemu pogoju.
x %% 3 # vektor ostankov pri deljenju s 3 
x %% 3 == 0 # vektor, ki je TRUE tam, kjer je ostanek pri deljenju s 3 enak 0
x[x %% 3 == 0] # števila, ki so deljiva s 3
x[x %% 5 == 1] # števila, ki dajo pri deljenju s 5 ostanek 1
x[x %% 3 == 0 | x %% 5 == 1] # števila, ki zadoščajo vsaj enemu pogoju


# ========================================================================
# 3. Poiščite način kako za dan vektor `v` dobimo komponente na sodih 
# mestih.
# ========================================================================
v <- c(3, 7, 1, 5, 9, 5, 5)
v <- c(3, 7, 1, 5, 9, 5, 5, 8)



# ========================================================================
# 4. Poiščite način kako za dan vektor `v` dobimo le pozitivne komponente.
# ========================================================================
v <- -5:5



# ========================================================================
# Spreminjanje komponent
# ========================================================================

# Vrednosti komponent spreminjamo s prireditvenim stavkom.
x <- c(1, -3, 5, -7, 9, -11)
x[3] <- -5


# Spreminjamo lahko tudi več vrednosti naenkrat.
x[c(1, 5)] <- 2 # 1. in 5. komponento nastavimo na 2
x[c(2, 4)] <- c(60, 90) # 2. komponento nastavimo na 60, 4. pa na 90
x[x %% 3 == 0] <- 10 # vse komponente, deljive z 3, nastavimo na 10
x[x > 1] <- 100 * x[x > 1] # komponente, večje od 1, pomnožimo s 100


# ========================================================================
# 5. 
# Naj bo `stanja` vektor stanj na posameznih računih, želimo poiskati vektor
# stanj po obračunanih obrestih. Na pozitivna stanja se obračunajo 5%, na 
# negativna pa 10% obresti.
# ========================================================================
stanja <- c(150, 50, -20, 0, 70, -60, 200)




# ========================================================================
# Imena
# ========================================================================
# Do komponent vektorjev lahko dostopamo tudi z njihovimi imeni.
# V R-ju je že vgrajen vektor `islands` površin največjih otokov na Zemlji.
# Do komponent lahko dostopamo kot poprej.
islands[c(13, 16, 8)] # 13., 16. in 8. otok, urejeno po abecedi
islands[islands < 100] # otoki s površino, manjšo od 100 kvadratnih milj


# Lahko pa do komponent dostopamo direktno po imenih.
islands["Britain"] # površina Velike Britanije
islands[c("Honshu", "Kyushu", "Hokkaido", "Shikoku")] # japonski otoki


# Če imena ni, dobimo vrednost NA (not available).
islands["Blejski otok"]


# V ozadju R uporablja vektor imen, do katerega lahko dostopamo s funkcijo
# `names`.
names(islands)


# Vektorje z imeni lahko s funkcijo `c` sestavimo tudi direktno.
matematika <- c(4, 2, 5, 3)
names(matematika) <- c("Janez", "Micka", "Lojzka", "Franci")


# Če želimo uvesti urejenost za imenske spremenljivke, si lahko pomagamo s
# funkcijo `factor`.
opisne.ocene <- c("manj uspešno", "uspešno", "zelo uspešno")
telovadba <- c("manj uspešno", "zelo uspešno", "uspešno", "uspešno")
Telovadba <- factor(telovadba, levels=opisne.ocene, ordered=TRUE)



# ========================================================================
# Matrike
# ========================================================================

# Če vektorju nastavimo dimenzije, postane matrika, kjer gredo elementi
# najprej od zgoraj navzdol, nato pa od leve proti desni.
x <- 1:100
dim(x) <- c(5, 20) # x naj bo matrika dimenzije 5 × 20
x
dim(x) <- c(10, 10) # x naj bo matrika dimenzije 10 × 10
x


# Matrike načeloma sestavljamo z ukazom `matrix`, ki sprejme vektor
# komponent ter število vrstic in stolpcev.
matrix(1:100, 10, 10)
matrix(1:10, 20, 5) # spet velja ciklično dopolnjevanje


# Podatki se načeloma polnijo po stolpcih, s parametrom `byrow=TRUE` pa jih
# lahko polnimo tudi po vrsticah.
matrix(1:10, 20, 5, byrow=TRUE)


# Do elementov dostopamo tako kot poprej, le da indekse ločimo z vejicami
x[10, 5]            # element v 10. vrstici in 5. stolpcu
x[c(4, 6), c(5, 9)] # elementi v 4. in 6. vrstici ter 5. in 9. stolpcu
x[4:6, 5:9]     # elementi od 4. do 6. vrstice ter od 5. do 9. stolpca
c(x[4, 5], x[6, 9]) # elementa v 4. vrstici in 5. stolpcu
#                   # ter v 6. vrstici in 9. stoplcu.


# Če indeksa ne podamo, vzamemo vse elemente
x[5, ] # vsi elementi v 5. vrstici
x[, 6] # vsi elementi v 6. stoplcu


# Ukaza `row` in `col` vrneta matriko indeksov vrstic in stolpcev.
# Ukaza sta uporabna predvsem v indeksnih vektorjih
x[row(x) %in% c(2, 3, 5, 7)] # vsi elementi v 2., 3., 5. in 7. vrstici
x[row(x) == col(x)]          # vsi elementi na diagonali
x[row(x) == col(x) + 1]      # vsi elementi pod diagonalo
x[row(x) == col(x) - 1]      # vsi elementi nad diagonalo


# Seveda spreminjanje dimenzij ni najbolj pameten način ustvarjanja matrik
# Več vektorjev enake dolžine lahko zložimo v matriko po vrsticah z ukazom
# `rbind` ali po stolpcih z ukazom `cbind`.
ocene <- rbind(Miha = c(mat = 5, sjk = 3, fiz = 3),
               Maja = c(mat = 4, sjk = 5, fiz = 4))
ocene["Miha", "mat"]


# Pozor: veljajo imena stolpcev prvega vnosa:
ocene <- rbind(Miha = c(mat = 5, sjk = 3, fiz = 3),
               Maja = c(kem = 4, bio = 5, geo = 4))


# Če ukaz `rbind` (ali `cbind`) uporabimo na spremenljivkah, se njihova imena
# uporabijo za imena stolpcev.
visine <- c(168, 197, 162, 174, 195, 167, 175, 159, 172, 182, 181, 176)
mase <- c(84, 70, 48, 74, 64, 73, 84, 88, 68, 71, 63, 68)
podatki <- cbind(visine, mase)


# Če je komponenta matrike odvisna le od koordinat, si lahko pomagamo s
# funkcijo `outer`. 

# Poštevanko tako dobimo z ukazom
outer(1:10, 1:10, "*") # simbole predstavimo z nizi
outer(1:10, 1:10, function(i, j) i * j ) # lahko tudi na ta način


# matriko binomskih koeficientov pa z
outer(0:10, 0:10, choose)
outer(0:10, 0:10, function(i,j) choose(i, j))


# ========================================================================
# 6. 
# Sestavi matriko velikosti `n` × `n` z vektorjem `d` na diagonali ter 
# številom `i` izven diagonale.
# ========================================================================
n <- 10
d <- seq(2, 11, length.out = n)
i <- 10



# ========================================================================
# 7. Za obdobje od 1925 do 2025 preštej, kolikokrat je 29. februar padel 
# na vikend (soboto ali nedeljo)

# Namig: uporabi funkcije as.Date, paste0, weekdays
# ========================================================================




# ========================================================================
# 8. 
# Sestavi vektor datumov vseh petkov, ki padejo na trinajsti dan v mesecu, 
# v obdobju od tvojega rojstnega do današnjega dne.
# ========================================================================




# ========================================================================
# 9. Sestavi vektorje z naslednjimi elementi:
# a) (3^1)/1, (3^2)/2,…, (3^50)/50
# b) “A1”, “A2”, … “A50” (Namig: funkcija paste0)
# c) e^x * sinx izračunanimi v točkah x=3,3.1,3.2,…,6 (Namig: funkcija seq)
# ========================================================================




# ========================================================================
# 10. Podano je naravno število x > 2. Zapiši izraz v R-ju, katerega 
# rezultat je TRUE, če je x praštevilo in FALSE sicer. 
# Namig: izraz gradi postopoma. Najprej izračunaj vektor ostankov deljenja 
# x s vsemi števili od 2 do x - 1. Nato preveri, če je 0 element tega 
# seznama.
# ========================================================================





# ========================================================================
# 11. Izračunaj dva vektorja `x` in `y` dolžine 250 tako, da s ponavljanjem 
# naključno izbiraš cela števila iz intervala [0,999]. 
# Označimo z x1,x2,…,x250 in y1,y2,…,y250 elemente seznamov x in y. 
# Izračunaj:
# a) Vektor z elementi y2−x1,y3−x2,…,y250−x249
# b) Vsoto ∑_(i=1)^249 e^(−x_(i+1)) /(x_i+10)
# ========================================================================
x = sample(1:999, 250, replace = TRUE)
y = sample(1:999, 250, replace = TRUE)






# ========================================================================
# 12. Vgrajen vektor `LETTERS` vsebuje 26 črk angleške abecede. 

# a) Zapiši vektor `v`, ki vsebuje črke "A", "B", "C" in "D". Z uporabo 
# funkcije `rep` sestavi naslednja vektorja:
# "A" "A" "A" "B" "B" "B" "C" "C" "C" "D" "D" "D" in
# "A" "B" "C" "D" "A" "B" "C" "D" "A" "B" "C" "D"

# b) Izberi 10 naključnih črk iz angleške abecede (male in ne velike črke)
# ter jih uredi po abecedi. Rešitev zapiši v eni vrstici. 
# Namig: uporabi funkciji sample in sort.

# c) Izberi 5 naključnih črk iz angleške abecede malih črk in 5 iz abecede
# velikih črk. Zapiši jih v en vektor in ga uredi po abecedi. 


# d) Ponovi nalogo c), le da črke urediš v padajočem vrstnem redu.

# ========================================================================





# ========================================================================
# 13. V programu za urejanje preglednic Excel (in podobno v programih 
# Google Sheets ali Numbers) so stolpci poimenovani z velikimi črkami 
# angleške abecede (od A do Z), nato sledijo stolpci poimenovani z dvema 
# črkama (od AA, prek AB, AC, in tako naprej, do ZY in ZZ), nato še tisti 
# s tremi črkami (od AAA do ZZZ).

# Napiši program v R-ju, ki za dan stolpec (npr. XFD) izračuna kateri po
# vrsti je. 

# Namig: uporabiš lahko LETTERS, t.j., vektor velikih črk v angleški abecedi, 
# ter klice funkcij expand.grid v kombinaciji s funkcijo paste0 za izračun 
# vektorja z imeni stolpcev. 
# Nato s klicem funkcije which ugotovite indeks stolpca XFD v tem vektorju.
# ========================================================================


