# Gardening & Waste Disposal Management System

A full-stack web platform for managing gardening and waste disposal services, featuring online payments via Paystack. Built with a **Laravel** REST API backend and a **React** SPA frontend.

---

## Project Structure

```text
domestik/
├── backend/          # Laravel REST API (Sanctum SPA Authentication & Paystack)
├── frontend/         # React SPA Frontend
└── README.md         # Setup & deployment documentation
```

---

## Local Development Setup

### 1. Backend Setup (Laravel)
1. Navigate to the backend folder and install PHP dependencies:
   ```bash
   cd backend
   composer install
   ```
2. Create your environment file and generate an app key:
   ```bash
   cp .env.example .env
   php artisan key:generate
   ```
3. Configure your database connection in `backend/.env`:
   ```env
   DB_CONNECTION=mysql
   DB_HOST=localhost
   DB_PORT=3306
   DB_DATABASE=domestik
   DB_USERNAME=root
   DB_PASSWORD=
   ```
4. **Load Sample Database:**
   Import the preloaded sample `domestik.sql` database file (containing test accounts) into your local MySQL database via phpMyAdmin or CLI:
   ```bash
   mysql -u root -p domestik < database/domestik.sql
   ```
5. **Configure Paystack Keys (`settings` table):**
   * The sample database comes preconfigured for Paystack testing (`sk_test_...`).
   * To update your Paystack keys locally, open the `settings` table in phpMyAdmin and replace the Paystack secret key value with your test keys.
6. Start the Laravel development server:
   ```bash
   php artisan serve
   ```
   Backend runs at: `http://localhost:8000`

---

### 2. Frontend Setup (React)
1. Navigate to the frontend folder and install packages:
   ```bash
   cd frontend
   npm install
   ```
2. Verify local API endpoints:
   * **`frontend/src/utilities/config.js`** — Ensure `destination` is set to:
     ```js
     http://localhost:8000
     ```
   * **`frontend/src/utilities/request.js`** — Ensure `Origin` in `payload.headers` is set to:
     ```js
     "Origin": "http://localhost:5173"
     ```
3. Start the frontend development server:
   ```bash
   npm run dev
   ```
   Frontend runs at: `http://localhost:5173`

---

## Preloaded Test Accounts

| Role | Email | Password |
| :--- | :--- | :--- |
| **Admin** | `tytan@techtytan.com` | `password` |
| **Admin** | `efeturi@example.com` | `password` |

---

## Preloaded States & Areas(Local Government Areas) in Nigeria

36 States plus FCT and 774 Areas(Local Government Areas) preloaded.

---

## Production Deployment (cPanel Same-Domain Architecture)

To keep both the React frontend and Laravel Sanctum API under the exact same domain (avoiding cross-domain cookie issues), organize `public_html` as follows:

```text
public_html/
├── api/              # Contents of Laravel's backend/public/
├── api-backend/      # Core Laravel application files (app, config, vendor, .env, etc.)
├── assets/           # React compiled JS/CSS assets
├── index.html        # React entry point
└── .htaccess         # Root routing & HTTPS enforcement
```

### 1. Backend Deployment (`api/` & `api-backend/`)
1. **Split the Laravel Files in `public_html`:**
   * Upload the core Laravel directories (`app/`, `bootstrap/`, `config/`, `database/`, `resources/`, `routes/`, `storage/`, `vendor/`, `.env`, `artisan`, etc.) into `public_html/api-backend/`.
   * Upload the contents of `backend/public/` (including `index.php` and `.htaccess`) into `public_html/api/`.
2. **Update Paths in `public_html/api/index.php`:**
   Point `index.php` to the `api-backend` folder:
   ```php
   $maintenance = __DIR__.'/../api-backend/storage/framework/maintenance.php'
   require __DIR__.'/../api-backend/vendor/autoload.php';
   \$app = require_once __DIR__.'/../api-backend/bootstrap/app.php';
   ```
3. **Protect `public_html/api-backend/`:**
   Create an `.htaccess` file inside `public_html/api-backend/.htaccess` to block direct browser access:
   ```apache
   # Deny access to all web users
   Require all denied
   ```
4. **Database, Environment & Live Paystack Keys:**
   * Create a MySQL database in cPanel and import the sample `domestik.sql` file via **phpMyAdmin**.
   * **Switch to Live Paystack Keys:** In phpMyAdmin update the Paystack secret key in the `settings` table from your test key (`sk_test_...`) to your live key (`sk_live_...`).
   * Configure `api-backend/.env` with a fresh `APP_KEY` and same-domain Sanctum settings:
     ```env
     APP_ENV=production
     APP_DEBUG=false
     APP_URL=https://yourdomain.com

     FRONTEND_URL=https://yourdomain.com
     SANCTUM_STATEFUL_DOMAINS=yourdomain.com,://yourdomain.com
     SESSION_DOMAIN=yourdomain.com
     SESSION_SECURE_COOKIE=true
     ```
   * Ensure `backend/config/cors.php` has `'supports_credentials' => true` and allows `https://yourdomain.com`.

   * Ensure `backend/config/sanctum.php` includes `https://yourdomain.com` in the stateful property.

### 2. Frontend Deployment (`public_html/`)
1. **Update Production URLs Before Building:**
   * **`frontend/src/utilities/config.js`** — Update `destination` and append `/api`:
     ```js
     https://yourdomain.com/api
     ```
   * **`frontend/src/utilities/request.js`** — Update `"Origin"` in `payload.headers`:
     ```js
     "Origin": "https://yourdomain.com"
     ```
2. **Build the React Bundle Locally:**
   ```bash
   cd frontend
   npm run build
   ```
3. **Upload Build Files:**
   Upload the contents of `frontend/dist` (or `build`) directly into `public_html/`.
4. **Configure Root Routing (`public_html/.htaccess`):**
   Place the following `.htaccess` file in `public_html/` to enforce HTTPS, pass `/api/*` traffic to Laravel, and route all frontend paths to React's `index.html`:
   ```apache
   <IfModule mod_rewrite.c>
     RewriteEngine On
     RewriteBase /

     # 1. Force HTTPS
     RewriteCond %{HTTPS} !=on
     RewriteRule ^(.*)\$ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]

     # 2. Allow direct access to the Laravel API folder
     RewriteRule ^api/ - [L]

     # 3. Route all other requests to React's index.html
     RewriteCond %{REQUEST_FILENAME} !-f
     RewriteCond %{REQUEST_FILENAME} !-d
     RewriteRule . /index.html [L]
   </IfModule>
   ```
