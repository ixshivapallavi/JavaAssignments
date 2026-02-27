use Social;
CREATE TABLE Households (
    Id INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

Select * from Households;

INSERT INTO Households VALUES (1, 'SHIVA Family'),(2, 'Pallavi Family'),(3, 'Joyce Family');

CREATE TABLE Members (
    Id INT PRIMARY KEY,
    HouseholdId INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    IsHead BIT DEFAULT 0,
    StartDate DATE NOT NULL,
    EndDate DATE NULL,
    FOREIGN KEY (HouseholdId) REFERENCES Households(Id)
);


SELECT * FROM Members;
INSERT INTO Members VALUES (1, 1, 'Shiva', 1, '2022-01-01', NULL),(2, 1, 'Parvati', 0, '2022-01-01', NULL),(3, 2, 'Pallavi', 1, '2021-01-01', '2023-01-01'),
(4, 2, 'Sai', 1, '2023-01-02', NULL),(5, 3, 'Joyce', 0, '2022-05-01', NULL);


CREATE TABLE IncomeHistory (
    Id INT PRIMARY KEY,
    HouseholdId INT NOT NULL,
    IncomeAmount DECIMAL(12,2) NOT NULL,
    IncomeDate DATE NOT NULL,
    FOREIGN KEY (HouseholdId) REFERENCES Households(Id)
);

SELECT * FROM IncomeHistory;
INSERT INTO IncomeHistory VALUES (1, 1, 20000, '2023-01-01'),(2, 1, 25000, '2023-06-01'),(3, 2, 15000, '2023-01-01'),
(4, 2, 18000, '2023-06-01'),(5, 3, 50000, '2023-01-01');

CREATE TABLE Benefits (
    Id INT PRIMARY KEY,
    BenefitName VARCHAR(100) NOT NULL,
    IncomeLimit DECIMAL(12,2) NOT NUL
);

SELECT * FROM Benefits;
INSERT INTO Benefits VALUES (1, 'Food Support', 40000),(2, 'Medical Aid', 30000),(3, 'Housing Grant', 45000);

CREATE TABLE HouseholdBenefits (
    HouseholdId INT,
    BenefitId INT,
    StartDate DATE NOT NULL,
    EndDate DATE NULL,
    PRIMARY KEY (HouseholdId, BenefitId),
    FOREIGN KEY (HouseholdId) REFERENCES Households(Id),
    FOREIGN KEY (BenefitId) REFERENCES Benefits(Id)
);

SELECT * FROM HouseholdBenefits;
INSERT INTO HouseholdBenefits VALUES (1, 1, '2023-01-01', NULL),(2, 1, '2023-01-01', NULL),(2, 3, '2023-01-01', NULL),
(3, 2, '2023-01-01', NULL);

CREATE TABLE BenefitConflicts (
    Benefit1Id INT,
    Benefit2Id INT
);

SELECT * FROM BenefitConflicts;
INSERT INTO BenefitConflicts VALUES (1, 3),(3, 1);


CREATE TABLE Payments (
    Id INT PRIMARY KEY,
    HouseholdId INT NOT NULL,
    BenefitId INT NOT NULL,
    PaymentAmount DECIMAL(12,2) NOT NULL,
    PaymentDate DATE NOT NULL,
    FOREIGN KEY (HouseholdId) REFERENCES Households(Id),
    FOREIGN KEY (BenefitId) REFERENCES Benefits(Id)
);

SELECT * FROM Payments;
INSERT INTO Payments VALUES (1, 1, 1, 5000, '2023-02-01'),(2, 2, 1, 4000, '2023-03-01'),(3, 2, 3, 6000, '2023-04-01'),
(4, 3, 2, 7000, '2023-02-01');


SELECT HouseholdId, SUM(IncomeAmount) AS TotalIncome
FROM IncomeHistory
GROUP BY HouseholdId;



SELECT DISTINCT hb1.HouseholdId
FROM HouseholdBenefits hb1
JOIN HouseholdBenefits hb2
    ON hb1.HouseholdId = hb2.HouseholdId
JOIN BenefitConflicts bc
    ON hb1.BenefitId = bc.Benefit1Id
   AND hb2.BenefitId = bc.Benefit2Id
WHERE hb1.BenefitId <> hb2.BenefitId
  AND hb1.EndDate IS NULL
  AND hb2.EndDate IS NULL;


SELECT h.Id
FROM Households h
LEFT JOIN Members m
    ON h.Id = m.HouseholdId
   AND m.IsHead = 1
   AND m.EndDate IS NULL
WHERE m.Id IS NULL;


SELECT newHead.Id, newHead.Name, newHead.HouseholdId
FROM Members oldHead
JOIN Members newHead
    ON oldHead.HouseholdId = newHead.HouseholdId
WHERE oldHead.IsHead = 1
  AND newHead.IsHead = 1
  AND oldHead.EndDate IS NOT NULL
  AND newHead.StartDate > oldHead.EndDate;


SELECT p.HouseholdId, p.PaymentDate, p.PaymentAmount
FROM Payments p
JOIN Benefits b
    ON p.BenefitId = b.Id
JOIN (
    SELECT HouseholdId, SUM(IncomeAmount) AS TotalIncome
    FROM IncomeHistory
    GROUP BY HouseholdId
) inc
    ON inc.HouseholdId = p.HouseholdId
WHERE inc.TotalIncome > b.IncomeLimit;

select*from HouseholdBenefits;
select*from Households;
select*from Benefits;
select*from members;




