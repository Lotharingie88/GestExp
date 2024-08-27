
DROP TABLE IF EXISTS "insemination";
CREATE TABLE IF NOT EXISTS "insemination" (
	"codins"	INTEGER UNIQUE,
	"insdate"	INTEGER,
	"extcheptel"	INTEGER,
	"nature"	INTEGER,
	PRIMARY KEY("codins" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "traite";
CREATE TABLE IF NOT EXISTS "traite" (
	"codtrait"	INTEGER UNIQUE,
	"litrage"	INTEGER,
	"traitdat"	INTEGER,
	"extcodchept"	INTEGER,
	PRIMARY KEY("codtrait" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "vente";
CREATE TABLE IF NOT EXISTS "vente" (
	"codvent"	INTEGER UNIQUE,
	"extchep2"	INTEGER,
	"ventdate"	INTEGER,
	"poids"	INTEGER,
	"prix"	INTEGER,
	"acheteur"	INTEGER,
	PRIMARY KEY("codvent" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "acheteur";
CREATE TABLE IF NOT EXISTS "acheteur" (
	"codach"	INTEGER UNIQUE,
	"nom"	TEXT,
	"ville"	TEXT,
	"metier"	INTEGER,
	"achtelephon"	INTEGER,
	PRIMARY KEY("codach" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "adress";
CREATE TABLE IF NOT EXISTS "adress" (
	"idadr"	INTEGER UNIQUE,
	"numer"	INTEGER,
	"rue"	TEXT,
	"cp"	TEXT,
	"ville"	TEXT,
	PRIMARY KEY("idadr")
);
DROP TABLE IF EXISTS "cheptel";
CREATE TABLE IF NOT EXISTS "cheptel" (
	"codchept"	INTEGER UNIQUE,
	"identification"	INTEGER,
	"nom"	TEXT,
	"extsex"	INTEGER,
	"extrace"	INTEGER,
	"naissance"	INTEGER,
	"entree"	INTEGER,
	"sortie"	INTEGER,
	"motsortie"	INTEGER,
	"mere"	TEXT,
	"pere"	TEXT,
	PRIMARY KEY("codchept" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "culture";
CREATE TABLE IF NOT EXISTS "culture" (
	"ccult"	INTEGER UNIQUE,
	"ncult"	TEXT,
	PRIMARY KEY("ccult" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "espece";
CREATE TABLE IF NOT EXISTS "espece" (
	"codesp"	INTEGER UNIQUE,
	"espnom"	TEXT,
	PRIMARY KEY("codesp" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "joursession";
CREATE TABLE IF NOT EXISTS "joursession" (
	"idsession"	TEXT UNIQUE,
	"iduser"	INTEGER,
	"debsess"	INTEGER,
	"finsess"	INTEGER,
	"datdebjours"	INTEGER,
	"datefinjours"	INTEGER,
	PRIMARY KEY("idsession")
);
DROP TABLE IF EXISTS "metier";
CREATE TABLE IF NOT EXISTS "metier" (
	"cmetier"	INTEGER UNIQUE,
	"metlib"	TEXT,
	"metabrev"	TEXT,
	PRIMARY KEY("cmetier" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "motsort";
CREATE TABLE IF NOT EXISTS "motsort" (
	"codsort"	INTEGER UNIQUE,
	"sotienom"	TEXT,
	"sortabrev"	TEXT,
	PRIMARY KEY("codsort" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "profil";
CREATE TABLE IF NOT EXISTS "profil" (
	"cprofil"	INTEGER,
	"profil"	TEXT
);
DROP TABLE IF EXISTS "race";
CREATE TABLE IF NOT EXISTS "race" (
	"corace"	INTEGER UNIQUE,
	"racnom"	TEXT,
	"extcodesp"	INTEGER,
	PRIMARY KEY("corace" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "session";
CREATE TABLE IF NOT EXISTS "session" (
	"idsession"	TEXT UNIQUE,
	"nom"	TEXT,
	"prenom"	TEXT,
	"limtime"	INTEGER,
	"datdeb"	INTEGER,
	PRIMARY KEY("idsession")
);
DROP TABLE IF EXISTS "sex";
CREATE TABLE IF NOT EXISTS "sex" (
	"cosex"	INTEGER UNIQUE,
	"sexnom"	TEXT,
	"sexabrev"	TEXT,
	PRIMARY KEY("cosex" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "soinsvet";
CREATE TABLE IF NOT EXISTS "soinsvet" (
	"codsoin"	INTEGER UNIQUE,
	"soinsdate"	INTEGER,
	"soinmotif"	TEXT,
	"extveto"	INTEGER,
	"medic"	TEXT,
	"duree"	INTEGER,
	PRIMARY KEY("codsoin" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "typcult";
CREATE TABLE IF NOT EXISTS "typcult" (
	"ctypcult"	INTEGER UNIQUE,
	"ntypcult"	TEXT,
	"ccult"	INTEGER,
	PRIMARY KEY("ctypcult" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "variete";
CREATE TABLE IF NOT EXISTS "variete" (
	"cvariet"	INTEGER UNIQUE,
	"nvariet"	TEXT,
	"ctypcult"	INTEGER,
	PRIMARY KEY("cvariet" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "veto";
CREATE TABLE IF NOT EXISTS "veto" (
	"codvet"	INTEGER UNIQUE,
	"nom"	TEXT,
	"ville"	TEXT,
	"telephon"	TEXT,
	PRIMARY KEY("codvet" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "typelevag";
CREATE TABLE IF NOT EXISTS "typelevag" (
	"ctypelev"	INTEGER UNIQUE,
	"libtypelev"	TEXT,
	PRIMARY KEY("ctypelev")
);
DROP TABLE IF EXISTS "typcultur";
CREATE TABLE IF NOT EXISTS "typcultur" (
	"ctypcult"	INTEGER UNIQUE,
	"libtypcult"	TEXT,
	PRIMARY KEY("ctypcult")
);
DROP TABLE IF EXISTS "utilisateur";
CREATE TABLE IF NOT EXISTS "utilisateur" (
	"iduser"	INTEGER UNIQUE,
	"nom"	TEXT,
	"prenom"	TEXT,
	"extadress"	INTEGER,
	"pwd"	TEXT,
	"telephone"	TEXT,
	"email"	INTEGER,
	"cactivite"	INTEGER,
	"cprofil"	INTEGER,
	"datdeb"	INTEGER,
	"datfin"	INTEGER,
	PRIMARY KEY("iduser" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "identexploit";
CREATE TABLE IF NOT EXISTS "identexploit" (
	"cident"	INTEGER UNIQUE,
	"identexploit"	INTEGER,
	"denomin"	TEXT,
	"superficie"	INTEGER,
	"elevage"	INTEGER,
	"culture"	INTEGER,
	"datmaj"	INTEGER,
	PRIMARY KEY("cident" AUTOINCREMENT)
);


