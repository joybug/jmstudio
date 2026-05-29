# ☁️ Google Drive API Connection Key (client_secrets.json) Setup Guide

To use Joy Markdown Studio's Google Drive sync feature with your own Google Cloud developer project credential, you need to create and download the client secret credential JSON file from the Google Cloud Console.

Follow these steps to generate and register your `client_secrets.json` file.

---

## 🛠️ [Step 1] Create a Google Cloud Project

1. Open the **Google Cloud Console** ([console.cloud.google.com](https://console.cloud.google.com)) and log in with your Google account.
2. Click the **Project selection dropdown** in the top left, and click the **"New Project"** button in the top right of the popup.
3. Enter a Project Name (e.g., `JoyMarkdownStudio`) and click **"Create"**.
4. Once created, click "Select Project" in the notification to switch to the new project environment.

---

## 🔑 [Step 2] Enable the Google Drive API

1. Click the **Navigation menu (three lines button)** in the top left and go to **"APIs & Services > Library"**.
2. Type **"Google Drive API"** in the search box and press Enter.
3. Click **"Google Drive API"** in the search results, then click the blue **"Enable"** button.

---

## 🎨 [Step 3] Configure the OAuth Consent Screen

This step configures the screen shown to users when they log in to authorize your application.

1. Click the **"OAuth consent screen"** tab in the left sidebar menu.
2. Select **"External"** as the User Type and click **"Create"**.
3. Fill in the **App Information**:
   * **App name**: `Joy Markdown Studio` (or any name you prefer)
   * **User support email**: Select your Google email address from the dropdown
   * **Developer contact information**: Enter your email address
   * *Leave the other fields blank* and click **"Save and Continue"** at the bottom.
4. **Scopes** step:
   * Click **"Add or Remove Scopes"**.
   * Find and check the **`.../auth/drive.file`** scope. (This is a safe, non-sensitive scope that only allows the app to access files it has created).
   * Scroll down and click **"Update"**, then click **"Save and Continue"** at the bottom of the page.
5. **Test users** step (Important):
   * Click **"Add Users"**.
   * Enter the Google email address (Gmail) you will use to log in and sync.
   * Click **"Add"**, then click **"Save and Continue"**.
6. Check the Summary and click **"Back to Dashboard"** at the bottom of the page.
7. **Change Publishing Status (Production)**:
   * On the OAuth Consent Screen dashboard, under **Publishing status**, click the **"Publish App"** button to change the status from "Testing" to "In production". (This is necessary to allow users to log in smoothly).

---

## ⬇️ [Step 4] Generate Credentials and Download JSON

1. Click the **"Credentials"** tab in the left sidebar menu.
2. Click the **"+ Create Credentials"** button at the top, and select **"OAuth client ID"**.
3. In the Application Type dropdown, select **"Desktop app"**.
4. Enter a name (e.g., `JMStudio Desktop`) and click **"Create"** at the bottom.
5. Once created, a popup will confirm it. Click **"OK"**.
6. Under the **OAuth 2.0 Client IDs** list, locate your newly created key.
7. Click the **"Download JSON (⬇️ icon)"** button on the far right of the row.
8. Rename the downloaded file (which has a long name starting with `client_secret_...`) to exactly **`client_secrets.json`**.

---

## 📂 [Step 5] Register and Import in the Application

Use one of the two methods below to apply the downloaded `client_secrets.json` file.

* **Method A (Recommended)**: Launch the app, open the Cloud Sync panel, click the connect guide, and click **"Select Credentials File"** inside the app setup modal. The application will automatically copy and register the file.
* **Method B**: Copy and paste the downloaded `client_secrets.json` file directly into the **same folder** where the Joy Markdown Studio executable (`.exe`) is located.

Once completed, clicking the 구글 드라이브 연동하기 (Connect Google Drive) button will link the app to your own private Google Cloud project environment!
