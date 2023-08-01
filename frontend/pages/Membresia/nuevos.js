import React from "react";
import Link from "next/link";
import { styled } from "@mui/material/styles";
import { useRouter } from "next/router";
import { Typography, Grid, Container } from "@mui/material";
import { DataGrid } from "@mui/x-data-grid";
import { Button } from "@mui/material";
import { Box } from "@mui/system";
import { Dialog } from "@mui/material";
import { DialogTitle } from "@mui/material";
import HorizontalHeader from "../../src/components/Membresia/HeaderM";
import MenuMultiSuite from "../../src/MenuMultiSuite";

const Nuevos = () => {
    const router = useRouter();
    const loading = false;
    const error = false;
    const data = [
        { id: 1, nombre: "John Doe", fechaConsolidacion: "2023-05-17", edad: "31", contactado: "No", asignadoA: "Pastor Juan" },
        { id: 2, nombre: "Jane Smith", fechaConsolidacion: "2023-05-16", edad: "29", contactado: "Si", asignadoA: "Pastor Bob" },
        { id: 3, nombre: "Bob Afe", fechaConsolidacion: "2023-05-15", edad: "27", contactado: "Si", asignadoA: "Pastor Bob" },
        { id: 4, nombre: "Maria Guzman", fechaConsolidacion: "2023-05-15", edad: "25", contactado: "Si", asignadoA: "Pastor Bob" },
        { id: 5, nombre: "David Soto", fechaConsolidacion: "2023-05-15", edad: "23", contactado: "Si", asignadoA: "Pastor Bob" },

    ];
    const [open, setOpen] = React.useState(false);
    const [id, setId] = React.useState(0);

    const handleClose = () => setOpen(false);
    const handleOpen = (id) => {
        setOpen(true);
        setId(id);
    };

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

    const columns = [
        { field: "nombre", headerName: "Nombre", width: 300 },
        { field: "fechaConsolidacion", headerName: "Fecha Consolidación", width: 300 },
        { field: "edad", headerName: "Edad", width: 300 },
        { field: "contactado", headerName: "Contactado", width: 300 },
        { field: "asignadoA", headerName: "Asignado a", width: 300 },
    ]

    if (loading) return "Loading...";
    if (error) return `Error! ${error.message}`;

    return (
        <>
            <MenuMultiSuite header={1} />
            <Box display="flex" justifyContent="center">
                <h1>Lista de nuevos Membresia</h1>
            </Box>
            <Box>
                <Box >
                    <div style={{ margin: "10px", display: "flex", justifyContent: "center" }}>
                        <div style={{ width: "100%" }}>
                            <DataGrid
                                rows={data}
                                columns={columns.map((column) => ({
                                    ...column,
                                }))}
                                autoHeight
                                autoWidth
                                pageSize={5}
                                rowsPerPageOptions={[5]}
                                checkboxSelection
                                disableSelectionOnClick
                                onRowDoubleClick={(row) => router.push(`/Membresia/${row.row.id}`)}
                            />
                        </div>
                    </div>
                </Box>



                <Dialog open={open} onClose={handleClose}>
                    <DialogTitle>¿Está seguro que desea eliminar este miembro?</DialogTitle>
                    <Button onClick={handleClose}>Cancelar</Button>
                    <Button onClick={() => handleDelete(id)}>Aceptar</Button>
                </Dialog>
            </Box>

        </>
    );
}

export default Nuevos;
