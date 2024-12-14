-- 2.1 A --
CREATE DATABASE Telecom_Company;

USE Telecom_Company;
GO

-- 2.1 B --
CREATE PROCEDURE CreateAllTables

AS

    CREATE TABLE customer_profile(
    nationalID INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL, 
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    address VARCHAR(70) NOT NULL, 
    date_of_birth DATE
    )

    CREATE table customer_account(
    mobileNo CHAR(11) PRIMARY KEY,
    pass VARCHAR(50),
    balance decimal(10,1),
    account_type VARCHAR(50) CHECK(account_type = 'postpaid' or account_type = 'prepaid' or account_type = 'pay-as-you-go' ),
    start_date DATE NOT NULL,
    status VARCHAR(50) CHECK(status = 'active' or status = 'onhold'),
    points INT default 0,
    nationalID INT,
    FOREIGN KEY (nationalID) REFERENCES customer_profile (nationalID)
    )

    CREATE table Service_plan(
    planID INT IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price INT NOT NULL,
    SMS_offered INT NOT NULL,
    minutes_offered INT NOT NULL,
    data_offered INT NOT NULL,
    description VARCHAR(50)
    )

    CREATE table Subscription(
    mobileNo CHAR(11),
    planID INT,
    subscription_date DATE,
    status VARCHAR(50) CHECK(status='active' or status='onhold'),
    CONSTRAINT pk_subscription PRIMARY KEY (mobileNo,planID),
    FOREIGN KEY (mobileNo) REFERENCES customer_account (mobileNo),
    FOREIGN KEY (planID) REFERENCES Service_plan (planID)
    )

    CREATE table Plan_Usage(
    usageID INT IDENTITY PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    data_consumption INT,
    minutes_used INT,
    SMS_sent INT, 
    mobileNo CHAR(11), 
    planID INT,
    FOREIGN KEY (mobileNo) REFERENCES customer_account (mobileNo),
    FOREIGN KEY (planID) REFERENCES Service_plan (planID)
    )

    CREATE table Payment(
    paymentID INT IDENTITY PRIMARY KEY,
    amount decimal(10,1) NOT NULL,
    date_of_payment DATE NOT NULL,
    payment_method VARCHAR(50) CHECK(payment_method ='cash' or payment_method ='credit'),
    status VARCHAR(50) CHECK(status ='successful' or status='rejected' or status='pending'),
    mobileNo CHAR(11),
    FOREIGN KEY (mobileNo) REFERENCES customer_account (mobileNo)
    )

    CREATE table process_payment(
    paymentID INT,
    planID INT,
    FOREIGN KEY (paymentID) REFERENCES Payment (paymentID),
    FOREIGN KEY (planID) REFERENCES Service_plan (planID),

    remaining_amount as(dbo.function_remaining_amount(paymentID, planID)),
    extra_amount as (dbo.function_extra_amount(paymentID, planID)),

    CONSTRAINT pk_process_payment PRIMARY KEY (paymentID) 
    )

    CREATE table Wallet(
    walletID INT IDENTITY PRIMARY KEY,
    current_balance decimal(10,2) default 0,
    currency VARCHAR(50) default 'egp',
    last_modified_DATE DATE ,
    nationalID INT,
    mobileNo CHAR(11),
    FOREIGN KEY (nationalID) REFERENCES customer_profile (nationalID)
    )

    CREATE table transfer_money(
    walletID1 INT, 
    walletID2 INT, 
    transfer_id INT IDENTITY,
    amount decimal (10,2),
    transfer_DATE DATE, 
    CONSTRAINT pk_transfer_money PRIMARY KEY (walletID1,walletID2,transfer_id),
    FOREIGN KEY (walletID1) REFERENCES Wallet(walletID),
    FOREIGN KEY (walletID2) REFERENCES Wallet (walletID)
    )

    CREATE table Benefits (
    benefitID INT PRIMARY KEY IDENTITY, 
    description VARCHAR(50),
    validity_date DATE, 
    status VARCHAR (50) CHECK(status='active' or status ='expired'),
    mobileNo CHAR(11), 
    FOREIGN KEY (mobileNo) REFERENCES customer_account(mobileNo)
    )

    CREATE table points_group(
    pointId INT IDENTITY,
    benefitID INT, 
    pointsAmount INT,
    paymentId INT,
    FOREIGN KEY (paymentId) REFERENCES Payment(paymentID),
    FOREIGN KEY (benefitID) REFERENCES Benefits(benefitID),
    CONSTRAINT pk_points_group PRIMARY KEY (pointId,benefitId)
    )

    CREATE table Exclusive_offer (
    offerID INT IDENTITY, 
    benefitID INT, 
    INTernet_offered INT ,
    SMS_offered INT,
    minutes_offered INT,
    FOREIGN KEY (benefitID) REFERENCES Benefits(benefitID),
    CONSTRAINT pk_Exclusive_offer PRIMARY KEY (offerID,benefitId)
    )

    CREATE table Cashback(
    cashbackID INT IDENTITY, 
    benefitID INT, 
    walletID INT, 
    amount INT,
    credit_DATE DATE,
    FOREIGN KEY (benefitID) REFERENCES Benefits(benefitID),
    FOREIGN KEY (walletid) REFERENCES Wallet(walletid),
    CONSTRAINT pk_Cashback PRIMARY KEY (cashbackID,benefitId)
    )

    CREATE table plan_provides_benefits(
    benefitid INT, 
    planID INT, 
    FOREIGN KEY (benefitID) REFERENCES Benefits(benefitID),
    FOREIGN KEY (planID) REFERENCES service_plan(planID),
    CONSTRAINT pk_plan_provides_benefits PRIMARY KEY (planID,benefitId)
    )

    CREATE table shop (
    shopID INT IDENTITY PRIMARY KEY,
    name VARCHAR(50),
    CateGOry VARCHAR(50)
    )

    CREATE table Physical_shop (
    shopID INT PRIMARY KEY, 
    address VARCHAR(50),
    working_hours VARCHAR(50),
    FOREIGN KEY (shopID) REFERENCES shop(shopID),
    )

    CREATE table E_shop (
    shopID INT PRIMARY KEY , 
    URL VARCHAR(50) NOT NULL,
    rating INT,
    FOREIGN KEY (shopID) REFERENCES shop(shopID),
    )

    CREATE table Voucher (
    voucherID INT IDENTITY PRIMARY KEY,
    value INT,
    expiry_DATE DATE,
    points INT, 
    mobileNo CHAR(11),
    redeem_DATE DATE,
    shopid INT, 
    FOREIGN KEY (shopID) REFERENCES shop(shopID),
    FOREIGN KEY (mobileNo) REFERENCES customer_account(mobileNo)
    )

    CREATE table Technical_support_ticket (
    ticketID INT IDENTITY,
    mobileNo CHAR(11), 
    issue_description VARCHAR(50),
    priority_level INT,
    status VARCHAR(50) CHECK (status IN ('Open','In progress','Resolved'))
    FOREIGN KEY (mobileNo) REFERENCES customer_account(mobileNo),
    CONSTRAINT pk_Technical_support_ticket PRIMARY KEY (ticketID,mobileNo)
    )
GO

GO
CREATE FUNCTION function_remaining_amount
(@paymentId INT, @planId INT)
RETURNS INT
AS

Begin
    DECLARE @amount INT

    IF (SELECT payment.amount FROM payment WHERE payment.paymentid=@paymentId)  < (SELECT Service_plan.price FROM Service_plan
    WHERE Service_plan.planid=@planid)

        Set @amount =  (SELECT Service_plan.price FROM Service_plan WHERE Service_plan.planid=@planid) - (SELECT payment.amount FROM payment
        WHERE payment.paymentid=@paymentId)

    Else
        Set @amount = 0

    Return @amount
END
GO

GO
CREATE FUNCTION function_extra_amount
(@paymentId INT, @planId INT)
RETURNS INT
AS

Begin

    DECLARE @amount INT

    If (SELECT payment.amount FROM payment WHERE payment.paymentid=@paymentId)  > (SELECT Service_plan.price FROM Service_plan
    WHERE Service_plan.planid=@planid)

        Set @amount = (SELECT payment.amount FROM payment WHERE payment.paymentid=@paymentId) - (SELECT Service_plan.price FROM Service_plan WHERE Service_plan.planid=@planid)

    Else
        Set @amount = 0

    Return @amount

END
GO

EXEC CreateAllTables
GO

-- 2.1 C --
CREATE PROCEDURE DropAllTables
AS
	DROP TABLE IF EXISTS Transfer_money, Cashback, points_Group, 
    Exclusive_Offer, Plan_Provides_Benefits, Benefits, Subscription, 
    Plan_Usage, Process_Payment, Payment, Wallet, Voucher, 
    Technical_Support_Ticket, Customer_Account, Eshop, Physical_Shop,
    Service_Plan, Shop, Customer_profile;
GO

-- 2.1 D --
CREATE PROCEDURE dropAllProceduresFunctionsViews
AS
    -- DROP ALL PROCEDURES --
    DROP PROCEDURE IF EXISTS CREATEAllTables, dropAllTables, 
    clearAllTables, Account_Plan, Benefits_Account, Account_Payment_points,
    Total_points_Account, Unsubscribed_Plans, Ticket_Account_Customer, 
    Account_Highest_Voucher, Top_Successful_Payments, 
    Initiate_plan_payment, Payment_wallet_cashback, 
    Initiate_balance_payment, Redeem_voucher_points;

    -- DROP ALL FUNCTIONS --
    DROP FUNCTION IF EXISTS Calculate_Remaining_Amount, Calculate_Extra_Amount, Account_Plan_DATE, Account_Usage_Plan, 
    Account_SMS_Offers, Wallet_Cashback_Amount, Account_SMS_Offers, Wallet_Cashback_Amount, Wallet_Transfer_Amount,
    Wallet_MobileNo, AccountLoginValidation, Consumption, Usage_Plan_CurrentMonth, 
    Cashback_Wallet_Customer, Remaining_plan_amount, Extra_plan_amount, Subscribed_plans_5_Months

    -- DROP ALL VIEWS --
    DROP VIEW IF EXISTS allCustomerAccounts, allServicePlans, allBenefits, AccountPayments, allShops,
    allResolvedTickets, CustomerWallet, E_shopVouchers, PhysicalStoreVouchers, Num_of_cashback
GO

-- 2.1 E --
GO
CREATE PROCEDURE clearAllTables
AS
    DELETE FROM Transfer_money;
    DELETE FROM Cashback;
    DELETE FROM points_Group;
    DELETE FROM Exclusive_Offer;
    DELETE FROM Plan_Provides_Benefits;
    DELETE FROM Benefits;
    DELETE FROM Subscription;
    DELETE FROM Plan_Usage;
    DELETE FROM Process_Payment;
    DELETE FROM Payment;
    DELETE FROM Wallet;
    DELETE FROM Voucher;
    DELETE FROM Technical_Support_Ticket;
    DELETE FROM E_shop;
    DELETE FROM Physical_shop;
    DELETE FROM Service_Plan;
    DELETE FROM Shop;
    DELETE FROM Customer_Account;
    DELETE FROM Customer_profile;  
GO

----------------------------------------------------------------------------------------------------------------------------

-- 2.2 A --
CREATE VIEW allCustomerAccounts AS
    SELECT p.*,a.mobileNo,a.account_type,a.status,a.start_date,a.balance,a.points 
    FROM customer_profile p INNER JOIN customer_account a ON p.nationalID = a.nationalID
    WHERE a.status = 'active'
GO

-- 2.2 B --
CREATE VIEW allServicePlans AS
    SELECT *
    FROM Service_Plan
GO

-- 2.2 C --
CREATE VIEW allBenefits AS
    SELECT * 
    FROM Benefits
    WHERE status = 'active'
GO

-- 2.2 D --
CREATE VIEW AccountPayments AS
    SELECT * 
    FROM Payment
GO

-- 2.2 E --
CREATE VIEW allShops AS
    SELECT *
    FROM Shop
GO

-- 2.2 F --
CREATE VIEW allResolvedTickets AS
    SELECT * 
    FROM Technical_Support_Ticket
    WHERE Technical_Support_Ticket.status = 'Resolved'
GO

-- 2.2 G --
CREATE VIEW CustomerWallet AS
    SELECT W.*, CP.first_name, CP.last_name
    FROM Wallet W JOIN Customer_profile CP ON (cp.nationalID = w.nationalID)
GO

-- 2.2 H --
CREATE VIEW E_shopVouchers AS
    select e.*, v.voucherID,v.value FROM E_shop e
    INNER JOIN Voucher v
    ON e.shopID = v.shopid
GO

-- 2.2 I --
CREATE VIEW PhysicalStoreVouchers AS
    SELECT Physical_shop.*, Voucher.voucherID, Voucher.value
    FROM Physical_shop JOIN Voucher ON (Physical_shop.shopID = Voucher.shopID)
GO

-- 2.2 J --
CREATE VIEW Num_of_cashback AS
    SELECT walletID, count(*) AS 'count of transactions' FROM Cashback
    GROUP BY walletID
GO

----------------------------------------------------------------------------------------------------------------------------
-- 2.3 A --

CREATE PROCEDURE Account_Plan
AS
    SELECT A.*, P.* FROM Customer_Account A
    INNER JOIN Subscription S ON A.mobileNo = S.mobileNo
    INNER JOIN Service_Plan P ON P.planID = S.planID
GO

-- 2.3 B --
CREATE FUNCTION Account_Plan_Date
(@sub_DATE DATE, @plan_id INT)
RETURNS Table
AS
Return (
    Select customer_account.mobileNo, Service_plan.planID, Service_plan.name 
    FROM customer_account INNER JOIN Subscription ON customer_account.mobileNo = Subscription.mobileNo 
    INNER JOIN Service_plan ON Subscription.planID = Service_plan.planID
    WHERE Subscription.subscription_DATE = @sub_DATE AND Service_plan.planID = @plan_id
)
GO

-- 2.3 C --
CREATE FUNCTION Account_Usage_Plan
(@mobile_num CHAR(11), @start_date DATE)
RETURNS Table
AS
Return (
    Select Plan_Usage.planID, SUM(Plan_Usage.data_consumption) AS 'total data' , SUM(Plan_Usage.minutes_used) AS 'total mins', SUM(Plan_Usage.SMS_sent) AS 'total SMS'
    FROM Plan_Usage
    WHERE  Plan_Usage.mobileNo = @mobile_num and Plan_Usage.start_date >= @start_date
    GROUP BY Plan_Usage.planID
)
GO

-- 2.3 D --
CREATE PROCEDURE Benefits_Account
@mobile_num CHAR(11), @plan_id INT

AS
    UPDATE Benefits
    SET mobileNo = NULL
    FROM  Benefits B INNER JOIN plan_provides_benefits pb
    ON B.benefitID = pb.benefitid 
    WHERE B.mobileNo = @mobile_num AND pb.planID = @plan_id
GO

-- 2.3 E --
CREATE FUNCTION Account_SMS_Offers
(@mobile_num CHAR(11))
RETURNS TABLE
AS
Return (
    SELECT o.* FROM Exclusive_offer o INNER JOIN Benefits b ON o.benefitID = b.benefitID 
    WHERE b.mobileNo = @mobile_num AND o.SMS_offered > 0 
)
GO

-- 2.3 F --
CREATE PROCEDURE Account_Payment_points
@mobile_num CHAR(11)

AS
    SELECT count(p.paymentID) AS 'Count', sum(pb.pointsAmount) AS 'Sum' 
    FROM Payment P INNER JOIN points_group pb  ON p.paymentID = pb.paymentId
    WHERE P.mobileNo = @mobile_num AND (year(current_timestamp) - year(p.DATE_of_payment)=1 ) 
    and P.status = 'successful'
GO

-- 2.3 G --
GO
CREATE FUNCTION Wallet_Cashback_Amount
(@walletID INT, @planID INT)
RETURNS INT
AS
Begin
    DECLARE @amount INT

    SET @amount = (
        SELECT sum(c.amount) 
        FROM Cashback c INNER JOIN plan_provides_benefits pb ON c.benefitID = pb.benefitid
        WHERE c.walletID = @walletID AND pb.planID = @planID
    )

    return @amount
END
GO

-- 2.3 H --
CREATE FUNCTION Wallet_Transfer_Amount
(@walletID INT, @start_date DATE, @end_date DATE)
RETURNS INT
AS
Begin
    DECLARE @avg INT

    SET @avg = (
        SELECT avg(t.amount) FROM transfer_money t
        WHERE t.walletID1 = @walletID AND t.transfer_DATE BETWEEN @start_date AND @end_date
    )

    RETURN @avg
END
GO

-- 2.3 I --
CREATE FUNCTION Wallet_MobileNo
(@mobile_num CHAR(11))
RETURNS bit
AS
Begin
    DECLARE @output bit
    IF EXISTS ((Select w.walletID FROM Wallet w
    WHERE w.mobileNo = @mobile_num ))
    SET @output = 1
    ELSE 
    SET @output = 0

    RETURN @output
END
GO

-- 2.3 J --
GO
CREATE PROCEDURE Total_points_Account
@mobile_num CHAR(11)  

AS
    DECLARE @sum INT
    SELECT @sum =  sum(pg.pointsAmount) FROM points_group pg
    INNER JOIN Payment p
    ON pg.paymentId = p.paymentID
    WHERE p.mobileNo = @mobile_num

    UPDATE customer_account  
    SET points = @sum
    WHERE mobileNo = @mobile_num

    DELETE FROM points_group
    WHERE poINTId in  (SELECT pg.poINTId FROM points_group pg
    INNER JOIN Payment p ON pg.paymentId = p.paymentID
    WHERE p.mobileNo = @mobile_num)
GO

-----------------------------------------------------------------------------------------------------------

-- 2.4 A --
CREATE FUNCTION AccountLoginValidation
(@mobile_num CHAR(11), @pass VARCHAR(50))
RETURNS bit
AS
Begin
    DECLARE @output bit
    IF exists((Select a.mobileNo FROM customer_account a
    where a.mobileNo = @mobile_num and a.pass = @pass ))
    set @output = 1
    else 
    set @output = 0

    return @output
END
GO

-- 2.4 B --
CREATE FUNCTION Consumption
(@Plan_name VARCHAR(50), @start_date DATE, @end_date DATE)
RETURNS TABLE
AS
Return (
    SELECT p.data_consumption,p.minutes_used,p.SMS_sent FROM Plan_Usage p 
    INNER JOIN Service_plan s ON s.planID = p.planID
    WHERE s.name = @Plan_name AND p.start_date >= @start_date AND p.end_date <= @end_date
)
GO

-- 2.4 C --
CREATE PROCEDURE Unsubscribed_Plans
(
    @mobile_num CHAR(11)
)
AS
BEGIN
    SELECT SP.*
    FROM Service_Plan SP
    WHERE SP.planID NOT IN (
        SELECT S.planID
        FROM Subscription S
        WHERE S.mobileNo = @mobile_num
    );
END;
GO

-- 2.4 D --
CREATE FUNCTION Usage_Plan_CurrentMonth
(@mobile_num CHAR(11))
RETURNS Table
AS
Return (
    SELECT p.data_consumption, p.minutes_used, p.SMS_sent FROM Plan_Usage p
    INNER JOIN Subscription s 
    ON p.planID = s.planID and p.mobileNo = s.mobileNo
    WHERE p.mobileNo = @mobile_num and s.status = 'active' 
    and month(p.start_date)= month(current_timestamp) or month(p.end_date)= month(current_timestamp) 
    and year(p.start_date)= year(current_timestamp) or year(p.end_date)= year(current_timestamp)
)
GO

-- 2.4 E --
CREATE FUNCTION Cashback_Wallet_Customer
(@NID INT)
RETURNS Table
AS
Return (
    SELECT c.* FROM Cashback c 
    INNER JOIN Wallet w 
    ON c.walletID = w.walletID 
    WHERE w.nationalID = @NID
)
GO

-- 2.4 F --
CREATE PROCEDURE Ticket_Account_Customer
@NID INT 
AS
    SELECT count(t.ticketID) AS 'Total Unresolved Tickets' FROM Technical_support_ticket t
    INNER JOIN customer_account a 
    ON t.mobileNo = a.mobileNo
    WHERE t.status <> 'resolved' and a.nationalID = @NID
GO

-- 2.4 G --
CREATE PROCEDURE Account_Highest_Voucher
@mobile_num CHAR(11)  

AS
    DECLARE @max INT
    SELECT @max =  max(v.value) FROM Voucher v 
    WHERE v.mobileNo = @mobile_num 

    SELECT v.voucherID FROM voucher v
    WHERE v.mobileNo = @mobile_num and v.value = @max
GO

-- 2.4 H --
CREATE FUNCTION Remaining_plan_amount
(@mobile_num CHAR(11), @plan_name VARCHAR(50))
RETURNS INT
AS
Begin
    DECLARE @output INT, @plan_id INT, @payment_id INT
    SELECT @plan_id = s.planID, @payment_id= p.paymentID 
    FROM Service_plan s INNER JOIN process_payment pp on s.planID = pp.planID 
    INNER JOIN payment p on pp.paymentID = p.paymentID
    WHERE s.name = @plan_name and p.mobileNo = @mobile_num and p.status='successful'

    SET @output = dbo.function_remaining_amount(@payment_id,@plan_id)
    RETURN @output
END
GO

-- 2.4 I --
CREATE FUNCTION Extra_plan_amount
(@mobile_num CHAR(11), @plan_name VARCHAR(50))
RETURNS INT
AS
Begin
    DECLARE @output INT, @plan_id INT, @payment_id INT
    SELECT @plan_id = s.planID, @payment_id= p.paymentID 
    FROM Service_plan s INNER JOIN process_payment pp ON s.planID = pp.planID 
    INNER JOIN payment p ON pp.paymentID = p.paymentID
    WHERE s.name = @plan_name and p.mobileNo = @mobile_num and p.status='successful'

    SET @output = dbo.function_extra_amount(@payment_id,@plan_id)
    RETURN @output
END
GO

-- 2.4 J --
CREATE PROCEDURE Top_Successful_Payments
@mobile_num CHAR(11)  

AS
    SELECT TOP 10 p.* FROM Payment p 
    WHERE p.mobileNo = @mobile_num
    and p.status = 'successful'
    ORDER BY p.amount DESC
GO

-- 2.4 K --
CREATE FUNCTION Subscribed_plans_5_Months
(@MobileNo CHAR(11))
RETURNS Table
AS
Return(
    SELECT sp.* 
    FROM Service_plan sp INNER JOIN Subscription s ON sp.planID = s.planID
    WHERE s.mobileNo = @MobileNo and 
    s.subscription_DATE >= DATEADD(month,-5,CURRENT_TIMESTAMP)
)
GO

-- 2.4 L --
CREATE PROCEDURE Initiate_plan_payment
@mobile_num CHAR(11), @amount decimal(10,1), @payment_method VARCHAR(50),
@plan_id INT 

AS
    DECLARE @payment_id INT

    Insert INTO Payment (amount,DATE_of_payment,payment_method,status,mobileNo)
    VALUES(@amount,CURRENT_TIMESTAMP,@payment_method,'successful',@mobile_num)

    SELECT @payment_id = p.paymentID FROM Payment p    
    WHERE p.mobileNo = @mobile_num and p.amount = @amount and p.DATE_of_payment = CAST(CURRENT_TIMESTAMP AS DATE)
    and p.payment_method = @payment_method and p.status = 'successful'

    Insert INTO process_payment(paymentID, planID) values(@payment_id, @plan_id)
    if(select remaining_amount FROM process_payment where planID = @plan_id and paymentID = @payment_id) = 0 
    
    UPDATE Subscription
    set status = 'active'
    where planID = @plan_id and mobileNo = @mobile_num
    else
    
    UPDATE Subscription
    set status = 'onhold'
    where planID = @plan_id and mobileNo = @mobile_num
GO

-- 2.4 M --
CREATE PROCEDURE Payment_wallet_cashback
@mobile_num CHAR(11), @payment_id INT, @benefit_id INT 

AS
    DECLARE @amount INT, @cash_amount INT, @wallet_id INT 
    select @amount = p.amount  FROM Payment p
    where p.paymentID = @payment_id and p.status = 'successful'
    set @cash_amount = 0.1 * @amount
    select @wallet_id = w.walletID FROM Wallet w
    INNER JOIN customer_account a on
    w.nationalID = a.nationalID 
    where a.mobileNo = @mobile_num

    Insert INTo Cashback(benefitID,walletID,amount,credit_DATE)
    values(@benefit_id,@wallet_id,@cash_amount,current_timestamp)

    UPDATE Wallet
    set current_balance = current_balance + @cash_amount,
    last_modified_DATE = current_timestamp
    where walletID = @wallet_id
GO

-- 2.4 N --
CREATE PROCEDURE Initiate_balance_payment
@mobile_num CHAR(11), @amount decimal(10,1), @payment_method VARCHAR(50)

as
    Insert INTO Payment (amount,DATE_of_payment,payment_method,status,mobileNo)
    values(@amount,CURRENT_TIMESTAMP,@payment_method,'successful',@mobile_num)

    UPDATE customer_account
    set balance = balance + @amount
    where mobileNo = @mobile_num
GO

-- 2.4 O --
CREATE PROCEDURE [Redeem_voucher_points]
@mobile_num CHAR(11), @voucher_id INT 

AS
    If (Select v.points FROM Voucher v 
    where v.voucherID = @voucher_id and v.expiry_DATE >CURRENT_TIMESTAMP ) <= (Select a.points FROM customer_account a 
    where a.mobileNo = @mobile_num) 
    begin 
    DECLARE @voucher_points INT 
    select @voucher_points = points FROM Voucher
    where voucherID = @voucher_id
    UPDATE Voucher
    set mobileNo = @mobile_num , redeem_DATE = current_timestamp 
    where voucherID = @voucher_id 

    UPDATE customer_account
    set points = points - @voucher_points
    where mobileNo = @mobile_num
    end 
    else 
    prINT 'no enough points to redeem voucher'
GO

INSERT INTO customer_profile (nationalID, first_name, last_name, email, address, DATE_of_birth) VALUES 
(101, 'John', 'Doe', 'john.doe@example.com', '123 Elm St', '1990-05-15'),
(102, 'Jane', 'Smith', 'jane.smith@example.com', '456 Oak St', '1985-10-20'),
(103, 'Alice', 'Brown', 'alice.brown@example.com', '789 Pine St', '2000-03-30');

INSERT INTO customer_account (mobileNo, pass, balance, account_type, start_date, status, points, nationalID) VALUES 
('12345678901', 'password123', 150.5, 'postpaid', '2024-01-01', 'active', 100, 101),
('23456789012', 'securePass', 200.0, 'prepaid', '2023-06-15', 'active', 150, 102),
('34567890123', 'mypassword', 75.0, 'pay-as-you-GO', '2022-09-20', 'onhold', 50, 103);

SET IDENTITY_INSERT Service_Plan ON;
INSERT INTO Service_plan (planID, name, price, SMS_offered, minutes_offered, data_offered, description) VALUES 
(1, 'Basic Plan', 10, 100, 500, 5, 'Affordable basic plan'),
(2, 'Standard Plan', 20, 200, 1000, 10, 'Mid-tier plan with more benefits'),
(3, 'Premium Plan', 30, 500, 2000, 20, 'Comprehensive plan for heavy users');
SET IDENTITY_INSERT Service_Plan OFF;

INSERT INTO Subscription (mobileNo, planID, subscription_DATE, status) VALUES 
('12345678901', 1, '2024-01-10', 'active'),
('23456789012', 2, '2023-07-01', 'active'),
('34567890123', 3, '2022-10-05', 'onhold');

INSERT INTO Plan_Usage (start_date, end_date, data_consumption, minutes_used, SMS_sent, mobileNo, planID) VALUES 
('2024-01-01', '2024-01-31', 4.5, 400, 80, '12345678901', 1),
('2023-06-01', '2023-06-30', 9.0, 850, 150, '23456789012', 2),
('2022-09-01', '2022-09-30', 2.0, 300, 40, '34567890123', 3);

SET IDENTITY_INSERT Payment ON;
INSERT INTO Payment (paymentID, amount, DATE_of_payment, payment_method, status, mobileNo) VALUES 
(1, 50.0, '2024-01-15', 'Credit', 'Successful', '12345678901'),
(2, 100.0, '2023-06-20', 'Credit', 'Successful', '23456789012'),
(3, 20.0, '2022-09-25', 'Cash', 'Pending', '34567890123');
SET IDENTITY_INSERT Payment OFF;

SET IDENTITY_INSERT Wallet ON;
INSERT INTO Wallet (walletID, current_balance, currency, last_modified_DATE, nationalID, mobileNo) VALUES 
(1, 150.0, 'USD', '2024-01-20', 101, '12345678901'),
(2, 200.0, 'USD', '2023-07-15', 102, '23456789012'),
(3, 50.0, 'USD', '2022-10-10', 103, '34567890123');
SET IDENTITY_INSERT Wallet OFF;

SET IDENTITY_INSERT Benefits ON;
INSERT INTO Benefits (benefitID, description, validity_DATE, status, mobileNo) VALUES 
(1, 'Free 1GB data', '2024-12-31', 'active', '12345678901'),
(2, '100 free minutes', '2024-06-30', 'active', '23456789012'),
(3, '50 free SMS', '2024-03-31', 'expired', '34567890123');
SET IDENTITY_INSERT Benefits OFF;

INSERT INTO points_group (benefitID, pointsAmount, paymentId) VALUES 
(1, 10, 1),
(2, 15, 2),
(3, 5, 3);

INSERT INTO Exclusive_offer (benefitID, INTernet_offered, SMS_offered, minutes_offered) VALUES 
(1, 2, 50, 100),
(2, 5, 100, 200),
(3, 1, 20, 50);

INSERT INTO Cashback (benefitID, walletID, amount, credit_DATE) VALUES 
(1, 1, 5.0, '2024-01-15'),
(2, 2, 10.0, '2023-06-20'),
(3, 3, 2.0, '2022-09-25');

INSERT INTO plan_provides_benefits (benefitid, planID) VALUES 
(1, 1),
(2, 2),
(3, 3);

SET IDENTITY_INSERT Shop ON;
INSERT INTO shop (shopID, name, CateGOry) VALUES 
(1, 'Tech Hub', 'Electronics'),
(2, 'Fashion World', 'Clothing'),
(3, 'Book Haven', 'Books');
SET IDENTITY_INSERT Shop OFF;

INSERT INTO Physical_shop (shopID, address, working_hours) VALUES 
(1, '123 Main St', '9 AM - 9 PM'),
(2, '456 Fashion Ave', '10 AM - 8 PM'),
(3, '789 Library Ln', '8 AM - 6 PM');

INSERT INTO E_shop (shopID, URL, rating) VALUES 
(1, 'www.techhub.com', 4.5),
(2, 'www.fashionworld.com', 4.0),
(3, 'www.bookhaven.com', 4.8);

SET IDENTITY_INSERT Voucher ON;
INSERT INTO Voucher (voucherID, value, expiry_DATE, points, mobileNo, redeem_DATE, shopid) VALUES 
(1, 20, '2024-12-31', 100, '12345678901', '2024-01-15', 1),
(2, 50, '2024-06-30', 250, '23456789012', '2023-06-20', 2),
(3, 10, '2024-03-31', 50, '34567890123', '2022-09-25', 3);
SET IDENTITY_INSERT Voucher OFF;

SET IDENTITY_INSERT Technical_Support_Ticket ON;
INSERT INTO technical_support_ticket (ticketID, mobileNo, issue_description, priority_level, status) VALUES 
(1, '12345678901', 'Unable to access account', 1, 'Open'),
(2, '23456789012', 'Billing discrepancy for last month', 2, 'In Progress'),
(3, '34567890123', 'Poor network connectivity in area', 3, 'Resolved');
SET IDENTITY_INSERT Technical_Support_Ticket OFF;