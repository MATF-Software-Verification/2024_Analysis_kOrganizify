# Analiza projekta "kOrganizify" (in progress)

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
4. **Valgrind ()**

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

Clang-Format se koristi za automatsko formatiranje C/C++ koda prema definisanim stilskim pravilima, bez promene njegove funkcionalnosti. Koristi se za osiguravanje konzistentnog izgleda i čitljivosti izvornog koda.

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
Skript formatira sve .cpp i .h fajlove iz direktorijuma src/ i čuva rezultat u folderu formatted_output/, zadržavajući originalnu strukturu direktorijuma.
**Napomena:**
Podrazumevani stil formatiranja definisan je u skripti promenljivom STYLE="Google".
Po želji se može koristiti i konfiguracioni fajl `.clang-format` u kojem se preciznije podešavaju pravila (npr. broj razmaka, poravnanje, veličina linije i sl.).

### Rezultati primene

Za pregled promena posle formatiranja može se koristiti komanda:

```bash
diff -rq ../src formatted_output
```
Ova komanda prikazuje sve fajlove čiji se sadržaj razlikuje nakon primene Clang-Format alata.
Detaljne razlike moguće je pregledati pomoću:
```bash
diff -ru ../src formatted_output | less
```

## 3. **Valgrind (Memcheck)**

**Memcheck** je osnovni alat Valgrind paketa, namenjen detekciji curenja memorije, pristupa oslobođenim ili neinicijalizovanim delovima memorije i drugih problema koji se javljaju tokom izvršavanja programa.
Omogućava detaljan uvid u stabilnost i ispravnost dinamičkog korišćenja memorije.

### Reprodukcija rezultata

Za instalaciju Valgrind alata koristi se sledeća komanda:
```bash
sudo apt install valgrind
```
Pokretanje analize se vrši pomoću skripte `valgrind_memcheck.sh`, koja se nalazi u direktorijumu `valgrind\memcheck`.
Pre prvog pokretanja potrebno je omogućiti prava za izvršavanje komandom:
```bash
chmod +x valgrind_memcheck.sh
```
Zatim pokrenuti analizu:
```bash
./valgrind_memcheck.sh
```
Skripta pokreće program uz Valgrind alat Memcheck, a rezultati se smeštaju u fajl `memcheck_report.txt` u istom direktorijumu.

### Analiza rezultata

## 4. **Valgrind (Massif)**

**Massif** je alat iz Valgrind paketa koji analizira potrošnju heap memorije tokom izvršavanja programa.
Koristi se za identifikaciju funkcija i delova koda koji zauzimaju najviše memorije, čime pomaže u optimizaciji performansi aplikacije.

### Reprodukcija rezultata

Massif koristi isti Valgrind paket, pa nije potrebna dodatna instalacija.
Analiza se pokreće pomoću skripte `valgrind_massif.sh`, koja se nalazi u folderu `valgrind\massif`.

Pre pokretanja potrebno je omogućiti prava za izvršavanje:
```bash
chmod +x valgrind_massif.sh
```
Zatim pokrenuti:
```bash
./valgrind_massif.sh
```
Rezultati analize čuvaju se u fajlu `massif.out`, koji se može pregledati pomoću alata *ms_print*:
```bash
ms_print massif.out > massif_report.txt
```
### Analiza rezultata
