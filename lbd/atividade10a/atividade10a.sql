create database exercicio10a
go
use exercicio10a

create table envio (
CPF varchar(20),
NR_LINHA_ARQUIV	int,
CD_FILIAL int,
DT_ENVIO datetime,
NR_DDD int,
NR_TELEFONE	varchar(10),
NR_RAMAL varchar(10),
DT_PROCESSAMENT	datetime,
NM_ENDERECO varchar(200),
NR_ENDERECO int,
NM_COMPLEMENTO	varchar(50),
NM_BAIRRO varchar(100),
NR_CEP varchar(10),
NM_CIDADE varchar(100),
NM_UF varchar(2),
)

create table endereço(
CPF varchar(20),
CEP	varchar(10),
PORTA	int,
ENDEREÇO	varchar(200),
COMPLEMENTO	varchar(100),
BAIRRO	varchar(100),
CIDADE	varchar(100),
UF Varchar(2))


create procedure sp_insereenvio
as
declare @cpf as int
declare @cont1 as int
declare @cont2 as int
declare @conttotal as int
set @cpf = 11111
set @cont1 = 1
set @cont2 = 1
set @conttotal = 1
	while @cont1 <= @cont2 and @cont2 < = 100
			begin
				insert into envio (CPF, NR_LINHA_ARQUIV, DT_ENVIO)
				values (cast(@cpf as varchar(20)), @cont1,GETDATE())
				insert into endereço (CPF,PORTA,ENDEREÇO)
				values (@cpf,@conttotal,CAST(@cont2 as varchar(3))+'Rua '+CAST(@conttotal as varchar(5)))
				set @cont1 = @cont1 + 1
				set @conttotal = @conttotal + 1
				if @cont1 > = @cont2
					begin
						set @cont1 = 1
						set @cont2 = @cont2 + 1
						set @cpf = @cpf + 1
					end
	end




exec sp_insereenvio


select * from envio order by CPF,NR_LINHA_ARQUIV asc
select * from endereço order by CPF asc




procedure sp_dudu_corrige as begin
	declare @cursor1_status int, @cursor2_status int, @linha int, @cpf varchar(20)
	declare @endereco varchar(100), @nr_linha_arq int
	set @linha = 0


	--CURSOR 1
	declare c_envio cursor for select NR_LINHA_ARQUIV, CPF  from envio
	open c_envio

        --FETCH CURSOR 1
	fetch next from c_envio into @nr_linha_arq, @cpf

	set @cursor1_status = @@fetch_status
	while(@cursor1_status = 0)
                 begin

             --CURSOR 2

              declare c_endereco cursor for select ENDEREÇO from endereço
		open c_endereco	

		--FETCH CURSOR 2

		fetch next from c_endereco into @endereco
		set @cursor2_status = @@fetch_status
		
		while(@linha != @nr_linha_arq and @cursor2_status = 0)begin
			set @linha = @linha + 1
			if(@linha = @nr_linha_arq)begin
				update envio set NM_ENDERECO = @endereco where NR_LINHA_ARQUIV = @linha and CPF = @cpf
			end
			fetch next from c_endereco into @endereco
			set @cursor2_status = @@fetch_status

		end
		set @linha = 0
		close c_endereco
		deallocate c_endereco
		fetch next from c_envio into @nr_linha_arq, @cpf
		set @cursor1_status = @@fetch_status

	end
	close c_envio
	deallocate c_envio
end
