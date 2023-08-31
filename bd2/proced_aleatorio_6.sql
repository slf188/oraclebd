show user;

create table prueba (
    pru_id integer not null,
    pru_numero integer not null,
    pru_title varchar(50) not null,
    pru_descrip varchar(50),
    pru_year number(4),
    pru_mail varchar(20),
    constraint pk_prueba primary key(pru_id)
);

select * from prueba;

begin 
    for i in 1..10 loop
        insert into prueba values(
            i,
            round(dbms_random.value(1,100)),
            'titulo'||i,
            'desc'||i,
            round(dbms_random.value(2000,2020)),
            '
            '||i||'@'
        );
    end loop;
end;


select count(*) from prueba;

select * from prueba;   
