# 🛍️ FashionStore — Java EE E-Commerce Web Application

A full-stack fashion e-commerce web application built with **Java Servlets**, **JSP**, **JSTL**, and **MySQL**, deployed on **Apache Tomcat 10.1**.

---

## 📌 Project Overview

FashionStore is a dynamic online fashion retail platform that allows users to browse products, filter by category and price, manage a shopping cart, and place orders. The application follows the classic **MVC (Model-View-Controller)** architecture using Java EE technologies.

---

## 🚀 Features

### 👤 User Authentication
- User registration with full profile and address details
- Session-based login and logout
- Protected pages (Cart, Checkout) redirect to login if unauthenticated
- Post-login redirect to originally requested page

### 🛒 Product Catalog
- Browse all products with image, name, and price
- Filter products by **category** (Men, Women, Sports, etc.)
- Filter products by **price range** (Under ₹500 to ₹5,000)
- **Sort** by price (low to high / high to low) or name (A–Z)
- **Search** products by keyword

### 🧺 Shopping Cart
- Add products to cart with selected **size** and **colour**
- Real-time **quantity update** with live price recalculation (no page reload)
- Remove individual items
- Persistent cart tied to user session

### 💳 Checkout & Orders
- Pre-filled delivery address from user profile
- Multiple payment method options (COD, UPI, Card)
- Order placed with full order summary
- Cart automatically cleared after successful order
- Order confirmation page with Order ID

---

## 🏗️ Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | JSP, JSTL, HTML5, CSS3, JavaScript |
| Backend | Java 21, Jakarta Servlets |
| Database | MySQL 8 |
| Server | Apache Tomcat 10.1 |
| Build Tool | Maven |
| Styling | Google Fonts (Cormorant Garamond, Jost) |

---

## 📁 Project Structure

```
fashion_store/
│
├── src/main/java/com/fashion_store
│   ├── controller/          # Servlets (MVC Controllers)
│   │   ├── HomeServlet.java
│   │   ├── ProductServlet.java
│   │   ├── ProductDetailsServlet.java
│   │   ├── CartServlet.java
│   │   ├── LoginServlet.java
│   │   ├── RegisterServlet.java
│   │   ├── CheckoutServlet.java
│   │   └── LogoutServlet.java
│   │
│   ├── dao/                 # Data Access Object interfaces
│   │   └── impl/            # DAO implementations (JDBC)
│   │
│   ├── model/               # POJOs (User, Product, Cart, Order...)
│   │
│   ├── filter/              # EncodingFilter (UTF-8)
│   │
│   └── util/                # DBConnection (MySQL connection pool)
│
├── src/main/webapp
│   ├── WEB-INF/
│   │   ├── views/           # JSP pages
│   │   │   ├── home.jsp
│   │   │   ├── products.jsp
│   │   │   ├── product-details.jsp
│   │   │   ├── cart.jsp
│   │   │   ├── login.jsp
│   │   │   ├── register.jsp
│   │   │   └── checkout.jsp
│   │   └── web.xml
│   │
│   ├── assets/
│   │   ├── css/
│   │   ├── js/
│   │   └── images/
│   └── index.html
│
└── pom.xml
```

---

## 🗃️ Database Schema

The application uses the following MySQL tables:

| Table | Description |
|-------|-------------|
| `users` | Registered user accounts with address |
| `categories` | Product categories (Men, Women, Sports...) |
| `products` | Product catalog with price, image, category |
| `product_variants` | Size and colour variants with stock quantity |
| `cart` | Active shopping cart per user |
| `cart_items` | Individual items in a cart |
| `orders` | Placed orders with delivery and payment info |
| `order_items` | Individual line items in an order |

---

## ⚙️ Setup & Installation

### Prerequisites
- Java 21+
- Apache Tomcat 10.1
- MySQL 8+
- Maven 3.8+

### Steps

**1. Clone the repository**
```bash
git clone https://github.com/Keerthana791/fashion_store
cd fashion_store
```

**2. Create the MySQL database**
```sql
CREATE DATABASE fashion_store;
USE fashion_store;
-- Run your schema SQL file here
```

**3. Configure database connection**

Edit `src/main/java/com/fashion_store/util/DBConnection.java`:
```java
String url      = "jdbc:mysql://localhost:3306/fashion_store";
String username = "root";
String password = "your_password";
```

**4. Build the project**
```bash
mvn clean package
```

**5. Deploy to Tomcat**
- Copy the generated `fashion_store.war` from `target/` to Tomcat's `webapps/` folder
- Or deploy directly from your IDE (Eclipse / IntelliJ)

**6. Access the application**
```
http://localhost:8080/fashion_store/
```

---

## 📸 Pages

| Page | URL |
|------|-----|
| Home | `/home` |
| Products | `/products` |
| Product Detail | `/product-details?id={id}` |
| Cart | `/cart` |
| Checkout | `/checkout` |
| Login | `/login` |
| Register | `/register` |

---

## 🔐 Security Notes

- Authentication is handled via **HTTP Sessions**
- Passwords are currently stored as plain text — **BCrypt hashing recommended for production**
- CSRF protection and HTTPS enforcement recommended before public deployment

---

## 🙋‍♀️ Author

**Keerthana** — Built as a Java EE learning project covering full MVC architecture, JDBC DAO pattern, session management, and responsive UI design.

---

## 📄 License

This project is for educational purposes.
