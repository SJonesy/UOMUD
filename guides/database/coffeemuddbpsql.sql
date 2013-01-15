CREATE TABLE CMVFS (
	CMFNAM varchar (255) NOT NULL,
	CMDTYP int NOT NULL,
	CMMODD bigint NOT NULL,
	CMWHOM varchar (50) NULL,
	CMDATA text NULL
);

ALTER TABLE CMVFS
	ADD PRIMARY KEY (CMFNAM);

CREATE TABLE CMCHAB (
	CMUSERID varchar(50) NOT NULL,
	CMABID varchar(50) NOT NULL ,
	CMABPF int NULL ,
	CMABTX text NULL
);

ALTER TABLE CMCHAB
	ADD PRIMARY KEY (CMUSERID,CMABID);

CREATE TABLE CMSTAT (
	CMSTRT bigint NOT NULL,
	CMENDT bigint NOT NULL,
	CMDATA text NULL
);

ALTER TABLE CMSTAT
	ADD PRIMARY KEY (CMSTRT);

CREATE TABLE CMPOLL (
	CMNAME varchar (100) ,
	CMBYNM varchar (100) NULL ,
	CMSUBJ varchar (255) NULL ,
	CMDESC text NULL ,
	CMOPTN text NULL ,
	CMFLAG int NULL ,
	CMQUAL varchar (255) NULL ,
	CMRESL text NULL,
	CMEXPI bigint NULL
);

ALTER TABLE CMPOLL
	ADD PRIMARY KEY (CMNAME);
	
	
CREATE TABLE CMCHAR (
	CMUSERID varchar(50) NOT NULL ,
	CMPASS varchar(50) NULL ,
	CMCLAS varchar(200) NULL ,
	CMSTRE int NULL ,
	CMRACE varchar(50) NULL ,
	CMDEXT int NULL ,
	CMCONS int NULL ,
	CMGEND varchar(50) NULL ,
	CMWISD int NULL ,
	CMINTE int NULL ,
	CMCHAR int NULL ,
	CMHITP int NULL ,
	CMLEVL varchar(50) NULL ,
	CMMANA int NULL ,
	CMMOVE int NULL ,
	CMDESC varchar(255) NULL ,
	CMALIG int NULL ,
	CMEXPE int NULL ,
	CMEXLV int NULL ,
	CMWORS varchar(50) NULL ,
	CMPRAC int NULL ,
	CMTRAI int NULL ,
	CMAGEH int NULL ,
	CMGOLD int NULL ,
	CMWIMP int NULL ,
	CMQUES int NULL ,
	CMROID varchar(100) NULL ,
	CMDATE varchar(50) NULL ,
	CMCHAN int NULL ,
	CMATTA int NULL ,
	CMAMOR int NULL ,
	CMDAMG int NULL ,
	CMBTMP int NULL ,
	CMLEIG varchar(50) NULL ,
	CMHEIT int NULL ,
	CMWEIT int NULL ,
	CMPRPT varchar(250) NULL,
	CMCOLR varchar(100) NULL,
	CMLSIP varchar(100) NULL,
	CMEMAL varchar(255) NULL,
	CMPFIL text NULL,
	CMSAVE varchar(150) NULL,
	CMMXML text NULL
);

ALTER TABLE CMCHAR
	ADD PRIMARY KEY (CMUSERID);

CREATE TABLE CMCHFO (
	CMUSERID varchar(50) NOT NULL ,
	CMFONM int NOT NULL ,
	CMFOID varchar(50) NULL ,
	CMFOTX text NULL ,
	CMFOLV int NULL ,
	CMFOAB int NULL 
);

ALTER TABLE CMCHFO
	ADD PRIMARY KEY (CMUSERID,CMFONM);

CREATE TABLE CMCHCL (
	CMUSERID varchar (50) NOT NULL ,
	CMCLAN varchar (100) NULL ,
	CMCLRO int NULL 
);

ALTER TABLE CMCHCL
	ADD PRIMARY KEY (CMUSERID,CMCLAN);

CREATE TABLE CMCHIT (
	CMUSERID varchar(50) NOT NULL ,
	CMITNM varchar(100) NOT NULL ,
	CMITID varchar(50) NULL ,
	CMITTX text NULL ,
	CMITLO varchar(100) NULL ,
	CMITWO int NULL ,
	CMITUR int NULL ,
	CMITLV int NULL ,
	CMITAB int NULL ,
	CMHEIT int NULL
);

ALTER TABLE CMCHIT
	ADD PRIMARY KEY (CMUSERID,CMITNM);

CREATE TABLE CMROCH (
	CMROID varchar(50) NOT NULL ,
	CMCHNM varchar(100) NOT NULL ,
	CMCHID varchar(50) NULL ,
	CMCHTX text NULL ,
	CMCHLV int NULL ,
	CMCHAB int NULL ,
	CMCHRE int NULL ,
	CMCHRI varchar(100) NULL
);

ALTER TABLE CMROCH 
	ADD PRIMARY KEY (CMROID,CMCHNM);

CREATE TABLE CMROEX (
	CMROID varchar(50) NOT NULL ,
	CMDIRE int NOT NULL ,
	CMEXID varchar(50) NULL ,
	CMEXTX text NULL ,
	CMNRID varchar(50) NULL 
);

ALTER TABLE CMROEX 
	ADD PRIMARY KEY (CMROID,CMDIRE);

CREATE TABLE CMROIT (
	CMROID varchar(50) NOT NULL ,
	CMITNM varchar(100) NOT NULL ,
	CMITID varchar(50) NULL ,
	CMITLO varchar(100) NULL ,
	CMITTX text NULL ,
	CMITRE int NULL ,
	CMITUR int NULL ,
	CMITLV int NULL ,
	CMITAB int NULL ,
	CMHEIT int NULL
);

ALTER TABLE CMROIT 
	ADD PRIMARY KEY (CMROID,CMITNM);

CREATE TABLE CMROOM (
	CMROID varchar(50) NOT NULL ,
	CMLOID varchar(50) NULL ,
	CMAREA varchar(50) NULL ,
	CMDESC1 varchar(255) NULL ,
	CMDESC2 text NULL ,
	CMROTX text NULL 
);

ALTER TABLE CMROOM 
	ADD PRIMARY KEY (CMROID);

CREATE TABLE CMQUESTS (
	CMQUESID varchar(50) NOT NULL ,
	CMQUTYPE varchar(50) NULL ,
	CMQSCRPT text NULL ,
	CMQWINNS text NULL
);

ALTER TABLE CMQUESTS 
	ADD PRIMARY KEY (CMQUESID);

CREATE TABLE CMAREA (
	CMAREA varchar(50) NOT NULL ,
	CMTYPE varchar(50) ,
	CMCLIM int NULL ,
	CMSUBS varchar(100) NULL ,
	CMDESC text NULL ,
	CMROTX text NULL ,
	CMTECH int NULL
);

ALTER TABLE CMAREA 
	ADD PRIMARY KEY (CMAREA);

CREATE TABLE CMJRNL (
	CMJKEY varchar(75) NOT NULL,
	CMJRNL varchar(50) NULL ,
	CMFROM varchar(50) NULL ,
	CMDATE varchar(50)  NULL ,
	CMTONM varchar(50) NULL ,
	CMSUBJ varchar(255) NULL ,
	CMPART varchar (75) NULL ,
	CMATTR int NULL,
	CMDATA varchar (255) NULL ,
	CMUPTM bigint NULL,
	CMIMGP varchar (50) NULL,
	CMVIEW int NULL,
	CMREPL int NULL,
	CMMSGT text NULL 
);

ALTER TABLE CMJRNL 
	ADD PRIMARY KEY (CMJKEY);

CREATE INDEX CMJRNLNAME on CMJRNL (CMJRNL);
CREATE INDEX CMJRNLCMPART on CMJRNL (CMPART);
CREATE INDEX CMJRNLCMTONM on CMJRNL (CMTONM);
CREATE INDEX CMJRNLCMUPTM on CMJRNL (CMUPTM);

CREATE TABLE CMCLAN (
	CMCLID varchar(100) NOT NULL,
	CMTYPE int ,
	CMDESC text NULL ,
	CMACPT varchar(255) NULL ,
	CMPOLI text NULL ,
	CMRCLL varchar(50) NULL ,
	CMDNAT varchar(50) NULL ,
	CMSTAT int NULL ,
	CMMORG varchar (50) NULL ,
	CMTROP int NULL
);

ALTER TABLE CMCLAN 
	ADD PRIMARY KEY (CMCLID);
	
CREATE TABLE CMPDAT (
	CMPLID varchar (100) ,
	CMSECT varchar (100) ,
	CMPKEY varchar (100) ,
	CMPDAT text NULL 
);

ALTER TABLE CMPDAT 
	ADD PRIMARY KEY (CMPLID,CMSECT,CMPKEY);

CREATE TABLE CMGRAC (
	CMRCID varchar (50) ,
	CMRDAT text NULL 
);

ALTER TABLE CMGRAC 
	ADD PRIMARY KEY (CMRCID);
	
CREATE TABLE CMCCAC (
	CMCCID varchar (50) ,
	CMCDAT text NULL 
);

ALTER TABLE CMCCAC 
	ADD PRIMARY KEY (CMCCID);

CREATE TABLE CMGAAC (
	CMGAID varchar (50) ,
	CMGAAT text NULL , 
	CMGACL varchar (50) NULL 
);

ALTER TABLE CMGAAC 
	ADD PRIMARY KEY (CMGAID);

CREATE TABLE CMACCT (
	CMANAM varchar (50) ,
	CMPASS varchar (50) ,
	CMCHRS text NULL ,
	CMAXML text NULL 
);

ALTER TABLE CMACCT 
	ADD PRIMARY KEY (CMANAM);
