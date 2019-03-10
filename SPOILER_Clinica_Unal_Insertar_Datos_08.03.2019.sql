--*******************************LLENANDO LA TABLA DE ESPECIALIDADES***************************
INSERT cgalvisn.especialidadesDisp_g12 VALUES ('endocrinologia') 
INSERT cgalvisn.especialidadesDisp_g12 VALUES ('otirronaringologia')
INSERT cgalvisn.especialidadesDisp_g12 VALUES ('urologia')
INSERT cgalvisn.especialidadesDisp_g12 VALUES ('dermatologia')
INSERT cgalvisn.especialidadesDisp_g12 VALUES ('cardiologia')
INSERT cgalvisn.especialidadesDisp_g12 VALUES ('neumologia')
INSERT cgalvisn.especialidadesDisp_g12 VALUES ('ortopedia y traumatologia')
INSERT cgalvisn.especialidadesDisp_g12 VALUES ('gastroenterologia')
insert cgalvisn.especialidadesDisp_g12 values('medicina general')
insert cgalvisn.especialidadesDisp_g12 values('ginecologia')
insert cgalvisn.especialidadesDisp_g12 values('nutricion y dietetica')
insert cgalvisn.especialidadesDisp_g12 values('odontologia' )
insert cgalvisn.especialidadesDisp_g12 values('optometria' )
insert cgalvisn.especialidadesDisp_g12 values('oftalmologia' )
insert cgalvisn.especialidadesDisp_g12 values('pediatria' )
insert cgalvisn.especialidadesDisp_g12 values('psicologia' )
insert cgalvisn.especialidadesDisp_g12 values('terapia ocupacional' )

 
insert edificio_g12 values ('Ed. Dolly M', 'cr100 no 73', 1);

insert paciente_g12 values ('Kaneki', 'Ken', 'cc', 1010038258, 1/*IDP*/, 0/*tienemulta?*/, 3543723, 3124110389, 'cr112', 'hombre', 'Cafesalud', 1/*hospitalizacion?*/, 1/*aislamiento?*/,18/*edad*/)
insert paciente_g12 values ('Midoriya', 'Izuku', 'cc', 1010038259, 2, 0, 4762936, 3107799062,'cr113', 'hombre', 'Saludcop', 1, 0,18)
insert paciente_g12 values ('Arima', 'Kishou', 'cc', 1010038257, 3, 0, 4582723, 3204238131,'cr142', 'hombre', 'Hospital Touhou', 0, 0, 28)
insert paciente_g12 values ('Asuna', 'Yuki', 'cc', 1010038256, 4, 0, 6962498, 3128305386, 'Casa de Andres', 'mujer', 'compensar', 0, 0, 18)

insert habitacion_g12 values (1/*IDH*/, 1/*IDC*/,null/*idp1*/, null/*ip2*/, null/*idp3*/, null/*ip4*/,1/*habilitada?*/,1/*ocupada?*/);

insert consultorio_g12 values (1/*idc*/, 1/*ide*/, 1/*disponible?*/, 1/*apto?*/, 'urologia');
insert consultorio_g12 values (2, 1, 1, 1, 'cardiologia');

insert medico_g12 values ('kirigaya', 'Kazuto', 1/*IDM*/, 1010038,'cc',3129840689, 4263667,0/*amonestaciones*/,'cr312','Cafesalud', 21, 1/*IDCo*/)
insert medico_g12 values ('kirigayito', 'Kazutoyito', 2, 1010039,'cc',3124110, 354723,0,'tokyo','Famisanar', 21, 2)

insert cita_g12 values (2/*IDC*/,1/*IDM*/,1/*IDP*/,1/*IDCo*/, '2019-01-19', '12:34:54.1237'/*Inicio*/,'12:34:54.1238'/*final*/,3000/*costo*/,0/*AsiteP*/,0/*fuerza>P*/,0/*Multa?*/,0/*multa*/,0/*AsisteM*/,0/*Fuerza>M*/,0/*Hospitalizar?*/)
insert cita_g12 values (3,1,1,1, '2019-01-19', '14:34:54.1237','16:34:54.1238',0,0,0,0,0,0,0,1)
insert cita_g12 values (1,1,2,2, '2019-01-19', '12:34:54.1237','12:34:54.1238',0,0,0,0,0,0,0,1)
insert cita_g12 values (4,1,3,1, '2019-01-19', '12:34:54.1237','12:34:54.1238',0,0,0,0,0,0,0,1)
insert cita_g12 values (5,1,4,1, '2019-01-19', '12:34:54.1237','12:34:54.1238',0,0,0,0,0,0,0,1)
insert cita_g12 values (2,1,1,2, '2019-01-19', '12:34:54.1237','12:34:54.1238',0,0,0,0,0,0,0,0)