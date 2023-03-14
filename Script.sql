CREATE DATABASE USO_ETF;
USE USO_ETF;

CREATE TABLE
    stocks(
        stock_id INT AUTO_INCREMENT,
        name VARCHAR(250) UNIQUE,
        PRIMARY KEY (stock_id)
    );
    
INSERT INTO stocks (name)
VALUES ('United States Oil ETF'), ('Brent Crude Oil'), ('WTI Crude Oil'), ('Chevron Corp'), ('Dow Jones Industrial Average'), ('Petroleo Brasileiro SA Petrobras'), ('Shell PLC'),('SPX'),('TotalEnergies SE'),('USD to EUR exchange rate'),('US dollar index'), ('Exxon Mobil Corp');

##1
CREATE TABLE
    IF NOT EXISTS exxon_mobil(
        stock_id INT,
        Date DATE NOT NULL,
        XOM_Open FLOAT,
        XOM_High FLOAT,
        XOM_Low FLOAT,
        XOM_Close FLOAT,
        XOM_Adj_Close FLOAT,
        XOM_Volume FLOAT,
        Name VARCHAR(255),
        PRIMARY KEY (Date),
        FOREIGN KEY(stock_id) REFERENCES stocks(stock_id)
    );
    
UPDATE exxon_mobil e, stocks s
SET e.stock_id = s.stock_id
WHERE e.Name = s.name;

##2
CREATE TABLE
    IF NOT EXISTS bz_crude_oil(
        stock_id INT,
        Date DATE NOT NULL,
        BZ_Open FLOAT,
        BZ_High FLOAT,
        BZ_Low FLOAT,
        BZ_Close FLOAT,
        BZ_Volume FLOAT,
        Name VARCHAR(255),
        PRIMARY KEY (Date),
        FOREIGN KEY(stock_id) REFERENCES stocks(stock_id)
    );
    
UPDATE bz_crude_oil bz, stocks s
SET bz.stock_id = s.stock_id
WHERE bz.Name = s.name;

##3
CREATE TABLE
    IF NOT EXISTS cl_crude_oil(
        stock_id INT,
        Date DATE NOT NULL,
        CL_Open FLOAT,
        CL_High FLOAT,
        CL_Low FLOAT,
        CL_Close FLOAT,
        CL_Volume FLOAT,
        Name VARCHAR(255),
        PRIMARY KEY (Date),
        FOREIGN KEY(stock_id) REFERENCES stocks(stock_id)
    );
    
UPDATE cl_crude_oil cl, stocks s
SET cl.stock_id = s.stock_id
WHERE cl.Name = s.name;

select * from cl_crude_oil;

##4
CREATE TABLE
    IF NOT EXISTS chevron(
        stock_id INT,
        Date DATE NOT NULL,
        CVX_Open FLOAT,
        CVX_High FLOAT,
        CVX_Low FLOAT,
        CVX_Close FLOAT,
        CVX_Adj_Close FLOAT,
        CVX_Volume FLOAT,
        Name VARCHAR(255),
        PRIMARY KEY (Date),
        FOREIGN KEY(stock_id) REFERENCES stocks(stock_id)
    );
    
UPDATE chevron c, stocks s
SET c.stock_id = s.stock_id
WHERE c.Name = s.name;

##5
CREATE TABLE
    IF NOT EXISTS dow_jones(
        stock_id INT,
        Date DATE NOT NULL,
        DJIA_Open FLOAT,
        DJIA_High FLOAT,
        DJIA_Low FLOAT,
        DJIA_Close FLOAT,
        Name VARCHAR(255),
        PRIMARY KEY (Date),
        FOREIGN KEY(stock_id) REFERENCES stocks(stock_id)
    );
    
UPDATE dow_jones dj, stocks s
SET dj.stock_id = s.stock_id
WHERE dj.Name = s.name;

select * from dow_jones;

##6
CREATE TABLE
    IF NOT EXISTS petrobras(
        stock_id INT,
        Date DATE NOT NULL,
        PBR_Open FLOAT,
        PBR_High FLOAT,
        PBR_Low FLOAT,
        PBR_Close FLOAT,
        PBR_Adj_Close FLOAT,
        PBR_Volume FLOAT,
        Name VARCHAR(255),
        PRIMARY KEY (Date),
        FOREIGN KEY(stock_id) REFERENCES stocks(stock_id)
    );
    
UPDATE petrobras p, stocks s
SET p.stock_id = s.stock_id
WHERE p.Name = s.name;

##7
CREATE TABLE
    IF NOT EXISTS shell(
        stock_id INT,
        Date DATE NOT NULL,
        SHEL_Open FLOAT,
        SHEL_High FLOAT,
        SHEL_Low FLOAT,
        SHEL_Close FLOAT,
        SHEL_Adj_Close FLOAT,
        SHEL_Volume FLOAT,
        Name VARCHAR(255),
        PRIMARY KEY (Date),
        FOREIGN KEY(stock_id) REFERENCES stocks(stock_id)
    );
    
UPDATE shell sh, stocks s
SET sh.stock_id = s.stock_id
WHERE sh.Name = s.name;

##8
CREATE TABLE
    IF NOT EXISTS spx(
        stock_id INT,
        Date DATE NOT NULL,
        SPX_Open FLOAT,
        SPX_High FLOAT,
        SPX_Low FLOAT,
        SPX_Close FLOAT,
        Name VARCHAR(255),
        PRIMARY KEY (Date),
        FOREIGN KEY(stock_id) REFERENCES stocks(stock_id)
    );
    
UPDATE spx sp, stocks s
SET sp.stock_id = s.stock_id
WHERE sp.Name = s.name;

##9
CREATE TABLE
    IF NOT EXISTS total_energies(
        stock_id INT,
        Date DATE NOT NULL,
        TTE_Open FLOAT,
        TTE_High FLOAT,
        TTE_Low FLOAT,
        TTE_Close FLOAT,
        TTE_Adj_Close FLOAT,
        TTE_Volume FLOAT,
        Name VARCHAR(255),
        PRIMARY KEY (Date),
        FOREIGN KEY(stock_id) REFERENCES stocks(stock_id)
    );
    
UPDATE total_energies t, stocks s
SET t.stock_id = s.stock_id
WHERE t.Name = s.name;

##10
CREATE TABLE
    IF NOT EXISTS usd_eur(
        stock_id INT,
        Date DATE NOT NULL,
        USDEUR_Open FLOAT,
        USDEUR_High FLOAT,
        USDEUR_Low FLOAT,
        USDEUR_Close FLOAT,
        USDEUR_Adj_Close FLOAT,
        Name VARCHAR(255),
        PRIMARY KEY (Date),
        FOREIGN KEY(stock_id) REFERENCES stocks(stock_id)
    );
    
UPDATE usd_eur, stocks s
SET usd_eur.stock_id = s.stock_id
WHERE usd_eur.Name = s.name;

##11
CREATE TABLE
    IF NOT EXISTS usdi(
        stock_id INT,
        Date DATE NOT NULL,
        USDI_Price FLOAT,
        USDI_Open FLOAT,
        USDI_High FLOAT,
        USDI_Low FLOAT,
        Name VARCHAR(255),
        PRIMARY KEY (Date),
        FOREIGN KEY(stock_id) REFERENCES stocks(stock_id)
    );
    
UPDATE usdi, stocks s
SET usdi.stock_id = s.stock_id
WHERE usdi.Name = s.name;

##12
CREATE TABLE
    IF NOT EXISTS uso_etf(
        stock_id INT,
        Date DATE NOT NULL,
        USO_Open FLOAT,
        USO_High FLOAT,
        USO_Low FLOAT,
        USO_Close FLOAT,
        USO_Adj_Close FLOAT,
        USO_Volume FLOAT,
        Name VARCHAR(255),
        PRIMARY KEY (Date),
        FOREIGN KEY(stock_id) REFERENCES stocks(stock_id)
    );
    
UPDATE uso_etf u, stocks s
SET u.stock_id = s.stock_id
WHERE u.Name = s.name;

##QUERIES

#1. Add a new column USO_Open_Close_Diff (shows the difference between Open and Close Price of USO ETF)
ALTER TABLE uso_etf ADD COLUMN USO_Open_Close_Diff FLOAT;
UPDATE uso_etf SET USO_Open_Close_Diff = USO_Open - USO_Close;

#2. Select the maximum and minimum difference between Open and Close Price
SELECT MIN(USO_Open_Close_Diff) AS Min_Diff FROM uso_etf;
SELECT MAX(USO_Open_Close_Diff) AS Max_Diff FROM uso_etf;

#4. Find the average volume for each of the four securities:
SELECT 'XOM' AS Security, AVG(XOM_Volume) AS Avg_Volume
FROM exxon_mobil
UNION ALL
SELECT 'TTE' AS Security, AVG(TTE_Volume) AS Avg_Volume
FROM total_energies
UNION ALL
SELECT 'PBS' AS Security, AVG(PBR_Volume) AS Avg_Volume
FROM petrobras
UNION ALL
SELECT 'CVX' AS Security, AVG(CVX_Volume) AS Avg_Volume
FROM chevron
UNION ALL
SELECT 'SHEL' AS Security, AVG(SHEL_Volume) AS Avg_Volume
FROM shell;

#5.Find the dates when USO ETF had the highest closing price:
SELECT 
    Date,
    USO_Close
FROM uso_etf
WHERE USO_Close = (SELECT MAX(USO_Close) FROM uso_etf);

#6. Find the average adjusted closed price for USO for each year:
SELECT 
    YEAR(Date) AS Year,
    AVG(USO_Adj_Close) AS Avg_USO_Adj_Close
FROM uso_etf
GROUP BY YEAR(Date);

SELECT 
	exxon_mobil.Date, exxon_mobil.XOM_Open, exxon_mobil.XOM_Close, exxon_mobil.XOM_High, exxon_mobil.XOM_Low, exxon_mobil.XOM_Adj_Close, exxon_mobil.XOM_Volume,
    bz_crude_oil.BZ_Open, bz_crude_oil.BZ_Close, bz_crude_oil.BZ_High, bz_crude_oil.BZ_Low, bz_crude_oil.BZ_Volume,
    cl_crude_oil.CL_Open, cl_crude_oil.CL_Close, cl_crude_oil.CL_High, cl_crude_oil.CL_Low, cl_crude_oil.CL_Volume,
    chevron.CVX_Open, chevron.CVX_Close, chevron.CVX_High, chevron.CVX_Low, chevron.CVX_Adj_Close, chevron.CVX_Volume,
    dow_jones.DJIA_Open, dow_jones.DJIA_Close, dow_jones.DJIA_High, dow_jones.DJIA_Low,
    petrobras.PBR_Open, petrobras.PBR_Close, petrobras.PBR_High, petrobras.PBR_Low, petrobras.PBR_Adj_Close, petrobras.PBR_Volume,
    shell.SHEL_Open, shell.SHEL_Close, shell.SHEL_High, shell.SHEL_Low, shell.SHEL_Adj_Close, shell.SHEL_Volume,
    spx.SPX_Open, spx.SPX_Close, spx.SPX_High, spx.SPX_Low,
    total_energies.TTE_Open, total_energies.TTE_Close, total_energies.TTE_High, total_energies.TTE_Low, total_energies.TTE_Adj_Close, total_energies.TTE_Volume,
    usd_eur.USDEUR_Open, usd_eur.USDEUR_Close, usd_eur.USDEUR_High, usd_eur.USDEUR_Low, usd_eur.USDEUR_Adj_Close,
    usdi.USDI_Price, usdi.USDI_Open, usdi.USDI_High, usdi.USDI_Low,
    uso_etf.USO_Open, uso_etf.USO_Close, uso_etf.USO_High, uso_etf.USO_Low, uso_etf.USO_Adj_Close, uso_etf.USO_Volume
    FROM exxon_mobil
JOIN bz_crude_oil ON exxon_mobil.Date = bz_crude_oil.Date
JOIN cl_crude_oil ON exxon_mobil.Date = cl_crude_oil.Date
JOIN chevron ON exxon_mobil.Date = chevron.Date
JOIN dow_jones ON exxon_mobil.Date = dow_jones.Date
JOIN petrobras ON exxon_mobil.Date = petrobras.Date
JOIN shell ON exxon_mobil.Date = shell.Date
JOIN spx ON exxon_mobil.Date = spx.Date
JOIN total_energies ON exxon_mobil.Date = total_energies.Date
JOIN usd_eur ON exxon_mobil.Date = usd_eur.Date
JOIN usdi ON exxon_mobil.Date = usdi.Date
JOIN uso_etf ON exxon_mobil.Date = uso_etf.Date;


# select * from bz_crude_oil
#union all
#select * from cl_crude_oil
#union all
