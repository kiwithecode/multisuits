import Filter from "./Filter";
import VistasRapidas from "./VistasRapidas";

import React from "react";
import AppBar from "@mui/material/AppBar";
import Toolbar from "@mui/material/Toolbar";
import Typography from "@mui/material/Typography";
import AppRegistrationIcon from "@mui/icons-material/AppRegistration";
import { styled } from "@mui/material/styles";

const StyledToolbar = styled(Toolbar)(({ theme }) => ({
  display: "flex",
  flexDirection: "column",

  [theme.breakpoints.up("sm")]: {
    flexDirection: "row",
  },
}));

const StyledTypography = styled(Typography)(({ theme }) => ({
    flexGrow: 1,
    marginBottom: "25px",
  
    [theme.breakpoints.up("sm")]: {
      marginBottom:"0px"
    },
  }));

const Subheader= () => {
  return (
    <AppBar
      position="static"
      sx={{
        paddingBottom: "15px",
      }}
    >
      <StyledToolbar>
        <StyledTypography
          variant="h6"
          component="div"
        >
          <div
            style={{
              marginBlock: "15px",
            }}
          >
            <AppRegistrationIcon />
            Vistas Rápidas
          </div>
          <VistasRapidas />
        </StyledTypography>

        <Filter />
      </StyledToolbar>
    </AppBar>
  );
}

export default Subheader;
