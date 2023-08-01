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
import Image from "next/image";
import { post, get } from "../src/services/api";
import { styled, createTheme, ThemeProvider } from "@mui/material/styles";
import { useRouter } from "next/router";
import Swal from "sweetalert2";
import Link from "next/link";
import AlertTitle from '@mui/material/AlertTitle';
import { Alert } from "@mui/material";
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
  margin: theme.spacing(3, 0, 1),
  backgroundColor: "#406AF5",
  color: "#ffffff", // Cambia el color de la letra para que sea visible en el fondo
}));

const StyledCreateAccountButton = styled(Button)(({ theme }) => ({
  margin: theme.spacing(3, 0, 1),
  backgroundColor: "#406AF5",
  color: "#ffffff",
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
  fontSize: "3rem",
  zIndex: "1000",
  color: "white",
  fontFamily: "Sigmar, cursive",
  wordBreak: "break-word",
  [theme.breakpoints.up("md")]: {
    display: "grid",
    fontSize: "35px",
  },

  [theme.breakpoints.up("lg")]: {
    fontSize: "30px",
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
  const [email, setEmail] = useState("");
  const [showPassword, setShowPassword] = useState(false);
  const [password, setPassword] = useState("");
  const [loading, setLoading] = useState(false);
  const [alert, setAlert] = useState(null);

  const handleLogin = async () => {
    setLoading(true);

    try {
      const response = await post('/login/login', { username: email, password: password });
      const { access_token } = response;
      const { user } = response;
      localStorage.setItem('user', JSON.stringify(user));
      // Store the JWT token in localStorage
      localStorage.setItem('jwtToken', access_token);

      // TODO: Handle successful login, e.g., redirect to a dashboard page
      console.log('Login successful');
      setAlert({
        type: "success",
        title: "Bienvenido",
        text: "Ingreso exitoso",
      });
      const menu = await get('/menu/get_modulos');
      localStorage.setItem('menu', JSON.stringify(menu['modulos']));
      const firstModule = menu['modulos'][0].codigo
      const currentModule = menu['modulos'][0].descripcion
      console.log(currentModule);
      localStorage.setItem('currentModule', currentModule);
      console.log(firstModule);
      localStorage.setItem('currentModuleID', firstModule);
      const optionsModule = await get('/menu/get_opciones_modulo/' + firstModule);
      localStorage.setItem('optionsModule', JSON.stringify(optionsModule['opciones']));
      //get first options from optionsModule
      //const firstOption = optionsModule['opciones'][0].descripcion
      const firstOption = 'Inicio'
      localStorage.setItem('currentOption', firstOption);
      router.push('/Membresia');
    } catch (error) {
      // TODO: Handle login error
      console.error('Login failed', error);
      setAlert({
        type: "error",
        title: "Oops...",
        text: error.request.response,
      });
    }

    setLoading(false);
  };

  const handleClickShowPassword = () => setShowPassword((show) => !show);

  const handleSubmit = async (event) => {
    event.preventDefault();

    //verify if all inputs have value/^[a-zA-Z0-9]+$/

    if (password.match(/^[a-zA-Z0-9_@]+$/) == null) {
      setAlert({
        type: "error",
        title: "Oops...",
        text: "Contraseña vacía",
      });


      return;
    }

    router.push("/selector");
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
              src="/assets/images/imgLogin2.jpg"
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
                  {alert && (
                    <Alert severity={alert.type}>
                      <AlertTitle>{alert.title}</AlertTitle>
                      {alert.text}
                    </Alert>
                  )}
                  <StyledPaper>
                    <StyledForm onSubmit={handleSubmit}>
                      <Grid
                        container
                        justifyContent="flex-start"
                        alignItems="center"
                      >
                        <Grid item style={{ paddingBottom: "20px" }}>
                          <StyledImg alt="Logo" src="/assets/images/logos/logoCCGWhite.png" style={{ width: "100px", height: "100px" }} />
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
                          CCG Mi Lugar
                        </Typography>
                      </Grid>
                      <TextField
                        variant="outlined"
                        margin="normal"
                        required
                        fullWidth
                        id="email"
                        placeholder="Usuario*"
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

                      <FormControl
                        style={{
                          m: 1,
                          width: "100%",
                          backgroundColor: "white",
                          border: "10px solid white",
                          borderRadius: "10px",
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

                      <div style={{ marginTop: "9px", marginLeft: "4px" }}>
                        Olvidastes la contraseña?
                      </div>

                      <StyledSubmitButton
                        type="submit"
                        fullWidth
                        variant="contained"
                        style={{
                          backgroundColor: "#1DA1F2",
                          paddingBlock: "1rem",
                        }}
                        disabled={loading}
                        onClick={handleLogin}
                      >
                        {loading ? 'Cargando...' : 'Ingresar'}
                      </StyledSubmitButton>

                      <Link href="crear-cuenta" passHref>
                        <StyledCreateAccountButton
                          fullWidth
                          variant="contained"
                          style={{
                            backgroundColor: "#1DA1F2",
                            paddingBlock: "1rem",
                          }}
                        >
                          Crear cuenta
                        </StyledCreateAccountButton>
                      </Link>
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
