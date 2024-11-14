CREATE TABLE CLIENT (
    CLIENT_ID INT PRIMARY KEY,
    CLIENT_NAME VARCHAR(100) NOT NULL,
    -- Регулярний вираз: тільки букви
    CHECK (CLIENT_NAME REGEXP '^[A-Za-zА-Яа-яёЁЇїІіЄєҐґ]{1,100}$'),
    CLIENT_STATUS VARCHAR(20) NOT NULL,
    -- Регулярний вираз: тільки букви, до 20 символів
    CHECK (CLIENT_STATUS REGEXP '^[A-Za-zА-Яа-я]{1,20}$')
);

CREATE TABLE BARISTA (
    BARISTA_ID INT PRIMARY KEY,
    BARISTA_NAME VARCHAR(100) NOT NULL,
    -- Регулярний вираз: тільки букви
    CHECK (BARISTA_NAME REGEXP '^[A-Za-zА-Яа-яёЁЇїІіЄєҐґ]{1,100}$'),
    EXPERIENCE_LEVEL VARCHAR(20) NOT NULL
);

CREATE TABLE DRINK (
    DRINK_ID INT PRIMARY KEY,
    DRINK_NAME VARCHAR(100) NOT NULL,
    DRINK_TYPE VARCHAR(20) NOT NULL,
    PRICE DECIMAL(5, 2) NOT NULL,
    CHECK (PRICE >= 0),
    VOLUME INT NOT NULL,
    CHECK (VOLUME > 0),
    STRENGTH INT,
    CHECK (STRENGTH >= 0),
    CLIENT_ID INT,
    BARISTA_ID INT,
    FOREIGN KEY (CLIENT_ID)
    REFERENCES CLIENT (CLIENT_ID),
    FOREIGN KEY (BARISTA_ID)
    REFERENCES BARISTA (BARISTA_ID)
);

CREATE TABLE INGREDIENT (
    INGREDIENT_ID INT PRIMARY KEY,
    INGREDIENT_NAME VARCHAR(100) NOT NULL,
    QUANTITY INT NOT NULL,
    CHECK (QUANTITY > 0),
    CATEGORY VARCHAR(50),
    DRINK_ID INT,
    FOREIGN KEY (DRINK_ID)
    REFERENCES DRINK (DRINK_ID)
);

-- Змінив 'SYSTEM' на 'SYSTEM_LOG' для уникнення використання зарезервованого слова
CREATE TABLE SYSTEM_LOG (
    SYSTEM_LOG_ID INT PRIMARY KEY,
    BARISTA_ID INT,
    FOREIGN KEY (BARISTA_ID)
    REFERENCES BARISTA (BARISTA_ID)
);
