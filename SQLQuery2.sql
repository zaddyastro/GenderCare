CREATE TABLE States (
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Cities (
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100) NOT NULL,
    state_id INT FOREIGN KEY REFERENCES States(id)
);

CREATE TABLE Medical_Providers (
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(150) NOT NULL,
    type VARCHAR(50),        --Hoapital, clinic 
    specialty VARCHAR(100),   --phycologist,surgon, endo
    cost_range VARCHAR(50),    --500-1000 INR vary karegi
    city_id INT FOREIGN KEY REFERENCES Cities(id),
    verified BIT DEFAULT 0,  
    contact_info VARCHAR(MAX)
);

CREATE TABLE News_Updates (
    id INT PRIMARY KEY IDENTITY(1,1),
    title NVARCHAR(200),
    description NVARCHAR(MAX),
    date_posted DATE DEFAULT GETDATE()
);

CREATE TABLE Support_Requests (
    id INT PRIMARY KEY IDENTITY(1,1),
    user_name VARCHAR(100),
    email VARCHAR(100),
    message VARCHAR(MAX),
    submitted_at DATETIME DEFAULT GETDATE()
);

