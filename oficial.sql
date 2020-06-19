DROP DATABASE audocao;
CREATE DATABASE audocao;
USE audocao;



/* CRIANDO AS TABELAS */
CREATE TABLE Humanos (
	nome VARCHAR(20) NOT NULL,
    sobrenome VARCHAR(40) NOT NULL,
    email VARCHAR(80) PRIMARY KEY,
    senha VARCHAR(10) NOT NULL,
    telefone VARCHAR(14) UNIQUE NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    datanascimento DATE NOT NULL,
    rendamensal DECIMAL(10,2) NOT NULL,
    cep VARCHAR(9) NOT NULL,
    nomerua VARCHAR(40) NOT NULL,
    numeromoradia INT NOT NULL,
    tipomoradia INT NOT NULL,
    nomemoradia VARCHAR(40),
    complemento VARCHAR(40)
);

CREATE TABLE Adotantes (
    email_adotante VARCHAR(80) PRIMARY KEY,
    FOREIGN KEY (email_adotante) REFERENCES Humanos(email)
);

CREATE TABLE Ajudantes (
    email_ajudante VARCHAR(80) PRIMARY KEY,
    FOREIGN KEY (email_ajudante) REFERENCES Humanos(email)
);

CREATE TABLE Moderadores (
    email_moderador VARCHAR(80) PRIMARY KEY,
    FOREIGN KEY (email_moderador) REFERENCES Humanos(email)
);

CREATE TABLE Contatos (
	id_contato INT PRIMARY KEY,
    motivo VARCHAR(40) NOT NULL,
    datainicio DATE NOT NULL,
    datafim DATE,
    relatorio VARCHAR(10000),
    moderador_email VARCHAR(80),
    adotante_email VARCHAR(80) NOT NULL,
    FOREIGN KEY (moderador_email) REFERENCES Moderadores(email_moderador),
    FOREIGN KEY (adotante_email) REFERENCES Adotantes(email_adotante),
    UNIQUE (datainicio,motivo,adotante_email)
);

CREATE TABLE Pets (
	id_pet INT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    idade INT,
    especie VARCHAR(20) NOT NULL,
    raca VARCHAR(20) NOT NULL,
    tamanho_cm INT NOT NULL,
    peso_gram INT NOT NULL,
    personalidade VARCHAR(1000),
    adaptabilidade VARCHAR(1000),
    disponibilidade INT NOT NULL,
    ajudante_email VARCHAR(80) NOT NULL,
    FOREIGN KEY (ajudante_email) REFERENCES Ajudantes(email_ajudante),
    UNIQUE (nome,idade,especie,raca,ajudante_email)
);

CREATE TABLE Fotopets (
	id_fotopet INT PRIMARY KEY,
    link VARCHAR(500),
    pet_id INT NOT NULL,
    FOREIGN KEY (pet_id) REFERENCES Pets(id_pet),
    UNIQUE (link,pet_id)
);

CREATE TABLE Adocoes (
	id_adocao INT PRIMARY KEY,
    datarequisicao DATE NOT NULL,
    dataadocao DATE,
    status INT NOT NULL,
    relatorio VARCHAR(10000),
    pet_id INT NOT NULL,
    moderador_email VARCHAR(80),
    adotante_email VARCHAR(80) NOT NULL,
    FOREIGN KEY (pet_id) REFERENCES Pets(id_pet),
    FOREIGN KEY (moderador_email) REFERENCES Moderadores(email_moderador),
    FOREIGN KEY (adotante_email) REFERENCES Adotantes(email_adotante),
    UNIQUE (datarequisicao,pet_id,adotante_email)
);
/* FIM CRIANDO TABELAS */



/* INICIO Humanos */
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Chester','Hardin','Fusce@nec.org','YfylNY9514','(29)96052-7094','282.403.392-43',DATE'1998-12-15',7786,'88887-146','Dexter R. Holland',6061,2,'Stephen Beck','apt 102');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Sage','Rios','egestas@velnisl.net','yuGSMY1353','(15)96713-3465','108.718.281-77',DATE'1992-01-22',1400,'14387-219','Venus Mccoy',5454,3,'','apt 704');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Benedict','Bartlett','mi.lacinia.mattis@dapibus.ca','INyoln3890','(76)98170-9518','100.024.100-13',DATE'1988-10-19',8944,'53139-216','Veronica Miller',3151,2,'','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Hayden','Cook','cursus.Nunc@a.net','glmfjn3017','(88)94977-9172','923.548.095-62',DATE'1984-03-19',14511,'45583-645','Tyrone Bruce',8554,1,'Jessica','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Geoffrey','Holman','malesuada@purus.com','EmOvJr3803','(57)94077-3490','650.785.635-05',DATE'1996-03-31',6319,'83502-380','Vance G. Franks',7628,3,'','apt 202');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Adrian','William','Suspendisse.aliquet.molestie@Fusce.org','UEpLbz6962','(79)97316-5113','126.319.399-87',DATE'1980-10-25',5925,'76802-073','Cathleen Rice',9319,2,'','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Debra','Cantrell','Phasellus.vitae@nibhenimgravida.org','KtvFXX9436','(25)91341-7557','918.214.297-33',DATE'1987-12-09',4868,'40453-046','Kathleen S. Griffin',9528,2,'Guy','apt 109');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Garth','Day','nunc.est.mollis@semperpretiumneque.edu','rSyFtU6494','(12)98672-2612','087.944.402-66',DATE'1986-12-01',18438,'15846-265','Cally Powell',8789,1,'','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Lana','Ford','ipsum.Suspendisse.sagittis@egestasSedpharetra.co.uk','IaYmKL4804','(99)93371-2359','840.529.400-03',DATE'1995-01-21',10671,'44080-199','Nora Foley',8807,1,'Aimee Hines','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Cailin','Mendoza','nec.tellus@purus.edu','PbZXEy4684','(78)98295-7945','491.085.095-66',DATE'1988-01-24',16352,'86057-877','Ocean H. Beasley',8815,1,'','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Blair','Burgess','egestas.Aliquam@egetipsum.co.uk','sIobXI4591','(42)99754-7315','127.469.892-88',DATE'1980-12-14',9017,'55200-389','Gillian Trujillo',816,3,'Burke','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Sandra','Garner','est@eget.net','rxIZki6995','(76)91446-0520','808.274.180-09',DATE'1997-01-17',9028,'21387-943','Akeem S. Flores',1964,1,'Simon','apt 604');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Alexander','Osborne','urna.Nunc@In.co.uk','EHKPGJ8521','(87)92657-4960','169.480.970-66',DATE'2000-12-03',7178,'20555-400','Hakeem H. Arnold',2382,1,'Lila','apt 304');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Cyrus','Adams','mus.Proin@Classaptenttaciti.edu','urOxkP9738','(43)92446-0021','428.315.609-81',DATE'1998-07-22',3747,'92446-364','Yuri Orr',7494,3,'Aline Rush','apt 602');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Brielle','Beck','habitant.morbi@ullamcorper.net','vKxfiz2942','(65)95606-6364','558.091.055-17',DATE'1995-08-02',17345,'25583-842','Hoyt Dickson',726,1,'','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Alea','Atkinson','at.augue@acsem.edu','HtkhRD1340','(28)94953-6606','533.646.111-85',DATE'1984-05-03',5892,'39056-881','Bethany C. Ayers',5568,2,'MacKenzie','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Faith','Hoover','magnis@tincidunt.com','ObSPiE7430','(85)98614-1937','863.254.733-77',DATE'1989-04-14',18933,'97684-999','Shannon Vasquez',914,2,'','apt 502');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Russell','English','mauris.sapien@Aenean.net','hTubgU6259','(25)91756-3661','314.937.363-87',DATE'1982-07-28',12579,'96560-279','Cassady Moreno',4405,1,'Emma','apt 903');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Samson','Daugherty','enim.Etiam.gravida@odioAliquamvulputate.co.uk','nfBvWi7662','(87)91059-6365','889.592.678-14',DATE'2000-09-16',4000,'47751-977','Kibo X. Whitehead',6913,2,'Basil','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Anjolie','Whitney','Quisque.varius@Nuncmauris.co.uk','UiKxsB9085','(23)98332-4179','139.591.206-63',DATE'1980-01-07',13890,'81663-439','Rosalyn Mathis',2524,1,'Ira','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Buffy','Ferrell','magna.Ut.tincidunt@sociis.ca','qrkOng3116','(16)90712-1681','271.872.483-28',DATE'1999-02-14',9896,'15466-094','Mia L. Leonard',1671,2,'Fulton','apt 702');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Kane','Shannon','augue.scelerisque.mollis@nullaIn.net','fNHWap5215','(59)92976-4693','664.586.039-44',DATE'1987-06-08',5055,'63447-993','Wallace Stanley',436,1,'Sybill Boone','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Mariam','Wynn','posuere.cubilia@sempercursus.co.uk','AdHrOY6690','(17)98772-9544','466.736.298-83',DATE'1985-06-03',8123,'49687-217','Jacqueline S. Cleveland',8674,2,'Morgan Aguilar','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Maggy','Decker','Suspendisse@In.com','uiOaOT7899','(61)96196-2061','648.889.511-44',DATE'1995-01-06',5613,'72387-466','Kieran S. Ramsey',8069,3,'','apt 701');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Irma','Estrada','ipsum.cursus.vestibulum@purus.edu','SpcNWM8784','(43)98694-2464','859.220.704-31',DATE'1996-06-28',6091,'65392-146','September Montoya',3793,3,'','apt 407');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Noelle','Hess','Integer@tristiqueac.co.uk','ReLBEh2234','(22)91883-5918','333.968.876-64',DATE'1988-01-28',1830,'77999-683','Kai Patterson',8194,1,'Iola','apt 508');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('James','Dunn','sed.libero@Morbiquisurna.co.uk','aJmYrR3859','(44)98705-4150','134.119.769-85',DATE'2000-07-16',5393,'83108-786','Meghan X. Crawford',2602,3,'','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Harlan','Moreno','sodales.nisi.magna@orci.com','nmQqnS9762','(34)92851-0389','234.884.220-55',DATE'1998-08-02',10581,'11144-493','Thaddeus O. Briggs',6144,2,'Barrett','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Kerry','Fitzgerald','ipsum.dolor@libero.org','Pasvtm1550','(22)93348-8336','427.131.137-87',DATE'1985-10-13',10081,'33091-608','Amy T. Holcomb',916,3,'','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Illiana','Vargas','felis@laciniaorciconsectetuer.co.uk','bWmobP6555','(98)97767-3680','981.396.228-49',DATE'1982-10-04',5877,'94373-058','Finn U. Burks',2304,1,'','apt 406');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Connor','Dillon','posuere@musAenean.co.uk','EljZms3415','(59)91449-9011','701.758.197-67',DATE'1999-03-28',9601,'13309-767','Hu C. Bell',2963,3,'Shaine','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Molly','Walter','Suspendisse@euismodin.net','fBwdrC5011','(38)95969-9913','375.598.233-19',DATE'1991-06-20',4887,'83682-698','Brendan A. Howell',2964,1,'','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Anika','Ellison','vitae@mitempor.org','POsZfK0827','(66)96331-9768','412.109.192-22',DATE'1984-05-28',9569,'19307-423','Thor Jones',4668,1,'','apt 807');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Joan','Lucas','ante.Vivamus@elementumat.co.uk','mwEGMA4182','(79)93232-5477','965.832.547-37',DATE'1987-08-01',2173,'91830-402','Lionel L. Bonner',1457,3,'Gabriel','apt 501');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Rajah','Vinson','elit@tellusjusto.org','jlgnOY5156','(83)92073-2759','949.730.950-93',DATE'1987-10-17',14865,'76611-299','Maryam Bishop',8045,3,'','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Jonah','Zamora','metus.sit@liberoettristique.edu','OfnzUp1867','(95)95449-0460','943.979.124-23',DATE'1994-11-24',19963,'98380-230','Jameson Walter',9519,1,'','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Randall','Conner','euismod.in@erat.com','NIzarQ0017','(49)94631-9417','475.233.440-24',DATE'1980-07-26',6288,'66533-268','Eaton W. Harrell',2033,1,'','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Ferris','Duran','Curabitur@nisiMauris.ca','GoQPZv6217','(14)97146-6641','337.878.634-76',DATE'1993-12-09',19724,'48883-135','Idona J. Howard',5015,1,'','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Yoshio','Ortiz','augue.ut@hymenaeosMauris.com','QTnLER2011','(24)99990-7066','815.479.347-51',DATE'1993-04-09',17068,'18557-155','Cullen Mcdonald',5435,3,'Grady','apt 707');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Shea','Woodard','pede.nec@pede.co.uk','AJvOpV3450','(69)90065-5025','880.227.068-41',DATE'1983-03-18',12348,'93461-633','Ria L. Morton',9209,1,'','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Porter','Saunders','vulputate.posuere@Proin.co.uk','HvxGkQ2286','(72)93006-5116','869.517.919-56',DATE'1981-06-25',3730,'76124-659','Zane S. Molina',6741,3,'Mannix','apt 801');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Jade','Hopkins','massa@augueSed.net','rJYlAg2896','(63)95178-0232','793.682.291-13',DATE'1987-05-22',2959,'96059-397','Craig Patterson',4737,1,'Mason','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Blaze','Kelly','eu@nisiAenean.ca','gFpZGH6826','(28)95153-2940','730.794.653-78',DATE'1997-07-25',11293,'20387-088','Adam Q. Morton',203,1,'','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Oprah','Delgado','orci.tincidunt.adipiscing@sedconsequatauctor.com','zqZBxk5147','(56)90130-2198','173.486.332-50',DATE'1989-11-14',7471,'70509-208','Nissim Rios',5183,3,'Xyla','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Armand','Hooper','tellus.sem.mollis@tristiquesenectus.ca','VpVXdx8001','(60)99366-5815','106.199.220-33',DATE'1988-12-11',18417,'44638-694','Mason C. Jordan',4229,2,'','apt 303');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Leo','Cunningham','eget@lorem.net','wPvnwI5567','(65)92471-3676','630.526.689-80',DATE'1987-10-10',6303,'59616-891','Brett M. Hale',3990,1,'','apt 209');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Xavier','Schwartz','et.rutrum.eu@ami.edu','LTclFW0927','(81)99541-0639','636.479.298-37',DATE'1981-01-30',17971,'15709-829','MacKensie Blevins',5071,2,'','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Guinevere','Martinez','Sed@justo.com','WjQDQm6489','(78)96046-7066','602.180.372-58',DATE'1986-02-28',11147,'82456-936','Harding Larson',544,2,'Morgan Hebert','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Keegan','Clements','nec.mauris.blandit@magna.ca','grlSqt1132','(69)93373-7866','822.134.989-67',DATE'1986-12-31',9110,'21369-927','Jemima C. Wood',8432,3,'Vladimir','apt 301');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Ila','Sherman','luctus.ut.pellentesque@sitametconsectetuer.com','MoHCEo1595','(52)98516-0323','878.511.383-63',DATE'1995-04-28',13682,'72840-075','Colin Barrera',7146,1,'','apt 209');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Thane','Ellis','quam.a@aliquetvelvulputate.ca','DUhEYk1626','(15)94375-9635','774.878.184-73',DATE'1984-12-15',15366,'62330-727','Lillith O. Leon',772,3,'Piper','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Willow','Marshall','enim.non.nisi@Ut.edu','umXjjS0263','(26)97494-2123','988.696.018-61',DATE'1997-01-30',14578,'87820-168','Roary J. Frazier',7048,2,'','apt 708');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Elijah','Sawyer','Morbi.vehicula.Pellentesque@risusvarius.org','UPYNGI0367','(69)92738-5633','392.132.806-93',DATE'1998-02-27',11566,'79144-845','Herman O. Giles',8827,1,'Christian','apt 709');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Kelsie','Dominguez','rutrum.justo.Praesent@scelerisqueneque.org','ihEzyC3706','(22)93032-8870','575.005.882-87',DATE'1993-11-04',15883,'39949-923','Tiger Stein',4960,1,'','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Shea','Mckee','risus.Donec.egestas@malesuadafringillaest.com','edsXRw6278','(60)96897-1541','147.683.105-96',DATE'1981-09-19',5986,'17625-834','Kessie T. Stephenson',9969,1,'','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Ulla','Haney','ligula.consectetuer@tempor.co.uk','bqMRvF3428','(65)99728-0405','736.220.463-78',DATE'1991-04-08',15207,'35468-886','Perry Andrews',7668,3,'','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Vance','Golden','Cras.convallis.convallis@pedeCras.net','MaLqyD6410','(19)96606-9871','953.487.498-86',DATE'1992-08-15',8996,'47742-870','Keane N. Hatfield',6335,1,'','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Hyatt','Lucas','amet.orci.Ut@taciti.co.uk','XIvbTz2843','(10)94630-6287','460.714.245-68',DATE'1998-06-15',19095,'90317-058','Hadassah J. Acevedo',2826,1,'','');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Constance','Humphrey','turpis@Sed.edu','IDBgWC6489','(57)96385-1763','183.289.951-20',DATE'1984-02-08',8834,'34191-146','Bradley Haley',1646,2,'Buckminster Watts','apt 107');
INSERT INTO Humanos (nome,sobrenome,email,senha,telefone,cpf,datanascimento,rendamensal,cep,nomerua,numeromoradia,tipomoradia,nomemoradia,complemento) VALUES ('Amos','Joseph','imperdiet@dictumeu.co.uk','hITtyS4762','(58)99354-9793','684.222.955-96',DATE'1988-12-10',3530,'79711-039','Chase M. Vance',3330,1,'Garth','apt 904');
/* FIM Humanos */



/* INICIO Adotantes */
INSERT INTO Adotantes (email_adotante) VALUES ('Fusce@nec.org');
INSERT INTO Adotantes (email_adotante) VALUES ('egestas@velnisl.net');
INSERT INTO Adotantes (email_adotante) VALUES ('mi.lacinia.mattis@dapibus.ca');
INSERT INTO Adotantes (email_adotante) VALUES ('cursus.Nunc@a.net');
INSERT INTO Adotantes (email_adotante) VALUES ('malesuada@purus.com');
INSERT INTO Adotantes (email_adotante) VALUES ('Suspendisse.aliquet.molestie@Fusce.org');
INSERT INTO Adotantes (email_adotante) VALUES ('Phasellus.vitae@nibhenimgravida.org');
INSERT INTO Adotantes (email_adotante) VALUES ('nunc.est.mollis@semperpretiumneque.edu');
INSERT INTO Adotantes (email_adotante) VALUES ('ipsum.Suspendisse.sagittis@egestasSedpharetra.co.uk');
INSERT INTO Adotantes (email_adotante) VALUES ('nec.tellus@purus.edu');
INSERT INTO Adotantes (email_adotante) VALUES ('egestas.Aliquam@egetipsum.co.uk');
INSERT INTO Adotantes (email_adotante) VALUES ('est@eget.net');
INSERT INTO Adotantes (email_adotante) VALUES ('urna.Nunc@In.co.uk');
INSERT INTO Adotantes (email_adotante) VALUES ('mus.Proin@Classaptenttaciti.edu');
INSERT INTO Adotantes (email_adotante) VALUES ('habitant.morbi@ullamcorper.net');
INSERT INTO Adotantes (email_adotante) VALUES ('at.augue@acsem.edu');
INSERT INTO Adotantes (email_adotante) VALUES ('magnis@tincidunt.com');
INSERT INTO Adotantes (email_adotante) VALUES ('mauris.sapien@Aenean.net');
INSERT INTO Adotantes (email_adotante) VALUES ('enim.Etiam.gravida@odioAliquamvulputate.co.uk');
INSERT INTO Adotantes (email_adotante) VALUES ('Quisque.varius@Nuncmauris.co.uk');
/* FIM Adotantes */



/* INICIO Ajudantes */
INSERT INTO Ajudantes (email_ajudante) VALUES ('magna.Ut.tincidunt@sociis.ca');
INSERT INTO Ajudantes (email_ajudante) VALUES ('augue.scelerisque.mollis@nullaIn.net');
INSERT INTO Ajudantes (email_ajudante) VALUES ('posuere.cubilia@sempercursus.co.uk');
INSERT INTO Ajudantes (email_ajudante) VALUES ('Suspendisse@In.com');
INSERT INTO Ajudantes (email_ajudante) VALUES ('ipsum.cursus.vestibulum@purus.edu');
INSERT INTO Ajudantes (email_ajudante) VALUES ('Integer@tristiqueac.co.uk');
INSERT INTO Ajudantes (email_ajudante) VALUES ('sed.libero@Morbiquisurna.co.uk');
INSERT INTO Ajudantes (email_ajudante) VALUES ('sodales.nisi.magna@orci.com');
INSERT INTO Ajudantes (email_ajudante) VALUES ('ipsum.dolor@libero.org');
INSERT INTO Ajudantes (email_ajudante) VALUES ('felis@laciniaorciconsectetuer.co.uk');
INSERT INTO Ajudantes (email_ajudante) VALUES ('posuere@musAenean.co.uk');
INSERT INTO Ajudantes (email_ajudante) VALUES ('Suspendisse@euismodin.net');
INSERT INTO Ajudantes (email_ajudante) VALUES ('vitae@mitempor.org');
INSERT INTO Ajudantes (email_ajudante) VALUES ('ante.Vivamus@elementumat.co.uk');
INSERT INTO Ajudantes (email_ajudante) VALUES ('elit@tellusjusto.org');
INSERT INTO Ajudantes (email_ajudante) VALUES ('metus.sit@liberoettristique.edu');
INSERT INTO Ajudantes (email_ajudante) VALUES ('euismod.in@erat.com');
INSERT INTO Ajudantes (email_ajudante) VALUES ('Curabitur@nisiMauris.ca');
INSERT INTO Ajudantes (email_ajudante) VALUES ('augue.ut@hymenaeosMauris.com');
INSERT INTO Ajudantes (email_ajudante) VALUES ('pede.nec@pede.co.uk');
/* FIM Ajudantes */



/* INICIO Moderadores */
INSERT INTO Moderadores (email_moderador) VALUES ('vulputate.posuere@Proin.co.uk');
INSERT INTO Moderadores (email_moderador) VALUES ('massa@augueSed.net');
INSERT INTO Moderadores (email_moderador) VALUES ('eu@nisiAenean.ca');
INSERT INTO Moderadores (email_moderador) VALUES ('orci.tincidunt.adipiscing@sedconsequatauctor.com');
INSERT INTO Moderadores (email_moderador) VALUES ('tellus.sem.mollis@tristiquesenectus.ca');
INSERT INTO Moderadores (email_moderador) VALUES ('eget@lorem.net');
INSERT INTO Moderadores (email_moderador) VALUES ('et.rutrum.eu@ami.edu');
INSERT INTO Moderadores (email_moderador) VALUES ('Sed@justo.com');
INSERT INTO Moderadores (email_moderador) VALUES ('nec.mauris.blandit@magna.ca');
INSERT INTO Moderadores (email_moderador) VALUES ('luctus.ut.pellentesque@sitametconsectetuer.com');
INSERT INTO Moderadores (email_moderador) VALUES ('quam.a@aliquetvelvulputate.ca');
INSERT INTO Moderadores (email_moderador) VALUES ('enim.non.nisi@Ut.edu');
INSERT INTO Moderadores (email_moderador) VALUES ('Morbi.vehicula.Pellentesque@risusvarius.org');
INSERT INTO Moderadores (email_moderador) VALUES ('rutrum.justo.Praesent@scelerisqueneque.org');
INSERT INTO Moderadores (email_moderador) VALUES ('risus.Donec.egestas@malesuadafringillaest.com');
INSERT INTO Moderadores (email_moderador) VALUES ('ligula.consectetuer@tempor.co.uk');
INSERT INTO Moderadores (email_moderador) VALUES ('Cras.convallis.convallis@pedeCras.net');
INSERT INTO Moderadores (email_moderador) VALUES ('amet.orci.Ut@taciti.co.uk');
INSERT INTO Moderadores (email_moderador) VALUES ('turpis@Sed.edu');
INSERT INTO Moderadores (email_moderador) VALUES ('imperdiet@dictumeu.co.uk');
/* FIM Moderadores */



/* INICIO Contatos */
INSERT INTO Contatos (id_contato,motivo,datainicio,datafim,relatorio,moderador_email,adotante_email) VALUES (1,'magna.',DATE'2020-05-16',DATE'2020-06-24','Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui.','vulputate.posuere@Proin.co.uk','Fusce@nec.org');
INSERT INTO Contatos (id_contato,motivo,datainicio,datafim,relatorio,moderador_email,adotante_email) VALUES (2,'ipsum.',DATE'2020-06-13',DATE'2020-06-30','arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis','Sed@justo.com','malesuada@purus.com');
INSERT INTO Contatos (id_contato,motivo,datainicio,datafim,relatorio,moderador_email,adotante_email) VALUES (3,'aptent taciti',DATE'2020-05-19',DATE'2020-05-25','sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut','ligula.consectetuer@tempor.co.uk','cursus.Nunc@a.net');
INSERT INTO Contatos (id_contato,motivo,datainicio,datafim,relatorio,moderador_email,adotante_email) VALUES (4,'velit dui, semper et,',DATE'2020-06-14',DATE'2020-06-19','vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque','enim.non.nisi@Ut.edu','magnis@tincidunt.com');
INSERT INTO Contatos (id_contato,motivo,datainicio,datafim,relatorio,moderador_email,adotante_email) VALUES (5,'tempus, lorem fringilla',DATE'2020-05-01',DATE'2020-06-04','congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris','Sed@justo.com','Quisque.varius@Nuncmauris.co.uk');
INSERT INTO Contatos (id_contato,motivo,datainicio,datafim,relatorio,moderador_email,adotante_email) VALUES (6,'pulvinar arcu et pede.',DATE'2020-05-08',DATE'2020-06-05','ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam','et.rutrum.eu@ami.edu','enim.Etiam.gravida@odioAliquamvulputate.co.uk');
INSERT INTO Contatos (id_contato,motivo,datainicio,datafim,relatorio,moderador_email,adotante_email) VALUES (7,'Praesent interdum',DATE'2020-05-22',DATE'2020-05-30','nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem','massa@augueSed.net','enim.Etiam.gravida@odioAliquamvulputate.co.uk');
INSERT INTO Contatos (id_contato,motivo,datainicio,datafim,relatorio,moderador_email,adotante_email) VALUES (8,'eleifend',DATE'2020-05-10',DATE'2020-05-10','diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis.','imperdiet@dictumeu.co.uk','habitant.morbi@ullamcorper.net');
INSERT INTO Contatos (id_contato,motivo,datainicio,datafim,relatorio,moderador_email,adotante_email) VALUES (9,'arcu eu odio',DATE'2020-06-15',DATE'2020-06-21','nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis','turpis@Sed.edu','Fusce@nec.org');
INSERT INTO Contatos (id_contato,motivo,datainicio,datafim,relatorio,moderador_email,adotante_email) VALUES (10,'Mauris',DATE'2020-05-08',DATE'2020-05-22','nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu','ligula.consectetuer@tempor.co.uk','egestas@velnisl.net');
INSERT INTO Contatos (id_contato,motivo,datainicio,datafim,relatorio,moderador_email,adotante_email) VALUES (11,'turpis. In',DATE'2020-05-09',DATE'2020-05-28','elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus','et.rutrum.eu@ami.edu','Suspendisse.aliquet.molestie@Fusce.org');
INSERT INTO Contatos (id_contato,motivo,datainicio,datafim,relatorio,moderador_email,adotante_email) VALUES (12,'egestas. Aliquam nec enim. Nunc',DATE'2020-05-12',DATE'2020-06-03','est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue','orci.tincidunt.adipiscing@sedconsequatauctor.com','nec.tellus@purus.edu');
INSERT INTO Contatos (id_contato,motivo,datainicio,datafim,relatorio,moderador_email,adotante_email) VALUES (13,'ridiculus mus. Donec dignissim magna',DATE'2020-05-12',DATE'2020-06-12','rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit','luctus.ut.pellentesque@sitametconsectetuer.com','egestas.Aliquam@egetipsum.co.uk');
INSERT INTO Contatos (id_contato,motivo,datainicio,datafim,relatorio,moderador_email,adotante_email) VALUES (14,'dolor. Fusce feugiat. Lorem ipsum dolor',DATE'2020-06-02',DATE'2020-06-20','commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut','risus.Donec.egestas@malesuadafringillaest.com','est@eget.net');
INSERT INTO Contatos (id_contato,motivo,datainicio,datafim,relatorio,moderador_email,adotante_email) VALUES (15,'in, tempus',DATE'2020-06-20',DATE'2020-06-21','arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies','enim.non.nisi@Ut.edu','Phasellus.vitae@nibhenimgravida.org');
INSERT INTO Contatos (id_contato,motivo,datainicio,datafim,relatorio,moderador_email,adotante_email) VALUES (16,'lacus. Quisque purus sapien,',DATE'2020-05-01',DATE'2020-06-19','mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non','nec.mauris.blandit@magna.ca','magnis@tincidunt.com');
INSERT INTO Contatos (id_contato,motivo,datainicio,datafim,relatorio,moderador_email,adotante_email) VALUES (17,'velit eget laoreet posuere, enim',DATE'2020-06-12',DATE'2020-06-29','interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo.','vulputate.posuere@Proin.co.uk','at.augue@acsem.edu');
INSERT INTO Contatos (id_contato,motivo,datainicio,adotante_email) VALUES (18,'pede, ultrices a, auctor non, feugiat',DATE'2020-05-02','est@eget.net');
INSERT INTO Contatos (id_contato,motivo,datainicio,adotante_email) VALUES (19,'montes, nascetur ridiculus mus. Donec',DATE'2020-06-06','Suspendisse.aliquet.molestie@Fusce.org');
INSERT INTO Contatos (id_contato,motivo,datainicio,adotante_email) VALUES (20,'a ultricies adipiscing,',DATE'2020-06-10','egestas@velnisl.net');
INSERT INTO Contatos (id_contato,motivo,datainicio,adotante_email) VALUES (21,'vitae,',DATE'2020-06-16','nec.tellus@purus.edu');
INSERT INTO Contatos (id_contato,motivo,datainicio,adotante_email) VALUES (22,'sit amet, faucibus ut,',DATE'2020-06-12','enim.Etiam.gravida@odioAliquamvulputate.co.uk');
INSERT INTO Contatos (id_contato,motivo,datainicio,adotante_email) VALUES (23,'dolor. Quisque tincidunt',DATE'2020-06-28','Quisque.varius@Nuncmauris.co.uk');
INSERT INTO Contatos (id_contato,motivo,datainicio,adotante_email) VALUES (24,'tellus justo sit amet',DATE'2020-05-28','mauris.sapien@Aenean.net');
/* FIM Contatos */



/* INICIO Pets */
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (1,'Macon Aguirre',1,'cachorro','magnis dis',42,1549,'risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes,','pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci',1,'augue.scelerisque.mollis@nullaIn.net');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (2,'Melissa',5,'cachorro','interdum libero',31,2922,'quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque','Duis a mi fringilla mi lacinia',1,'ipsum.cursus.vestibulum@purus.edu');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (3,'Jane',3,'gato','Duis',39,1882,'pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in,','nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus',3,'elit@tellusjusto.org');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (4,'Tanner',2,'cachorro','tincidunt. Donec',37,2141,'eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris','ultrices posuere cubilia Curae; Phasellus ornare. Fusce mollis.',1,'vitae@mitempor.org');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (5,'Ramona Zimmerman',4,'gato','quis diam.',49,1900,'accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor','mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis',3,'posuere@musAenean.co.uk');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (6,'Damian Faulkner',3,'gato','Integer',40,1232,'orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan','et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant',1,'Curabitur@nisiMauris.ca');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (7,'Rudyard',1,'gato','a, malesuada',40,2609,'nec enim. Nunc ut erat. Sed nunc est, mollis non,','elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede.',3,'pede.nec@pede.co.uk');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (8,'Felix',3,'cachorro','Donec non',35,2316,'mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis,','ac nulla. In tincidunt congue turpis. In',3,'sodales.nisi.magna@orci.com');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (9,'Aidan Workman',6,'cachorro','mi',41,2738,'varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat','Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc',3,'posuere.cubilia@sempercursus.co.uk');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (10,'Samantha Moreno',5,'gato','est,',38,2527,'ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam','sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur',1,'magna.Ut.tincidunt@sociis.ca');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (11,'Kylie Tyson',5,'gato','leo,',56,7265,'arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere','metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras',3,'sed.libero@Morbiquisurna.co.uk');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (12,'Daniel Kemp',3,'cachorro','ac arcu.',68,3331,'Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla','in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus',1,'pede.nec@pede.co.uk');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (13,'Paloma',7,'gato','dignissim.',66,6234,'sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc','hendrerit. Donec porttitor tellus non magna.',3,'ante.Vivamus@elementumat.co.uk');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (14,'Xaviera Franco',6,'cachorro','quam,',58,6224,'mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget','erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames',1,'euismod.in@erat.com');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (15,'Teagan',6,'cachorro','ridiculus mus.',97,5881,'pede. Nunc sed orci lobortis augue scelerisque mollis.','a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc',3,'felis@laciniaorciconsectetuer.co.uk');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (16,'Amal Dunn',8,'gato','eu',100,4047,'diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim.','Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique',1,'magna.Ut.tincidunt@sociis.ca');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (17,'Paul',5,'gato','vestibulum, neque',43,6981,'Mauris ut quam vel sapien','pellentesque. Sed dictum. Proin eget odio.',1,'Curabitur@nisiMauris.ca');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (18,'Sonya',4,'cachorro','aliquet',66,5605,'enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus.','diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus.',3,'metus.sit@liberoettristique.edu');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (19,'Nita Hoffman',5,'gato','erat,',69,4271,'molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis','viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi.',3,'posuere@musAenean.co.uk');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (20,'Ocean Rosales',8,'gato','Morbi vehicula.',114,10137,'bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus.','leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum',3,'sed.libero@Morbiquisurna.co.uk');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (21,'Palmer',9,'cachorro','ac',142,13818,'Cras interdum. Nunc sollicitudin commodo','luctus felis purus ac tellus. Suspendisse',1,'Suspendisse@In.com');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (22,'Chloe',3,'cachorro','et',102,12970,'Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus.','ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem.',3,'ipsum.cursus.vestibulum@purus.edu');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (23,'Kyle',7,'gato','non',139,12924,'ipsum. Phasellus vitae mauris sit amet lorem','nec enim. Nunc ut erat. Sed nunc est, mollis',1,'Suspendisse@euismodin.net');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (24,'Moana Strong',7,'gato','Vivamus',137,13185,'scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros.','non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non,',1,'pede.nec@pede.co.uk');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (25,'Mira',4,'gato','cursus.',139,10152,'pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit','molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas',3,'euismod.in@erat.com');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (26,'Cheryl',5,'gato','natoque',109,10111,'Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas','fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',1,'ante.Vivamus@elementumat.co.uk');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (27,'Marsden Diaz',8,'cachorro','ut',126,13460,'mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a,','netus et malesuada fames ac turpis egestas. Aliquam fringilla',1,'felis@laciniaorciconsectetuer.co.uk');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (28,'Ima Beach',9,'gato','placerat.',143,11939,'dui. Fusce diam nunc, ullamcorper eu, euismod','Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante,',3,'magna.Ut.tincidunt@sociis.ca');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (29,'Avye',3,'gato','Class aptent',138,13894,'erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit','tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed,',1,'augue.scelerisque.mollis@nullaIn.net');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (30,'Orli',6,'gato','porttitor',179,20333,'Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi.','at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna.',1,'posuere.cubilia@sempercursus.co.uk');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (31,'Dexter',7,'gato','dui.',207,18164,'mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et','magna. Sed eu eros. Nam',3,'ipsum.dolor@libero.org');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (32,'Paki',4,'cachorro','molestie',209,17467,'arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac','nunc risus varius orci, in consequat enim',1,'magna.Ut.tincidunt@sociis.ca');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (33,'Aurelia',5,'cachorro','morbi tristique',209,18564,'pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus','lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus,',3,'Curabitur@nisiMauris.ca');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (34,'Rafael Durham',10,'gato','interdum',200,23196,'ullamcorper eu, euismod ac, fermentum','nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit',3,'vitae@mitempor.org');
INSERT INTO Pets (id_pet,nome,idade,especie,raca,tamanho_cm,peso_gram,personalidade,adaptabilidade,disponibilidade,ajudante_email) VALUES (35,'Judah',3,'cachorro','Nunc sed',245,18021,'penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel','vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim.',3,'posuere@musAenean.co.uk');
/* FIM Pets */



/* INICIO Fotopets */
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (1,'https://www.audocao/foto=KZCIRwMPGB=1084.bd1.link',10);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (2,'https://www.audocao/foto=KTebYGMpsB=6234.bd1.link',16);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (3,'https://www.audocao/foto=RbQQdQhMDn=7344.bd1.link',4);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (4,'https://www.audocao/foto=ezVRBUTHes=0497.bd1.link',13);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (5,'https://www.audocao/foto=iQadHnYpEv=0858.bd1.link',35);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (6,'https://www.audocao/foto=xfhsZStQEc=9422.bd1.link',31);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (7,'https://www.audocao/foto=CPqKyrOzgK=7791.bd1.link',33);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (8,'https://www.audocao/foto=AbkEUrASNc=1640.bd1.link',2);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (9,'https://www.audocao/foto=EBKWeawACy=5439.bd1.link',30);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (10,'https://www.audocao/foto=ZERlZkOXwV=0447.bd1.link',21);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (11,'https://www.audocao/foto=rRBjHgzBel=7690.bd1.link',29);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (12,'https://www.audocao/foto=xwuditjBOM=3501.bd1.link',28);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (13,'https://www.audocao/foto=LBZgewkcOe=2034.bd1.link',6);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (14,'https://www.audocao/foto=mWszYCfkFg=1385.bd1.link',14);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (15,'https://www.audocao/foto=IAZpLAiLuz=8062.bd1.link',13);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (16,'https://www.audocao/foto=aNpkICuNtb=0558.bd1.link',30);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (17,'https://www.audocao/foto=sWhixIGlEo=1211.bd1.link',32);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (18,'https://www.audocao/foto=GhjVYPmcbE=9110.bd1.link',31);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (19,'https://www.audocao/foto=SBfqFRpTuC=7442.bd1.link',33);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (20,'https://www.audocao/foto=upZQEHSrAD=9997.bd1.link',17);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (21,'https://www.audocao/foto=QtGktxXwXe=4790.bd1.link',19);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (22,'https://www.audocao/foto=eUKPjitTxt=1846.bd1.link',24);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (23,'https://www.audocao/foto=MkvleMdaHc=2568.bd1.link',12);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (24,'https://www.audocao/foto=LXTREDocKt=2012.bd1.link',29);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (25,'https://www.audocao/foto=jLrpuJzgnG=1223.bd1.link',17);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (26,'https://www.audocao/foto=fQFdwiZxCI=0816.bd1.link',25);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (27,'https://www.audocao/foto=KFirWogymK=9155.bd1.link',11);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (28,'https://www.audocao/foto=IzoZCirgPr=8133.bd1.link',18);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (29,'https://www.audocao/foto=emHRbXJWvo=9098.bd1.link',27);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (30,'https://www.audocao/foto=rTQAbXCnIy=6850.bd1.link',19);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (31,'https://www.audocao/foto=SOLRlEVJUo=0987.bd1.link',33);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (32,'https://www.audocao/foto=WfjGBZVQYW=5476.bd1.link',11);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (33,'https://www.audocao/foto=FBhnluodVx=9622.bd1.link',10);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (34,'https://www.audocao/foto=hulmoZSonn=3425.bd1.link',7);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (35,'https://www.audocao/foto=KiDRrDGBpP=0071.bd1.link',14);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (36,'https://www.audocao/foto=mDdicUlAwh=2705.bd1.link',21);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (37,'https://www.audocao/foto=KEySBpBOpl=5198.bd1.link',16);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (38,'https://www.audocao/foto=BpZvMfOaNY=2766.bd1.link',35);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (39,'https://www.audocao/foto=OzjqYRUjol=2268.bd1.link',20);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (40,'https://www.audocao/foto=ZSeDogHYiL=8265.bd1.link',6);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (41,'https://www.audocao/foto=ofImOdiCnl=9892.bd1.link',25);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (42,'https://www.audocao/foto=pYMcSqxCJq=6810.bd1.link',4);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (43,'https://www.audocao/foto=dkKzxNRozQ=5475.bd1.link',29);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (44,'https://www.audocao/foto=SPlTyEJcWp=3070.bd1.link',25);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (45,'https://www.audocao/foto=iHRCPPEIof=8675.bd1.link',6);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (46,'https://www.audocao/foto=YPAMSYAABv=3225.bd1.link',3);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (47,'https://www.audocao/foto=WqMNitqmhj=0324.bd1.link',18);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (48,'https://www.audocao/foto=MHjINBPOXC=4639.bd1.link',7);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (49,'https://www.audocao/foto=hZGxfUMbUe=7550.bd1.link',3);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (50,'https://www.audocao/foto=SVDzhXIPoa=3995.bd1.link',31);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (51,'https://www.audocao/foto=XrrZrYbbmh=4756.bd1.link',30);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (52,'https://www.audocao/foto=momkklznUL=9063.bd1.link',35);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (53,'https://www.audocao/foto=UlXFjaPihi=2129.bd1.link',16);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (54,'https://www.audocao/foto=oNMXPpmNZf=0937.bd1.link',15);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (55,'https://www.audocao/foto=pUbrywERrM=4792.bd1.link',28);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (56,'https://www.audocao/foto=crUxGovPnp=0417.bd1.link',4);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (57,'https://www.audocao/foto=ZBKKyLnOER=8403.bd1.link',26);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (58,'https://www.audocao/foto=xHMgwyoHvI=5917.bd1.link',4);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (59,'https://www.audocao/foto=FAfgZAUFgc=5831.bd1.link',14);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (60,'https://www.audocao/foto=sxvbPbjUtJ=3745.bd1.link',7);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (61,'https://www.audocao/foto=iWFelWhrle=5835.bd1.link',22);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (62,'https://www.audocao/foto=WeUpfZmsYL=0077.bd1.link',16);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (63,'https://www.audocao/foto=WVksTFyTsL=3082.bd1.link',23);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (64,'https://www.audocao/foto=RciTidIoVS=0817.bd1.link',10);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (65,'https://www.audocao/foto=AukjqrFroD=2769.bd1.link',31);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (66,'https://www.audocao/foto=lOYMvpWpoI=1686.bd1.link',6);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (67,'https://www.audocao/foto=YMIrmQpcne=0062.bd1.link',18);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (68,'https://www.audocao/foto=MLfnYzRtAh=8123.bd1.link',32);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (69,'https://www.audocao/foto=CLAEoqJEoK=6356.bd1.link',15);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (70,'https://www.audocao/foto=wcYXYrZhYj=1186.bd1.link',9);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (71,'https://www.audocao/foto=nTXVZYMotG=6965.bd1.link',1);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (72,'https://www.audocao/foto=WZwUDNtkTm=0847.bd1.link',6);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (73,'https://www.audocao/foto=xfnYuHJaHo=9617.bd1.link',28);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (74,'https://www.audocao/foto=wkrveMWapN=9989.bd1.link',6);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (75,'https://www.audocao/foto=vjeqkrFHKK=9704.bd1.link',26);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (76,'https://www.audocao/foto=hRAomqUcBV=7932.bd1.link',3);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (77,'https://www.audocao/foto=KbIrLvYuLP=2365.bd1.link',20);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (78,'https://www.audocao/foto=CtfttwfXks=1238.bd1.link',12);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (79,'https://www.audocao/foto=tfgkBxBPQe=0233.bd1.link',9);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (80,'https://www.audocao/foto=voGDKLGdMV=2305.bd1.link',20);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (81,'https://www.audocao/foto=Pjvccwoity=4388.bd1.link',8);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (82,'https://www.audocao/foto=lqZXJtZuiX=1754.bd1.link',16);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (83,'https://www.audocao/foto=qThpoHUjDe=7935.bd1.link',5);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (84,'https://www.audocao/foto=BdZSacrfQg=6064.bd1.link',22);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (85,'https://www.audocao/foto=kxlmfdtXzE=1428.bd1.link',13);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (86,'https://www.audocao/foto=iCnopDlWZq=8842.bd1.link',15);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (87,'https://www.audocao/foto=ECgMWotqon=7787.bd1.link',7);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (88,'https://www.audocao/foto=eCbMLEGPxT=1407.bd1.link',5);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (89,'https://www.audocao/foto=aaZiTsSEPS=3528.bd1.link',20);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (90,'https://www.audocao/foto=bqzsoNjSfY=4824.bd1.link',22);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (91,'https://www.audocao/foto=YOXPdKSCdh=9702.bd1.link',19);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (92,'https://www.audocao/foto=LKlWiToCSF=6063.bd1.link',28);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (93,'https://www.audocao/foto=AvBTaWoabK=7552.bd1.link',11);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (94,'https://www.audocao/foto=HmlcyqfcGE=3645.bd1.link',4);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (95,'https://www.audocao/foto=ihrhPhMlYw=5404.bd1.link',21);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (96,'https://www.audocao/foto=QErfBgCQfj=9888.bd1.link',21);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (97,'https://www.audocao/foto=BMjxJDVrEG=9522.bd1.link',31);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (98,'https://www.audocao/foto=IMpqgKsFNV=6343.bd1.link',28);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (99,'https://www.audocao/foto=QPNhBxfFuO=3191.bd1.link',26);
INSERT INTO Fotopets (id_fotopet,link,pet_id) VALUES (100,'https://www.audocao/foto=MhxvjJSYUF=1907.bd1.link',10);
/* FIM Fotopets */



/* INICIO Adocoes */
INSERT INTO Adocoes (id_adocao,datarequisicao,status,pet_id,moderador_email,adotante_email) VALUES (1,DATE'2020-06-15',2,1,'massa@augueSed.net','mi.lacinia.mattis@dapibus.ca');
INSERT INTO Adocoes (id_adocao,datarequisicao,dataadocao,status,relatorio,pet_id,moderador_email,adotante_email) VALUES (2,DATE'2020-05-17',DATE'2020-06-01',5,'quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi.',2,'eu@nisiAenean.ca','Suspendisse.aliquet.molestie@Fusce.org');
INSERT INTO Adocoes (id_adocao,datarequisicao,status,pet_id,moderador_email,adotante_email) VALUES (3,DATE'2020-05-27',2,3,'luctus.ut.pellentesque@sitametconsectetuer.com','Phasellus.vitae@nibhenimgravida.org');
INSERT INTO Adocoes (id_adocao,datarequisicao,dataadocao,status,relatorio,pet_id,moderador_email,adotante_email) VALUES (4,DATE'2020-05-10',DATE'2020-06-20',3,'Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in',4,'risus.Donec.egestas@malesuadafringillaest.com','egestas.Aliquam@egetipsum.co.uk');
INSERT INTO Adocoes (id_adocao,datarequisicao,dataadocao,status,relatorio,pet_id,moderador_email,adotante_email) VALUES (5,DATE'2020-05-18',DATE'2020-06-14',5,'Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi',5,'Cras.convallis.convallis@pedeCras.net','mus.Proin@Classaptenttaciti.edu');
INSERT INTO Adocoes (id_adocao,datarequisicao,status,pet_id,moderador_email,adotante_email) VALUES (6,DATE'2020-06-15',2,6,'eu@nisiAenean.ca','enim.Etiam.gravida@odioAliquamvulputate.co.uk');
INSERT INTO Adocoes (id_adocao,datarequisicao,status,relatorio,pet_id,moderador_email,adotante_email) VALUES (7,DATE'2020-05-19',4,'nec mauris blandit mattis. Cras eget nisi dictum augue malesuada',7,'vulputate.posuere@Proin.co.uk','magnis@tincidunt.com');
INSERT INTO Adocoes (id_adocao,datarequisicao,status,relatorio,pet_id,moderador_email,adotante_email) VALUES (8,DATE'2020-06-01',4,'a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla',8,'nec.mauris.blandit@magna.ca','egestas@velnisl.net');
INSERT INTO Adocoes (id_adocao,datarequisicao,status,pet_id,moderador_email,adotante_email) VALUES (9,DATE'2020-06-18',2,9,'enim.non.nisi@Ut.edu','cursus.Nunc@a.net');
INSERT INTO Adocoes (id_adocao,datarequisicao,dataadocao,status,relatorio,pet_id,moderador_email,adotante_email) VALUES (10,DATE'2020-05-08',DATE'2020-05-23',3,'a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec',10,'amet.orci.Ut@taciti.co.uk','ipsum.Suspendisse.sagittis@egestasSedpharetra.co.uk');
INSERT INTO Adocoes (id_adocao,datarequisicao,dataadocao,status,relatorio,pet_id,moderador_email,adotante_email) VALUES (11,DATE'2020-05-09',DATE'2020-05-22',5,'dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque.',11,'imperdiet@dictumeu.co.uk','nec.tellus@purus.edu');
INSERT INTO Adocoes (id_adocao,datarequisicao,status,pet_id,moderador_email,adotante_email) VALUES (12,DATE'2020-05-30',2,12,'Morbi.vehicula.Pellentesque@risusvarius.org','egestas@velnisl.net');
INSERT INTO Adocoes (id_adocao,datarequisicao,status,relatorio,pet_id,moderador_email,adotante_email) VALUES (13,DATE'2020-05-04',4,'ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae,',13,'Cras.convallis.convallis@pedeCras.net','Fusce@nec.org');
INSERT INTO Adocoes (id_adocao,datarequisicao,dataadocao,status,relatorio,pet_id,moderador_email,adotante_email) VALUES (14,DATE'2020-05-26',DATE'2020-06-13',3,'adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris',14,'Morbi.vehicula.Pellentesque@risusvarius.org','nec.tellus@purus.edu');
INSERT INTO Adocoes (id_adocao,datarequisicao,dataadocao,status,relatorio,pet_id,moderador_email,adotante_email) VALUES (15,DATE'2020-06-24',DATE'2020-06-30',5,'Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui,',15,'nec.mauris.blandit@magna.ca','habitant.morbi@ullamcorper.net');
INSERT INTO Adocoes (id_adocao,datarequisicao,dataadocao,status,relatorio,pet_id,moderador_email,adotante_email) VALUES (16,DATE'2020-05-19',DATE'2020-06-11',3,'sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et,',16,'Sed@justo.com','est@eget.net');
INSERT INTO Adocoes (id_adocao,datarequisicao,status,pet_id,moderador_email,adotante_email) VALUES (17,DATE'2020-06-07',2,17,'eget@lorem.net','urna.Nunc@In.co.uk');
INSERT INTO Adocoes (id_adocao,datarequisicao,status,pet_id,moderador_email,adotante_email) VALUES (18,DATE'2020-05-19',2,18,'enim.non.nisi@Ut.edu','mi.lacinia.mattis@dapibus.ca');
INSERT INTO Adocoes (id_adocao,datarequisicao,status,pet_id,adotante_email) VALUES (19,DATE'2020-06-25',1,19,'urna.Nunc@In.co.uk');
INSERT INTO Adocoes (id_adocao,datarequisicao,status,pet_id,adotante_email) VALUES (20,DATE'2020-05-01',1,20,'mauris.sapien@Aenean.net');
INSERT INTO Adocoes (id_adocao,datarequisicao,status,pet_id,adotante_email) VALUES (21,DATE'2020-06-08',1,21,'cursus.Nunc@a.net');
INSERT INTO Adocoes (id_adocao,datarequisicao,status,pet_id,adotante_email) VALUES (22,DATE'2020-05-06',1,22,'Quisque.varius@Nuncmauris.co.uk');
INSERT INTO Adocoes (id_adocao,datarequisicao,dataadocao,status,relatorio,pet_id,moderador_email,adotante_email) VALUES (23,DATE'2020-06-28',DATE'2020-06-30',3,'Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna.',15,'nec.mauris.blandit@magna.ca','habitant.morbi@ullamcorper.net');
INSERT INTO Adocoes (id_adocao,datarequisicao,status,relatorio,pet_id,moderador_email,adotante_email) VALUES (24,DATE'2020-06-19',4,'nec mauris blandit mattis.',9,'vulputate.posuere@Proin.co.uk','magnis@tincidunt.com');
/* FIM Adocoes */



/* DESCRIBES */
DESC Humanos;
DESC Adotantes;
DESC Ajudantes;
DESC Moderadores;
DESC Contatos;
DESC Pets;
DESC Fotopets;
DESC Adocoes;
/* FIM DESCRIBES */



/* UPDATES */
UPDATE Pets, Adocoes
SET Pets.disponibilidade=2
WHERE (Adocoes.status=2 OR Adocoes.status=3)
AND Adocoes.pet_id=Pets.id_pet;

UPDATE Pets, Adocoes
SET Pets.disponibilidade=1
WHERE (Adocoes.status=1 OR Adocoes.status=4 OR Adocoes.status=5)
AND Adocoes.pet_id=Pets.id_pet
AND Pets.disponibilidade!=2;
/* FIM UPDATES */



/* INICIO SELECTS */
	SELECT /* Quantos animais possui no total na instituição? */
		COUNT(*) AS "número de animais na instituição"
        FROM Pets
        WHERE Pets.disponibilidade=1
        OR Pets.disponibilidade=3;
        
	SELECT /* Quantos pets estão disponíveis para adoção? */
		COUNT(*) AS "pets disponiveis"
        FROM Pets
        WHERE Pets.disponibilidade=1;
        
	SELECT /* Quais são os pets disponíveis para adoção? */
		Pets.nome AS "nome do pet", 
        Pets.especie AS "espécie do pet", 
        Pets.raca AS "raça do pet", 
        Pets.disponibilidade 
		FROM Pets 
		WHERE Pets.disponibilidade=1 
		ORDER BY Pets.especie, Pets.nome;
        
	SELECT /* Quantos pets estão em recuperação? */
		COUNT(*) AS "pets em recuperação"
        FROM Pets
        WHERE Pets.disponibilidade=3;
        
	SELECT /* Quais pets estão adotados? */
		Pets.nome AS "nome do pet", 
        Pets.especie AS "espécie do pet", 
        Pets.raca AS "raça do pet", 
        Pets.disponibilidade 
		FROM Pets 
		WHERE Pets.disponibilidade=2 
		ORDER BY Pets.especie, Pets.nome;
		
	SELECT /* Quais são os adotantes que já devolveram pets? */
		Humanos.nome AS "nome do adotante",
		Pets.nome AS "nome do pet", 
		Pets.especie AS "espécie do pet", 
		Adocoes.status AS "status da adocao"
		FROM Humanos, Adotantes, Adocoes, Pets 
		WHERE Humanos.email=Adotantes.email_adotante 
		AND Adocoes.adotante_email=Adotantes.email_adotante
		AND Adocoes.pet_id=Pets.id_pet
		AND Adocoes.status=5;
        
	SELECT /* Quais pets já foram adotados por mais de uma vez? */
		Pets.nome AS "nome do pet",
        Pets.especie AS "espécie do pet",
        COUNT(Adocoes.pet_id) AS "vezes adotado"
        FROM Adocoes, Pets
        WHERE Adocoes.pet_id=Pets.id_pet
        AND (Adocoes.status=3 OR Adocoes.status=5)
        GROUP BY Pets.nome
        HAVING COUNT(Adocoes.pet_id)>1
        ORDER BY Pets.nome;
        
	SELECT /* Quais pessoas já adotaram mais de uma vez? */
		Humanos.nome AS "nome do adotante",
        Humanos.sobrenome AS "sobrenome do adotante",
        COUNT(Adocoes.adotante_email) AS "número de adoções"
        FROM Adocoes, Humanos, Adotantes
        WHERE Adocoes.adotante_email=Adotantes.email_adotante
        AND Adotantes.email_adotante=Humanos.email
        AND (Adocoes.status=3 OR Adocoes.status=5)
        GROUP BY Humanos.nome
        HAVING COUNT(Adocoes.adotante_email)>1
        ORDER BY Humanos.nome;
        
	SELECT /* Quais moderadores já recusaram adoções? */
		Humanos.nome AS "nome do moderador",
		Humanos.sobrenome AS "sobrenome do moderador",
        COUNT(*) AS "vezes que negou"
		FROM Humanos, Adocoes, Moderadores
		WHERE Adocoes.status=4
		AND Adocoes.moderador_email=Moderadores.email_moderador
		AND Moderadores.email_moderador=Humanos.email
		GROUP BY Humanos.nome;
        
	SELECT /* Quais moderadores já negaram adoções para uma certa pessoa? */
		Humano_moderador.nome AS "nome do moderador",
        Humano_adotante.nome AS "nome do adotante",
        COUNT(*) AS "vezes negada"
		FROM Adocoes, Moderadores, Adotantes, Humanos Humano_moderador, Humanos Humano_adotante
		WHERE Adocoes.status=4
		AND Adocoes.moderador_email=Moderadores.email_moderador
		AND Adocoes.adotante_email=Adotantes.email_adotante
		AND Moderadores.email_moderador=Humano_moderador.email
		AND Adotantes.email_adotante=Humano_adotante.email
		GROUP BY Humano_moderador.nome
        ORDER BY Humano_moderador.nome;
        
	SELECT /* Quais adoções estão com status de adotado? */
		Adocoes.id_adocao AS "id da adoção",
        Humano_adotante.nome AS "nome do adotante",
        Humano_moderador.nome AS "nome do moderador",
        Adocoes.status AS "status da adoção"
        FROM Adocoes, Adotantes, Moderadores, Humanos Humano_moderador, Humanos Humano_adotante
        WHERE Adocoes.status=3
        AND Adocoes.adotante_email=Adotantes.email_adotante
        AND Adotantes.email_adotante=Humano_adotante.email
        AND Adocoes.moderador_email=Moderadores.email_moderador
        AND Moderadores.email_moderador=Humano_moderador.email;
        
	SELECT /* Quais são as raças disponíveis? */
		Pets.especie AS "espécies",
		Pets.raca AS "raças",
        COUNT(*) AS "quantidade disponível"
        FROM Pets
        GROUP BY Pets.especie, Pets.raca
        ORDER BY Pets.especie, Pets.raca;
        
	SELECT /* Quais gatos estão disponíveis para adoção? */
		Pets.nome AS "nome do gato"
		FROM Pets
        WHERE Pets.especie="gato"
        AND Pets.disponibilidade=1;
        
	SELECT /* Quais são os cachorros mais velhos que estão para adoção? */
		Pets.nome AS "nome do cachorro",
        Pets.idade AS "idade do cachorro"
        FROM Pets
        WHERE Pets.especie="cachorro"
        AND Pets.disponibilidade=1
        ORDER BY Pets.idade DESC, Pets.nome;
        
	SELECT /* Quais animais estão na faixa etária de 0 a 2 anos? */
		Pets.nome AS "nome do pet",
        Pets.idade AS "idade do pet",
        Pets.especie AS "espécie do pet",
        Pets.raca AS "raça do pet"
        FROM Pets
        WHERE Pets.idade<3
        ORDER BY Pets.idade, Pets.nome;
        
	SELECT /* Quais filhotes de cachorro estão pra adoção? (no máximo 1 ano) */
		Pets.nome AS "nome do cachorro",
        Pets.idade AS "idade do cachorro"
        FROM Pets
        WHERE Pets.idade<2
        AND Pets.disponibilidade=1
        AND Pets.especie="cachorro"
        ORDER BY Pets.idade, Pets.nome;
/* FIM SELECTS */