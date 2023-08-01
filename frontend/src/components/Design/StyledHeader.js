import { Style } from '@mui/icons-material';
import { Box, Typography, Button, Menu, MenuItem } from '@mui/material';
import React from 'react';
const StyledHeader = ({ data, setData, setOpen, title, getData }) => {
    const [anchorEl, setAnchorEl] = React.useState(null);
    const [openModal, setOpenModal] = React.useState(false);

    const handleClick = (event) => {
        setAnchorEl(event.currentTarget);
    };

    const handleClose = () => {
        setAnchorEl(null);
    };

    const handleOpenModal = () => {
        setOpenModal(true);
    };

    const handleCloseModal = () => {
        setOpenModal(false);
    };

    return (
        <Box
            display="flex"
            justifyContent="space-between"
            alignItems="center"
            flexDirection="row"
            padding="10px"
            marginTop="8em"
            marginBottom="2em"
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
                <Typography variant="h4" component="h4" gutterBottom>
                    {title}
                </Typography>
                <Box
                    display="flex"
                    alignItems="center"
                    onClick={handleClick}
                    sx={{ cursor: 'pointer' }}
                >
                    <Typography variant="subtitle1" component="h4" gutterBottom>
                        Vistas recientemente
                    </Typography>
                    <i className="fas fa-caret-down" style={{ marginLeft: '10px' }}></i>
                </Box>
                <span style={{ fontSize: '12px' }}>{data.length} registros / Actualizado recientemente</span>
                <Menu
                    anchorEl={anchorEl}
                    open={Boolean(anchorEl)}
                    onClose={handleClose}
                    anchorOrigin={{
                        vertical: 'bottom',
                        horizontal: 'right',
                    }}
                    transformOrigin={{
                        vertical: 'top',
                        horizontal: 'right',
                    }}
                    getContentAnchorEl={null}
                >
                    <MenuItem onClick={handleClose}>Option 1</MenuItem>
                    <MenuItem onClick={handleClose}>Option 2</MenuItem>
                    <MenuItem onClick={handleClose}>Option 3</MenuItem>
                </Menu>
            </Box>
            <Box
                sx={{
                    display: "flex",
                    justifyContent: "center",
                    alignItems: "center",
                    flexDirection: "column",
                    marginRight: "2em",
                }}
            >
                <Box
                    sx={{
                        display: "flex",
                        justifyContent: "center",
                        alignItems: "center",
                        flexDirection: "row",
                        marginBottom: ".5em",
                    }}
                >
                    <Button
                        variant="contained"
                        style={{ width: "150px", backgroundColor: "#1DA1F2" }}
                        onClick={setOpen}
                    >
                        Nuevo
                    </Button>
                    <Button
                        variant="contained"
                        color="primary"
                        style={{ width: "150px", backgroundColor: "#1DA1F2" }}
                        onClick={() => {
                            console.log("Importar");
                        }}
                    >
                        Importar
                    </Button>
                </Box>
                <Box>
                    <div className="input-group input-group-sm" style={{ width: '300px', padding: '3px' }}>
                        <div className="input-group-append">
                            <button className="btn " type="button"
                                style={{ backgroundColor: "white", color: "gray" }}
                            >
                                <i className="fas fa-search"></i>
                            </button>
                        </div>
                        <input
                            type="text"
                            onChange={(e) => {
                                let search = e.target.value.toLowerCase();
                                let result = [];
                                if (search === "") {
                                    setData(getData);
                                } else {
                                    result = data.filter((item) => {
                                        //buscar en todos los campos
                                        return Object.keys(item).some((key) => {
                                            if (item[key] !== null) {
                                                return item[key].toString().toLowerCase().includes(search);
                                            }
                                        }
                                        );

                                    });
                                    setData(result);
                                }
                            }}
                            className="form-control"
                            placeholder="Buscar..."
                        />
                    </div>
                </Box>
            </Box>
            {                   /*{openModal && (
                <Box
                    position="fixed"
                    top={0}
                    left={0}
                    width="100%"
                    height="100%"
                    display="flex"
                    justifyContent="center"
                    alignItems="center"
                    bgcolor="rgba(0, 0, 0, 0.5)"
                >
                    {modalComponent}
 <Button
                        variant="contained"
                        color="primary"
                        style={{ marginTop: '1em' }}
                        onClick={handleCloseModal}
                    >
                        Close Modal
                    </Button>
                </Box>}
            )*/}
        </Box>
    );
};


export default StyledHeader;
