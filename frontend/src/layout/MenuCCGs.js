import { Button, Typography } from "@mui/material";
import Link from "next/link";
import { Fragment } from "react";
import React from "react";
import Consform from "../components/Membresia/consform";

export function MembresiaMenu() {
    const [open, setOpen] = React.useState(false);
    const handleClick = () => {
        console.log("handleClick");
        setOpen(!open);
    };
    const handleCloseModal = () => {
        setOpen(false);
    };

    return (
        <Fragment>
            <li>
                <Button
                    variant="text"
                    color="inherit"
                    onClick={handleClick}
                >

                    CONSOLIDACIÓN
                </Button>

            </li>
            <li><Link href="/index2">
                <Button
                    variant="text"
                    color="inherit"
                >
                    CHECK IN
                </Button></Link>
            </li>
            <li>
            <Link href="/Membresia/Personas">
                <Button
                    variant="text"
                    color="inherit"
                >
                    PERFILES
                </Button></Link>
            </li>
            <li>
            <Link href="/index2">
                <Button
                    variant="text"
                    color="inherit"
                >
                    ÁREAS DE SERVICIO
                </Button></Link>
            </li>
            {open && <Consform isOpen={open} handleClose={handleCloseModal} />}
        </Fragment>
    )
}

export const AprendeMenu = () => (
    <Fragment>
        <li>
            <Link href="/">C y C</Link>
        </li>
        <li>
            <Link href="/index2">GLOBAL</Link>
        </li>
        <li>
            <Link href="/index3">PAREJAS</Link>
        </li>
    </Fragment>
);

export const FinancieroMenu = () => (
    <Fragment>
        <li>
            <Link href="/">FACTURAS</Link>
        </li>
        <li>
            <Link href="/">RECAUDACIONES</Link>
        </li>
        <li>
            <Link href="/">COBROS</Link>
        </li>
        <li>
            <Link href="/">BANCOS</Link>
        </li>
    </Fragment>
);

export const AdministracionMenu = () => (
    <Fragment>
        <li>
            <Link href="/">USUARIOS</Link>
        </li>
        <li>
            <Link href="/">PERMISOS</Link>
        </li>
        <li>
            <Link href="/">ROLES</Link>
        </li>
        <li>
            <Link href="/">MINISTERIOS</Link>
        </li>
        <li>
            <Link href="/">REASIGNACIÓN</Link>
        </li>
    </Fragment>
);
