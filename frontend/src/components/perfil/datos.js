import React from 'react';
import {Typography, Grid} from "@mui/material";
import {Delete, Edit} from '@mui/icons-material';
function Datos(user) {
    return (
        <Grid container spacing={3}>
            <Grid item lg={6} sm={6} xs={6}>
                <Typography variant="body1" sx={{ mb: 2 }} className="m-0">
                    <strong>Sexo</strong>
                </Typography>
                <Typography variant="body1" sx={{ mb: 2 }}>
                    {user.sexo}
                    <Edit className="m-0 ml-5" sx={{ width: 20, height: 20, mb: 2 }}/>
                </Typography>
                <Typography variant="body1" sx={{ mb: 2 }} className="m-0">
                    <strong>Estado civil</strong>
                </Typography>
                <Typography variant="body1" sx={{ mb: 2 }}>
                    {user.estadoCivil} <Edit className="m-0 ml-5" sx={{ width: 20, height: 20, mb: 2 }}/>
                </Typography>
                <Typography variant="body1" sx={{ mb: 2 }} className="m-0">
                    <strong>Número de Cédula</strong>
                </Typography>
                <Typography variant="body1" sx={{ mb: 2 }}>
                    {user.numeroDocumento} <Edit className="m-0 ml-5" sx={{ width: 20, height: 20, mb: 2 }}/>
                </Typography>
            </Grid>
            <Grid item lg={6} sm={6} xs={6}>
                <Typography variant="body1" sx={{ mb: 2 }} className="m-0">
                    <strong>Pastor</strong>
                </Typography>
                <Typography variant="body1" sx={{ mb: 2 }}>
                    {user.pastor}<Edit className="m-0 ml-5" sx={{ width: 20, height: 20, mb: 2 }}/>
                </Typography>
                <Typography variant="body1" sx={{ mb: 2 }} className="m-0">
                    <strong>Dirección</strong>
                </Typography>
                <Typography variant="body1" sx={{ mb: 2 }}>
                    {user.Dir_Domicilio}<Edit className="m-0 ml-5" sx={{ width: 20, height: 20, mb: 2 }}/>
                </Typography>
                <Typography variant="body1" sx={{ mb: 2 }} className="m-0">
                    <strong>Fecha de nacimiento</strong>
                </Typography>
                <Typography variant="body1" sx={{ mb: 2 }}>
                    {user.fechaNacimiento}<Edit className="m-0 ml-5" sx={{ width: 20, height: 20, mb: 2 }}/>
                </Typography>
            </Grid>
        </Grid>
    );
}

export default Datos;