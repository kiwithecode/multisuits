import * as React from "react";
import ButtonGroup from "@mui/material/ButtonGroup";
import IconButton from "@mui/material/IconButton";
import Icon from "@mui/material/Icon";
import Typography from "@mui/material/Typography";
import PersonIcon from "@mui/icons-material/Person";
import SavingsIcon from "@mui/icons-material/Savings";
import SchoolIcon from "@mui/icons-material/School";
import ManageAccountsIcon from "@mui/icons-material/ManageAccounts";
import Stack from "@mui/material/Stack";
import Link from "next/link";
import { Box, Grid } from "@mui/material";
import { styled } from "@mui/material/styles";
import CarouselFadeExample from "../src/CarouselFadeExample";
import MenuMultiSuite from "../src/MenuMultiSuite";

const StyledMain = styled(Box)(({ theme }) => ({
  display: "flex",
  flexDirection: "column",
  minWidth: "100%",

  [theme.breakpoints.up("md")]: {
    flexDirection: "row",
  },
}));

const StyledLeftSide = styled(Box)(({ theme }) => ({
  display: "flex",
  flexDirection: "column",
  flex: "2",
  justifyContent: "center",
  alignItems: "center",
  // backgroundColor: "red",
  // paddingBlock: "3rem",
  paddingTop:"100px",
  
  [theme.breakpoints.up("md")]: {
    minHeight: "100vh",
    paddingTop:"150px",
  },
}));

const StyledRightSide = styled(Box)(({ theme }) => ({
  display: "flex",
  flex: "1",
  flexDirection: "column",
  justifyContent: "center",
  // backgroundColor: "blue",
  // paddingBlock:"3rem"
  
  
}));

export default function CenteredButtons() {
  return (
    <>
        <MenuMultiSuite header = {1}/>
      <StyledMain>
        <StyledLeftSide>
          <CarouselFadeExample />
          <div style={{
            width:"100%",
            textAlign:"center",
            paddingTop:"2rem"

          }}>
            <p
              style={{

                fontWeight:"900",
                fontSize:"1.2rem"
              }}
            >
              No hace falta que seas poderoso, ni necesitas un gran ejército; lo
              único que necesitas es mi Espíritu
            </p>
            <p  style={{

                fontWeight:"700",
                fontSize:"1.1rem"
              }}>
                Zacarias 4:5
                </p>
          </div>
        </StyledLeftSide>
      </StyledMain>
    </>
  );
}
