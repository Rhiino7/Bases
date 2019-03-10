select * from cgalvisn.especialidadesDisp_g12
select * from cgalvisn.edificio_g12
select * from cgalvisn.paciente_g12
select * from cgalvisn.habitacion_g12
select * from cgalvisn.consultorio_g12
select * from cgalvisn.medico_g12
select * from cgalvisn.cita_g12

/************************************************************VISTAS**************************************************************/

/*************************************************************VISTAS DE PACIENTE***********************************************/

DROP VIEW paciente_a_sus_datos
DROP VIEW paciente_a_medico
DROP VIEW paciente_a_citas
drop view faltasPacientes

CREATE VIEW paciente_a_sus_datos as 
select * from paciente_g12

CREATE VIEW paciente_a_medico as
select medico_g12.nombre, medico_g12.apellido, medico_g12.tipoDocumento, medico_g12.documento, medico_g12.IDM /*,medico_g12.horario*/,medico_g12.IDCo, consultorio_g12.especialidad
from medico_g12, consultorio_g12
where medico_g12.IDCo = consultorio_g12.IDCo

CREATE VIEW paciente_a_citas as 
select cita_g12.IDC, cita_g12.fecha, cita_g12.horaI, cita_g12.horaF, edificio_g12.nombre Nom_Edificio, edificio_g12.direccion, edificio_g12.IDE, consultorio_g12.IDCo, consultorio_g12.especialidad, medico_g12.nombre, medico_g12.apellido, medico_g12.IDM, cita_g12.IDP 
from medico_g12, consultorio_g12, edificio_g12, cita_g12
where medico_g12.IDCo = consultorio_g12.IDCo and consultorio_g12.IDco = cita_g12.IDco and edificio_g12.IDE = consultorio_g12.IDE --and cita_g12.IDP = IDP

create view faltasPacientes as select cgalvisn.cita_g12.IDC, cgalvisn.cita_g12.IDP, cgalvisn.paciente_g12.nombre,cgalvisn.paciente_g12.apellido,cgalvisn.cita_g12.fecha,cgalvisn.cita_g12.horaI 
from cgalvisn.cita_g12,cgalvisn.paciente_g12
where cgalvisn.cita_g12.IDP = cgalvisn.paciente_g12.IDP and cgalvisn.cita_g12.asisteP = 0     


/**************************USANDO LAS VISTAS DE PACIENTE*********************************/
select * from paciente_a_sus_datos
where paciente_a_sus_datos.IDP = IDP

select * from paciente_a_medico

select * from paciente_a_citas 
where paciente_g12.IDP = IDP 

--IDP es la identificacion del paciente que quiere ver la informacion 


/*************************************************************VISTAS DE MEDICO*************************************************/
DROP VIEW medico_a_paciente
drop view medico_a_sus_datos
drop view medico_a_citas
drop view faltasMedicos

CREATE VIEW medico_a_paciente as
select paciente_g12.nombre, paciente_g12.apellido, paciente_g12.tipoDoc, paciente_g12.documento, paciente_g12.IDP, paciente_g12.genero, paciente_g12.eps, paciente_g12.hospitalizacion, paciente_g12.aislamiento, paciente_g12.edad, habitacion_g12.IDH, medico_g12.IDM 
from paciente_g12, medico_g12, consultorio_g12, cita_g12, habitacion_g12
where medico_g12.IDCo = consultorio_g12.IDCo and consultorio_g12.IDco = cita_g12.IDco and cita_g12.IDP = paciente_g12.IDP and (paciente_g12.IDP = habitacion_g12.IDP1 or paciente_g12.IDP = habitacion_g12.IDP2 or paciente_g12.IDP = habitacion_g12.IDP3 or paciente_g12.IDP = habitacion_g12.IDP4)

CREATE VIEW medico_a_sus_datos as
select medico_g12.nombre, medico_g12.apellido, medico_g12.IDM, medico_g12.documento, medico_g12.tipoDocumento, medico_g12.celular, medico_g12.telefono /*, medico_g12.horario*/, medico_g12.amonestaciones, medico_g12.direccion, medico_g12.eps, medico_g12.edad, medico_g12.IDCo, consultorio_g12.especialidad
from medico_g12, consultorio_g12
where medico_g12.IDCo = consultorio_g12.IDCo

CREATE VIEW medico_a_citas as 
select cita_g12.IDC, cita_g12.fecha, cita_g12.horaI, cita_g12.horaF, edificio_g12.nombre x, edificio_g12.direccion, edificio_g12.IDE, consultorio_g12.IDCo, consultorio_g12.especialidad, paciente_g12.nombre, paciente_g12.apellido, paciente_g12.IDP, cita_g12.IDM 
from medico_g12, consultorio_g12, edificio_g12, cita_g12, paciente_g12 
where paciente_g12.IDP = cita_g12.IDP and consultorio_g12.IDco = cita_g12.IDco and edificio_g12.IDE = consultorio_g12.IDE  --and cita_g12.IDP = IDP

create view faltasMedicos as select cgalvisn.cita_g12.IDC, cgalvisn.cita_g12.IDM, cgalvisn.medico_g12.nombre, cgalvisn.medico_g12.apellido,cgalvisn.cita_g12.fecha,cgalvisn.cita_g12.horaI 
from cgalvisn.cita_g12,cgalvisn.medico_g12
where cgalvisn.cita_g12.IDM = cgalvisn.medico_g12.IDM and cgalvisn.cita_g12.asisteM = 0     


/**************************USANDO LAS VISTAS DE MEDICO************************************/

select * from medico_a_paciente 
where medico_a_paciente.IDM = IDM

select * from medico_a_sus_datos
where medico_a_sus_datos.IDM = IDM

select * from medico_a_citas
where medico_a_citas_g12.IDM = IDM --IDM es la identificacion del medico que quiere ver la informacion    

select * from faltasMedicos


/**************************VISTAS CONSULTORIO************************************/
drop view todos_a_consultorio

CREATE VIEW todos_a_consultorio as 
select * from consultorio_g12


/**************************VISTAS USANDO CONSULTORIO************************************/
select * from todos_a_consultorio


/*******************************DROPEADO DE TODO***********************************/
DROP VIEW paciente_a_sus_datos
DROP VIEW paciente_a_medico
DROP VIEW paciente_a_citas
drop view faltasPacientes
DROP VIEW medico_a_paciente
drop view medico_a_sus_datos
drop view medico_a_citas
drop view faltasMedicos
drop view todos_a_consultorio
