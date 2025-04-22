# CustomerCare

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


