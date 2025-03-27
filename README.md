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
├── app/               # Logika aplikacji (backend, frontend)
├── data/              # Surowe dane, zrzuty bazy danych (np. do dockera)
├── docker/            # Konfiguracja Dockera + docker-compose
├── docs/              # Dokumentacja: ERD, backlog, konwencje commitów itp.
├── import/            # Skrypty do importu danych (np. CSV)
├── sql/               # Skrypty SQL do tworzenia schematu bazy danych
├── .vscode/           # Konfiguracje edytora (formatter, ustawienia workspace)
├── .gitignore         # Ignorowane pliki
├── package.json       # Skrypty formatowania SQL, configi dev-tools
├── .prettierrc.json   # Konfiguracja Prettiera (JS, SQL)
├── .sqlformatter.json # Konfiguracja SQL Formatter (SQL)
└── README.md          # Ten plik
```

---

## Wymagania

- Python 3.10+
- MySQL 8.0+ (uruchamiany lokalnie lub przez Dockera)
- Node.js (do narzędzi developerskich jak prettier/sql-formatter)
- Biblioteki:
  - pandas
  - sqlalchemy
  - mysql-connector-python _(jeśli używasz MySQL)_

---

## Uruchamianie przez Dockera (zalecane)

```bash
docker-compose up -d
```

Domyślnie uruchomi serwer MySQL i utworzy bazę danych `neuralwallet`.

---

## Uruchomienie projektu lokalnie (dev)

1. Sklonuj repozytorium:

```bash
git clone https://github.com/AdiMlodszy/NeuralWallet.git
cd NeuralWallet
```

2. Utwórz środowisko i zainstaluj zależności:

```bash
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install -r requirements.txt
```

3. Uruchom bazę danych (Docker lub lokalnie)

4. Zainicjalizuj bazę danych i uruchom aplikację:

```bash
python sql/init_db.py
python app/main.py
```

---

## Skrypty developerskie (npm)

```bash
npm run format:sql        # Formatuje pliki SQL
npm run format:prettier   # Formatuje kod JS/TS
npm run format            # Wykonuje oba
```

---

## Pomysły na rozwój

- AI do przewidywania salda kont
- Automatyczne kategoryzowanie transakcji
- Tagowanie wydatków na podstawie opisu
- Wykresy i dashboard z analizą trendów

---

## Autor

Tworzone przez **add.ktiv** – projekt edukacyjny z pogranicza finansów i AI.

