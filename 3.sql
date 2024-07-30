create table Roles 
(
  RoleId serial primary key,
  RoleName varchar(21) not null
);

create table Employees 
(
  EmployeeId serial primary key,
  EmployeeSurname varchar(15) not null,
  EmployeeName varchar(15) not null,
  EmployeePatronymic varchar(15) not null,
  EmployeeBirthdate date not null,
  EmployeeAddress varchar(100),
  EmployeePhoneNumber varchar(18),
  EmployeePost int references Roles (RoleId),
  EmployeeStatus varchar(15),
  EmployeeLogin varchar(45),
  EmployeePassword varchar(45)
);

create table Categories 
(
  CategoryId serial primary key,
  CategoryName varchar(25) not null
);

create table MaterialSamples 
(
    SampleId int serial primary key,
	SampleName varchar(45) not null	
)

create table JewelryMaterials
(
    MaterialId int serial primary key,
	MaterialName varchar(45) not null,
	MaterialSample int references MaterialSamples (SampleId)
)

create table Jewelries
(
  JewelryArticle text not null primary key,
  JewelryName varchar(45) not null,
  JewelryDescription varchar(255),
  JewelrySize numeric not null,
  JewelryWeight numeric not null,
  JewelryMaterial int references JewelryMaterials (MaterialId),
  JewelryImage bytea, -- Используйте тип bytea для изображений в PostgreSQL
  JewelryCategory int references Categories (CategoryId),
  JewerlyCost numeric not null,
  jewelryquantity int
);

create table Services 
(
  ServiceId serial primary key,
  ServiceName varchar(45),
  ServiceCost numeric
);

create table Clients
(
  ClientId serial primary key,
  ClientSurname varchar(15) not null,
  ClientName varchar(15) not null,
  ClientPatronymic varchar(15) not null,
  ClientEmail varchar(255),
  ClientPhoneNumber varchar(18)
);

create table Cheques
(
  ChequeId int serial primary key,
  EmployeeId int references Employees (EmployeeId),
  ChequeDate date not null
);

create table Receipts (
	ReceiptId int serial primary key,
	EmployeeId int references Employees (EmployeeId),
	ClientId int references Clients (ClientId),
	CategoryId int references Categories(CategoryId),
	MaterialId int references JewelryMaterials(MaterialId),
	ReceiptDate date not null,
	ReceiptDuration int not null,
	ReceiptStatus varchar(10) not null
)

create table JewelryTablePart
(
  JewelryTablePartId serial primary key,
  ChequeId int references Cheques (ChequeId),
  JewelryId int references Jewelries (JewelryId)
);

create table ServicesTablePart
(
  ServicesTablePartId serial primary key,
  ReceiptId int references Receipts (ReceiptId),
  ServiceId int references Services (ServiceId)
);