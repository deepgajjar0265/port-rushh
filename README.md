# 🔐 Port Monitor Dashboard

A lightweight cybersecurity tool that monitors **open ports (TCP & UDP)** on your system and displays them in a **web-based dashboard** with search, sorting, export, and visualization features.

---

## 🚀 Features

* 🔍 View all **open ports (TCP + UDP)**
* 🌐 Identify **internal vs external connections**
* 🔽 **Sort data** by any column
* 🔎 **Search/filter** across all fields
* 📄 Export data to:

  * CSV (for Excel analysis)
  * PDF (formatted report)
* 📊 **Port usage visualization (chart)**
* 📄 Pagination (25 rows per page)
* ⚡ Clean and user-friendly UI

---

## 🛠️ Tech Stack

* Frontend: HTML, CSS, JavaScript
* Backend: Node.js (Express)
* Script: PowerShell
* Libraries:

  * Chart.js
  * jsPDF + AutoTable

---

## ⚙️ How It Works

```text
PowerShell Script → Sends Port Data → Node.js API → Web Dashboard
```

1. PowerShell collects open ports from your system
2. Sends data to backend (`localhost:3000`)
3. Website fetches and displays it

---

## 📦 Installation & Setup

### 1️⃣ Clone Repository

```bash
git clone https://github.com/your-username/port-monitor-dashboard.git
cd port-monitor-dashboard
```

---

### 2️⃣ Setup Backend

```bash
npm init -y
npm install express cors
node server.js
```

---

### 3️⃣ Run PowerShell Script

```powershell
.\port_scan.ps1
```

This will send live port data to the backend.

---

### 4️⃣ Open Dashboard

Open `index.html` in your browser.

---

## 📁 Project Structure

```
📦 port-monitor-dashboard
 ┣ 📜 server.js
 ┣ 📜 port_scan.ps1
 ┣ 📜 index.html
 ┗ 📜 README.md
```

---

## 📊 Example Data

| Direction | IP   | Protocol | Scope    | Port | Remote      |
| --------- | ---- | -------- | -------- | ---- | ----------- |
| Outbound  | IPv4 | TCP      | External | 443  | 142.250.x.x |
| Inbound   | IPv4 | UDP      | Internal | 53   | 0.0.0.0:*   |

---

## ⚠️ Notes

* Requires **Windows PowerShell** for script execution
* Backend must be running before opening the dashboard
* Data updates when script is executed again

---

## 🎯 Use Cases

* Cybersecurity learning
* Network monitoring
* Port analysis
* Beginner SOC dashboard project

---

## 🚀 Future Improvements

* 🚨 Suspicious activity alerts
* 🔔 Real-time notifications
* 🧠 AI anomaly detection
* ☁️ Database logging (Firebase / MongoDB)
* 🔐 Authentication system

---

## 👨‍💻 Author

**Deep**

---

## ⭐ Contribute

Feel free to fork this project and improve it!

---

## 📜 License

This project is for educational purposes.
