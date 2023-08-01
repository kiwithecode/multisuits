import React from 'react';
import {Typography, Grid} from "@mui/material";
import {Edit} from "@mui/icons-material";

function DatosConsagracion(user) {
    return (
        <Grid container spacing={3}>
            <Grid item lg={6} sm={6} xs={6}>
                <Typography variant="body1" sx={{ mb: 2 }} className="m-0">
                    <strong>Fecha de bautismo</strong>
                </Typography>
                <Typography variant="body1" sx={{ mb: 2 }}>
                    {user.fechaBautismo}<Edit className="m-0 ml-5" sx={{ width: 20, height: 20, mb: 2 }}/>
                </Typography>
                <Typography variant="body1" sx={{ mb: 2 }} className="m-0">
                    <strong>Fecha de conversión</strong>
                </Typography>
                <Typography variant="body1" sx={{ mb: 2 }}>
                    {user.fechaConversion}<Edit className="m-0 ml-5" sx={{ width: 20, height: 20, mb: 2 }}/>
                </Typography>
                <Typography variant="body1" sx={{ mb: 2 }} className="m-0">
                    <strong>Fecha de ingreso</strong>
                </Typography>
                <Typography variant="body1" sx={{ mb: 2 }}>
                    {user.fechaIngreso}<Edit className="m-0 ml-5" sx={{ width: 20, height: 20, mb: 2 }}/>
                </Typography>
            </Grid>
            <Grid item lg={6} sm={6} xs={6}>
                <Typography variant="body1" sx={{ mb: 2 }} className="m-0">
                    <strong>Profesión</strong>
                </Typography>
                <Typography variant="body1" sx={{ mb: 2 }}>
                    {user.profesion}<Edit className="m-0 ml-5" sx={{ width: 20, height: 20, mb: 2 }}/>
                </Typography>
                <Typography variant="body1" sx={{ mb: 2 }} className="m-0">
                    <strong>Lugar de trabajo</strong>
                </Typography>
                <Typography variant="body1" sx={{ mb: 2 }}>
                    {user.lugarTrabajo}<Edit className="m-0 ml-5" sx={{ width: 20, height: 20, mb: 2 }}/>
                </Typography>
            </Grid>
        </Grid>
    );
}

export default DatosConsagracion;