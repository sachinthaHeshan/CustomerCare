# PulseCare CustomerCare System

PulseCare is a web-based customer care management system designed to streamline customer support operations, including ticketing, FAQs, feedback, and inquiries. The project is built using Java Servlets, JSP, and MySQL.

## Features

- **User Authentication**: Secure login and registration for customers, support staff, and admins.
- **Ticket Management**: Create, view, edit, and delete support tickets.
- **FAQ Management**: Admins/support can manage FAQs; customers can view public FAQs.
- **Feedback System**: Customers can submit, edit, and view feedback; admins/support can manage feedback.
- **Inquiry Handling**: Customers can submit inquiries and view their status.
- **Role-Based Access**: Different views and permissions for customers, support, and admin users.

## Project Structure

```
CustomerCare/
├── src/
│   └── main/
│       ├── java/com/customercare/
│       │   ├── controller/   # Servlets for handling requests
│       │   ├── dao/          # Data access objects
│       │   ├── listener/     # Application listeners
│       │   ├── model/        # JavaBeans for domain models
│       │   ├── service/      # Business logic
│       │   └── util/         # Utility classes (DB, constants)
│       └── webapp/
│           ├── auth/         # Login, register, auth JSPs
│           ├── faq/          # FAQ management JSPs
│           ├── feedback/     # Feedback JSPs
│           ├── inquiry/      # Inquiry JSPs
│           ├── layout/       # Header, sidebar
│           ├── tickets/      # Ticket management JSPs
│           ├── styles/       # CSS files
│           ├── asserts/      # Images
│           └── WEB-INF/      # web.xml, libraries
├── build/                    # Compiled classes
└── README.md
```

## Getting Started

### Prerequisites
- Java 8 or higher
- Apache Tomcat 9+
- MySQL Server
- Maven (optional, for build automation)

### Database Setup
1. Create a MySQL database named `customercare`.
2. Update the database credentials in `DBUtil.java` if needed:
   - URL: `jdbc:mysql://localhost:3306/customercare`
   - USER: `root`
   - PASSWORD: `12345678Abc`
3. Import the required tables and sample data (see your SQL scripts).

### Build & Deploy
1. Compile the project (use your IDE or `javac`).
2. Deploy the `src/main/webapp` directory to your Tomcat webapps folder.
3. Ensure all required JARs are in `WEB-INF/lib` (JSTL, Servlet API, MySQL Connector, etc.).
4. Start Tomcat and access the app at `http://localhost:8080/CustomerCare/`.

## Usage
- Register or log in as a customer to submit tickets, feedback, and inquiries.
- Admin/support users can manage tickets, FAQs, and feedback.
- Use the sidebar for navigation; role-based options are shown.

## Technologies Used
- Java Servlets & JSP
- MySQL
- JSTL
- HTML5, CSS3 (custom styles)
- Apache Tomcat

## Authors
- [Your Name Here]

## License
This project is for educational purposes.

---

## 🛠️ How to Set Up the Project Locally

Follow these steps to get the project up and running in your local environment.

---

### 1️⃣ Import Project into Eclipse

1. Open Eclipse
2. Go to: **File > Import > Existing Projects into Workspace**
3. Select the cloned GitHub project folder
4. Click **Finish**

> If not detected as a web project:
> - Right-click the project → **Properties > Project Facets**
> - Enable: **Dynamic Web Module** and **Java**

---

### 2️⃣ Add JAR FILES

1. Download the jar files [here](https://drive.google.com/drive/folders/1YngVkr5RrNuOqoo8V0x5tFWGlDxqxKd-).
2. Copy the `.jar` files into: **WebContent/WEB-INF/lib/**



---

### 3️⃣ Create the MySQL Database

Run the following SQL in your MySQL client:

```sql
CREATE DATABASE customercare;

USE customercare;

CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type TEXT NOT NULL, -- e.g., 'customer', 'admin', 'support_agent'
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Sample data
INSERT INTO user (type, name, email, password) VALUES
('customer', 'Alice Perera', 'alice@example.com', 'Test@1234'),
('admin', 'Nimal Silva', 'nimal@example.com', 'Test@1234'),
('support_agent', 'Kavindu Jayasuriya', 'kavindu@example.com', 'Test@1234'),
('customer', 'Sanduni Fernando', 'sanduni@example.com', 'Test@1234'),
('support_agent', 'Dilan Wickrama', 'dilan@example.com', 'Test@1234');
```

---

### 4️⃣ Configure Database Connection

Update the database credentials in `DBUtil.java` to match your local MySQL settings:

```java
private static final String URL = "jdbc:mysql://localhost:3306/customercare";
private static final String USER = "root";     // change if your MySQL user is different
private static final String PASS = "";         // change if your MySQL has a password
```

---

### 5️⃣ Add Tomcat Server in Eclipse

1. Open Eclipse and go to **Window > Show View > Servers**.
2. In the **Servers** tab, right-click → **New > Server**.
3. Choose your version of **Apache Tomcat** from the list.
4. Click **Next**, select the Tomcat installation directory on your machine, and click **Finish**.
5. Once the server is created, right-click on **Servers** → **Add and Remove**.
6. Add your project to the server and click **Finish**.
7. Click the **Start** button to start the server.

---

### 6️⃣ Run the Application

1. Right-click on your project in Eclipse.
2. Select **Run As > Run on Server**.
3. Once the server starts, open your browser and go to the following URL: 
    http://localhost:8080/customercare/login


