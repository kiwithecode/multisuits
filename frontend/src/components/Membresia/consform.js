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

export default function Consform({ isOpen, handleClose }) {
    const formRef = useRef();
    const [open, setOpen] = React.useState(false);
    const [userExists, setUserExists] = React.useState(false);
    const [lideres, setLideres] = React.useState([]);
    const [selectedImage, setSelectedImage] = React.useState(null);
    const [alert, setAlert] = React.useState(null);
    const [expanded, setExpanded] = React.useState(false);
    const [formValues, setFormValues] = React.useState({
        tipoIde: '',
        ide: '',
        nombre: '',
        apellido: '',
        estadoCivil: '',
        genero: '',
        fechaNac: null,
        Dir_Domicilio: '',
        Dir_Trabajo: '',
        Tel_Domicilio: '',
        Tel_Trabajo: '',
        Correo_Personal: '',
        asisteGrupo: '',
        lider: '',
        quiereParteCCG: '',
        quiereParteGrupo: '',
        comentarios: '',
        elija: '',
        seBautizo: '',
        profesion: '',
        fechaBautismo: null,
        Foto: null,
        Cel_Personal: '',
        Cel_Trabajo: '',
        Correo_Trabajo: '',
    });

    const handleChange =
        (panel) => (event, isExpanded) => {
            setExpanded(isExpanded ? panel : false);
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

    const buscarTelefono = (params, tipoBuscado) => {
        // Verificar si existen las propiedades necesarias
        if (params.contactos?.length) {
            // Recorrer el array de contactos
            for (var i = 0; i < params.contactos.length; i++) {
                var contacto = params.contactos[i];

                // Verificar si el tipo de teléfono coincide
                if (contacto.contacto_tipo === tipoBuscado) {
                    return contacto.Valor;
                }
            }
        }
        return null; // Si no se encuentra el tipo de teléfono
    }

    const style = {
        position: 'absolute',
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        width: '90%', // set the width to be responsive
        bgcolor: 'background.paper',
        border: '2px solid #000',
        boxShadow: 24,
        pt: 2,
        px: 4,
        pb: 3,
        maxHeight: '90vh', // set the maximum height of the modal to be 90% of the viewport height
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
                    type: 'info',
                    title: 'Persona no encontrada',

                }
            );
        } else {
            setAlert(
                {
                    type: 'success',
                    title: 'Persona encontrada',
                }
            );

            const birthdate = dayjs(userExists.Fecha_Nac);
            const baptismdate = dayjs(userExists.FechaBautizo);
            setFormValues({
                ...formValues,
                tipoIde: userExists.Tipo_Identificacion,
                ide: userExists.Identificacion,
                nombre: userExists.Nombres,
                apellido: userExists.Apellidos,
                estadoCivil: userExists.EstadoCivil,
                genero: userExists.Sexo,
                Dir_Domicilio: userExists.Dir_Domicilio,
                fechaNac : birthdate,
                seBautizo: userExists.EsBautizado ? 'SI' : 'NO',
                fechaBautismo: baptismdate,
                asisteGrupo: userExists.PerteneceGrupoFamiliar ? 'SI' : 'NO',
                profesion: userExists.profesion,
                Correo_Personal: userExists.Correo_Personal,
                Tel_Domicilio: userExists.Tel_Domicilio,
                Cel_Personal: userExists.Cel_Personal,
                Cel_Trabajo: userExists.Cel_Trabajo,
                Correo_Trabajo: userExists.Correo_Trabajo,
                Dir_Trabajo: userExists.Dir_Trabajo,
                Tel_Trabajo: userExists.Tel_Trabajo,

            });
        }


    };

    useEffect(() => {
        setOpen(isOpen);
        //call API to get all leaders
        const getLideres = async () => {
            const response = await get('/consolidacion/lideres');
            setLideres(response);
        }
        getLideres();
    }, [isOpen]);


    const handleInputChange = (event) => {
        setFormValues({
            ...formValues,
            [event.target.name]: event.target.value
        });
    };

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
                        Identificacion: formValues.ide,
                        Tipo_Identificacion: formValues.tipoIde,
                        Fecha_Nac: formValues.fechaNac,
                        Nombres: formValues.nombre,
                        Foto: formValues.Foto,
                        Apellidos: formValues.apellido,
                        Sexo: formValues.genero,
                        EstadoCivil: formValues.estadoCivil,
                        Zona: formValues.Dir_Domicilio,
                        EsBautizado: formValues.seBautizo === 'SI' ? true : false,
                        PerteneceGrupoFamiliar: formValues.asisteGrupo === 'SI' ? true : false,
                        Dir_Domicilio: formValues.Dir_Domicilio,
                        profesion: formValues.profesion,
                        Dir_Trabajo: formValues.Dir_Trabajo,
                        FechaBautizo: formValues.seBautizo === 'SI'? formValues.fechaBautismo : null,
                        lider: formValues.PerteneceGrupoFamiliar === 'SI' ? formValues.lider : null,
                        quiereGrupoFamiliar: formValues.quiereParteGrupo === 'SI' ? true : false,
                        comentario: formValues.comentarios,
                        motivo: formValues.elija,
                        Tel_Domicilio: formValues.Tel_Domicilio,
                        Tel_Trabajo: formValues.Tel_Trabajo,
                        Correo_Personal: formValues.Correo_Personal,
                        Cel_Personal: formValues.Cel_Personal,
                        Cel_Trabajo: formValues.Cel_Trabajo,
                        Correo_Trabajo: formValues.Correo_Trabajo,
                        
                    }
                    const saveData = async () => {
                        try {
                            const response = await post('/consolidacion/sendForm', sendValues);
                            console.log(response);
                            //delete data from form
                            setFormValues({
                                tipoIde: '',
                                ide: '',
                                nombre: '',
                                apellido: '',
                                estadoCivil: '',
                                genero: '',
                                fechaNac: null,
                                Dir_Domicilio: '',
                                Dir_Trabajo: '',
                                Tel_Domicilio: '',
                                Tel_Trabajo: '',
                                Correo_Personal: '',
                                asisteGrupo: '',
                                lider: '',
                                quiereParteCCG: '',
                                quiereParteGrupo: '',
                                comentarios: '',
                                elija: '',
                                seBautizo: '',
                                fechaBautismo: null,
                                profesion: '',
                                Cel_Personal: '',
                                Cel_Trabajo: '',
                                Correo_Trabajo: '',
                            });
                            setAlert({
                                type: "success",
                                title: "¡Se ha guardado la información correctamente!"
                            });
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
                        <h3>Consolidación</h3>
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
                                <Grid item xs={2}>
                                    <TextField
                                        name="tipoIde"
                                        label="Tipo ID"
                                        select
                                        required
                                        fullWidth
                                        value={formValues.tipoIde}
                                        onChange={handleInputChange}
                                    >
                                        <MenuItem value="RUC">RUC</MenuItem>
                                        <MenuItem value="CED">CÉDULA</MenuItem>
                                        <MenuItem value="PAS">PASAPORTE</MenuItem>
                                    </TextField>
                                </Grid>
                                <Grid item xs={5}>
                                    <Box mb={2}>
                                        <TextField
                                            name="ide"
                                            label="ID"
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
                                <Grid item xs={5}>
                                    <Box mb={2}>
                                        {alert && (
                                            <Alert severity={alert.type}>
                                                <AlertTitle>{alert.title}</AlertTitle>
                                                {alert.text}
                                            </Alert>
                                        )}
                                    </Box>
                                </Grid>
                                <Grid item xs={6}>
                                    <Box mb={2}>
                                        <TextField
                                            name="elija"
                                            label="Elija"
                                            select
                                            required
                                            fullWidth
                                            value={formValues.elija}
                                            onChange={handleInputChange}
                                        >
                                            <MenuItem value="Reconciliacion">Reconciliación</MenuItem>
                                            <MenuItem value="Primera vez">Acepta a Cristo por primera vez</MenuItem>
                                        </TextField>
                                    </Box>
                                </Grid>
                                <Grid item xs={6}>
                                    <TextField
                                        name="seBautizo"
                                        label="¿Se bautizó?"
                                        select
                                        required
                                        fullWidth
                                        value={formValues.seBautizo}
                                        onChange={handleInputChange}
                                    >
                                        <MenuItem value="SI">SI</MenuItem>
                                        <MenuItem value="NO">NO</MenuItem>
                                    </TextField>
                                </Grid>
                            </Grid>
                            <Box
                                mb={2}
                            >

                                <Accordion
                                    expanded={expanded === 'panel1'} onChange={handleChange('panel1')}

                                >
                                    <AccordionSummary expandIcon={<ExpandMoreIcon />}>
                                        Datos Personales
                                    </AccordionSummary>
                                    <AccordionDetails>
                                        <Grid container spacing={3}>


                                            <Grid item xs={6}>
                                                <TextField name="nombre"
                                                    label="Nombre" value={formValues.nombre || ''
                                                    } onChange={handleInputChange} fullWidth
                                                    required
                                                />
                                            </Grid>
                                            <Grid item xs={6}>
                                                <TextField name="apellido"
                                                    required
                                                    label="Apellido" value={formValues.apellido || ''} onChange={handleInputChange} fullWidth />
                                            </Grid>
                                            <Grid item xs={6}>
                                                <TextField name="estadoCivil" label="Estado Civil" value={formValues.estadoCivil || ''} onChange={handleInputChange}
                                                    select
                                                    required
                                                    fullWidth >
                                                    <MenuItem value="soltero">SOLTERO</MenuItem>
                                                    <MenuItem value="casado">CASADO</MenuItem>
                                                    <MenuItem value="divorciado">DIVORCIADO</MenuItem>
                                                    <MenuItem value="viudo">VIUDO</MenuItem>
                                                </TextField>
                                            </Grid>
                                            <Grid item xs={6}>
                                                <TextField name="genero"
                                                    select
                                                    required
                                                    label="Género" value={formValues.genero || ''} onChange={handleInputChange} fullWidth
                                                >
                                                    <MenuItem value="M">MASCULINO</MenuItem>
                                                    <MenuItem value="F">FEMENINO</MenuItem>
                                                    <MenuItem value="O">OTRO</MenuItem>
                                                </TextField>
                                            </Grid>
                                            <Grid item xs={6}>
                                                <DatePicker
                                                    label="Fecha de Nacimiento"
                                                    value={formValues.fechaNac}
                                                    fullWidth
                                                    required
                                                    onChange={(newValue) => {
                                                        console.log(newValue);
                                                        console.log(typeof (newValue)   );
                                                        setFormValues({ ...formValues, fechaNac: newValue });
                                                    }}
                                                    renderInput={(params) => <TextField
                                                        required
                                                        fullWidth {...params} />}
                                                />
                                            </Grid>
                                        </Grid>
                                    </AccordionDetails>
                                </Accordion>
                            </Box>
                            <Box
                                mb={2}
                            >
                                <Accordion
                                    expanded={expanded === 'panel2'} onChange={handleChange('panel2')}
                                >
                                    <AccordionSummary expandIcon={<ExpandMoreIcon />}>
                                        Datos de Contacto
                                    </AccordionSummary>
                                    <AccordionDetails>
                                        <Grid container spacing={3}>
                                        <Grid item xs={6}>
                                                <TextField name="Dir_Domicilio"
                                                    required
                                                    label="Dirección Domicilio" value={formValues.Dir_Domicilio || ''} onChange={handleInputChange} fullWidth />
                                            </Grid>
                                            <Grid item xs={6}>
                                                <TextField name="Dir_Trabajo" label="Dirección de Trabajo" value={formValues.Dir_Trabajo || ''} onChange={handleInputChange} fullWidth />
                                            </Grid>
                                            <Grid item xs={6}>
                                                <TextField name="Tel_Domicilio" label="Teléfono Domicilio" value={formValues.Tel_Domicilio || ''} onChange={handleInputChange} fullWidth />
                                            </Grid>
                                            <Grid item xs={6}>
                                                <TextField name="Tel_Trabajo" label="Teléfono de Trabajo" value={formValues.Tel_Trabajo || ''} onChange={handleInputChange} fullWidth />
                                            </Grid>
                                            <Grid item xs={6}>
                                                <TextField name="Correo_Personal" label="Correo Personal" value={formValues.Correo_Personal || ''} onChange={handleInputChange} fullWidth />
                                            </Grid>
                                            <Grid item xs={6}>
                                                <TextField name="Correo_Trabajo" label="Correo de Trabajo" value={formValues.Correo_Trabajo || ''} onChange={handleInputChange} fullWidth />
                                            </Grid>
                                            <Grid item xs={6}>
                                                <TextField name="Cel_Personal" label="Celular Personal" value={formValues.Cel_Personal || ''} onChange={handleInputChange} fullWidth />
                                            </Grid>
                                            <Grid item xs={6}>
                                                <TextField name="Cel_Trabajo" label="Celular de Trabajo" value={formValues.Cel_Trabajo || ''} onChange={handleInputChange} fullWidth />
                                            </Grid>
                                        </Grid>
                                    </AccordionDetails>
                                </Accordion>
                            </Box>
                            <Box mb={2}>

                                <Accordion
                                    expanded={expanded === 'panel3'} onChange={handleChange('panel3')}
                                >
                                    <AccordionSummary expandIcon={<ExpandMoreIcon />}>
                                        Datos CCG
                                    </AccordionSummary>
                                    <AccordionDetails>
                                        <Grid container spacing={3}>
                                            <Grid item xs={6}>
                                                <TextField
                                                    name="asisteGrupo"
                                                    label="Asiste a Grupo"
                                                    fullWidth
                                                    select
                                                    value={formValues.asisteGrupo}
                                                    onChange={handleInputChange}
                                                >
                                                    <MenuItem value="SI">SI</MenuItem>
                                                    <MenuItem value="NO">NO</MenuItem>
                                                </TextField>
                                            </Grid>
                                            {formValues.asisteGrupo === "SI" && (
                                                <Grid item xs={6}>
                                                    <Autocomplete
                                                        fullWidth
                                                        options={lideres}  // You need to define this array of leaders
                                                        getOptionLabel={(option) => option.Nombres + " " + option.Apellidos}  // Adjust according to your data structure
                                                        onChange={(event, newValue) => {
                                                            setFormValues({ ...formValues, lider: newValue });
                                                        }}
                                                        renderInput={(params) => <TextField {...params} label="Lider" />}
                                                    />
                                                </Grid>
                                            )}
                                            {formValues.asisteGrupo === "NO" && (
                                                <>
                                                    <Grid item xs={6}>
                                                        <TextField
                                                            name="quiereParteCCG"
                                                            label="¿Quiere ser parte de CCG?"
                                                            select
                                                            fullWidth
                                                            value={formValues.quiereParteCCG}
                                                            onChange={handleInputChange}
                                                        >
                                                            <MenuItem value="SI">SI</MenuItem>
                                                            <MenuItem value="NO">NO</MenuItem>
                                                        </TextField>
                                                    </Grid>
                                                    <Grid item xs={6}>
                                                        <TextField
                                                            name="quiereParteGrupo"
                                                            label="¿Quiere ser parte de un grupo?"
                                                            select
                                                            fullWidth
                                                            value={formValues.quiereParteGrupo}
                                                            onChange={handleInputChange}
                                                        >
                                                            <MenuItem value="SI">SI</MenuItem>
                                                            <MenuItem value="NO">NO</MenuItem>
                                                        </TextField>
                                                    </Grid>
                                                </>
                                            )}
                                            <Grid item xs={6}
                                                // appear only if seBautizo is SI
                                                style={{ display: formValues.seBautizo === "SI" ? "block" : "none" }}
                                            >
                                                <DatePicker
                                                    label="Fecha de Bautismo"
                                                    value={formValues.fechaBautismo}
                                                    fullWidth

                                                    onChange={(newValue) => {
                                                        setFormValues({ ...formValues, fechaBautismo: newValue });
                                                    }}
                                                    renderInput={(params) => <TextField fullWidth {...params} />}
                                                />
                                            </Grid>
                                            <Grid item
                                                //xs 12 if asisteGrupo is NO, else xs 6
                                                xs={formValues.asisteGrupo === "NO" ? 12 : 6}
                                            >
                                                <TextField
                                                    name="comentarios"
                                                    label="Comentarios"
                                                    multiline
                                                    fullWidth
                                                    rows={4}
                                                    value={formValues.comentarios}
                                                    onChange={handleInputChange}
                                                />
                                            </Grid>

                                        </Grid>
                                    </AccordionDetails>
                                </Accordion>
                            </Box>
{                            /*<Box mb={2}>
                                <Accordion
                                    expanded={expanded === 'panel4'} onChange={handleChange('panel4')}
                                >
                                    <AccordionSummary expandIcon={<ExpandMoreIcon />}>
                                        Queremos conocerte
                                    </AccordionSummary>
                                    <AccordionDetails>
                                        <Grid container spacing={3}>
                                            <Grid item xs={12}>
                                                {
                                                    selectedImage ? (
                                                        <img src={selectedImage} alt="Foto" style={{ width: '15rem' }} />
                                                    ) : (
                                                        <img src="/assets/images/404.png" alt="Foto" style={{ width: '15rem' }} />
                                                    )
                                                }
                                            </Grid>
                                            <Grid item xs={12}>
                                                <Button variant="contained" component="label">
                                                    Subir una imagen
                                                    <input type="file" hidden onChange={handleImageChange} />
                                                </Button>
                                            </Grid>
                                        </Grid>
                                    </AccordionDetails>
                                </Accordion>
                            </Box>*/}
                            <Button type="submit"
                                variant="contained"
                                style={{ backgroundColor: '#1DA1F2' }}
                                color="primary"
                                onClick={handleSubmit}

                            >Guardar y Nuevo</Button>
                            <Button type="submit"
                                variant="contained"
                                style={{ marginLeft: '1rem', backgroundColor: '#1DA1F2' }}
                                color="primary"

                                onClick={(e) => { handleSubmit(e); window.location.reload() }}

                            >Guardar</Button>
                        </form>
                    </Box>
                </Box>
            </Modal>
        </>
    );
}
