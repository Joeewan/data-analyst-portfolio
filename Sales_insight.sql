-- ============================================
-- NFL Jersey Sales Analysis Project
-- Author: Joseph Ewan
-- Purpose: Analyze jersey sales performance by player, team, region, and time
-- ============================================

-- STEP 1: Create table 
CREATE TABLE nfl_jersey_sales (
    Sale_ID INT PRIMARY KEY,
    Player_Name VARCHAR(50),
    Team VARCHAR(50),
    Quantity_Sold INT,
    Price_Per_Jersey DECIMAL(6,2),
    Region VARCHAR(50),
    Sale_Date DATE
);

CREATE TABLE nfl_hat_sales (
    Sale_ID INT PRIMARY KEY,
    Team VARCHAR(50),
    Region VARCHAR(50),
    Quantity_Sold INT,
    Price_Per_Hat DECIMAL(10,2),
    Sale_Date DATE
);

-- STEP 2: Add Created data 
INSERT INTO nfl_jersey_sales
    (Sale_ID, Player_Name, Team, Quantity_Sold, Price_Per_Jersey, Region, Sale_Date)
VALUES
    (1, 'Patrick Mahomes', 'Kansas City Chiefs', 3, 129.99, 'Midwest', '2025-01-15'),
    (2, 'Lamar Jackson', 'Baltimore Ravens', 2, 119.99, 'Northeast', '2025-02-10'),
    (3, 'Josh Allen', 'Buffalo Bills', 2, 109.99, 'Northeast', '2025-03-05'),
    (4, 'Joe Burrow', 'Cincinnati Bengals', 4, 124.99, 'Midwest', '2025-03-20'),
    (5, 'Jalen Hurts', 'Philadelphia Eagles', 5, 129.99, 'East Coast', '2025-04-12'),
    (6, 'CeeDee Lamb', 'Dallas Cowboys', 4, 109.99, 'South', '2025-05-08'),
    (7, 'Justin Jefferson', 'Minnesota Vikings', 3, 124.99, 'Midwest', '2025-05-22'),
    (8, 'Tyreek Hill', 'Miami Dolphins', 3, 129.99, 'Southeast', '2025-06-12'),
    (9, 'Aaron Rodgers', 'Pittsburgh Steelers', 5, 134.99, 'Northeast', '2025-06-30'),
    (10, 'Dak Prescott', 'Dallas Cowboys', 3, 114.99, 'South', '2025-07-15'),
    (11, 'Travis Kelce', 'Kansas City Chiefs', 4, 129.99, 'Midwest', '2025-07-28'),
    (12, 'Micah Parsons', 'Green Bay Packers', 2, 119.99, 'Midwest', '2025-08-09'),
    (13, 'Brock Purdy', 'San Francisco 49ers', 5, 129.99, 'West Coast', '2025-08-14'),
    (14, 'Christian McCaffrey', 'San Francisco 49ers', 3, 134.99, 'West Coast', '2025-08-28'),
    (15, 'Trevor Lawrence', 'Jacksonville Jaguars', 4, 119.99, 'Southeast', '2025-09-21'),
    (16, 'CJ Stroud', 'Houston Texans', 5, 109.99, 'South', '2025-10-05'),
    (17, 'Justin Herbert', 'Los Angeles Chargers', 3, 129.99, 'West Coast', '2025-10-15'),
    (18, 'Puka Nacua', 'Los Angeles Rams', 4, 119.99, 'West Coast', '2025-11-01'),
    (19, 'Jared Verse', 'Los Angeles Rams', 2, 134.99, 'West Coast', '2025-11-20'),
    (20, 'Cooper Kupp', 'Seattle Seahawks', 3, 124.99, 'West Coast', '2025-11-28'),
    (21, 'DK Metcalf', 'Pittsburgh Steelers', 4, 129.99, 'Northeast', '2025-10-05'),
    (22, 'Geno Smith', 'Las Vegas Raiders', 2, 109.99, 'West Coast', '2025-12-10'),
    (23, 'Shedeur Sanders', 'Cleveland Browns', 3, 124.99, 'Midwest', '2025-12-18'),
    (24, 'Nick Cross', 'Indianapolis Colts', 2, 114.99, 'Midwest', '2025-12-22'),
    (25, 'Jonathan Taylor', 'Indianapolis Colts', 4, 124.99, 'Midwest', '2026-01-02'),
    (26, 'Stefon Diggs', 'New England Patriots', 5, 114.99, 'Northeast', '2026-01-08'),
    (27, 'Amon-Ra St. Brown', 'Detroit Lions', 4, 119.99, 'Midwest', '2026-01-12'),
    (28, 'Saquon Barkley', 'Philadelphia Eagles', 5, 129.99, 'East Coast', '2026-01-20'),
    (29, 'Bijan Robinson', 'Atlanta Falcons', 3, 114.99, 'Southeast', '2026-01-25'),
    (30, 'Jayden Daniels', 'Washington Commanders', 3, 109.99, 'East Coast', '2026-02-02');

INSERT INTO nfl_hat_sales (Sale_ID, Team, Region, Quantity_Sold, Price_Per_Hat, Sale_Date)

VALUES
(1, 'Chiefs', 'Midwest', 40, 24.99, '2024-07-15'),
(2, 'Packers', 'Midwest', 35, 22.99, '2024-07-15'),
(3, 'Seahawks', 'West', 25, 23.99, '2024-08-02'),
(4, 'Rams', 'West', 30, 21.99, '2024-08-03'),
(5, 'Cowboys', 'South', 38, 25.50, '2024-08-05'),
(6, 'Bengals', 'Midwest', 28, 21.99, '2024-08-10'),
(7, 'Browns', 'Midwest', 33, 23.50, '2024-08-12'),
(8, 'Colts', 'Midwest', 29, 22.75, '2024-08-15'),
(9, 'Patriots', 'Northeast', 32, 26.99, '2024-08-15'),
(10, 'Eagles', 'Northeast', 30, 25.49, '2024-08-20'),
(11, 'Bills', 'Northeast', 27, 23.50, '2024-08-22'),
(12, 'Raiders', 'West', 36, 24.75, '2024-08-25'),
(13, 'Steelers', 'Northeast', 31, 24.25, '2024-09-01'),
(14, 'Saints', 'South', 28, 23.99, '2024-09-05'),
(15, 'Dolphins', 'South', 34, 25.25, '2024-09-08');

-- ============================================
-- STEP 3: ANALYTICAL QUERIES
-- ============================================

-- 1️ View All Data
SELECT * 
FROM nfl_jersey_sales;

-- 2️ Total revenue per player
SELECT 
    Player_Name,
    Team,
    SUM(Quantity_Sold * Price_Per_Jersey) AS Total_Revenue
FROM nfl_jersey_sales
GROUP BY Player_Name, Team
ORDER BY Total_Revenue DESC;

-- 3️  Top-selling teams by total jersey revenue
SELECT 
    Team,
    SUM(Quantity_Sold * Price_Per_Jersey) AS Team_Revenue
FROM nfl_jersey_sales
GROUP BY Team
ORDER BY Team_Revenue DESC;

-- 4️ Regional performance: total sales and revenue by region
SELECT 
    Region,
    SUM(Quantity_Sold) AS Total_Jerseys_Sold,
    SUM(Quantity_Sold * Price_Per_Jersey) AS Total_Revenue
FROM nfl_jersey_sales
GROUP BY Region
ORDER BY Total_Revenue DESC;


-- 5 Top 5 players by total revenue
SELECT 
    Player_Name,
    Team,
    SUM(Quantity_Sold * Price_Per_Jersey) AS Total_Revenue
FROM nfl_jersey_sales
GROUP BY Player_Name, Team
ORDER BY Total_Revenue DESC
LIMIT 5;
