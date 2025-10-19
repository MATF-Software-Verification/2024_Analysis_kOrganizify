# Analiza projekta "kOrganizify"

## Uvod ##
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
2. **Clang-format / Clang-tidy** – formatiranje i proveravanje stila i strukture koda.
3. **Valgrind (Memcheck)** – dinamička analiza memorije i otkrivanje curenja i nevalidnog pristupa.
4. **Jedinični testovi** – testiranje funkcionalnosti i merenje pokrivenosti koda.

**Zaključci:**


**Reprodukcija rezultata:**

