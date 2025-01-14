
--Tables Name
--( for comment cntr k+cntr c , for uncomment cntr k + cntr u ) 

create database test2;
use test2;
--DROP DATABASE test2;

--drop table employees, departments, job_history, locations, jobs, job_grades, company_mast, salesman, orders, customer, nobel_win, item_mast,emp_details,EmployeeInfo
--drop table EmployeePosition, EmployeeDetails, EmployeeSalary, testtable;

select * from salesman

create table employees(
employee_id int, first_name varchar(50), last_name varchar(50), email varchar(50),
phone_number varchar(50), hire_date date, job_id varchar(50), salary float, commission_pct float,
manager_id int, department_id int) ;

insert into employees(
employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary,
commission_pct, manager_id, department_id)
values(100  ,'Steven',        'King',          'SKING',    '515.123.4567' , '2003-06-17'  , 'AD_PRES',     24000.00,            0.00,          0, 90),
      (101  ,'Neena',         'Kochhar',       'NKOCHHAR',  '515.123.4568' ,       '2005-09-21'  , 'AD_VP',       17000.00,            0.00,        100, 90),
         (102  ,'Lex',           'De Haan',       'LDEHAAN',   '515.123.4569' ,       '2001-01-13'  , 'AD_VP',      17000.00,            0.00,        100, 90),
         (103  ,'Alexander',     'Hunold',        'AHUNOLD',   '590.423.4567',        '2006-01-03'  , 'IT_PROG',      9000.00,            0.00,       102, 60), 
         (104  ,'Bruce',         'Ernst',         'BERNST',    '590.423.4568',        '2007-05-21'  , 'IT_PROG',      6000.00,            0.00,         103, 60), 
         (105  ,'David',         'Austin',        'DAUSTIN',   '590.423.4569',        '2005-06-25'  , 'IT_PROG',      4800.00,            0.00,         103, 60), 
         (106  ,'Valli',         'Pataballa',     'VPATABAL',  '590.423.4560',        '2006-02-05'  , 'IT_PROG',      4800.00,            0.00,         103, 60), 
         (107  ,'Diana',         'Lorentz',       'DLORENTZ',  '590.423.5567',        '2007-02-07'  , 'IT_PROG',      4200.00,            0.00,        103, 60), 
         (108  ,'Nancy',         'Greenberg',     'NGREENBE',  '515.124.4569',        '2002-08-17'  , 'FI_MGR',      12008.00,            0.00,         101, 100), 
         (109  ,'Daniel',        'Faviet',        'DFAVIET',   '515.124.4169',        '2002-08-16'  , 'FI_ACCOUNT',   9000.00,            0.00,         108, 100), 
         (110  ,'John',          'Chen',          'JCHEN',     '515.124.4269',        '2005-09-28'  , 'FI_ACCOUNT',   8200.00,            0.00,         108, 100), 
         (111  ,'Ismael',        'Sciarra',       'ISCIARRA',  '515.124.4369',        '2005-09-30'  , 'FI_ACCOUNT',   7700.00,            0.00,         108, 100), 
         (112  ,'Jose Manuel',   'Urman',         'JMURMAN',   '515.124.4469',        '2006-03-07'  , 'FI_ACCOUNT',   7800.00,            0.00,         108, 100), 
         (113  ,'Luis',          'Popp',          'LPOPP',     '515.124.4567',        '2007-12-07'  , 'FI_ACCOUNT',   6900.00,            0.00,         108, 100), 
         (114  ,'Den',           'Raphaely',      'DRAPHEAL',  '515.127.4561',        '2002-12-07'  , 'PU_MAN',      11000.00,            0.00,         100, 30), 
         (115  ,'Alexander',     'Khoo',          'AKHOO',     '515.127.4562',        '2003-05-18'  , 'PU_CLERK',     3100.00,            0.00,         114, 30),
         (116  ,'Shelli',        'Baida',         'SBAIDA',    '515.127.4563',        '2005-12-24'  , 'PU_CLERK',    2900.00,          0.00,       114, 30),
         (117  ,'Sigal',         'Tobias',        'STOBIAS',   '515.127.4564',        '2005-07-24'  , 'PU_CLERK',     2800.00,            0.00,         114, 30),
         (118  ,'Guy',           'Himuro',        'GHIMURO',   '515.127.4565',        '2006-11-15'  , 'PU_CLERK',     2600.00,            0.00,        114, 30),
         (119  ,'Karen',         'Colmenares',    'KCOLMENA',  '515.127.4566',        '2007-08-10'  , 'PU_CLERK',     2500.00,            0.00,         114, 30),
         (120  ,'Matthew',       'Weiss',         'MWEISS',    '650.123.1234',        '2004-07-18'  , 'ST_MAN',       8000.00,            0.00,         100, 50),
         (121  ,'Adam',          'Fripp',         'AFRIPP',    '650.123.2234',        '2005-04-10'  , 'ST_MAN',       8200.00,            0.00,         100, 50),
         (122  ,'Payam',         'Kaufling',      'PKAUFLIN',  '650.123.3234',        '2003-05-01'  , 'ST_MAN',       7900.00,            0.00,         100, 50),
         (123  ,'Shanta',        'Vollman',       'SVOLLMAN',  '650.123.4234',       '2005-10-10' , 'ST_MAN',       6500.00,            0.00,        100, 50),
         (124  , 'Kevin',        'Mourgos',       'KMOURGOS',  '650.123.5234',        '2007-11-16'  , 'ST_MAN',       5800.00,            0.00,       100, 0),
         (125  , 'Julia',        'Nayer',         'JNAYER',    '650.124.1214',        '2005-07-16'  , 'ST_CLERK',     3200.00,            0.00,         120, 50),
         (126  , 'Irene',        'Mikkilineni',   'IMIKKILI',  '650.124.1224',        '2006-09-28'  , 'ST_CLERK',     2700.00,            0.00,         120,             50),
         (127  , 'James',        'Landry',        'JLANDRY',   '650.124.1334',        '2007-01-14'  , 'ST_CLERK',     2400.00,            0.00,         120,             50),
         (128  , 'Steven',       'Markle',        'SMARKLE',  '650.124.1434',       '2008-03-08'  , 'ST_CLERK',     2200.00,            0.00,         120,             50),
         (129  , 'Laura',         'Bissot',       'LBISSOT',   '650.124.5234' ,       '2005-08-20'  , 'ST_CLERK',     3300.00,            0.00,         121,             50),
         (130  , 'Mozhe',        'Atkinson',     'MATKINSO',  '650.124.6234',        '2005-10-30'  ,'ST_CLERK',     2800.00,            0.00,         121,             50),
         (131  ,'James',        'Marlow',       'JAMRLOW',  '650.124.7234',        '2005-02-16'  ,'ST_CLERK',     2500.00,            0.00,         121,             50),
         (132  ,'TJ',           'Olson',        'TJOLSON',  '650.124.8234',        '2007-04-10'  ,'ST_CLERK',    2100.00,            0.00,         121,             50),
         (133  ,'Jason',        'Mallin',       'JMALLIN',   '650.127.1934',        '2004-06-14'  ,'ST_CLERK',     3300.00,            0.00,         122,             50),
         (134  ,'Michael',      'Rogers',       'MROGERS',   '650.127.1834',        '2006-08-26'  ,'ST_CLERK',     2900.00,            0.00,         122,             50),
         (135  ,'Ki',           'Gee',          'KGEE',      '650.127.1734',        '2007-12-12'  ,'ST_CLERK',     2400.00,            0.00,         122,             50),
         (136  ,'Hazel',        'Philtanker',   'HPHILTAN',  '650.127.1634',        '2008-02-06'  ,'ST_CLERK',     2200.00,            0.00,         122,             50),
         (137  ,'Renske',       'Ladwig',       'RLADWIG',   '650.121.1234',        '2003-07-14'  ,'ST_CLERK',     3600.00,            0.00,         123,             50),
         (138  ,'Stephen',      'Stiles',       'SSTILES',   '650.121.2034',        '2005-10-26'  ,'ST_CLERK',     3200.00,            0.00,         123,            50),
         (139  ,'John',         'Seo',          'JSEO',      '650.121.2019',        '2006-02-12'  ,'ST_CLERK',     2700.00,            0.00,         123,            50),
         (140  ,'Joshua',       'Patel',        'JPATEL',    '650.121.1834',        '2006-04-06'  ,'ST_CLERK',     2500.00,            0.00,         123,            50),
         (141  ,'Trenna',       'Rajs',         'TRAJS',     '650.121.8009',        '2003-10-17'  ,'ST_CLERK',     3500.00,            0.00,         124,             50),
         (142  ,'Curtis',       'Davies',       'CDAVIES',   '650.121.2994',        '2005-01-29'  ,'ST_CLERK',     3100.00,            0.00,         124,             50),
         (143  ,'Randall',      'Matos',        'RMATOS',    '650.121.2874',        '2006-03-15'  ,'ST_CLERK',     2600.00,            0.00,         124,             50),
         (144  ,'Peter',        'Vargas',       'PVARGAS',   '650.121.2004',        '2006-07-09'  ,'ST_CLERK',     2500.00,            0.00,         124,             50),
         (145  ,'John',         'Russell',      'JRUSSEL',   '011.44.1344.429268',  '2004-10-01'  ,'SA_MAN',      14000.00,            0.40,         100,             80),
         (146  ,'Karen',        'Partners',     'KPARTNER',  '011.44.1344.467268',  '2005-01-05'  ,'SA_MAN',      13500.00,            0.30,         100,             80),
         (147  ,'Alberto',      'Errazuriz',    'AERRAZUR',  '011.44.1344.429278',  '2005-03-10'  ,'SA_MAN',      12000.00,            0.30,         100,            80),
         (148,  'Gerald',       'Cambrault',    'GCAMBRAU',  '011.44.1344.619268',  '2007-10-15'  ,'SA_MAN',      11000.00,            0.30,         100,             80),
         (149,  'Eleni',        'Zlotkey',      'EZLOTKEY',  '011.44.1344.429018',  '2008-01-29'  ,'SA_MAN',      10500.00,            0.20,         100,             80),
         (150,  'Peter',        'Tucker',       'PTUCKER',   '011.44.1344.129268',  '2005-01-30'  ,'SA_REP',      10000.00,            0.30,         145,             80),
         (151,  'David',        'Bernstein',    'DBERNSTE',  '011.44.1344.345268',  '2005-03-24'  ,'SA_REP',       9500.00,            0.25,         145,             80),
         (152,  'Peter',        'Hall',         'PHALL',     '011.44.1344.478968',  '2005-08-20'  ,'SA_REP',       9000.00,            0.25,         145,            80),
         (153,  'Christopher',  'Olsen',        'COLSEN',    '011.44.1344.498718',  '2006-03-30'  ,'SA_REP',       8000.00,            0.20,         145,             80),
         (154,  'Nanette',     'Cambrault',   'NCAMBRAU',  '011.44.1344.987668',  '2006-12-09'  ,'SA_REP',       7500.00,            0.20,         145,             80),
         (155,  'Oliver',      'Tuvault',      'OTUVAULT',  '011.44.1344.486508',  '2007-11-23'  ,'SA_REP',       7000.00,            0.15,         145,             80),
         (156,  'Janette',     'King',         'JKING',     '011.44.1345.429268',  '2004-01-30'  ,'SA_REP',      10000.00,            0.35,         146,             80),
         (157,  'Patrick',      'Sully',        'PSULLY',    '011.44.1345.929268',  '2004-03-04'  ,'SA_REP',       9500.00,            0.35,         146,             80),
         (158,  'Allan',        'McEwen',       'AMCEWEN',   '011.44.1345.829268',  '2004-08-01'  ,'SA_REP',       9000.00,            0.35,        146,             80),
         (159,  'Lindsey',      'Smith',        'LSMITH',    '011.44.1345.729268',  '2005-03-10'  ,'SA_REP',       8000.00,            0.30,         146,             80),
         (160,  'Louise',       'Doran',        'LDORAN',    '011.44.1345.629268',  '2005-12-15'  ,'SA_REP',       7500.00,            0.30,         146,             80),
         (161,  'Sarath',       'Sewall',       'SSEWALL',   '011.44.1345.529268',  '2006-11-03'  ,'SA_REP',       7000.00,            0.25,         146,             80),
         (162,  'Clara',        'Vishney',      'CVISHNEY',  '011.44.1346.129268',  '2005-11-11'  ,'SA_REP',      10500.00,            0.25,         147,             80),
         (163,  'Danielle',     'Greene',       'DGREENE',   '011.44.1346.229268',  '2007-03-19'  ,'SA_REP',       9500.00,            0.15,         147,             80),
         (164,  'Mattea',       'Marvins',      'MMARVINS',  '011.44.1346.329268',  '2008-01-24'  ,'SA_REP',       7200.00,            0.10,         147,             80),
         (165,  'David',        'Lee',          'DLEE',      '011.44.1346.529268',  '2008-02-23'  ,'SA_REP',       6800.00,            0.10,         147,             80),
         (166,  'Sundar',       'Ande',         'SANDE',     '011.44.1346.629268',  '2008-03-24'  ,'SA_REP',       6400.00,            0.10,         147,             80),
         (167,  'Amit',         'Banda',        'ABANDA',    '011.44.1346.729268',  '2008-04-21'  ,'SA_REP',       6200.00,            0.10,         147,             80),
         (168,  'Lisa',         'Ozer',         'LOZER',     '011.44.1343.929268',  '2005-03-11'  ,'SA_REP',      11500.00,            0.25,         148,             80),
         (169,  'Harrison',     'Bloom',        'HBLOOM',    '011.44.1343.829268',  '2006-03-23'  ,'SA_REP',      10000.00,            0.20,         148,             80),
         (170,  'Tayler',       'Fox',          'TFOX',      '011.44.1343.729268',  '2006-01-24'  ,'SA_REP',       9600.00,            0.20,         148,             80),
         (171,  'William',      'Smith',        'WSMITH',    '011.44.1343.629268',  '2007-02-23'  ,'SA_REP',       7400.00,            0.15,         148,             80),
         (172,  'Elizabeth',    'Bates',        'EBATES',    '011.44.1343.529268',  '2007-03-24'  ,'SA_REP',       7300.00,            0.15,         148,             80),
         (173,  'Sundita',      'Kumar',        'SKUMAR',    '011.44.1343.329268',  '2008-04-21'  ,'SA_REP',       6100.00,            0.10,         148,             80),
         (174,  'Ellen',        'Abel',         'EABEL',     '011.44.1644.429267',  '2004-05-11'  ,'SA_REP',      11000.00,            0.30,         149,             80),
         (175,  'Alyssa',       'Hutton',       'AHUTTON',   '011.44.1644.429266',  '2005-03-19'  ,'SA_REP',       8800.00,            0.25,         149,             80),
         (176,  'Jonathon',     'Taylor',       'JTAYLOR',   '011.44.1644.429265',  '2006-03-24'  ,'SA_REP',       8600.00,            0.20,         149,             80),
         (177,  'Jack',         'Livingston',   'JLIVINGS',  '011.44.1644.429264',  '2006-04-23'  ,'SA_REP',       8400.00,            0.20,         149,             80),
         (178, 'Kimberely',    'Grant',        'KGRANT',    '011.44.1644.429263', '2007-05-24'  ,'SA_REP',       7000.00,            0.15,         149,              0),
         (179,  'Charles',      'Johnson',      'CJOHNSON',  '011.44.1644.429262',  '2008-01-04'  ,'SA_REP',       6200.00,            0.10,         149,             80),
         (180, 'Winston',      'Taylor',       'WTAYLOR',   '650.507.9876',        '2006-01-24'  ,'SH_CLERK',     3200.00,            0.00,         120,             50),
         (181,  'Jean',         'Fleaur',       'JFLEAUR',   '650.507.9877',        '2006-02-23'  ,'SH_CLERK',     3100.00,            0.00,         120,             50),
         (182,  'Martha',       'Sullivan',     'MSULLIVA',  '650.507.9878',        '2007-06-21'  ,'SH_CLERK',     2500.00,            0.00,         120,             50),
         (183,  'Girard',       'Geoni',        'GGEONI',    '650.507.9879',        '2008-02-03'  ,'SH_CLERK',     2800.00,            0.00,         120,             50),
         (184,  'Nandita',      'Sarchand',     'NSARCHAN',  '650.509.1876',        '2004-01-27'  ,'SH_CLERK',     4200.00,            0.00,         121,             50),
         (185,  'Alexis',       'Bull',         'ABULL',     '650.509.2876',        '2005-02-20'  ,'SH_CLERK',     4100.00,            0.00,         121,             50),
         (186,  'Julia',        'Dellinger',    'JDELLING',  '650.509.3876',        '2006-06-24'  ,'SH_CLERK',     3400.00,            0.00,         121,            50),
         (187,  'Anthony',      'Cabrio',       'ACABRIO',   '650.509.4876',        '2007-02-07'  ,'SH_CLERK',     3000.00,            0.00,         121,             50),
         (188,  'Kelly',        'Chung',        'KCHUNG',    '650.505.1876',        '2005-06-14'  ,'SH_CLERK',     3800.00,           0.00,         122,             50),
         (189,  'Jennifer',     'Dilly',        'JDILLY',    '650.505.2876',        '2005-08-13'  ,'SH_CLERK',     3600.00,            0.00,         122,             50),
         (190,  'Timothy',      'Gates',        'TGATES',    '650.505.3876',        '2006-07-11'  ,'SH_CLERK',     2900.00,            0.00,         122,             50),
         (191,  'Randall',      'Perkins',      'RPERKINS',  '650.505.4876',        '2007-12-19'  ,'SH_CLERK',     2500.00,            0.00,         122,             50),
         (192,  'Sarah',        'Bell',         'SBELL',     '650.501.1876',        '2004-02-04'  ,'SH_CLERK',     4000.00,            0.00,         123,             50),
         (193,  'Britney',      'Everett',      'BEVERETT',  '650.501.2876',        '2005-03-03'  ,'SH_CLERK',     3900.00,            0.00,         123,             50),
         (194,  'Samuel',       'McCain',       'SMCCAIN',   '650.501.3876',        '2006-07-01'  ,'SH_CLERK',     3200.00,            0.00,         123,             50),
         (195,  'Vance',        'Jones',        'VJONES',    '650.501.4876',        '2007-03-17'  ,'SH_CLERK',     2800.00,            0.00,         123,             50),
         (196,  'Alana',        'Walsh',        'AWALSH',    '650.507.9811',        '2006-04-24'  ,'SH_CLERK',     3100.00,            0.00,         124,             50),
         (197,  'Kevin',        'Feeney',       'KFEENEY',   '650.507.9822',        '2006-05-23'  ,'SH_CLERK',     3000.00,            0.00,         124,             50),
         (198,  'Donald',       'OConnell',     'DOCONNEL',  '650.507.9833',        '2007-06-21'  ,'SH_CLERK',     2600.00,            0.00,         124,             50),
         (199,  'Douglas',      'Grant',        'DGRANT',    '650.507.9844',        '2008-01-13'  ,'SH_CLERK',     2600.00,            0.00,         124,             50),
         (200,  'Jennifer',     'Whalen',       'JWHALEN',   '515.123.4444',        '2003-09-17'  ,'AD_ASST',      4400.00,            0.00,         101,             10),
         (201,  'Michael',      'Hartstein',    'MHARTSTE',  '515.123.5555',        '2004-02-17' ,'MK_MAN',      13000.00,            0.00,         100,             20),
         (202,  'Pat',          'Fay',          'PFAY',      '603.123.6666',        '2005-08-17'  ,'MK_REP',       6000.00,            0.00,         201,             20),
         (203,  'Susan',        'Mavris',       'SMAVRIS',   '515.123.7777',        '2002-06-07'  ,'HR_REP',       6500.00,            0.00,        101,             40),
         (204,  'Hermann',      'Baer',         'HBAER',     '515.123.8888',        '2002-06-07'  ,'PR_REP',      10000.00,            0.00,         101,             70),
         (205,  'Shelley',      'Higgins',      'SHIGGINS',  '515.123.8080',        '2002-06-07'  ,'AC_MGR',      12008.00,            0.00,         101,            110),
         (206,  'William',      'Gietz',        'WGIETZ',    '515.123.8181',        '2002-06-07'  ,'AC_ACCOUNT',   8300.00,            0.00,         205,            110);
select * from employees;

create table departments( 
department_id int, department_name varchar(50), manager_id int, location_id int)

insert into departments(department_id, department_name, manager_id,location_id)
values(10, 'Administration' ,              200,         1700),
		(20,  'Marketing'   ,                 201,         1800),
		(30,  'Purchasing'  ,                 114,         1700),
		(40,  'Human Resources',              203,         2400), 
		(50,  'Shipping',                     121,         1500), 
		(60,  'IT',                           103,         1400), 
		(70,  'Public Relations',             204,         2700), 
		(80,  'Sales',                        145,         2500), 
		(90,  'Executive',                    100,         1700), 
		(100,  'Finance',                      108,         1700), 
		(110,  'Accounting',                   205,         1700), 
		(120,  'Treasury',                       0,         1700), 
		(130,  'Corporate Tax',                  0,         1700), 
		(140,  'Control And Credit',             0,         1700), 
		(150,  'Shareholder Services',           0,         1700), 
		(160,  'Benefits',                       0,         1700), 
		(170,  'Manufacturing',                  0,         1700), 
		(180,  'Construction',                   0,         1700), 
		(190,  'Contracting',                    0,         1700), 
		(200,  'Operations',                     0,         1700), 
		(210,  'IT Support',                     0,         1700), 
		(220,  'NOC',                            0,         1700), 
		(230,  'IT Helpdesk',                    0,         1700), 
		(240,  'Government Sales',               0,         1700), 
		(250,  'Retail Sales',                   0,         1700), 
		(260,  'Recruiting',                     0,         1700), 
		(270,  'Payroll',                        0,         1700);

select * from departments;


create table job_history(
employee_id int, start_date date, end_date date, job_id varchar(50), department_id int)

insert into job_history(employee_id, start_date, end_date, job_id, department_id) 
values( 102,  '2001-01-13',  '2006-07-24',  'IT_PROG',                60), 
        ( 101,  '1997-09-21',  '2001-10-27',  'AC_ACCOUNT',            110), 
         (101,  '2001-10-28', '2005-03-15',  'AC_MGR',                110), 
         (201,  '2004-02-17',  '2007-12-19',  'MK_REP',                 20), 
         (114,  '2006-03-24',  '2007-12-31',  'ST_CLERK',               50), 
         (122,  '2007-01-01',  '2007-12-31',  'ST_CLERK',               50), 
         (200,  '1995-09-17',  '2001-06-17',  'AD_ASST',                90), 
         (176,  '2006-03-24',  '2006-12-31',  'SA_REP',                 80), 
         (176,  '2007-01-01',  '2007-12-31',  'SA_MAN',                 80), 
         (200,  '2002-07-01',  '2006-12-31',  'AC_ACCOUNT',             90); 

select * from job_history;

create table locations( 
location_id int, street_address varchar(50), postal_code varchar(50), city varchar(50),
state_province varchar(50), country_id varchar(50))

insert into locations(location_id, street_address, postal_code, city, state_province, country_id)
values( 1000  ,'1297 Via Cola di Rie',                      '989'          ,'Roma',                    ' ',               'IT'),         
       ( 1100  ,'93091 Calle della Testa',                   '10934'        ,'Venice',                 ' ',                 'IT'),        
        (1200  ,'2017 Shinjuku-ku',                          '1689'         ,'Tokyo',                'Tokyo Prefecture',   'JP'),        
        (1300  ,'9450 Kamiya-cho',                           '6823'         ,'Hiroshima',             ' ',                  'JP'),        
        (1400  ,'2014 Jabberwocky Rd',                       '26192'        ,'Southlake',            'Texas'              ,'US'),        
        (1500  ,'2011 Interiors Blvd',                       '99236'        ,'South San Francisco',  'California'         ,'US'),         
        (1600  ,'2007 Zagora St',                            '50090'        ,'South Brunswick',      'New Jersey'         ,'US'),         
        (1700  ,'2004 Charade Rd',                           '98199'        ,'Seattle',              'Washington'         ,'US'),         
        (1800  ,'147 Spadina Ave',                           'M5V 2L7'      ,'Toronto',              'Ontario'            ,'CA'),         
        (1900  ,'6092 Boxwood St',                           'YSW 9T2'      ,'Whitehorse',           'Yukon'              ,'CA'),         
        (2000  ,'40-5-12 Laogianggen',                       '190518'       ,'Beijing',               '  '                ,'CN'),         
        (2100  ,'1298 Vileparle (E)',                        '490231'       ,'Bombay',               'Maharashtra'        ,'IN'),         
        (2200  ,'12-98 Victoria Street',                     '2901'         ,'Sydney',               'New South Wales'    ,'AU'),         
        (2300  ,'198 Clementi North',                        '540198'       ,'Singapore',             '  '                ,'SG'),         
        (2400  ,'8204 Arthur St',                            ' '           ,'London',                 '  '               ,'UK'),         
        (2500  ,'Magdalen Centre, The Oxford Science Park',  'OX9 9ZB'      ,'Oxford',               'Oxford'             ,'UK'),         
        (2600  ,'9702 Chester Road',                         '9629850293'   ,'Stretford',            'Manchester'         ,'UK'),         
        (2700  ,'Schwanthalerstr. 7031',                     '80925'        ,'Munich',               'Bavaria'            ,'DE'),         
        (2800  ,'Rua Frei Caneca 1360',                      '01307-002'    ,'Sao Paulo',            'Sao Paulo'          ,'BR'),         
        (2900  ,'20 Rue des Corps-Saints',                   '1730'         ,'Geneva',               'Geneve'             ,'CH'),         
        (3000  ,'Murtenstrasse 921',                         '3095'         ,'Bern',                 'BE'                 ,'CH'),         
        (3100  ,'Pieter Breughelstraat 837',                 '3029SK'       ,'Utrecht',              'Utrecht'            ,'NL'),         
        (3200  ,'Mariano Escobedo 9991',                     '11932'        ,'Mexico City',          'Distrito Federal'  ,'MX');
select * from locations;


create table jobs(
job_id varchar(50), job_title varchar(50), min_salary int, max_salary int) 

insert into jobs(job_id, job_title, min_salary, max_salary)
values('AD_PRES',     'President',                             20080,      40000) ,
 ('AD_VP',       'Administration Vice President',         15000,      30000 ),
 ('AD_ASST',     'Administration Assistant',               3000,        6000), 
 ('FI_MGR',      'Finance Manager',                        8200,       16000), 
 ('FI_ACCOUNT',  'Accountant',                             4200,        9000), 
 ('AC_MGR',      'Accounting Manager',                     8200,       16000), 
 ('AC_ACCOUNT',  'Public Accountant',                      4200,        9000), 
 ('SA_MAN',      'Sales Manager',                         10000,       20080), 
 ('SA_REP',      'Sales Representative',                   6000,       12008), 
 ('PU_MAN',      'Purchasing Manager',                     8000 ,      15000), 
 ('PU_CLERK',    'Purchasing Clerk',                       2500 ,       5500), 
 ('ST_MAN',      'Stock Manager',                          5500 ,       8500), 
 ('ST_CLERK',    'Stock Clerk',                            2008 ,       5000), 
 ('SH_CLERK',    'Shipping Clerk',                         2500 ,       5500), 
 ('IT_PROG',     'Programmer',                             4000 ,     10000), 
 ('MK_MAN',      'Marketing Manager',                      9000 ,      15000), 
 ('MK_REP',      'Marketing Representative',               4000 ,       9000), 
 ('HR_REP',      'Human Resources Representative',         4000 ,       9000), 
 ('PR_REP',      'Public Relations Representative',        4500 ,      10500);

select * from jobs;

create table job_grades(
grade_level char, lowest_sal int, highest_sal int)
insert into job_grades(grade_level, lowest_sal, highest_sal)
values('A',              1000,        2999),
		('B',              3000,        5999),
		('C',              6000,        9999),
		('D',             10000,       14999),
		('E',             15000,       24999),
		('F',             25000,       40000);
select * from job_grades;

create table company_mast(
com_id int, com_name varchar(20));
insert into company_mast(com_id, com_name)
values ( 11, 'Samsung'), (12, 'iBall'),(13, 'Epsion'),
       (14, 'Zebronics'),(15, 'Asus'),(16, 'Frontech');
select * from company_mast; 

create table salesman(
salesman_id int primary key, name varchar(50) not null, 
city varchar(50) not null, commission float );

insert into salesman(salesman_id, name, city, commission ) 
values(5001,'James Hoog', 'New York' ,0.15),
    (5002,'Nail Knite', 'Paris' ,0.13),
    (5005,'Pit Alex', 'London', 0.11),
    (5006,'Mc Lyon' , 'Paris' ,0.14),
    (5007,'Paul Adam' , 'Rome', 0.13),
    (5003,'Lauson Hen' ,'San Jose', 0.12);

select * from salesman;


create table orders(
ord_no int primary key, purch_amt float not null, 
ord_date date not null, customer_id int, salesman_id int );

insert into orders(ord_no, purch_amt, ord_date, customer_id ,salesman_id) 
values (70001, 150.5, '2012-10-05',  3005,  5002),
		(70009,270.65, '2012-09-10',  3001, 5005),
		(70002,65.26, '2012-10-05',  3002, 5001),
		(70004,110.5, '2012-08-17',  3009, 5003),
		(70007, 948.5, '2012-09-10',  3005, 5002),
		(70005, 2400.6, '2012-07-27',  3007, 5001),
		(70008,5760, '2012-09-10',  3002, 5001),
		(70010,1983.43, '2012-10-10', 3004,5006),
		(70003, 2480.4, '2012-10-10',  3009, 5003),
		(70012, 250.45, '2012-06-27',  3008, 5002),
		(70011, 75.29, '2012-08-17',  3003, 5007),
		(70013, 3045.6, '2012-04-25',  3002, 5001);

select * from orders order by ord_date ;

create table customer(
customer_id int primary key, cust_name varchar(50) not null, 
city varchar(50) not null, grade int, salesman_id int );

insert into customer(customer_id, cust_name, city, grade, salesman_id ) 
values( 3002 , 'Nick Rimando' ,'New York',100, 5001),
       ( 3007 , 'Brad Davis' ,'New York ',200 ,5001),
        (3005 , 'Graham Zusi' ,' California',200 , 5002),
        (3008 , 'Julian Green' ,'London ',300 , 5002),
        (3004 , 'Fabian Johnson',' Paris',300 ,5006),
        (3009 , 'Geoff Cameron',' Berlin ', 100 ,5003),
        (3003 , 'Jozy Altidor' ,'Moscow ',200 ,5007),
        (3001 , 'Brad Guzan' ,' London ', null , 5005);

select * from customer;


create table nobel_win(
YEAR int, SUBJECT varchar(50) not null, 
WINNER varchar(50) not null, COUNTRY varchar(50), CATEGORY varchar(50) );

insert into nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY ) 
values( 1970,'Physics', 'Hannes Alfven', 'Sweden', 'Scientist'),
	  (1970 ,'Physics', 'Louis Neel', 'France', 'Scientist'),
		(1970 ,'Chemistry', 'Luis Federico Leloir', 'France', 'Scientist'),
		(1970 ,'Physiology', 'Ulf von Euler', 'Sweden', 'Scientist'),
		(1970 ,'Physiology', 'Bernard Katz', 'Germany', 'Scientist'),
		(1970 ,'Literature', 'Aleksandr Solzhenitsyn', 'Russia', 'Linguist'),
		(1970 ,'Economics', 'Paul Samuelson', 'USA', 'Economist'),
		(1970 ,'Physiology', 'Julius Axelrod', 'USA', 'Scientist'),
		(1971 ,'Physics', 'Dennis Gabor', 'Hungary', 'Scientist'),
		(1971 ,'Chemistry', 'Gerhard Herzberg', 'Germany', 'Scientist'),
		(1971 ,'Peace', 'Willy Brandt', 'Germany', 'Chancellor'),
		(1971 ,'Literature', 'Pablo Neruda', 'Chile', 'Linguist'),
		(1971 ,'Economics', 'Simon Kuznets', 'Russia', 'Economist'),
		(1978 ,'Peace', 'Anwar al-Sadat', 'Egypt', 'President'),
		(1978 ,'Peace', 'Menachem Begin', 'Israel', 'Prime Minister'),
		(1987 ,'Chemistry', 'Donald J. Cram', 'USA', 'Scientist'),
		(1987 ,'Chemistry', 'Jean-Marie Lehn', 'France', 'Scientist'),
		(1987 ,'Physiology', 'Susumu Tonegawa', 'Japan', 'Scientist'),
		(1994 ,'Economics', 'Reinhard Selten', 'Germany', 'Economist'),
		(1994 ,'Peace', 'Yitzhak Rabin', 'Israel', 'Prime Minister'),
		(1987 ,'Physics', 'Johannes Georg Bednorz', 'Germany', 'Scientist'),
		(1987 ,'Literature', 'Joseph Brodsky', 'Russia', 'Linguist'),
		(1987 ,'Economics', 'Robert Solow', 'USA', 'Economist'),
		(1994 ,'Literature', 'Kenzaburo Oe', 'Japan', 'Linguist');

select * from nobel_win;



create table item_mast(
PRO_ID int primary key, PRO_NAME varchar(50) not null, 
PRO_PRICE float not null, PRO_COM int,);

insert into item_mast(PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM ) 
values( 101, 'Mother Board', 3200.00, 15),
    (102, 'Key Board', 450.00, 16),
    (103, 'ZIP drive', 250.00, 14),
    (104, 'Speaker', 550.00, 16),
    (105, 'Monitor', 5000.00, 11),
    (106, 'DVD drive', 900.00, 12),
    (107, 'CD drive', 800.00, 12),
    (108, 'Printer', 2600.00, 13),
    (109, 'Refill cartridge', 350.00, 13),
    (110, 'Mouse', 250.00, 12);

select * from item_mast;

create table emp_details(
EMP_IDNO int, EMP_FNAME varchar(50) not null, 
EMP_LNAME varchar(50) not null, EMP_DEPT int,);

insert into emp_details(EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT ) 
values(127323,'Michale', 'Robbin', 57),
   (526689, 'Carlos', 'Snares', 63),
   (843795 , 'Enric', 'Dosio', 57),
   (328717 , 'Jhon', 'Snares', 63),
   (444527 , 'Joseph', 'Dosni', 47),
   (659831 , 'Zanifer', 'Emily', 47),
   (847674 , 'Kuleswar', 'Sitaraman', 57),
   (748681 , 'Henrey', 'Gabriel', 47),
   (555935 , 'Alex', 'Manuel', 57),
   (539569 , 'George', 'Mardy', 27),
   (733843 , 'Mario', 'Saule', 63),
   (631548 , 'Alan', 'Snappy', 27),
   (839139 , 'Maria', 'Foster', 57);

select * from emp_details;


create table EmployeeInfo 
(EmpId int not null,
EmpFname varchar(50) not null,
EmpLname varchar(50) not null,
Department varchar(50) not null, 
Project varchar(50) not null, 
Address varchar(50) not null, 
DOB date, 
Gender varchar(50) not null);

EXEC sp_help EmployeeInfo;

insert into EmployeeInfo
(EmpId, EmpFname, EmpLname, Department, Project, Address, DOB, Gender)
values(1,'Sanjay', 'Mehra','HR','P1','Hyderabad(HYD)','01/12/1976','M'),
(2,'Ananya', 'Mishra','Admin','P2', 'Delhi(DEL)', '02/05/1968', 'F'),
(3,'Rohan','Diwan','Account','P3','Mumbai(BOM)','01/01/1980','M'),
(4,'Sonia','Kulkarni','HR','P1','Hyderabad(HYD)','02/05/1992','F'),
(5,'Ankit','Kapoor','Admin','P2','Delhi(DEL)','03/07/1994','M');

select * from EmployeeInfo;


create table EmployeePosition 
(EmpID int not null,
EmpPosition varchar(50) not null, 
DateOfJoining date, 
Salary int not null);

insert into EmployeePosition
(EmpID, EmpPosition, DateOfJoining, Salary)
values(1,'Manager','01/05/2022',500000),
(2,'Executive', '02/05/2022', 75000),
(3,'Manager','01/05/2022',90000),
(2,'Lead','02/05/2022',85000),
(1,'Executive','01/05/2022',300000);

select * from EmployeePosition;


CREATE table EmployeeDetails(
 EmpId int identity(121,100), 
 FullName char(25),
 ManagerId int,
 DateOfJoining date, 
 City char(25));

 insert into EmployeeDetails
 ( FullName, ManagerId,DateOfJoining, City)values('John Snow',321,'2014-01-31', 'Toronto'),
					('Walter White',986, '2015-01-30', 'California'),
					('Kuldeep Rana',876, '2016-11-27', 'New Delhi');

select * from EmployeeDetails;


CREATE table EmployeeSalary(
 EmpId int identity(121,100), 
 Project char(25),
 Salary int,
 Variable int);

 insert into EmployeeSalary ( Project, Salary, Variable)
 values('P1',8000,500 ),
	   ('P2',10000,1000 ),
	   ('P1',12000, 0);

select * from EmployeeDetails;
select * from EmployeeSalary;


create table testtable (col1 varchar(50)); 

insert into testtable(col1)
values('A001/DJ-402\44_/100/2015'),
	('001_\DJ-402\44_/100/2015'),
	('A001_DJ-402-2014-2015'),
	('A002_DJ-401-2014-2015'),
	('A001/DJ_401'),
	('A001/DJ_402\44'),
	('A001/DJ_402\44\2015'),
	('A001/DJ-402%45\2015/200'),
	('A001/DJ_402\45\2015%100'),
	('A001/DJ_402%45\2015/300'),
	('A001/DJ-402\44');
select * from testtable;

create table emp_department( 
dpt_code int, dpt_name varchar(50), dpt_allotment int);

insert into emp_department(dpt_code, dpt_name, dpt_allotment) 
values(57, 'IT', 65000),
      (63, 'Finance', 15000),
      (47, 'HR', 240000),
      (27, 'RD', 55000),
      (89, 'QC', 75000);





