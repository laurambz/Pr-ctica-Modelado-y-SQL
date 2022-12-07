create schema practica_LMB authorization bqohjoyb;

create table practica_lmb.fleet_status(
	id_status varchar(20) not null,
	status varchar(50) not null,
	constraint fleet_status_PK primary key (id_status)
);

insert into practica_lmb.fleet_status
(id_status,status)
values('in','active');

insert into practica_lmb.fleet_status
(id_status,status)
values('out','inactive');

create table practica_lmb.c_colour(
	id_colour integer not null,
	colour varchar(50) not null,
	constraint c_colour_PK primary key (id_colour)
);

insert into practica_lmb.c_colour
(id_colour,colour)
values(01,'white');

insert into practica_lmb.c_colour
(id_colour,colour)
values(02,'black');

insert into practica_lmb.c_colour
(id_colour,colour)
values(03,'blue');

insert into practica_lmb.c_colour
(id_colour,colour)
values(04,'red');

create table practica_lmb.c_corporation(
	id_corporation integer not null,
	corporation varchar(50) not null,
	constraint c_corporation_PK primary key (id_corporation)
);

insert into practica_lmb.c_corporation
(id_corporation,corporation)
values(0001,'Corp_A');

insert into practica_lmb.c_corporation
(id_corporation,corporation)
values(0002,'Corp_B');

create table practica_lmb.c_brand(
	id_corporation integer not null,
	id_brand integer not null,
	brand varchar(50) not null,
	constraint c_brand_PK primary key (id_corporation,id_brand),
	constraint c_corporation_FK foreign key (id_corporation)
	references practica_lmb.c_corporation(id_corporation)
);

insert into practica_lmb.c_brand
(id_corporation,id_brand,brand)
values(0001,001,'brand_a1');

insert into practica_lmb.c_brand
(id_corporation,id_brand,brand)
values(0001,002,'brand_a2');

insert into practica_lmb.c_brand
(id_corporation,id_brand,brand)
values(0002,003,'brand_b1');

insert into practica_lmb.c_brand
(id_corporation,id_brand,brand)
values(0002,004,'brand_b2');


create table practica_lmb.c_model(
	id_corporation integer not null,
	id_brand integer not null,
	id_model integer not null,
	model varchar(50) not null,
	constraint c_model_PK primary key (id_corporation,id_brand,id_model),
	constraint c_brand_FK foreign key (id_corporation,id_brand)
	references practica_lmb.c_brand(id_corporation,id_brand)
);

insert into practica_lmb.c_model
(id_corporation,id_brand,id_model,model)
values(0001,001,01,'model_a11');

insert into practica_lmb.c_model
(id_corporation,id_brand,id_model,model)
values(0001,001,02,'model_a12');

insert into practica_lmb.c_model
(id_corporation,id_brand,id_model,model)
values(0001,002,03,'model_a21');

insert into practica_lmb.c_model
(id_corporation,id_brand,id_model,model)
values(0001,002,04,'model_a22');

insert into practica_lmb.c_model
(id_corporation,id_brand,id_model,model)
values(0002,003,05,'model_b11');

insert into practica_lmb.c_model
(id_corporation,id_brand,id_model,model)
values(0002,003,06,'model_b12');

insert into practica_lmb.c_model
(id_corporation,id_brand,id_model,model)
values(0002,004,07,'model_b21');

insert into practica_lmb.c_model
(id_corporation,id_brand,id_model,model)
values(0002,004,08,'model_b22');

create table practica_lmb.car(
	id_car integer not null,
	id_status varchar not null,
	id_corporation integer not null,
	id_brand integer not null,
	id_model integer not null,
	id_colour integer not null,
	car_plate varchar(50) not null,
	km_total numeric(10,2) not null,
	dt_purchase date not null,
	constraint car_PK primary key (id_car),
	constraint fleet_status_FK foreign key (id_status)
	references practica_lmb.fleet_status(id_status),
	constraint c_model_FK foreign key (id_corporation,id_brand,id_model)
	references practica_lmb.c_model(id_corporation,id_brand,id_model),
	constraint c_colour_FK foreign key (id_colour)
	references practica_lmb.c_colour(id_colour)	
);

insert into practica_lmb.car (id_car,id_status,id_corporation,id_brand,id_model,id_colour,car_plate,km_total,dt_purchase) values (0001,'in',0001,001,01,01,'0547QDE',155500,'2021-05-25');
insert into practica_lmb.car (id_car,id_status,id_corporation,id_brand,id_model,id_colour,car_plate,km_total,dt_purchase) values (0002,'in',0001,001,01,01,'1597WER',150300,'2021-04-26');
insert into practica_lmb.car (id_car,id_status,id_corporation,id_brand,id_model,id_colour,car_plate,km_total,dt_purchase) values (0003,'in',0001,002,03,01,'3579ERT',157500,'2021-03-27');
insert into practica_lmb.car (id_car,id_status,id_corporation,id_brand,id_model,id_colour,car_plate,km_total,dt_purchase) values (0004,'in',0001,002,04,01,'8521RTY',160500,'2021-05-20');
insert into practica_lmb.car (id_car,id_status,id_corporation,id_brand,id_model,id_colour,car_plate,km_total,dt_purchase) values (0005,'in',0002,003,05,01,'2589TYU',250357,'2020-10-18');
insert into practica_lmb.car (id_car,id_status,id_corporation,id_brand,id_model,id_colour,car_plate,km_total,dt_purchase) values (0006,'in',0002,003,06,02,'1256YUI',252230,'2020-04-01');
insert into practica_lmb.car (id_car,id_status,id_corporation,id_brand,id_model,id_colour,car_plate,km_total,dt_purchase) values (0007,'in',0002,004,07,01,'2547IOP',350620,'2019-06-30');
insert into practica_lmb.car (id_car,id_status,id_corporation,id_brand,id_model,id_colour,car_plate,km_total,dt_purchase) values (0008,'in',0002,004,08,03,'3652ASD',400250,'2018-06-15');
insert into practica_lmb.car (id_car,id_status,id_corporation,id_brand,id_model,id_colour,car_plate,km_total,dt_purchase) values (0009,'in',0001,001,01,01,'2145DFG',165231,'2021-04-01');
insert into practica_lmb.car (id_car,id_status,id_corporation,id_brand,id_model,id_colour,car_plate,km_total,dt_purchase) values (0010,'in',0001,001,02,01,'7458FGH',250700,'2020-03-01');
insert into practica_lmb.car (id_car,id_status,id_corporation,id_brand,id_model,id_colour,car_plate,km_total,dt_purchase) values (0011,'in',0001,002,03,04,'9856HJK',358500,'2019-02-01');
insert into practica_lmb.car (id_car,id_status,id_corporation,id_brand,id_model,id_colour,car_plate,km_total,dt_purchase) values (0012,'in',0001,002,03,01,'7856KLZ',365123,'2019-01-25');
insert into practica_lmb.car (id_car,id_status,id_corporation,id_brand,id_model,id_colour,car_plate,km_total,dt_purchase) values (0013,'out',0002,003,05,01,'6584ZXC',400120,'2018-12-01');
insert into practica_lmb.car (id_car,id_status,id_corporation,id_brand,id_model,id_colour,car_plate,km_total,dt_purchase) values (0014,'in',0002,003,06,01,'3265VBN',254666,'2020-11-01');
insert into practica_lmb.car (id_car,id_status,id_corporation,id_brand,id_model,id_colour,car_plate,km_total,dt_purchase) values (0015,'in',0002,004,07,01,'2154MNB',267698,'2022-10-01');


create table practica_lmb.t_currency(
	id_currency varchar(20) not null,
	currency varchar(50) not null,
	constraint c_currency_PK primary key (id_currency)
);

insert into practica_lmb.t_currency
(id_currency,currency)
values('EUR','euro');

insert into practica_lmb.t_currency
(id_currency,currency)
values('GBD','libra');

insert into practica_lmb.t_currency
(id_currency,currency)
values('USD','dolar');

create table practica_lmb.c_test(
	id_car integer not null,
	dt_test date not null,
	km_test numeric(10,2) not null,
	test_cost numeric(10,2) not null,
	id_currency varchar(20) not null,
	constraint c_test_PK primary key (id_car,dt_test),
	constraint car_FK foreign key (id_car)
	references practica_lmb.car(id_car),
	constraint t_currency_FK foreign key (id_currency)
	references practica_lmb.t_currency(id_currency)
);

insert into practica_lmb.c_test (id_car,dt_test,km_test,test_cost,id_currency) values (0001,'2022-05-25',5000,200,'EUR');
insert into practica_lmb.c_test (id_car,dt_test,km_test,test_cost,id_currency) values (0002,'2022-04-26',5000,200,'EUR');
insert into practica_lmb.c_test (id_car,dt_test,km_test,test_cost,id_currency) values (0003,'2022-03-27',5000,200,'EUR');
insert into practica_lmb.c_test (id_car,dt_test,km_test,test_cost,id_currency) values (0004,'2022-05-20',5000,200,'EUR');
insert into practica_lmb.c_test (id_car,dt_test,km_test,test_cost,id_currency) values (0005,'2021-10-18',5000,500,'EUR');
insert into practica_lmb.c_test (id_car,dt_test,km_test,test_cost,id_currency) values (0006,'2021-04-01',10000,171,'GBD');
insert into practica_lmb.c_test (id_car,dt_test,km_test,test_cost,id_currency) values (0007,'2020-06-30',5000,200,'EUR');
insert into practica_lmb.c_test (id_car,dt_test,km_test,test_cost,id_currency) values (0008,'2019-06-15',5000,500,'EUR');
insert into practica_lmb.c_test (id_car,dt_test,km_test,test_cost,id_currency) values (0009,'2022-04-01',5000,200,'EUR');
insert into practica_lmb.c_test (id_car,dt_test,km_test,test_cost,id_currency) values (0010,'2021-03-01',10000,200,'EUR');
insert into practica_lmb.c_test (id_car,dt_test,km_test,test_cost,id_currency) values (0011,'2020-02-01',5000,200,'EUR');
insert into practica_lmb.c_test (id_car,dt_test,km_test,test_cost,id_currency) values (0012,'2019-01-25',5000,200,'EUR');
insert into practica_lmb.c_test (id_car,dt_test,km_test,test_cost,id_currency) values (0013,'2019-12-01',5000,200,'EUR');
insert into practica_lmb.c_test (id_car,dt_test,km_test,test_cost,id_currency) values (0014,'2021-11-01',5000,200,'EUR');


create table practica_lmb.insurance_comp(
	id_insurance varchar(20) not null,
	insurance varchar(50) not null,
	constraint insurance_comp_PK primary key (id_insurance)
);

insert into practica_lmb.insurance_comp
(id_insurance,insurance)
values('01','axa seguros');

insert into practica_lmb.insurance_comp
(id_insurance,insurance)
values('02','allianz direct');

insert into practica_lmb.insurance_comp
(id_insurance,insurance)
values('03','reale seguros');


create table practica_lmb.insurance_comp_hist(
	id_car integer not null,
	dt_start_insurance date not null,
	dt_end_insurance date not null default '4000-01-01',
	reason varchar(200) null,
	id_insurance varchar(20) not null,
	policy_num varchar(50) not null,
	constraint insurance_comp_hist_PK primary key (id_car,dt_start_insurance),
	constraint car_FK foreign key (id_car)
	references practica_lmb.car(id_car),
	constraint insurance_comp_FK foreign key (id_insurance)
	references practica_lmb.insurance_comp(id_insurance)
);

insert into practica_lmb.insurance_comp_hist (id_car,dt_start_insurance,dt_end_insurance,reason,id_insurance,policy_num) values (0001,'2021-05-25','4000-01-01','','01','x123');				
insert into practica_lmb.insurance_comp_hist (id_car,dt_start_insurance,dt_end_insurance,reason,id_insurance,policy_num) values (0002,'2021-04-26','4000-01-01','','01','x111');				
insert into practica_lmb.insurance_comp_hist (id_car,dt_start_insurance,dt_end_insurance,reason,id_insurance,policy_num) values (0003,'2021-03-27','4000-01-01','','01','x102');				
insert into practica_lmb.insurance_comp_hist (id_car,dt_start_insurance,dt_end_insurance,reason,id_insurance,policy_num) values (0004,'2021-05-20','4000-01-01','','02','p111');				
insert into practica_lmb.insurance_comp_hist (id_car,dt_start_insurance,dt_end_insurance,reason,id_insurance,policy_num) values (0005,'2020-10-18','4000-01-01','','01','x104');				
insert into practica_lmb.insurance_comp_hist (id_car,dt_start_insurance,dt_end_insurance,reason,id_insurance,policy_num) values (0006,'2020-04-01','4000-01-01','','02','p102');				
insert into practica_lmb.insurance_comp_hist (id_car,dt_start_insurance,dt_end_insurance,reason,id_insurance,policy_num) values (0007,'2019-06-30','4000-01-01','','02','p105');				
insert into practica_lmb.insurance_comp_hist (id_car,dt_start_insurance,dt_end_insurance,reason,id_insurance,policy_num) values (0008,'2018-06-15','4000-01-01','','03','r444');				
insert into practica_lmb.insurance_comp_hist (id_car,dt_start_insurance,dt_end_insurance,reason,id_insurance,policy_num) values (0009,'2021-04-01','2022-03-31','change of insurance company','02','p106');				
insert into practica_lmb.insurance_comp_hist (id_car,dt_start_insurance,dt_end_insurance,reason,id_insurance,policy_num) values (0009,'2022-04-01','4000-01-01','','01','x125');				
insert into practica_lmb.insurance_comp_hist (id_car,dt_start_insurance,dt_end_insurance,reason,id_insurance,policy_num) values (0010,'2020-03-01','4000-01-01','','01','x126');				
insert into practica_lmb.insurance_comp_hist (id_car,dt_start_insurance,dt_end_insurance,reason,id_insurance,policy_num) values (0011,'2019-02-01','4000-01-01','','01','x126');				
insert into practica_lmb.insurance_comp_hist (id_car,dt_start_insurance,dt_end_insurance,reason,id_insurance,policy_num) values (0012,'2019-01-25','4000-01-01','','01','x128');				
insert into practica_lmb.insurance_comp_hist (id_car,dt_start_insurance,dt_end_insurance,reason,id_insurance,policy_num) values (0013,'2018-12-01','2022-12-01','deregistered','01','x129');				
insert into practica_lmb.insurance_comp_hist (id_car,dt_start_insurance,dt_end_insurance,reason,id_insurance,policy_num) values (0014,'2020-11-01','4000-01-01','','01','x150');				
insert into practica_lmb.insurance_comp_hist (id_car,dt_start_insurance,dt_end_insurance,reason,id_insurance,policy_num) values (0015,'2022-10-01','4000-01-01','','01','x100');				
