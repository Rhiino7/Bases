--ESTO CAMBIA EL ESTADO DE HOSPITALIZACION DEL PACIENTE Y SE USA JUNTO A LA DE ABAJO
--LAS COMILLAS SIMPLES REPRESENTAN LO QUE DEBEMOS CAMBIAR MANUALMENTE 
UPDATE cgalvisn.paciente_g12
set hospitalizacion = 1 from cgalvisn.paciente_g12, cgalvisn.cita_g12 
where (paciente_g12.IDP = cita_g12.IDP) and (cita_g12.hospitalizar = 1) and (paciente_g12.IDP = 4/*IDP*/) and (cita_g12.IDC = 5/*IDC*/)

--EN CASO DE QUE NO REQUIERA AISLAMIENTO
UPDATE cgalvisn.habitacion_g12
set IDP/*n*/ = /*IDP*/ from cgalvisn.habitacion_g12, cgalvisn.paciente_g12
where cgalvisn.habitacion_g12.IDH =/*IDH*/ and cgalvisn.habitacion_g12.ocupado = 0 and cgalvisn.paciente_g12.IDP =/*IDP*/ and cgalvisn.paciente_g12.hospitalizacion = 1 and 
cgalvisn.paciente_g12.aislamiento = 0

--EN CASO DE QUE REQUIERA AISLAMIENTO
UPDATE cgalvisn.habitacion_g12
set IDP1 = /*IDP*/, ocupado = 1 from cgalvisn.habitacion_g12, cgalvisn.paciente_g12
where cgalvisn.habitacion_g12.IDH =/*IDH*/ and cgalvisn.habitacion_g12.ocupado = 0 and cgalvisn.paciente_g12.IDP =/*IDP*/ and cgalvisn.paciente_g12.hospitalizacion = 1 and cgalvisn.paciente_g12.aislamiento = 1

--CAMBIA LAS AMONESTACIONES DEL MEDICO
UPDATE cgalvisn.medico_g12  
set	amonestaciones += 1 from cgalvisn.medico_g12, cgalvisn.cita_g12
where cgalvisn.medico_g12.IDM = /*IDM*/ and cgalvisn.cita_g12.IDC = /*IDC*/ and cgalvisn.cita_g12.asisteM = 0 and cgalvisn.cita_g12.fuerzaMM=0;

--Update cuando el paciente asiste
UPDATE cgalvisn.cita_g12
set asisteP = 1 
where cgalvisn.cita_g12.IDP = /*IDP donde el medico dice que llego el cabrón :)*/

--Update cuando el paciente debe una multa

--Update de cambiar habilitacion y ocupado de habitacion

--Update de cambiar disponible y apto de consultorio