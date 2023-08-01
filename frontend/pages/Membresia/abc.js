
import React, { useState, useEffect } from "react";
import { Box, Button, Grid, Step, StepLabel, Stepper, TextField, FormControl, FormLabel, FormControlLabel, RadioGroup, Radio, Typography } from "@mui/material";
import HorizontalHeader from "../../src/components/Membresia/HeaderM";
import Autocomplete from '@mui/material/Autocomplete';
import { get, post } from '../../src/services/api';
import Consform from "../../src/components/Membresia/consform.js";
import MenuMultiSuite from "../../src/MenuMultiSuite";
import Image from "next/image";


export default function Consolidacion() {
    const steps = ['Ingrese su cedula', 'Información general', 'Datos personales', 'Deseamos identificarlo'];
    const [hobbies, setHobbies] = useState([]);
    const [selectedHobbies, setSelectedHobbies] = useState([]);
    const [open, setOpen] = useState(false);

    const handleOpenModal = () => {
        console.log('open');
        setOpen(true);
    };

    // function to handle closing the Modal
    const handleCloseModal = () => {
        setOpen(false);
    };

    const dataC = [
        { id: 1, imagen: "https://randomuser.me/api/portraits/men/1.jpg", 
        nombre: "John", apellido: "Doe", Dir_Domicilio: "123 Main St.",
        numeroDocumento: "12345678", edad: "31", estadoCivil: "Soltero",
        email: "jon@fmial.com", Cel_Personal: "098-765-4321", grupoFamiliar: "Si",
        pastor: "Pastor Bob", ccg: "Si", grupoFamiliarForm: "Si", observaciones: "Ninguna" },
        {
            "id": 2,
            "imagen": "https://randomuser.me/api/portraits/women/2.jpg",
            "nombre": "Jane",
            "apellido": "Smith",
            "Dir_Domicilio": "456 Elm St.",
            "numeroDocumento": "87654321",
            "edad": "28",
            "estadoCivil": "Casada",
            "email": "jane@example.com",
            "Cel_Personal": "012-345-6789",
            "grupoFamiliar": "No",
            "pastor": "Pastor John",
            "ccg": "No",
            "grupoFamiliarForm": "No",
            "observaciones": "Ninguna"
        },
        {
            "id": 3,
            "imagen": "https://randomuser.me/api/portraits/men/3.jpg",
            "nombre": "Michael",
            "apellido": "Johnson",
            "Dir_Domicilio": "789 Oak Ave.",
            "numeroDocumento": "98765432",
            "edad": "35",
            "estadoCivil": "Casado",
            "email": "michael@example.com",
            "Cel_Personal": "987-654-3210",
            "grupoFamiliar": "Si",
            "pastor": "Pastora Maria",
            "ccg": "Si",
            "grupoFamiliarForm": "No",
            "observaciones": "Tiene dos hijos"
            },
            {
                "id": 4,
                "imagen": "https://randomuser.me/api/portraits/women/4.jpg",
                "nombre": "Emily",
                "apellido": "Davis",
                "Dir_Domicilio": "321 Pine St.",
                "numeroDocumento": "54321678",
                "edad": "24",
                "estadoCivil": "Soltera",
                "email": "emily@example.com",
                "Cel_Personal": "876-543-2109",
                "grupoFamiliar": "No",
                "pastor": "Pastor Mark",
                "ccg": "No",
                "grupoFamiliarForm": "No",
                "observaciones": "Participa en el coro de la iglesia"
                },
                                         
    ];

    function useGetStepContent(step, formValues, handleChange) {
        const [image, setImage] = useState(null);

        const handleImageChange = (e) => {
            const file = e.target.files[0];
            if (file) {
                setImage(URL.createObjectURL(file));
            }
        };

        switch (step) {
            case 0:
                return <TextField name="numeroDocumento" value={formValues.numeroDocumento} onChange={handleChange} label="Ingrese su cedula" fullWidth sx={{ mb: 2 }} />
            case 1:
                return (
                    false ?
                        <Typography variant="h6">Ya ha llenado este documento</Typography>
                        :
                        <>
                            <Typography variant="h6">Seleccione la opción que se adapte a usted:</Typography>
                            <FormControl component="fieldset">
                                <RadioGroup aria-label="opcion" name="opcion">
                                    <FormControlLabel value="reconciliacion" control={<Radio />} label="Reconciliación" />
                                    <FormControlLabel value="primera vez" control={<Radio />} label="Acepta a Cristo por primera vez" />
                                </RadioGroup>
                            </FormControl>
                            <Typography variant="h6">¿Se bautizó el día de hoy?</Typography>
                            <FormControl component="fieldset">
                                <RadioGroup aria-label="bautizo" name="bautizo">
                                    <FormControlLabel value="si" control={<Radio />} label="Si" />
                                    <FormControlLabel value="no" control={<Radio />} label="No" />
                                </RadioGroup>
                            </FormControl>
                        </>
                );
            case 2:
                return (
                    // Add the other form fields similarly
                    <>
                        <TextField name="nombre" value={formValues.nombre} onChange={handleChange} label="Nombres completos" fullWidth sx={{ mb: 2 }} />
                        <TextField name="apellido" value={formValues.apellido} onChange={handleChange} label="Apellidos completos" fullWidth sx={{ mb: 2 }} />
                        <TextField name="Dir_Domicilio" value={formValues.Dir_Domicilio} onChange={handleChange} label="Dirección" fullWidth sx={{ mb: 2 }} />
                        <TextField name="Tel_Domicilio" value={formValues.Tel_Domicilio} onChange={handleChange} label="Teléfono" fullWidth sx={{ mb: 2 }} />
                        {/* <Autocomplete
                            multiple
                            id="tags-standard"
                            options={hobbies}
                            getOptionLabel={(option) => option.descripcion}
                            defaultValue={selectedHobbies}
                            onChange={(event, value) => setSelectedHobbies(value)}
                            renderInput={(params) => (
                                <TextField
                                    {...params}
                                    label="Hobbies"
                                    placeholder="Hobbies"
                                    sx={{ mb: 2 }}
                                />
                            )}
                        />*/}
                        <TextField name="edad" value={formValues.edad} onChange={handleChange} label="Edad" fullWidth sx={{ mb: 2 }} />
                        <TextField name="estadoCivil" value={formValues.estadoCivil} onChange={handleChange} label="Estado civil" fullWidth sx={{ mb: 2 }} />
                        <TextField name="email" value={formValues.email} onChange={handleChange} label="Correo electrónico" fullWidth sx={{ mb: 2 }} />
                        <TextField name="Cel_Personal" value={formValues.Cel_Personal} onChange={handleChange} label="Celular" fullWidth sx={{ mb: 2 }} />
                        <Typography variant="h6">¿Asiste a un grupo familiar?</Typography>
                        <FormControl component="fieldset">
                            <RadioGroup aria-label="grupoFamiliar" name="grupoFamiliar">
                                <FormControlLabel value="si" control={<Radio />} label="Si" />
                                <FormControlLabel value="no" control={<Radio />} label="No" />
                            </RadioGroup>
                        </FormControl>
                        <TextField name="pastor" value={formValues.grupoPastor} onChange={handleChange} label="Nombre del líder de grupo o pastor  (En caso de asistir a un grupo)" fullWidth sx={{ mb: 2 }} />
                        <Typography variant="h6">¿Quieres ser parte del Centro Cristiano de Guayaquil?</Typography>
                        <FormControl component="fieldset">
                            <RadioGroup aria-label="ccg" name="ccg">
                                <FormControlLabel value="si" control={<Radio />} label="Si" />
                                <FormControlLabel value="no" control={<Radio />} label="No" />
                            </RadioGroup>
                        </FormControl>
                        <Typography variant="h6">¿Quieres ser parte de un grupo familiar (grupo semanal en el cual se habla de la palabra del Señor) en el Centro Cristiano de Guayaquil?</Typography>
                        <FormControl component="fieldset">
                            <RadioGroup aria-label="grupoFamiliarForm" name="grupoFamiliarForm">
                                <FormControlLabel value="si" control={<Radio />} label="Si" />
                                <FormControlLabel value="no" control={<Radio />} label="No" />
                            </RadioGroup>
                        </FormControl>
                        <TextField name="observaciones" value={formValues.observaciones} onChange={handleChange} label="Observaciones" fullWidth sx={{ mb: 2 }} />
                    </>
                );
            case 3:
                return <Box display="flex" flexDirection="column" alignItems="center">
                    {
                        formValues.imagen ?
                            <Image layout='fill'
                                src={formValues.imagen}
                                alt="preview"
                                style={{ marginBottom: '20px', width: '200px', borderRadius: '10px', boxShadow: '0 0 10px rgba(0,0,0,0.1)' }} />
                            : image && <Image layout='fill'
                                src={image}
                                alt="preview"
                                style={{ marginBottom: '20px', width: '200px', borderRadius: '10px', boxShadow: '0 0 10px rgba(0,0,0,0.1)' }} />

                    }
                    <Button variant="contained" component="label">
                        Subir una imagen
                        <input type="file" hidden onChange={handleImageChange} />
                    </Button>
                </Box>;
            default:
                return 'Finalizado';
        }
    }
    const [activeStep, setActiveStep] = useState(0);
    const [formValues, setFormValues] = useState({});
    const [userFound, setUserFound] = useState(false);

    const handleChange = (event) => {
        setFormValues(prevValues => ({
            ...prevValues,
            [event.target.name]: event.target.value
        }));
    };

    const handleNext = async () => {
        const personaData = {
            Nombres: formValues.nombre,
            Apellidos: formValues.apellido,
            Fecha_Nac: formValues.fecha_nacimiento,
            Direccion: formValues.Dir_Domicilio,
            Telefono: formValues.Tel_Domicilio,
            Email: formValues.email,
            Foto: formValues.Foto,
            Identificacion: formValues.numero_documento,
            Tipo_Identifiicacion: formValues.tipo_documento,
            Sexo: formValues.sexo,
            EstadoCivil: formValues.estado_civil,
            Fecha_Ingreso_Registro: formValues.fecha_ingreso,
            Consolidacion: formValues.estado,
            EsBautizado: '1'
        };

        if (activeStep === steps.length - 1) {
            try {
                await post('/consolidacion/personas', personaData);
                setFormValues({});
                setActiveStep(0);
            } catch (error) {
                console.error(error);
            }
        } else {
            setActiveStep((prevActiveStep) => prevActiveStep + 1);
        }
    };

    const handleBack = () => {
        setActiveStep((prevActiveStep) => prevActiveStep - 1);
    };

    useEffect(() => {
        get('/consolidacion/hobbies')
            .then(response => {
                setHobbies(response);
            })
            .catch(error => {
                console.error('There was an error!', error);
            });
        if (formValues.numeroDocumento) {
            const match = dataC.find(item => item.numeroDocumento === formValues.numeroDocumento);
            if (match) {
                setUserFound(true);
                setFormValues(match);
            }

        }
    }, [formValues.numeroDocumento]);


    return (
        <>
            <MenuMultiSuite header = {1}/>
            <Box display="flex" justifyContent="center" pt='2rem'>
                <h1>Consolidación</h1>
                <Button
                    variant="contained"
                    color="primary"
                    onClick={handleOpenModal}
                    sx={{ ml: 2 }}
                />
            </Box>
            <Box >
                <Stepper activeStep={activeStep} sx={{ margin: "40px" }}>
                    {steps.map((label) => (
                        <Step key={label}>
                            <StepLabel>{label}</StepLabel>
                        </Step>
                    ))}
                </Stepper>
                <Box sx={{ width: '100%', p: 2 }}>
                    {useGetStepContent(activeStep, formValues, handleChange)}
                    <Box sx={{ display: 'flex', justifyContent: 'space-between', mt: 2 }}>
                        <Button disabled={activeStep === 0} onClick={handleBack}>Back</Button>
                        <Button variant="contained" onClick={handleNext}>
                            {activeStep === steps.length - 1 ? 'Finish' : 'Next'}
                        </Button>
                    </Box>
                </Box>
            </Box>
            {open && <Consform isOpen={open} handleClose={handleCloseModal} />}
        </>
    );
}

