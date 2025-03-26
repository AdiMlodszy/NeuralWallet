# NeuralWallet

**NeuralWallet** to osobista aplikacja do zarządzania finansami, która umożliwia śledzenie kont, transakcji i sald. Projekt tworzony z myślą o późniejszej integracji z AI (np. analiza wydatków, przewidywanie salda).

---

## Funkcje MVP

- Dodawanie kont (standardowe, oszczędnościowe, kredytowe)
- Ręczne dodawanie transakcji
- Import transakcji z plików CSV
- Przegląd historii transakcji
- Podgląd aktualnego salda konta

---

## Struktura katalogów

```
NeuralWallet/
├── app/          # Logika aplikacji
├── import/       # Skrypty do importu danych (np. CSV)
├── sql/          # Skrypty SQL do tworzenia i inicjalizacji bazy danych
├── docs/         # Dokumentacja: ERD, notatki projektowe
├── data/         # Przykładowe dane (CSV, JSON itp.)
├── tests/        # (opcjonalnie) testy aplikacji
└── README.md     # Ten plik
```

---

## Wymagania

- Python 3.10+
- Baza danych: MySQL, SQLite lub PostgreSQL
- Biblioteki:
  - pandas
  - sqlalchemy
  - mysql-connector-python _(jeśli używasz MySQL)_

---

## Jak uruchomić projekt

1. Sklonuj repozytorium:

```bash
git clone https://github.com/twoj-login/NeuralWallet.git
cd NeuralWallet
```

2. Utwórz środowisko i zainstaluj zależności:

```bash
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install -r requirements.txt
```

3. Utwórz bazę danych i uruchom aplikację:

```bash
python sql/init_db.py
python app/main.py
```

---

## Pomysły na rozwój

- AI do przewidywania salda kont
- Automatyczne kategoryzowanie transakcji
- Tagowanie wydatków na podstawie opisu
- Wykresy i dashboard z analizą trendów

---

## Autor

Tworzone przez add.ktiv – projekt edukacyjny z pogranicza finansów i AI.
