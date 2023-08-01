// Import necessary components using dynamic import
import React, { useEffect, useState, lazy, Suspense } from "react";
import { Grid, Typography, Box, Card, CardContent, Button, Container } from "@mui/material";
import { Avatar } from "@mui/material";
import { AccountBox, Replay10 } from "@mui/icons-material";
import { get, put } from "../../src/services/api";
import Accordion from "@mui/material/Accordion";
import AccordionSummary from "@mui/material/AccordionSummary";
import AccordionDetails from "@mui/material/AccordionDetails";
import ExpandMoreIcon from "@mui/icons-material/ExpandMore";
import MenuMultiSuite from "../../src/MenuMultiSuite";
import Tabs from '@mui/material/Tabs';
import Tab from '@mui/material/Tab';
import { CircularProgress } from "@mui/material";
import { TextField } from "@mui/material";
import EditableField from "../../src/components/EditableField";
import { Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper } from '@mui/material';
import NuevoFamiliar from "../../src/components/Membresia/nuevoFamiliar";
// Lazy load the components that are not immediately needed
const Link = lazy(() => import("next/link"));
const Layout = lazy(() => import("../../src/layout/Layout"));
const HorizontalHeader = lazy(() => import("../../src/components/Membresia/HeaderM"));
//const EditableField = lazy(() => import("../../src/components/EditableField"));


function MembresiaProfile({ id }) {
  const [user, setUser] = useState({});
  const [loading, setLoading] = useState(true);
  const [value, setValue] = React.useState(1);
  const [bitacora, setBitacora] = useState([]);
  const [openModal, setOpenModal] = React.useState(false);
  const [expanded, setExpanded] = React.useState('panel1');

  const handleChangeAccordion = (panel) => (event, newExpanded) => {
    setExpanded(newExpanded ? panel : false);
  };

  const handleChange = (event, newValue) => {
    setValue(newValue);
  };

  useEffect(() => {
    const getPersona = async () => {
      try {
        let result = await get(`/consolidacion/getPersonaByID/${id}`);
        setUser(result);
        console.log(result);
      } catch (err) {
        console.error(err);
        setLoading(false);
      }
    };
    const getBitacora = async () => {
      try {
        let result = await get(`/consolidacion/bitacoraPersona/${id}`);
        setBitacora(result);
        console.log(result);
        setLoading(false);
      } catch (err) {

        setLoading(false);
      }
    };

    getPersona();
    getBitacora();
  }, []);
/*
  function buscarContacto(params, tipoBuscado) {
    // Verificar si existen las propiedades necesarias
    if (params?.contactos?.length) {
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

  function buscarContactoItem(params, tipoBuscado) {
    // Verificar si existen las propiedades necesarias
    if (params?.contactos?.length) {
      // Recorrer el array de contactos
      for (var i = 0; i < params.contactos.length; i++) {
        var contacto = params.contactos[i];

        // Verificar si el tipo de teléfono coincide
        if (contacto.contacto_tipo === tipoBuscado) {
          return contacto;
        }
      }
    }

    return null; // Si no se encuentra el tipo de teléfono
  }*/
  const handleFieldUpdate = async (field, value) => {
    // Simulación de llamada a la API para actualizar los datos
    try {
      // Aquí realizarías la llamada a la API y actualizarías los datos en la base de datos
      // Puedes usar la variable 'field' para identificar qué propiedad del perfil se está actualizando
      // y la variable 'value' para obtener el nuevo valor
      // Por ejemplo:
      // await api.updateProfile({ [field]: value });

      // Simulamos una pequeña demora para mostrar el indicador de carga

        let result = await put(`/consolidacion/personas/${id}`, {
          [field]: value,
        });
        console.log(field, value);

        let person = await get(`/consolidacion/getPersonaByID/${id}`);

        // Actualizamos el estado local con los nuevos datos
        setUser(person);
      
      console.log("Perfil actualizado:", user);
    } catch (error) {
      console.error("Error al actualizar el perfil:", error);
    }
  };

  const TabPanel = ({ children, value, index }) => {
    return (
      <div hidden={value !== index}>
        {value === index && <Box p={3}>{children}</Box>}
      </div>
    );
  };

  const handleAddFamiliar = () => {
    //openModal(true);
    setOpenModal(true);
  }

  const handleCloseModal = () => {
    setOpenModal(false);
    window.location.reload();
  }

  return (

    <div
      style={{
        backgroundColor: "#E1F1FE",
        minHeight: "100vh",
        paddingBottom: "20px",
      }}
    >
      <MenuMultiSuite header={1} />
      {loading
        ? <Box
          sx={{
            display: "flex",
            justifyContent: "center",
            alignItems: "center",
            height: "100vh",
          }}
        >
          <CircularProgress />
        </Box>
        :
        //check if user is logged in
        user.Nombres ?
          (
            <Box

            >
              <Box>
                <Box display="flex" justifyContent="space-between"
                  alignItems="center"
                  flexDirection="row"
                  padding="10px"
                  marginTop="7em"
                  backgroundColor="white"
                >
                  <Box
                    sx={{
                      display: "flex",
                      justifyContent: "center",
                      alignItems: "left",
                      flexDirection: "column",
                      marginLeft: "2em",
                    }}
                  >
                    <Box sx={{ color: "#1D366D" }}>
                      <Box sx={{ fontSize: 'h6.fontSize', m: 1, color: 'black', fontWeight: "light", mt: 0, lineHeight: 0.25 }}>Persona</Box>
                      <Box sx={{ fontSize: 'h4.fontSize', m: 1, color: 'black', fontWeight: "normal", mb: 0, lineHeight: 1.5 }}>{user.Nombres} {user.Apellidos}</Box>
                    </Box>
                  </Box>
                </Box>
                <Box
                  display="flex"
                  justifyContent="space-between"
                  alignItems="center"
                  flexDirection={["column", "row"]}
                  padding="10px"
                  marginBottom="2em"
                  backgroundColor="#d2d1d1"
                  color="black"
                >
                  <Box display="flex" flexDirection="column" ml={["0", "2em"]} mb={["2em", "0"]}>
                    <Box fontWeight="bold">Líder de la persona:</Box>
                    <Box>{user.lider === undefined ? "No tiene" : user.lider}</Box>
                  </Box>
                  <Box display="flex" flexDirection="column" mb={["2em", "0"]}>
                    <Box fontWeight="bold">Ministerio:</Box>
                    <Box>{user.ministerio === undefined ? "No tiene" : user.ministerio}</Box>
                  </Box>
                  <Box display="flex" flexDirection="column" mr={["0", "25em"]}>
                    <Box fontWeight="bold">Modificado por:</Box>
                    <Box>Juan Cevallos</Box>
                  </Box>
                </Box>
              </Box>

              <Grid container spacing={3} className="pt-1 rpt-5">
                <Grid item lg={7}>
                  <Card>
                    <CardContent>
                      <Tabs value={value} onChange={handleChange} aria-label="basic tabs example">
                        <Tab label="Relacionado" />
                        <Tab label="Detalle" />
                        <Tab label="Bitácora de consolidación" />
                      </Tabs>
                      <TabPanel value={value} index={0}>
                        <Box sx={{ display: "flex", flexDirection: "column", padding: "3", justifyContent: "flex-end" }}>
                          <Box sx={{ display: "flex", justifyContent: "flex-end", marginBottom: "1em" }}>
                            <Button
                              variant="contained"
                              color="primary"
                              style={{
                                marginBottom: "1em",
                                backgroundColor: "#1DA1F2",
                                alignItems: "center",
                              }}
                              onClick={handleAddFamiliar}
                            >
                              Agregar familiar
                            </Button>
                          </Box>
                          <Box sx={{ flexGrow: 1 }}>
                            <table className="table table-bordered">
                              <thead>
                                <tr>
                                  <th>ID Persona</th>
                                  <th>Apellidos</th>
                                  <th>Nombres</th>
                                  <th>Tipo de Relación</th>
                                </tr>
                              </thead>
                              <tbody>
                                {user.familiares.length !== 0 &&
                                  user.familiares.map((row) => (
                                    <tr key={row.id}>
                                      <td>{row["id Persona"]}</td>
                                      <td>{row.Apellidos}</td>
                                      <td>{row.Nombres}</td>
                                      <td>{row["tipo relacion"]}</td>
                                    </tr>
                                  ))}
                                {user.familiares.length === 0 && (
                                  <tr>
                                    <td colSpan={4} className="text-center py-3">
                                      No tiene familiares registrados
                                    </td>
                                  </tr>
                                )}
                              </tbody>
                            </table>
                          </Box>

                        </Box>
                        <NuevoFamiliar
                          isOpen={openModal}
                          handleClose={handleCloseModal}
                          idPersona1={user.id}
                        />
                      </TabPanel>

                      <TabPanel value={value} index={1}>
                        <Box
                          sx={{
                            display: "flex",
                            flexDirection: "column",

                          }}
                        >
                          <Accordion sx={{ width: '100%' }}
                            expanded={expanded === 'panel1'}
                            onChange={handleChangeAccordion('panel1')}

                          >
                            <AccordionSummary
                              expandIcon={<ExpandMoreIcon />}
                              aria-controls="panel1a-content"
                              id="panel1a-header"

                            >
                              <Typography sx={{ width: '33%', flexShrink: 0 }}>
                                Datos personales
                              </Typography>
                            </AccordionSummary>
                            <AccordionDetails>
                              <Grid container spacing={3} className="pt-1 rpt-5">
                                <Grid item lg={6}>
                                  <EditableField
                                    label="Tipo de identificación:"
                                    initialValue={user.Tipo_Identificacion}
                                    onUpdate={(value) =>
                                      handleFieldUpdate("Tipo_Identificacion", value)
                                    }
                                  />
                                  <EditableField
                                    label="Indetificación:"
                                    initialValue={user.Identificacion}
                                    onUpdate={(value) =>
                                      handleFieldUpdate("Identificacion", value)
                                    }
                                  />
                                  <EditableField
                                    label="Nombres:"
                                    initialValue={user.Nombres}
                                    onUpdate={(value) =>
                                      handleFieldUpdate("Nombres", value)
                                    }
                                  />
                                  <EditableField
                                    label="Apellidos:"
                                    initialValue={user.Apellidos}
                                    onUpdate={(value) =>
                                      handleFieldUpdate("Apellidos", value)
                                    }
                                  />


                                </Grid>
                                <Grid item lg={6}>
                                  <EditableField
                                    label="Sexo:"
                                    initialValue={user.Sexo}
                                    onUpdate={(value) => handleFieldUpdate("Sexo", value)}
                                  />
                                  <EditableField
                                    label="Fecha de nacimiento:"
                                    initialValue={user.Fecha_Nac}
                                    onUpdate={(value) =>
                                      handleFieldUpdate("Fecha_Nac", value)
                                    }
                                  />
                                  <EditableField
                                    label="Estado civil:"
                                    initialValue={user.EstadoCivil}
                                    onUpdate={(value) =>
                                      handleFieldUpdate("EstadoCivil", value)
                                    }
                                  />
                                  <EditableField
                                    label="Profesión:"
                                    initialValue={user.profesion}
                                    onUpdate={(value) =>
                                      handleFieldUpdate("profesion", value)
                                    }
                                  />


                                </Grid>
                              </Grid>
                            </AccordionDetails>
                          </Accordion>
                          <Accordion
                            expanded={expanded === 'panel2'}
                            onChange={handleChangeAccordion('panel2')}
                            sx={{ width: '100%' }}
                          >
                            <AccordionSummary
                              expandIcon={<ExpandMoreIcon />}
                              aria-controls="panel1a-content"
                              id="panel1a-header"
                            >
                              <Typography>Datos de contacto</Typography>
                            </AccordionSummary>
                            <AccordionDetails>
                            <Grid container spacing={3} className="pt-1 rpt-5">
                              <Grid item lg={6}>
                              <EditableField
                                label="Teléfono:"
                                initialValue={user.Tel_Domicilio }
                                onUpdate={(value) =>
                                  handleFieldUpdate("Tel_Domicilio", value)
                                }
                              />
                              <EditableField
                                label="Correo:"
                                initialValue={user.Correo_Personal}
                                onUpdate={(value) =>
                                  handleFieldUpdate("Correo_Personal", value)
                                }
                              />
                              <EditableField
                                label="Celular:"
                                initialValue={user.Cel_Personal}
                                onUpdate={(value) =>
                                  handleFieldUpdate("Cel_Personal", value)
                                }
                              />
                              <EditableField
                                label="Dirección:"
                                initialValue={user.Dir_Domicilio}
                                onUpdate={(value) =>
                                  handleFieldUpdate("Dir_Domicilio", value)
                                }
                              />
                              </Grid>
                              <Grid item lg={6}>
                              <EditableField
                                label="Teléfono de trabajo:"
                                initialValue={user.Tel_Trabajo }
                                onUpdate={(value) =>
                                  handleFieldUpdate("Tel_Trabajo", value)
                                }
                              />
                              <EditableField
                                label="Correo de trabajo:"
                                initialValue={user.Correo_Trabajo}
                                onUpdate={(value) =>
                                  handleFieldUpdate("Correo_Trabajo", value)
                                }
                              />
                              <EditableField
                                label="Celular de trabajo:"
                                initialValue={user.Cel_Trabajo}
                                onUpdate={(value) =>
                                  handleFieldUpdate("Cel_Trabajo", value)
                                }
                              />
                              <EditableField
                                label="Dirección de trabajo:"
                                initialValue={user.Dir_Trabajo}
                                onUpdate={(value) =>
                                  handleFieldUpdate("Dir_Trabajo", value)
                                }
                              />
                              </Grid>
                              </Grid>
                            </AccordionDetails>
                          </Accordion>
                        </Box>
                      </TabPanel>
                      <TabPanel value={value} index={2}>
                        <TableContainer component={Paper}>
                          <Table>
                            <TableHead>
                              <TableRow> <TableCell>ID</TableCell>
                                <TableCell>Contactar</TableCell>
                                <TableCell>Motivo</TableCell>
                                <TableCell>Comentario</TableCell>
                                <TableCell>Fecha de Creación</TableCell>
                                <TableCell>Fecha de Modificación</TableCell>

                                <TableCell>Usuario que Creó</TableCell>
                                <TableCell>Usuario que Modificó</TableCell>
                              </TableRow>
                            </TableHead>
                            <TableBody>
                              {Array.isArray(bitacora) && bitacora && bitacora.length !== 0 ? (
                                bitacora.map((row) => (
                                  <TableRow key={row.id}>
                                  <TableCell>{row.id}</TableCell>
                                    <TableCell
                                      sx={{
                                        fontWeight: "normal",
                                      }}
                                    >
                                      {row.Contactar}
                                    </TableCell>
                                    
                                    <TableCell>{row.Motivo}</TableCell>
                                    <TableCell>{row.comentario}</TableCell>
                                    <TableCell>{row.fechaCreacion}</TableCell>
                                    <TableCell>{row.FechaModificacion}</TableCell>
                                    <TableCell>{row.usuarioCrea}</TableCell>
                                    <TableCell>{row.UsuarioModifica}</TableCell>
                                  </TableRow>
                                ))
                              ) : (
                                <TableRow>
                                  <TableCell colSpan={8}
                                    sx={{
                                      textAlign: "center",
                                      py: 3,
                                    }}
                                  >
                                    No hay datos de consolidación disponibles
                                  </TableCell>
                                </TableRow>
                              )}
                            </TableBody>

                          </Table>
                        </TableContainer>
                      </TabPanel>

                    </CardContent>
                  </Card>
                </Grid>
                <Grid item lg={4.60} sx={{ marginLeft: "auto" }}>
                  <Card>
                    <CardContent>
                      <Typography variant="h6" sx={{ textDecoration: "underline", textDecorationColor: "blue" }}>
                        Actividad
                      </Typography>
                      <Typography variant="body1">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                      </Typography>

                      <div style={{ marginTop: "20px" }}>
                        <Typography variant="subtitle2" sx={{ marginBottom: "5px" }}>
                          From:
                        </Typography>
                        <TextField
                          id="sender-email"
                          variant="outlined"
                          placeholder="Your email address"
                          fullWidth
                          sx={{ marginBottom: "10px" }}
                        />

                        <Typography variant="subtitle2" sx={{ marginBottom: "5px" }}>
                          To:
                        </Typography>
                        <TextField
                          id="recipient-email"
                          variant="outlined"
                          placeholder="Recipient's email address"
                          fullWidth
                          sx={{ marginBottom: "10px" }}
                        />

                        <Typography variant="subtitle2" sx={{ marginBottom: "5px" }}>
                          Subject:
                        </Typography>
                        <TextField
                          id="email-subject"
                          variant="outlined"
                          placeholder="Email subject"
                          fullWidth
                          sx={{ marginBottom: "10px" }}
                        />

                        <Typography variant="subtitle2" sx={{ marginBottom: "5px" }}>
                          Message:
                        </Typography>
                        <TextField
                          id="email-message"
                          variant="outlined"
                          placeholder="Your message"
                          fullWidth
                          multiline
                          rows={4}
                        />
                      </div>
                    </CardContent>
                  </Card>

                </Grid>
              </Grid>
            </Box>
          )
          : <Box
            sx={{
              display: "flex",
              justifyContent: "center",
              alignItems: "center",
              height: "100vh",
            }}

          >
            <Typography variant="h4">No se encontró el miembro</Typography>
          </Box>
      }
    </div>
  );
}

export async function getServerSideProps({ params }) {
  return {
    props: {
      id: params.id,
    },
  };
}

export default MembresiaProfile;
