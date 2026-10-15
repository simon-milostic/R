# ========================================================================
# Seznami
# ========================================================================

# Vsi elementi vektorjev v R-ju morajo biti istega tipa. Če pa želimo
# sestaviti več podatkov različnih tipov, napišemo seznam. 
# Sezname lahko sestavimo neposredno z ukazom `list`.
list(1, 2, "abc")
c(1, 2, "abc") # če napišemo vektor, se elementi pretvorijo na skupen tip


# Če želimo, lahko nekatere komponente seznama tudi poimenujemo:
list(a = 1, b = 2, c = "abc")

oseba <- list(ime = "Janez", priimek = "Novak", starost = 20,
              naslov = list(ulica = "Prešernova", stevilka = 14),
              starsi = c("Franci", "Francka"))


# Do elementov dostopamo z ukazom `x[[i]]`, kjer je `i` indeks elementa.
# Če je nek element poimenovan z nizom `"ime"`, lahko do njega dostopamo z
# ukazom `x[["ime"]]` ali pa kar z ukazom `x$ime`.
# Podobno lahko elemente seznamov spreminjamo z ukazoma `x[[i]] <- v` ali
# `x$ime <- v`.

oseba
oseba$ime
oseba[2]
oseba[["naslov"]]
oseba$starsi[2]


# Pozor: `x[[i]]` ni enako kot `x[i]`. V prvem primeru dobimo `i`-ti element, v
# drugem pa podseznam, ki vsebuje `i`-ti element.


##########################################################################
# OSNOVNO POGRAMIRANJE
##########################################################################

# ========================================================================
# Funkcije 
# ========================================================================

# Funkcije definiramo z

#     ime.funkcije <- function(argumenti) {
#       definicija
#     }

# Načeloma je vrednost funkcije enaka vrednosti zadnjega izraza v njeni
# definiciji. Če pa želimo, pa lahko rezultat funkcije vrnemo z ukazom
# `return(rezultat)`. Ukaz `return` vrne rezultat ter konča izvajanje
# funkcije.

# Na primer, kvadratno funkcijo bi definirali kot
kvadrat <- function(x) {
  x^2
}

# lahko pa tudi kot
kvadrat <- function(x) {
  return(x^2)
}


# Funkcije lahko sprejmejo tudi več argumentov, na primer:
povprecje <- function(x, y) {
  (x + y) / 2
}


# Tako kot v Pythonu so nekateri argumenti lahko tudi neobvezni.
# Določimo jih s tem, da jim pripišemo privzeto vrednost, na primer:
eksponentna <- function(x, baza=exp(1)) {
  baza^x
}


# Take funkcije lahko kličemo:
# 1. kot običajno: `eksponentna(3, 2)` vrne `8`;
eksponentna(3, 2)

# 2. brez neobveznih argumentov: `eksponentna(3)` vrne `20.08554`;
eksponentna(3)

# 3. s poimenovanimi argumenti: `eksponentna(2, baza=3)` vrne `9`.
eksponentna(2, baza=3)

# ========================================================================
# Krmilni stavki 
# ========================================================================

# Krmilni stavki v R-ju se obnašajo podobno kot v Pythonu.
# Pogojni stavek napišemo kot:

#     if (pogoj) {
#       ukazi, ki se izvedejo, če pogoj drži
#     } else {
#       ukazi, ki se izvedejo, če pogoj ne drži
#     }


# Zanka `while` prav tako deluje podobno kot v Pythonu:

#     while (pogoj) {
#       ukazi, ki se izvajajo, dokler pogoj drži
#     }


# Poleg zanke `while` R pozna tudi zanko `repeat`, ki se obnaša tako kot
# zanka `while`, v kateri je pogoj vedno enak `TRUE`.
# Če želimo zaustaviti izvajanje zanke `repeat`, uporabimo ukaz `break`,
# ki se obnaša tako kot v Pythonu, ali pa ukaz `return`.
# Če želimo skočiti na naslednji korak trenutne zanke, pa uporabimo
# ukaz `next`, ki se obnaša tako kot `continue` v Pythonu.



# ========================================================================
# Zanka for 
# ========================================================================

# Iz Pythona ste navajeni uporabljati zanko `for`, ki jo pozna tudi R.
# Če želite nek ukaz izvesti za vsak člen `x` vektorja `v`, napišete

#     for (x in v) {
#       ukaz
#     }

# Na primer
for (x in 1:10) {
  cat(x, "\n")
}


# Toda pozor, zanka `for` je izjemno neučinkovita. Poglejmo, koliko časa
# bi sestavljali vektor `v`, sestavljen iz milijon naključnih števil.
# Najboljša rešitev je kar ukaz `v <- runif(100000)`, ki v trenutku v `v`
# zapiše `1000000` naključnih števil. Neumnejša je rešitev, da najprej
# v `v` zapišemo `1000000` ničel, nato pa eno po eno zapisujemo
# naključna števila.
v <- numeric(1000000)
for (i in 1:1000000) {
  v[i] <- runif(1)
}


# Najbolj neumna stvar, ki jo lahko naredimo, pa je ta, da začnemo s
# praznim vektorjem in vanj na konec dodajamo naključna števila.
v <- numeric(0)
for (i in 1:1000000) {
  v <- c(v, runif(1))
}

# Težava je v tem, da mora računalnik neprestano preurejati pomnilnik.

# ========================================================================
# Uporaba funkcij na vektorjih in razpredelnicah 
# ========================================================================

# Če želite funkcijo `f` uporabiti na vseh komponentah vektorja `x`,
# uporabite funkcijo `sapply(x, f)`.


# Funkcija `mapply(f, x, y, ...)` deluje podobno,
# le da lahko funkcija `f` sprejme več argumentov.
# Kot rezultat nato dobite vektor
# `f(x[1], y[1], ...)`, `f(x[2], y[2], ...)`, `f(x[3], y[3], ...)`, …
vsota <- function(x, y){
  x + y
}
mapply(vsota, 1:10, 3:12)


# Navadno funkcijo lahko spremenimo v vektorsko s funkcijo `Vectorize`.
# (To je funkcija višjega reda, ki sprejme funkcijo in vrne funkcijo.)

# Seveda R pozna tudi ogromno funkcij, namenjenih za delo z vektorji. Poleg
# tega, da skoraj vse vgrajene funkcije, ki smo jih spoznali, s pomočjo
# cikličnega dopolnjevanja delujejo tudi na vektorjih, obstajajo funkcije,
# ki so smiselne šele, ko jih uporabite na vektorjih.

# Na primer, `sum(x)` izračuna vsoto členov `x`, `prod(x)` njihov zmnožek,
# `mean(x)` njihovo povprečje, `sd(x)` njihov standardni odklon, `min(x)`
# najmanjši člen, `max(x)` največji člen, `range(x)` pa oba.


##########################################################################
# NALOGE
##########################################################################

# ========================================================================
# 1. Naj bo `s` seznam.
# a) Z uporabo funkcije `sapply` preveri, če so vsi elementi seznama vektorji
# enake dolžine (v primeru, da so, naj bo izraz enak TRUE, sicer pa FALSE)
# Namig: uporabi funkcijo `all`. 
# b) Izračunaj vsoto vsakega elementa.
# c) Seznamu dodaj element z imenom `norms`, ki je vektor 10 naključnih števil
# iz standardne normalne porazdelitve. 
# ========================================================================
s <- list(x=1:5, y=2:6, z=3:7)



# ========================================================================
# 2. Sestavite funkcijo `sodi(v)`, ki vrne vse komponente vektorja `v` na 
# sodih mestih.




# ========================================================================
# 3. Sestavite funkcijo `ime_datoteke(ime, koncnica)`, ki vrne niz, ki 
# predstavlja polno ime datoteke, t.j. "ime.koncnica".
# Privzeta vrednost končnice naj bo enaka `"csv"`.
# Namig: uporabite funkcijo `paste`. 

# Na primer, `ime_datoteke("vaje2", "R")` naj vrne niz `"vaje2.R"`,
# `ime_datoteke("tabela")` pa naj vrne `"tabela.csv"`.
# ========================================================================



# ========================================================================
# 4. Sestavite funkcijo `prastevila.med(m, n)`, ki vrne vektor vseh praštevil
# med `m` in `n`. Namig: logični indeksni vektorji - na prejšnjih vajah smo
# preverjali, če je dano število praštevilo (ampak samo za x>2!).
# ========================================================================



# ========================================================================
# 5. Sestavite funkcijo `vsota.prastevil.med(m, n)`, ki vrne vsoto vseh
# praštevil med `m` in `n`.
# ========================================================================



# ========================================================================
# 6. Poznamo tri stopnje DDV: 
#       * 5% (kategorija A)
#       * 9.5% (kategorija B)
#       * 22% (kategorija C)
# Sestavite funkcijo DDV, ki v odvisnosti od kategorije vrne ustrezno stopnjo 
# davka. V primeru neznane kategorije naj vrne "neznan vhod". 

# Na primer, `DDV("A")` naj vrne niz `5%`, `DDV("E")` pa naj vrne 
# "neznan vhod". 
# ========================================================================




# ========================================================================
# 7. Napišite funkcijo DDV na način, da bo sprejela vektor kategorij in
# vrnila vektor pripadajočih davčnih stopenj. 
# Namig: uporabite funkcijo `case_when` iz knjižnice `dplyr`
# (lahko si pomagate tudi s funkcijo `sapply` ali pa `Vectorize`)

# Na primer, `DDV.v(c("A", "A", "C", "B", "C", "D"))` naj vrne
# vektor "5%", "5%", "22%", "9.5%", "22%", "neznan vhod"
# =======================================================================




# ========================================================================
# 8. Implementiraj funkcijo kvalitativni_odvodi, ki za podan vektor x 
# izračuna vektor dolžine length(x) - 1 z elementi, ki so enaki 
# “kvalitativnim” odvodom elementov x. Kvalitativni odvod elementa je enak 
# -1, če je element manjši od svojega predhodnika, 0, če je element enak 
# svojemu predhodniku, ter 1, če je element večji od svojega predhodnika.
# Funkcijo napiši brez uporabe zanke for!

# Primer: rezultat funkcije kvalitativni_odvodi na vektorju c(3, 1, 1, 2) 
# je c(-1, 0, 1).
# ========================================================================



# ========================================================================
# 9. Implementiraj funkcijo ekstremi, ki za podan vektor x vrne vektor 
# njegovih "ekstremnih" vrednosti. Element seznama je "ekstremna" vrednost, 
# če je večji (ali manjši) od obeh sosednjih elementov.
# Implementacijo funkcije ekstremi dopolni z argumentom indeksi s privzeto 
# vrednostjo FALSE. Če je vrednost argumenta indeksi enaka TRUE naj funkcija 
# vrne vektor "ekstremnih" vrednosti, ča pa je enaka FALSE naj vrne vektor 
# njihovih indeksov.
# Funkcijo napiši brez uporabe zanke for!

# Primer: vektor "ekstremov" v seznamu c(-1, -3, -5, -3, -1, 1, 3, 5, 3, 1) 
# je c(-5, 5), vektor njihovih indeksov pa c(3, 8).
# ========================================================================




# ========================================================================
# 10. Implementiraj funkcijo drsece_povprecje_3, ki za podan vektor x 
# izračuna drseče povprečje širine 3, t.j., vektor oblike
# ((x_1+x_2+x_3)/3,(x_2+x_3+x_4)/3,…,(x_{n−2}+x_{n−1}+x_n)/3),
# kjer so x_1,x_2,…,x_n elementi podanega vektorja x.
# Funkcijo napiši brez uporabe zanke for!

# Pri drsečem povprečju širine 3 torej računamo povprečne vrednosti treh 
# zaporednih elementov podanega vektorja x. V splošnem je drseče povprečje 
# širine k vektor povprečnih vrednosti k-tih zaporednih elementov vektorja x. 

# Primer:
# drsece_povprecje_3(c(1:5, 6:1)) = c(2, 3, 4, 5, 5.333, 5, 4, 3, 2)
# ========================================================================




# ========================================================================
# 11. Implementiraj bolj splošno funkcijo drsece_povprecje(x, k), ki za 
# vektor x izračuna drseče povprečje širine k. 
# Funkcijo napiši brez uporabe zanke for!
# ========================================================================



