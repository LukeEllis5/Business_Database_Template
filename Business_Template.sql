-- Create database for a business
CREATE DATABASE Business;

-- Connect to the Business database
\c Business

-- Department table
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

-- Employee table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE DEFAULT CURRENT_DATE,
    end_date DATE,
    title VARCHAR(50),
    department_id INT,
    manager_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
	FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

-- Customers table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    account_opening DATE DEFAULT CURRENT_DATE,
    age SMALLINT CHECK (age BETWEEN 18 AND 99),
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(50),
    state CHAR(2)
);

-- Inventory table
CREATE TABLE inventory (
    inventory_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50) UNIQUE NOT NULL,
    purchase_date DATE DEFAULT CURRENT_DATE,
	price NUMERIC(10,2) NOT NULL
);

-- Sales table
CREATE TABLE sales (
    sales_id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    customer_id INT NOT NULL,
    sales_person_id INT,
    transaction_type VARCHAR(30),
    sale_date DATE DEFAULT CURRENT_DATE,
    department_id INT NOT NULL,
    revenue NUMERIC(10, 2) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES inventory(inventory_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_person_id) REFERENCES employees(employee_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
