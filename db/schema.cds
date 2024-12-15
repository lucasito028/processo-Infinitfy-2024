namespace gestao.aerea;

entity Companhia @readonly {
    key ICAO : String(4);
    razaoSocial : String(255);
    CNPJ : String(14);
    telefone : String(15);
    email : String(255);
}

entity Aeronave @readonly {
    key marca : String(50);
    key modelo : String(50);
    key numeroSerie : String(50);
    capacidade : Integer;
    tipoMotor : String(50);
}

entity PropriedadeAeronave @readonly {
    key aeronaveId : Association to Aeronave;
    key companhiaId : Association to Companhia;
    matricula : String(20);
    validadeCertificado : Date;
}

entity Aeroporto @readonly {
    key ICAO : String(4);
    cidade : String(100);
    estado : String(50);
    pais : String(50);
}

entity Conexao @readonly {
    key origemId : Association to Aeroporto;
    key destinoId : Association to Aeroporto;
}

entity Passageiro {
    key CPF : String(11);
    nome : String(255);
    telefone : String(15);
    email : String(255);
    dataNascimento : Date;
}

entity ReservaPassagem {
    key reservaId : UUID;
    passageiroId : Association to Passageiro;
    horarioVooId : Association to HorarioVoo;
    assento : String(5);
    classe : String(20);
    preco : Decimal(10,2);
}

entity HorarioVoo {
    key horarioId : UUID;
    companhiaId : Association to Companhia;
    conexaoId : Association to Conexao;
    aeronaveId : Association to Aeronave;
    status : String(20);
    horarioPartida : DateTime;
    horarioChegada : DateTime;
    horarioPartidaReal : DateTime;
    horarioChegadaReal : DateTime;
}
