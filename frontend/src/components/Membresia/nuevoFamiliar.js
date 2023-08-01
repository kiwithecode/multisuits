import React, { useEffect, useRef } from 'react';
import { TextField, Select, MenuItem, Box, Modal, Grid, IconButton, InputAdornment, Checkbox, FormControlLabel, Accordion, AccordionSummary, AccordionDetails, Button } from '@mui/material';
import { DateTimePicker, DatePicker, LocalizationProvider } from '@mui/x-date-pickers';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';
import HorizontalHeader from './HeaderM';
import Autocomplete from '@mui/material/Autocomplete';
import { get, post } from '../../services/api'
import Swal from "sweetalert2";
import SearchIcon from '@mui/icons-material/Search';
import AlertTitle from '@mui/material/AlertTitle';
import { Alert } from "@mui/material";
import dayjs, { Dayjs } from 'dayjs';
import Image from "next/image";


export default function NuevoFamiliar({ isOpen, handleClose, idPersona1 }) {
    const formRef = useRef();
    const [open, setOpen] = React.useState(false);
    const [userExists, setUserExists] = React.useState(false);
    const [lideres, setLideres] = React.useState([]);
    const [selectedImage, setSelectedImage] = React.useState(null);
    const [alert, setAlert] = React.useState(null);
    const [expanded, setExpanded] = React.useState(false);
    const [relaciones, setRelaciones] = React.useState([]);
    const [formValues, setFormValues] = React.useState({
        ide: '',
        NombresCompletos: '',
        idRelacion: '',
    });

    const handleChange =
        (panel) => (event, isExpanded) => {
            setExpanded(isExpanded ? panel : false);
        };

    const handleInputChange = (event) => {
        setFormValues({
            ...formValues,
            [event.target.name]: event.target.value
        });
    };

    const handleImageChange = (event) => {
        const file = event.target.files[0];

        if (file) {
            const reader = new FileReader();
            reader.onload = () => {
                setSelectedImage(reader.result);
            };
            reader.readAsDataURL(file);
        }
    };

    const style = {
        position: 'absolute',
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        width: '50%', // set the width to be responsive
        bgcolor: 'background.paper',
        border: '2px solid #000',
        boxShadow: 24,
        pt: 2,
        px: 4,
        pb: 3,
        maxHeight: '80vh', // set the maximum height of the modal to be 90% of the viewport height
        overflowY: 'auto', // add a scrollbar if the content exceeds the height of the modal
    };

    //function to check if user exists
    const checkUser = async () => {
        //call API to check if user exists with get

        const userExists = await get('/consolidacion/getPersonaByCED/' + formValues.ide);
        setUserExists(userExists);
        console.log(userExists);
        if (userExists == "Persona no encontrada") {
            setAlert(
                {
                    type: 'error',
                    title: 'La persona no existe, por favor regístrela',

                }
            );
        } else {
            setAlert(
                {
                    type: 'success',
                    title: 'Persona encontrada',
                }
            );
            //set values to form
            setFormValues({
                ...formValues,
                NombresCompletos: userExists.Nombres + ' ' + userExists.Apellidos,
            });

            const birthdate = dayjs(userExists.Fecha_Nac);
            const baptismdate = dayjs(userExists.FechaBautizo);
        }


    };
    useEffect(() => {
        setOpen(isOpen);
        //call API to get all leaders
        const getrelaciones = async () => {
            const response = await get('/consolidacion/getRelaciones');
            setRelaciones(response);
        }
        getrelaciones();
    }, [isOpen]);

    const handleSubmit = (event) => {
        event.preventDefault();
        if (formRef.current.reportValidity()) {
            Swal.fire({
                title: '¿Está seguro?',
                text: "Se guardará la información en la base de datos",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sí',
                cancelButtonText: 'No'
            }).then((result) => {
                if (result.isConfirmed) {
                    const sendValues = {
                        idPersona1: idPersona1,
                        idPersona2: formValues.ide,
                        idRelacion: formValues.idRelacion,
                    }
                    const saveData = async () => {
                        try {
                            const response = await post('/consolidacion/addRelacion', sendValues);
                            console.log(response);
                            //delete data from form
                            setFormValues({
                                ide: '',
                                NombresCompletos: '',
                                idRelacion: '',
                            });
                            setAlert({
                                type: "success",
                                title: "¡Se ha guardado la información correctamente!"
                            });
                            //reload after 2 seconds

                            //handleClose();
                        }
                        catch (error) {
                            console.log(error);
                            setAlert({
                                type: "error",
                                title: "No se ha podido guardar la información",
                            });
                        }
                    }
                    saveData();
                }
            })
        } else {
            setAlert({
                type: "error",
                title: "Por favor llene todos los campos requeridos"
            });
        }
    };
    return (
        <>
            <Modal
                open={open}
                onClose={handleClose}
                aria-labelledby="modal-modal-title"
                aria-describedby="modal-modal-description"
            >
                <Box
                    sx={style}
                >
                    <Box display="flex" justifyContent="center">
                        <h3>Agregar familiar</h3>
                    </Box>
                    <Box
                        display="flex"
                        justifyContent="center"
                        alignItems="center"
                        flexDirection="column"
                        p={1}
                    >
                        <form
                            ref={formRef}
                            onSubmit={handleSubmit}

                        >

                            <Grid container spacing={3}>
                                <Grid item xs={12}>
                                    <Box mb={0}
                                        borderTop={1}
                                        margin={0}
                                        padding={0}
                                        display={{ xs: 'none', sm: 'flex' }}
                                        alignItems="flex-end"
                                        justifyContent="flex-end"
                                        fontSize={12}
                                    >
                                        <span
                                            style={{ color: 'red' }}
                                        >* </span> Información obligatoria
                                    </Box>
                                    <Box mb={2}

                                        backgroundColor="grey.300"
                                    >
                                        <h5>Datos del familiar</h5>
                                    </Box>
                                </Grid>
                                <Grid item xs={6}>
                                    <Box mb={2}>
                                        <TextField
                                            name="ide"
                                            label="Cédula del familiar"
                                            required
                                            value={formValues.ide || ''}
                                            onChange={handleInputChange}
                                            fullWidth
                                            InputProps={{
                                                endAdornment: (
                                                    <InputAdornment position="end">
                                                        <IconButton onClick={checkUser} variant="contained" color="primary">
                                                            <SearchIcon />
                                                        </IconButton>
                                                    </InputAdornment>
                                                ),
                                            }}
                                        />
                                    </Box>
                                </Grid>
                                <Grid item xs={6} display={{ xs: 'none', sm: 'flex' }}>
                                    <Box >
                                        {alert && (
                                            <Alert severity={alert.type}>
                                                <AlertTitle>{alert.title}</AlertTitle>
                                                {alert.text}
                                            </Alert>
                                        )}
                                    </Box>
                                </Grid>


                            </Grid>
                            <Grid container spacing={3}>
                                <Grid item xs={6}>
                                    <TextField name="nombre"
                                        label="Nombres Completos" value={formValues.NombresCompletos || ''
                                        } onChange={handleInputChange} fullWidth
                                        disabled
                                    />
                                </Grid>
                                <Grid item xs={6}>
                                    <TextField name="idRelacion"
                                        label="Relación" value={formValues.idRelacion || ''} onChange={handleInputChange}
                                        select
                                        required
                                        fullWidth >
                                        {relaciones.map((option) => (
                                            <MenuItem key={option.id} value={option.id}>
                                                {option.Descripcion}
                                            </MenuItem>
                                        ))}
                                    </TextField>
                                </Grid>
                            </Grid>

                            <Button type="submit"
                                style={{ marginTop: 10 }}
                                variant="contained"
                                onClick={handleSubmit}

                            >Enviar</Button>
                        </form>
                    </Box>
                </Box>
            </Modal>
        </>
    );
}