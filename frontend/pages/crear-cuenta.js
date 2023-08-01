import React, { useContext, useState } from "react";
import {
  TextField,
  Button,
  Paper,
  Typography,
  Grid,
  Container,
  FormControl,
  InputLabel,
  OutlinedInput,
  InputAdornment,
  IconButton,
  CssBaseline,
} from "@mui/material";
import { Visibility, VisibilityOff } from "@mui/icons-material";
import ArrowBackIosIcon from "@mui/icons-material/ArrowBackIos";
import Image from "next/image";

import { styled, createTheme, ThemeProvider } from "@mui/material/styles";
import { useRouter } from "next/router";
import Swal from "sweetalert2";
import Link from "next/link";

//STYLES
const StyledPaper = styled("div")(({ theme }) => ({
  margin: theme.spacing(8, 4),
  display: "flex",
  flexDirection: "column",
  alignItems: "center",
}));

const StyledForm = styled("form")(({ theme }) => ({
  width: "100%",
  marginTop: theme.spacing(1),
}));
const StyledImg = styled("img")(({ theme }) => ({
  width: "50px",
  height: "50px",
  marginRight: theme.spacing(1),
}));

const StyledSubmitButton = styled(Button)(({ theme }) => ({
  margin: theme.spacing(3, 0, 2),
  backgroundColor: "#406AF5",
  color: "#ffffff", // Cambia el color de la letra para que sea visible en el fondo
}));

const BackgroundLoginStyle = styled("span")(({ theme }) => ({
  boxSizing: "border-box",
  display: "block",
  overflow: "hidden",
  width: "initial",
  height: "initial",
  background: "none",
  opacity: 0,
  border: 0,
  margin: 0,
  padding: 0,
  position: "absolute",
  top: 0,
  left: 0,
  bottom: 0,
  right: 0,
  [theme.breakpoints.up("md")]: {
    opacity: 1,
  },
}));

const backgroundLoginImgStyle = {
  position: "absolute",
  inset: "0px",
  boxSizing: "border-box",
  padding: "0px",
  border: "none",
  margin: "auto",
  display: "block",
  minWidth: "100%",
  maxWidth: "100%",
  minHeight: "100%",
  maxHeight: "100%",
  objectFit: "cover",
};

const FraseLoginStyle = styled(Grid)(({ theme }) => ({
  display: "none",
  textAlign: "center",
  fontSize: "5rem",
  zIndex: "1000",
  color: "white",
  fontFamily: "Sigmar, cursive",
  wordBreak: "break-word",
  [theme.breakpoints.up("md")]: {
    display: "grid",
    fontSize: "65px",
  },

  [theme.breakpoints.up("lg")]: {
    fontSize: "100px",
  },
}));

const customTheme = createTheme({
  palette: {
    background: {
      default: "#1DA1F2 !important",
    },
  },
});

const Login = () => {
  const router = useRouter();
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [user, setUser] = useState("")
  const [email, setEmail] = useState("");
  const [phone, setPhone] = useState("");
  const [password, setPassword] = useState("");
  const [showPassword, setShowPassword] = useState(false);

  const handleClickShowPassword = () => setShowPassword((show) => !show);

  const handleSubmit = async (event) => {
    event.preventDefault();

    //verify if all inputs have value/^[a-zA-Z0-9]+$/

    if (password.match(/^[a-zA-Z0-9_@]+$/) == null) {
      Swal.fire({
        icon: "error",
        title: "Oops...",
        text: "Contraseña inválida",
      });

      return;
    }

    router.push("/login");
  };

  return (
    <ThemeProvider theme={customTheme}>
      <CssBaseline />
      <div
        className="login-page"
        style={{
          minHeight: "100%",
          minWidth: "100%",
          background:
            "radial-gradient(circle at 49% 99%, rgb(17, 249, 214) 0%, rgba(255, 255, 255, 0) 18.13%), linear-gradient(rgb(15, 87, 219) 0%, rgba(255, 255, 255, 0) 67%), linear-gradient(rgb(29, 161, 42) 0%, rgb(29, 161, 242) 0%)",
        }}
      >
        <div
          style={{
            background:
              "radial-gradient(at 86% 4%, rgba(17, 249, 214, 0.5) 0%, rgba(0, 0, 0, 0.1) 20.52%, rgba(0, 0, 0, 0.1) 37%, rgba(29, 161, 242, 0) 50%), radial-gradient(at 9% 7%, rgba(15, 87, 219, 0.25) 0%, rgba(0, 0, 0, 0.1) 30%, rgba(255, 255, 255, 0) 54%), radial-gradient(circle at 5% 100%, rgb(15, 87, 219) 0%, rgba(0, 0, 0, 0.2) 51%, rgba(255, 255, 255, 0) 66%)",
          }}
        >
          <BackgroundLoginStyle>
            <Image
              style={backgroundLoginImgStyle}
              loader={({ src }) => src}
              src="https://crehana-vercel-images-prd.imgix.net/auth-mf/_next/static/media/bg-desktop.0b1c2c39.png?auto=format&w=1920&q=75&fit=crop"
              layout="fill"
            />
          </BackgroundLoginStyle>

          <Container
            maxWidth={false}
            style={{ height: "100vh" }}
            justify="center"
          >
            <Grid
              container
              justifyContent="center"
              alignItems="center"
              style={{ height: "100%" }}
            >
              <FraseLoginStyle item md={6} lg={7}>
                Crecimiento y cambio
              </FraseLoginStyle>
              <Grid item xs={12} sm={8} md={6} lg={5}>
                <Paper
                  elevation={3}
                  style={{
                    padding: "32px",
                    backdropFilter: "blur(20px)",
                    background: "rgba(255, 255, 255, 0.1)",
                    color: "white",
                  }}
                >
                  <StyledPaper>
                    <StyledForm onSubmit={handleSubmit}>
                      <Link href="/login" passHref>
                        <ArrowBackIosIcon
                          sx={{
                            cursor: "pointer",
                            position: "absolute",
                            top: "40px",
                            left: "auto",
                          }}
                        />
                      </Link>
                      <Grid
                        container
                        justifyContent="flex-start"
                        alignItems="center"
                      >
                        <Grid item style={{ paddingBottom: "20px" }}>
                          <StyledImg
                            alt="Logo"
                            style={{ marginLeft: "10px" }}
                            src="/assets/images/logos/logoCCGWhite.png"
                            layout='fill'
                          />
                        </Grid>
                        <Typography
                          component="h1"
                          variant="h5"
                          style={{
                            fontWeight: "bolder",
                            fontSize: "1.4rem",
                            color: "white",
                          }}
                        >
                          CCGMultiSuites
                        </Typography>
                      </Grid>
                      <TextField
                        variant="outlined"
                        margin="normal"
                        required
                        fullWidth
                        id="firstName"
                        placeholder="Nombres*"
                        name="firstName"
                        autoComplete="given-name"
                        autoFocus
                        value={firstName}
                        onChange={(e) => setFirstName(e.target.value)}
                        sx={{
                          backgroundColor: "white",
                          border: "10px solid white",
                          borderRadius: "10px",
                        }}
                      />
                      <TextField
                        variant="outlined"
                        margin="normal"
                        required
                        fullWidth
                        id="lastName"
                        placeholder="Apellidos*"
                        name="lastName"
                        autoComplete="family-name"
                        autoFocus
                        value={lastName}
                        onChange={(e) => setLastName(e.target.value)}
                        sx={{
                          backgroundColor: "white",
                          border: "10px solid white",
                          borderRadius: "10px",
                        }}
                      />
                      <TextField
                        variant="outlined"
                        margin="normal"
                        fullWidth
                        required
                        id="user"
                        placeholder="Usuario*"
                        name="user"
                        autoFocus
                        value={user}
                        onChange={(e) => setUser(e.target.value)}
                        sx={{
                          backgroundColor: "white",
                          border: "10px solid white",
                          borderRadius: "10px",
                        }}
                      />
                      <TextField
                        variant="outlined"
                        margin="normal"
                        fullWidth
                        id="email"
                        placeholder="Correo"
                        name="email"
                        autoComplete="email"
                        autoFocus
                        value={email}
                        onChange={(e) => setEmail(e.target.value)}
                        sx={{
                          backgroundColor: "white",
                          border: "10px solid white",
                          borderRadius: "10px",
                        }}
                      />

                      <TextField
                        variant="outlined"
                        margin="normal"
                        fullWidth
                        id="tel-national"
                        placeholder="Número telefónico"
                        name="tel-national"
                        autoComplete="tel-national"
                        autoFocus
                        value={phone}
                        onChange={(e) => {
                          const inputPhoneNumber = event.target.value.replace(
                            /\D/g,
                            ""
                          );
                          if (inputPhoneNumber.length <= 10) {
                            setPhone(inputPhoneNumber);
                          }
                        }}
                        sx={{
                          backgroundColor: "white",
                          border: "10px solid white",
                          borderRadius: "10px",
                        }}
                        inputProps={{
                          inputMode: "numeric",
                          pattern: "^[0-9]*$",
                          maxLength: 10,
                        }}
                      />

                      <FormControl
                        style={{
                          m: 1,
                          width: "100%",
                          backgroundColor: "white",
                          border: "10px solid white",
                          borderRadius: "10px",
                          marginTop: "16px",
                        }}
                        variant="outlined"
                        onChange={(e) => setPassword(e.target.value)}
                        required
                      >
                        <OutlinedInput
                          id="outlined-adornment-password"
                          type={showPassword ? "text" : "password"}
                          endAdornment={
                            <InputAdornment position="end">
                              <IconButton
                                aria-label="toggle password visibility"
                                onClick={handleClickShowPassword}
                              >
                                {showPassword ? (
                                  <VisibilityOff />
                                ) : (
                                  <Visibility />
                                )}
                              </IconButton>
                            </InputAdornment>
                          }
                          label=""
                          placeholder="Contraseña*"
                        />
                      </FormControl>

                      <StyledSubmitButton
                        type="submit"
                        fullWidth
                        variant="contained"
                        style={{
                          backgroundColor: "#0F57DB",
                          paddingBlock: "1rem",
                        }}
                      >
                        Crear cuenta
                      </StyledSubmitButton>
                    </StyledForm>
                  </StyledPaper>
                </Paper>
              </Grid>
            </Grid>
          </Container>
        </div>
      </div>
    </ThemeProvider>
  );
};

export default Login;
