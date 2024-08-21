create database osOficina;
use osOficina;
-- drop database osOficina;

create table clients(  
	   idClient int auto_increment primary key,
       idOSconserto int,
       idOSrev int,
       carModel varchar(100) not null,
       nomeClient varchar(100) not null,
       CPF char(11) not null,
       constraint unique_cpf_client unique (CPF)
);
alter table clients auto_increment=1;

create table systema( 
        idSystema int auto_increment primary key,
        idClientSystema int,
        idSystemaOs int default 1,
        consertoType varchar(255) not null,
        revisão varchar(100) not null,
        constraint fk_systema_clients foreign key (idClientSystema) references clients(idClient)
	
);
alter table systema auto_increment=1;

create table teamConserto (
        idTeamConserto int auto_increment primary key,
        idTeamConsOs int default 1,
        nomeEmploye varchar(100) not null,
        registrationWork char(4) not null,
        especialidade varchar(100) not null,
        address varchar(100)
);

alter table teamConserto auto_increment=1;


create table teamRevisão (
        idTeamRevisão int auto_increment primary key,
        nomeEmploye varchar(100) not null,
        registrationWork char(4) not null,
        especialidade varchar(100) not null,
        address varchar(100)
);

alter table teamRevisão auto_increment=1;
-- Err0 1364 maldito default
-- Erro 1062 
-- Erro 1452 já cansei de dropar o banco de dados
-- Tabela problemIdentification gerando erro 1452 na segunda constraint, vou remove-la.
-- Removi e persistiu outro problema de chave duplicada 

create table problemIdentification (
			idSystemaOs int,
            idTeamConsOs int default 1,
            primary key (idSystemaOs, idTeamConsOs),
            problemaRelatado varchar(200) not null,
            constraint fk_problemIdt_systema foreign key (idSystemaOs) references systema(idSystema),
			constraint fk_problemIdt_teamCons foreign key (idteamConsOs) references teamConserto(idTeamConserto)

);
-- primary key (idSystemaOs, idTeamConsOs),
-- desc  systema;


create table revisão (
			idSystemaRev int,
            idTeamRev int,
            revisãoOk bool default true,
            primary key (idSystemaRev, idTeamRev),
            constraint fk_revisão_systema foreign key (idSystemaRev) references systema(idSystema),
            constraint fk_revisão_TeamRev foreign key (idTeamRev) references teamRevisão(idTeamRevisão)
);

create table consertoOS (
             idConsertoOS int auto_increment primary key,
             idTeamConsOS int,
             valorPecas float not null,
             dataEntrega varchar(15),
             pagamento enum ('Cartão debito', 'Cartão credito', 'Dinheiro', 'Pix') not null,
             cancelamento enum ('Sim', 'Não') not null,
			constraint fk_consertoOS_teamCons foreign key (idTeamConsOS) references teamConserto(idTeamConserto)
);
alter table consertoOS auto_increment=1;

create table revisãoOS (
             idRevisãoOS int auto_increment primary key,
             idTeamRevOS int,
             valorPecas float not null,
             dataEntrega varchar(15),
             pagamento enum ('Cartão debito', 'Cartão credito', 'Dinheiro', 'Pix') not null,
             cancelamento enum ('Sim', 'Não') not null,
             constraint fk_revisãoOS_teamRev foreign key (idTeamRevOS) references teamRevisão(idTeamRevisão)
);
alter table revisãoOS auto_increment=1;
alter table clients add constraint fk_osConserto_client foreign key (idOSconserto) references consertoOS (idConsertoOS);
alter table clients add constraint fk_osRev_client foreign key (idOSrev) references revisãoOS (idRevisãoOS);

