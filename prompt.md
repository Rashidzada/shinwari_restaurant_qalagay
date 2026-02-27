You are a senior Flutter engineer and product owner. Build a complete offline-first POS + Management application for “Shinwari Restaurant Qalagay” that runs on Android (APK) and Windows (EXE). The system must include full CRUD, invoices, printing, PDF history, staff, suppliers, expenses, sales, and profit/loss reports.

TECH STACK (must follow):

* Flutter latest stable (Android + Windows)
* Local database: SQLite using Drift (preferred) or sqflite
* State management: Riverpod (preferred) or BLoC
* PDF: pdf + printing packages
* Thermal printing:

  * Android: Bluetooth ESC/POS thermal printer support (58mm/80mm)
  * Windows: print using generated PDF to any installed printer

MODULES & REQUIREMENTS:

1. Restaurant/Owner Settings (Admin-only, protected by PIN):

* Restaurant name: Shinwari Restaurant Qalagay
* Address, phone editable
* Owner details: Name, CNIC, contact number, signature image upload/draw, logo upload, owner photo upload
* Paper size: 58mm/80mm, footer note editable

2. Menu Items CRUD:

* Categories: Chicken, Beef, BBQ, Drinks, Others
* Fields: item name, sale price, optional cost price, availability toggle
* Seed default items:
  Chicken biryani, chicken karahi, chicken handi, chicken seekh, chicken pulao
  Beef karahi, beef biryani, beef pulao
  BBQ: dumcha, chicken, beef, etc.

3. POS / Invoice:

* Create invoice: customer name optional, dine-in/takeaway optional
* Add items (qty, rate auto), remove/edit items
* Totals: subtotal, discount (Rs), grand total, received, balance
* Status: PAID/PARTIAL/UNPAID
* Save invoices and show Invoice History with search and filters by date/customer/invoice number

4. Printing & PDF (MUST):

* On Save or Print: generate a small PDF receipt and store locally as INV-000123.pdf
* Allow Open PDF, Share PDF, and Reprint invoice anytime
* Thermal print format (58/80mm): header (name/phone/address), invoice no/date, items list, totals, footer note
* Printer setup screen for scanning/selecting Bluetooth printer and test print

5. Expenses CRUD:

* Fields: date, category, amount, notes
* Reports: daily/weekly/monthly/yearly totals

6. Sales Reports:

* Calculate from invoices:
  daily/weekly/monthly/yearly
  paid vs unpaid breakdown

7. Profit & Loss Reports:

* Compute:
  Profit = Sales - (Expenses + CostOfItemsSold)
* If cost price missing, also show “Sales - Expenses” with warning label
* Show daily/weekly/monthly/yearly

8. Staff Management:

* Staff CRUD: name, phone, role, salary
* Attendance: Present/Absent/Leave daily
* Salary module: paid/unpaid tracking, optional advances

9. Supplier Management:

* Supplier CRUD: name, phone, address
* Supplier items list: item name, purchase price, unit
* Optional Purchases module to record purchases and update inventory

UX/UI:

* Very clean, modern UI, big buttons
* Dashboard with cards: New Bill, Invoices, Menu, Expenses, Staff, Suppliers, Reports, Settings
* Fast billing flow with minimal taps
* Error handling for printer not connected and invalid inputs

DELIVERABLES (must output):
A) Folder structure + key packages
B) Full Flutter code for all required files
C) Database schema (Drift tables) and repositories
D) Build instructions:

* Android: generate release APK
* Windows: generate release EXE
  E) Testing checklist + sample data

IMPORTANT:

* Make the project production-ready: proper state management, separation of concerns, and clean code.
* Use local storage paths correctly for PDFs for both Android and Windows.
* Ensure reprint from history works perfectly.
