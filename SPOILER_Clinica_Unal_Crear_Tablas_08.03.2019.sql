profesor.ver_objetos --EJECUTAR PARA VER LAS TABLAS Y VISTAS CREADAS

create table especialidadesDisp_g12(
especialidad varchar (40)	primary key	not null,
);

create table edificio_g12(
nombre					varchar(20)							not null,
direccion				varchar(30)							not null,
IDE						int				primary key			not null,
);

create table paciente_g12(
nombre				varchar(20)								not null,
apellido			varchar(20)								not null,
tipoDoc				varchar(10)								not null,
documento			int							unique		not null,
IDP					int				primary key				not null,
Tienemulta		    bit											null,
telefono			bigint											null,
celular				bigint											null,
direccion			varchar(30)									null,
genero				varchar(10)								not null,
eps					varchar(20)								null,
hospitalizacion		bit										not null,
aislamiento			bit										not null,
edad				int										not null,
);

create table habitacion_g12(
IDH         int					primary key					not null,
IDE			int	    FOREIGN KEY REFERENCES cgalvisn.edificio_g12(IDE),
IDP1		int		unique FOREIGN KEY REFERENCES cgalvisn.paciente_g12(IDP) null,
IDP2		int		unique FOREIGN KEY REFERENCES cgalvisn.paciente_g12(IDP) null,
IDP3		int		unique FOREIGN KEY REFERENCES cgalvisn.paciente_g12(IDP) null,
IDP4		int		unique FOREIGN KEY REFERENCES cgalvisn.paciente_g12(IDP) null,
habilitada	bit										not null,
ocupado		bit										not null,
);

create table consultorio_g12(
IDCo		int		primary key										not null,
IDE			int	    FOREIGN KEY REFERENCES cgalvisn.edificio_g12(IDE)	,
disponible  bit														not null,
apto		bit														not null,
especialidad varchar(40) FOREIGN KEY REFERENCES cgalvisn.especialidadesDisp_g12(especialidad)
);

create table medico_g12(
nombre					varchar(20)							not null,
apellido				varchar(20)							not null,
IDM						int				primary key			not null,
documento				int				unique				not null,
tipoDocumento			varchar(20)							not null,
celular					int									not null,
telefono				int									not null,
amonestaciones			int				default 0			not null,
direccion				varchar(20)							not null,
eps						varchar(20)							not null,
edad					int									not null,
IDCo int	       FOREIGN KEY REFERENCES cgalvisn.consultorio_g12(IDCo)/*,(cgalvisn.medico_g12(horario)) idea de carlos que no esten en el mismo consultorio ni en el mismo horario al mismo tiempo*/
);

create table cita_g12(
IDC     int						not null,
IDM int	FOREIGN KEY REFERENCES cgalvisn.medico_g12(IDM),
IDP int FOREIGN KEY REFERENCES cgalvisn.paciente_g12(IDP),
IDCo int FOREIGN KEY REFERENCES cgalvisn.consultorio_g12(IDCo),
fecha date								not null,
horaI time							not null check (horaI between '06:00:00.0000' and '22:20:00.0000'),
horaF time							not null check (horaI between '06:20:00.0000' and '22:40:00.0000'),/*Nuevas restricciones para cumplir el requisito  63, revisar si funciona*/
costo bigint			default 0   not null,
asisteP bit                 null,			/*Se deja en null si aun no llega la fecha de la cita, */
fuerzaMP bit						 null,  /*Se retiro atributos multa bit y dinero multa big int, se agregara multa a paciente para solucionar eso*/
asisteM	bit				    null,
fuerzaMM bit						 null, /*Se deja en null si ambos asisten, */
hospitalizar bit		default 0	not null,
completada bit          null, /*Nuevos atributo, diferencia una cita que ya se hizo de una que no, revisar y cambiar todos los datos relacionados con cita */
cancelada bit           null, /*Nuevo atributo,Requisito 78*/
 primary key (fecha,horaI,IDCo)
);

drop table cgalvisn.cita_g12
drop table cgalvisn.medico_g12
drop table cgalvisn.consultorio_g12
drop table cgalvisn.especialidadesDisp_g12
drop table cgalvisn.habitacion_g12
drop table cgalvisn.edificio_g12
drop table cgalvisn.paciente_g12