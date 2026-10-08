##############################################################################
# Delo v konzoli
##############################################################################

# Kakor v Pythonu, lahko tudi v R-ju ukaze vnašamo direktno v konzolo.
# Znak > nam pove, da konzola pričakuje nov vnos.

# 1. Izračunajte naslednja števila: 12345679 * 9, 7 * (1 + 2 + 3).


# 2. Če vnos ni zaključen, konzola kaže znak +. Napišite 3 + (4 ter pritisnite 
# Enter. Kaj morate storiti, da bo R srečen? S katero tipko lahko prekinete vnos?


# 3. Po zgodovini vnosov brskamo s puščicama gor in dol. Sprehodite se po zgodovini 
# ter v njej poiščite svoje ukaze.


# 4. Ker se konzola včasih sesuje in ker je iskanje po zgodovini nepregledno,
# je našo kodo bolje pisati v datoteko, kot je ta. Iz nje lahko ukaze z ukazom 
# Run ali kombinacijo tipk Ctrl+Enter izvedemo v konzoli. Poskusite izvesti 
# spodnje ukaze. 
9 * 98765432
(1 + 2 + 3) * (3 + 4)
sin(pi / 4)


# 5. Za pomoč o posamezni funkciji uporabite ukaz ?ime.funkcije. 
# Kaj počne funkcija rnorm?


##############################################################################
# Osnovna aritmetika
##############################################################################

# 6. Vrednosti izrazov lahko shranimo v spremenljivke. 
x <- 5
y <- 6
z <- x + y


# 7. V R je vgrajenih cel kup matematičnih funkcij: trigonometrijske,
# kombinatorične, zaokroževalne, verjetnostne in še in še. Spoznavali jih
# bomo spotoma. Spodaj je navedenih nekaj primerov. 
a <- sqrt(2) / 2
fi <- asin(a)
4 * fi
sin(fi)^2 + cos(fi)^2
sin(fi)^2 + cos(fi)^2 - 1


# 8. Kaj delajo zaokroževalne funkcije round, ceiling, floor, trunc, signif?
round(13.2)
round(13.7)
ceiling(13.2)
ceiling(13.7)
floor(13.2)
floor(13.7)
trunc(-1.8)
floor(-1.8)

# Round zaokroža na najbližje število, prav tako signif, le da prvi na
# dano število mest za decimalno vejico, drugi pa število mest na začetku
# števila. Funkcija ceiling zaokroža navzgor, floor navzdol, trunc pa
# odbije decimalke (zaokroži proti 0). 

# 9. Polovice se vedno zaokrožujejo na sodo število.
round(12.5)
round(13.5)
round(14.5)
round(15.5)


# 10. Kako določimo število decimalk pri zaokrožitvi? Zaokrožite število 
# 1 / pi na 3 decimalke.
round(1 / pi, digits = 3)


##############################################################################
# Nerealna števila
##############################################################################

# 11. R pozna tudi kompleksna števila. Pišemo jih v obliki x+yi, kjer pred i ni
# presledka, temveč le število. Oglejte si spodnje primere. 
1 + 3i
2i
sqrt(3i)
exp(pi * 1i)


# 12. Števila pretvorimo v kompleksna z ukazom as.complex ali s tem, da jih
# uporabimo v istem izrazu kot kompleksna. 
as.complex(2)
2 + 0i
2 * 1i
3 + (2 + 3i) - (4 + 3i)


# 13. R pozna tudi vrednost Inf, ki predstavlja neskončnost.
3 + Inf
1 / 0
-3 * Inf
Inf + Inf
2^10000 # Inf dobimo tudi v primeru prevelikih števil


# 14. Za števila, ki niso definirana, uporabimo vrednost NaN. Obstaja tudi 
# vrednost NA, ki predstavlja manjkajoče podatke in jo bomo spoznali kasneje.
Inf - Inf
0 * Inf
0 / 0
(NaN + 3) - 20 * 6 #  Število NaN "okuži" celoten izraz, v katerem nastopa
NaN * 0 # tudi če množimo z 0, se ga ne znebimo.



