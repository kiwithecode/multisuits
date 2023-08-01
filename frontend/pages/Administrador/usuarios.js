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

const Usuarios = () => {

    const [anchorEl, setAnchorEl] = React.useState(null);
    const [page, setPage] = useState(0);
    const [rowsPerPage, setRowsPerPage] = useState(10);
    const [open, setOpen] = React.useState(false);
    const [fullData, setFullData] = useState([]);

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

    const [id, setId] = React.useState(0);
    const [data, setData] = useState("");
    const [loading, setLoading] = useState(true)
    const [selectedItems, setSelectedItems] = useState([]);

    const handleSelect = (event, id) => {
        const checked = event.target.checked;
        setData(prevData => prevData.map(item => {
            if (item.id === id) {
                return { ...item, selected: checked };
            }
            return item;
        }));
    };

    function formatDate(dateString) {
        const date = new Date(dateString);
        const utcOffset = -5; // Lima, Peru UTC offset in hours
        
        // Apply the UTC offset to the date
        date.setHours(date.getHours() + utcOffset);
        
        const today = new Date();
        
        const formattedDate = date.toDateString();
        const isToday = date.getDate() === today.getDate() &&
                        date.getMonth() === today.getMonth() &&
                        date.getFullYear() === today.getFullYear();
        
        if (isToday) {
          const options = { day: '2-digit', month: '2-digit', year: 'numeric' };
          return date.toLocaleDateString('es-PE', options);
        } else {
          const day = String(date.getDate()).padStart(2, '0');
          const month = String(date.getMonth() + 1).padStart(2, '0'); // Months are zero-based
          const year = date.getFullYear();
          return `${day}/${month}/${year}`;
        }
      }
      
      
      
      const getUsuarios = async () => {
        const response = await get("/consolidacion/usuarios");
        if (response) {
            console.log(response);
            setData(response);
            setFullData(response);
            setLoading(false);
        }

    };
      
    useEffect(() => {
        getUsuarios();
    }, []);

    const columns = [
        {
            field: "id",
            headerName: "id",
            width: 100,
            hide: true,
        },
        {
            field: "Codigo",
            headerName: "usuario",
            width: 100
        },
        {
            field: "Persona",
            headerName: "Nombres completos",
            width: 300,
        },
        {
            field: "Identificacion",
            headerName: "Identificacion",
            width: 200,
        },
        {
            field: "Fecha_Creacion",
            headerName: "Fecha de creación",
            width: 200,
            renderCell: (params) => <span>{params.value ? formatDate(params.value) : ''}</span>


        },
        {
            field: "Fecha_modificacion",
            headerName: "Fecha de modificación",
            width: 200,
            renderCell: (params) => <span>{params.value ? formatDate(params.value) : ''}</span>


        },
        {
            field: "Estado",
            headerName: "Estado",
            width: 200,
            renderCell: (params) => {
            //if A color green
            //if I color red
            return <span
                style={{
                color:
                    params.value === "A"
                    ? "green"
                    : params.value === "I"
                    ? "red"
                    : "black",
                }}
            >{params.value=='A'?'Activo':'Inactivo'
            }</span>
        }
        },
    ];


    return (
        <div
            style={{
                backgroundColor: "#E1F1FE",
                minHeight: "100vh",
                paddingBottom: "20px",
            }}
        >
            <MenuMultiSuite header={1} />
            <StyledHeader
                getData={fullData}
                data={data}
                setData={setData}
                setOpen={() => setOpen(true)}
                title={"Consolidación"}
            />
            {
                <Consform
                    isOpen={open}
                    handleClose={() => setOpen(false)}
                />
            }
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
    )
}

export default Usuarios;