import React, { useState } from "react";
import { Button, Modal, Box, TextField } from "@mui/material";
import CloseIcon from "@mui/icons-material/Close";
import FilterAltIcon from "@mui/icons-material/FilterAlt";

const Filter = () => {
  const [open, setOpen] = useState(false);
  const [name, setName] = useState("");
  const [lastName, setLastName] = useState("");
  const [email, setEmail] = useState("");
  const [phone, setPhone] = useState("");

  const handleOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  return (
    <div>
      <Button variant="contained" onClick={handleOpen}>
        <FilterAltIcon />
      </Button>
      <Modal
        open={open}
        onClose={handleClose}
        aria-labelledby="modal-title"
        aria-describedby="modal-description"
      >
        <Box
          sx={{
            position: "fixed",
            top: 0,
            left: 0,
            width: "100vw",
            height: "100vh",
            display: "flex",
            justifyContent: "center",
            alignItems: "center",
            backgroundColor: "rgba(0, 0, 0, 0.5)",
          }}
        >
          <Box
            sx={{
              position: "relative",
              backgroundColor: "#fff",
              padding: "1rem",
              borderRadius: "4px",
              width: "95vw",
              height: "95vh",
            }}
          >
            <h2 id="modal-title">Filtros</h2>
            <Button
              sx={{
                position: "absolute",
                top: "10px",
                right: "10px",
              }}
              onClick={handleClose}
            >
              <CloseIcon />
            </Button>

            <div
            style={{
                display:"flex",
                flexDirection:"column",
                justifyContent:"space-evenly",
                height:"400px"
            }}
            >
              <TextField
                label="Nombre"
                name="name"
                onChange={(e) => setName(e.target.value)}
              />
              <TextField
                label="Apellido"
                name="lastName"
                onChange={(e) => setLastName(e.target.value)}
              />
              <TextField
                label="Correo electrónico"
                name="email"
                onChange={(e) => setEmail(e.target.value)}
              />
              <TextField
                label="Teléfono"
                name="phone"
                onChange={(e) => setPhone(e.target.value)}
              />
            </div>

            <Button
                variant="contained"
                fullWidth
            >
                Filtrar
            </Button>

          </Box>
        </Box>
      </Modal>
    </div>
  );
};

export default Filter;
