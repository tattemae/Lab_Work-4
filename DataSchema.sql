CREATE TABLE CLIENT (
    CLIENT_ID INT PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL
    -- Регулярний вираз: тільки букви
    CHECK (NAME ~ '^[A-Za-zА-Яа-яёЁЇїІіЄєҐґ]{1,100}$'),
    STATUS VARCHAR(20) NOT NULL
    -- Регулярний вираз: тільки букви, до 20 символів
    CHECK (STATUS ~ '^[A-Za-zА-Яа-я]{1,20}$')
);

CREATE TABLE BARISTA (
    BARISTA_ID INT PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL
    -- Регулярний вираз: тільки букви
    CHECK (NAME ~ '^[A-Za-zА-Яа-яёЁЇїІіЄєҐґ]{1,100}$'),
    LEVEL VARCHAR(20) NOT NULL
);

CREATE TABLE DRINK (
    DRINK_ID INT PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    TYPE VARCHAR(20) NOT NULL,
    PRICE DECIMAL(5, 2) NOT NULL
    CHECK (PRICE >= 0),
    VOLUME INT NOT NULL
    CHECK (VOLUME > 0),
    STRENGTH INT CHECK (STRENGTH >= 0),
    CLIENT_ID INT,
    BARISTA_ID INT,
    FOREIGN KEY (CLIENT_ID) REFERENCES CLIENT (CLIENT_ID),
    FOREIGN KEY (BARISTA_ID) REFERENCES BARISTA (BARISTA_ID)
);

CREATE TABLE INGREDIENT (
    INGREDIENT_ID INT PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    QUANTITY INT NOT NULL
    CHECK (QUANTITY > 0),
    CATEGORY VARCHAR(50),
    DRINK_ID INT,
    FOREIGN KEY (DRINK_ID) REFERENCES DRINK (DRINK_ID)
);

CREATE TABLE SYSTEM (
    SYSTEM_ID INT PRIMARY KEY,
    BARISTA_ID INT,
    FOREIGN KEY (BARISTA_ID) REFERENCES BARISTA (BARISTA_ID)
);