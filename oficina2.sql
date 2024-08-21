use osOficina;

insert into clients (carModel, nomeClient, CPF) values
               ('Volvo-89', 'Alexandro de Araujo Jorge', '13222287654'),
               ('Renault Sandero Step-Way', 'Nathalia Blanda', '14376545690'),
               ('BMW-i9', 'Bruno Marrone', '12345678909'),
               ('Corolla Cross', 'Patrick Santos', '09876543211');
               
 -- select * from clients;
 
 insert into systema(idSystemaOs, consertoType, revisão) values
               (1 ,'Conserto em geral', 'Sem revisão'),
               (1, 'Sem conserto', 'Revisão');
  
  -- select * from systema;
  
  insert into teamConserto(idTeamConsOs, nomeEmploye, registrationWork, especialidade, address) values
                (3,'Aroldo Conceição', '1602', 'Mecânica em Geral', 'Rua sem saida 23'),
                (4,'Agnaldo Timoteo', '1345', 'Mecânica em geral', 'Rua 4 CDD');
      
 -- select * from teamConserto;
 
 insert into teamRevisão(nomeEmploye, registrationWork, especialidade, address) values
               ('Don Menique', '1267', 'Revisão em geral', 'Estrada da soca 567'),
               ('Elipse Felipe', '1000', 'Revisão em geral', 'Estrada Rio grande 23');
               
-- select * from teamRevisão;
 
 insert into problemIdentification(idSystemaOs, idTeamConsOs ,problemaRelatado) values
               (1, 1, 'Freio não funciona e troca de farol de milha'),
               (2, 2,'Trocar eixo das rodas'),
               (3, 3,'Revisão dos 40.000km'),
               (4, 4,'Revisão do oleo');
  
  insert into revisão(idSystemaRev, idTeamRev, revisãoOK) values
               (1, 3, null),
               (2, 4, null);
               
 insert into  consertoOS(idTeamConsOS, valorPecas, dataEntrega, pagamento, cancelamento) values
               (1 ,  380.0, '15/08/2024', 'Cartão debito', 'Não'),
               (2, 600.45, '17/08/2024', 'Pix', 'Não');
 
 insert into revisãoOS(idTeamRevOS, valorPecas, dataEntrega, pagamento, cancelamento) values
               (1, 220.0, '12/02/2025', 'Pix', 'Não'),
               (2, 349.90, '13/03/2025', 'Pix', 'Não');
               
  select count(*) from clients;
  
  
               