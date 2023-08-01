
import React, { useEffect, useState } from "react";
import Link from "next/link";
import { styled } from "@mui/material/styles";
import { useRouter } from "next/router";
import { Typography, Grid, Container, Menu, MenuItem } from "@mui/material";
import { DataGrid } from "@mui/x-data-grid";
import { Button } from "@mui/material";
import { ThemeProvider } from "@mui/material/styles";
import { createTheme } from "@mui/material";
import Checkbox from '@mui/material/Checkbox';
import FormControlLabel from '@mui/material/FormControlLabel';
import { Box } from "@mui/system";
import MenuMultiSuite from "../../src/MenuMultiSuite";
import { get } from "../../src/services/api";
import { CircularProgress } from "@mui/material";
import { TablePagination } from '@mui/material';
import StyledTable from '../../src/components/Design/StyledTable';
import StyledHeader from "../../src/components/Design/StyledHeader";
import Consform from "../../src/components/Membresia/consform";
import NuevaPersona from "../../src/components/Membresia/nuevaPersona";

const Lista = () => {
    const [anchorEl, setAnchorEl] = React.useState(null);
    const [page, setPage] = useState(0);
    const [rowsPerPage, setRowsPerPage] = useState(10);
    const [openModal, setOpenModal] = React.useState(false);




    const handleChangePage = (event, newPage) => {
        setPage(newPage);
        window.scrollTo(0, 0); // Scroll to the top of the window
    };

    const handleChangeRowsPerPage = (event) => {
        setRowsPerPage(parseInt(event.target.value, 10));
        setPage(0);
        window.scrollTo(0, 0); // Scroll to the top of the window
    };

    const handleClick = (event) => {
        setAnchorEl(event.currentTarget);
    };

    const handleClose = () => {
        setAnchorEl(null);
    };

    const router = useRouter();
    const error = false;
    const label = { inputProps: { 'aria-label': 'Checkbox demo' } };

    const [open, setOpen] = React.useState(false);
    const [id, setId] = React.useState(0);
    const [data, setData] = useState("");
    const [loading, setLoading] = useState(true)
    const [selectedItems, setSelectedItems] = useState([]);
    const [fullData, setFullData] = useState([]);

    const handleSelect = (event, id) => {
        const checked = event.target.checked;
        setData(prevData => prevData.map(item => {
            if (item.id === id) {
                return { ...item, selected: checked };
            }
            return item;
        }));
    };

    const getPersonas = async () => {
        try {
            let result = await get("/consolidacion/personas")
            // result = {...result.contacto,...result.persona}
            setData(result)
            console.log(result)

            console.log(result.contacto)
            setData(result.map(item => ({ ...item, selected: false })));
            setFullData(result);
        } catch (err) {
            console.error(err)
        } finally {
            setLoading(false)
        }
    }

    useEffect(() => {
        getPersonas()
    }, [])


    const handleDelete = async (id) => {
        try {
            const { data } = await deleteMiembro({
                variables: {
                    id: id,
                },
            });
            console.log(data);
            router.push("/Membresia/personas");
        } catch (error) {
            console.log(error);
        }
    };

    const buscarTelefono = (params, tipoBuscado) => {
        // Verificar si existen las propiedades necesarias
        if (params.row?.contactos?.length) {
            // Recorrer el array de contactos
            for (var i = 0; i < params.row.contactos.length; i++) {
                var contacto = params.row.contactos[i];

                // Verificar si el tipo de teléfono coincide
                if (contacto.contacto_tipo === tipoBuscado) {
                    return contacto.Valor;
                }
            }
        }

        return null; // Si no se encuentra el tipo de teléfono
    }
    // { field: "email", headerName: "Email", width: 130 },

    const columns = [{
        field: "checkbox",
        headerName: "",
        width: 50,
        renderCell: (params) => (
            <Checkbox
                checked={params.row.selected}
                onChange={(event) => handleSelect(event, params.row.id)}
            />
        )
    },
    { field: "id", headerName: "ID", width: 25 },

    {
        field: "Nombres", headerName: "Nombre", width: 150, renderCell: (params) => {
            const linkUrl = `/Membresia/${params.row.id}`;
            return (
                <Link href={linkUrl}

                >
                    <a style={{ color: "#1DA1F2" }}><u>{params.value}</u>
                    </a>
                </Link>
            );
        }
    },
    { field: "Apellidos", headerName: "Apellido", width: 150 },
    { field: "Identificacion", headerName: "Identificación", width: 150 },
    { field: "ministerio", headerName: "Ministerio", width: 150 },
    { field: "lider", headerName: "Lider", width: 150 },
    {
        field: "Tel_Domicilio", headerName: "Teléfono", width: 150
    },
    { field: "Correo_Personal", headerName: "Correo", width: 150},
    { field: "Dir_Domicilio", headerName: "Direccion", width: 150 },
    { field: "Zona", headerName: "Zona", width: 150 },

        // { field: "observaciones", headerName: "Observaciones", width: 130 },
    ]

    if (error) return `Error! ${error.message}`;

    return (
        <div
            style={{
                backgroundColor: "#E1F1FE",
                minHeight: "100vh",
                paddingBottom: "20px",
            }}
        >
            <MenuMultiSuite header={1} />
            <NuevaPersona
                isOpen={openModal}
                handleClose={() => {
                    setOpenModal(false)
                    setTimeout(() => {
                        window.location.reload();
                    }, 500);
                }}
            />
            <StyledHeader

                data={data}
                setData={setData}
                setOpen={() => {
                    setOpenModal(true)
                }
                }
                title={"Personas"}
                getData={fullData}
            />
            <Box>
                {
                    loading ? <Box
                        sx={{
                            display: "flex",
                            justifyContent: "center",
                            alignItems: "center",
                        }}
                    >
                        <CircularProgress />
                    </Box> :
                        <StyledTable
                            columns={columns}
                            data={data}
                            selectedItems={selectedItems}
                            setSelectedItems={setSelectedItems}
                            handleSelect={handleSelect}
                            page={page}
                            rowsPerPage={rowsPerPage}
                        />
                }
                <TablePagination
                    component="div"
                    rowsPerPageOptions={[10, 25, 50]}
                    count={data.length}
                    rowsPerPage={rowsPerPage}
                    page={page}
                    onPageChange={handleChangePage}
                    onRowsPerPageChange={handleChangeRowsPerPage}
                />
            </Box>

        </div>
    );
}

export default Lista;
