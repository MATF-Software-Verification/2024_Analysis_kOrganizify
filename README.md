# Analiza projekta "kOrganizify"

## Uvod
Ovaj rad predstavlja praktičnu primenu alata za statičku i dinamičku analizu u okviru predmeta **Verifikacija softvera** na Matematičkom fakultetu. U radu su prikazani rezultati verifikacije jednog studentskog projekta.

**Autor:** Milena Vidić 1107/2024

**Analizirani projekat:** [kOrganizify](https://gitlab.com/matf-bg-ac-rs/course-rs/projects-2023-2024/kOrganizify)

**Opis:**
kOrganizify je projekat napisan u jeziku C++ koji služi za organizaciju zadataka i događaja. Projekat je modularno organizovan, sa klasama koje obrađuju zadatke, raspored i čuvanje podataka, što ga čini pogodnim za statičku i dinamičku analizu.

Analiza je izvršena na grani: `master`

Heš kod commit-a: `006aac3aa0d534318bdc0cee7db898bd864601f0`

## Korišćeni alati
U okviru analize korišćeni su sledeći alati i tehnike:

1. **Cppcheck** – statička analiza koda, detekcija logičkih i stilskih grešaka.
2. **Clang-format** – formatiranje koda
3. **Valgrind (Memcheck)** – dinamička analiza memorije i otkrivanje curenja i nevalidnog pristupa.
4. **Jedinični testovi** – testiranje funkcionalnosti i merenje pokrivenosti koda.

## 1. **Cppcheck**

**Cppcheck** je korišćen za statičku analizu koda i generisanje izveštaja o potencijalnim greškama i preporukama u projektu.

### Reprodukcija rezultata

Za instalaciju alata i dodatnih komponenti potrebno je pokrenuti sledeće komande:
```bash
sudo apt update && sudo apt install cppcheck cppcheck-htmlreport firefox
```
Alat *cppcheck-htmlreport* omogućava generisanje HTML izveštaja, dok je Firefox potreban za automatsko otvaranje rezultata.
Analiza se pokreće pomoću skripte `cppcheck.sh`, koja se nalazi u folderu `cppcheck`. Pre prvog pokretanja potrebno je omogućiti prava za izvršavanje komandom:

```bash
chmod +x cppcheck.sh
```
Zatim se analiza pokreće komandom:
```bash
./cppcheck.sh
```
Tada se generišu tekstualni izveštaj sa svim porukama upozorenja i HTML izveštaj, koji sadrži iste informacije ali prikazane preglednije. Rezultati se čuvaju u folderima `results` i `html_report`.


### Analiza rezultata

Rezultati analize alatom Cppcheck pokazali su da projekat kOrganizify nema kritične greške u radu sa memorijom, pokazivačima niti nedefinisano ponašanje.
Većina prijavljenih poruka odnosi se na eksterni kod u okviru test okvira Catch2 i ne utiče na funkcionalnost projekta.
U okviru samog izvornog koda projekta nisu pronađene značajne greške, već samo manji broj informativnih upozorenja koja ne ukazuju na probleme u radu programa.

## 2. **Clang-format**

Clang-Format se koristi za automatsko formatiranje C/C++ koda prema definisanim stilskim pravilima, bez promene njegove funkcionalnosti.

### Reprodukcija rezultata

Alat se instalira komandom:
```bash
sudo apt install clang-format
```
Formatiranje se pokreće pomoću skripte `clang_format.sh`, koja se nalazi u`clang-format` direktorijumu. Pre prvog pokretanja potrebno je omogućiti prava za izvršavanje komandom:

```bash
chmod +x clang_format.sh
```
Zatim se skripta pokreće komandom:
```bash
./clang_format.sh
```

