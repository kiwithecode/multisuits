import Head from "next/head";
import { Fragment, useEffect, useState, useMemo } from "react";
import "../styles/globals.css";

import { CssBaseline } from "@mui/material";
import { ThemeProvider,createTheme } from "@mui/material/styles";
import { LocalizationProvider } from '@mui/x-date-pickers';
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs'

function MyApp({ Component, pageProps }) {
  const [loading, setLoading] = useState(true);
  const [mode, setMode] = useState('light');

  useEffect(() => {
    setTimeout(() => {
      setLoading(false);
    }, 1000);
  }, []);

  useEffect(() => {
    const mode = localStorage.getItem("mode");
    // set mode
    if(mode !== null){
        setMode("light");
    }
  }, []);

  // const ligthTheme = createTheme({
  //   palette: {
  //     mode: 'light',
  //   },
  // });

  // const darkTheme = createTheme({
  //   palette: {
  //     mode: 'dark',
  //   },
  // });

  const _setDarkMode = (mode) => {
    localStorage.setItem("mode", mode);
    setMode(mode);
  }

  const colorMode = useMemo(
    () => ({
      toggleColorMode: () => {
        setMode((prevMode) => {if (prevMode === 'light'){
          _setDarkMode("dark")
          return "dark"
        } else{ 
          _setDarkMode("light")

          return 'light'
        }});
      },
    }),
    [],
  );

  const theme = useMemo(
    () =>
      createTheme({
        palette: {
          mode:mode,
        },
      }),
    [mode],
  );

  return (
    <LocalizationProvider dateAdapter={AdapterDayjs}>
    <Fragment>
      <Head>
        <title>
          Suite CCG - Mi lugar
        </title>
        {/*====== Favicon Icon ======*/}
        <link
          rel="shortcut icon"
          href="/assets/images/logos/logoCCGBlack.png"
          type="image/x-icon"
        />
        {/*====== Google Fonts ======*/}
        <link
          href="https://fonts.googleapis.com/css2?family=Mulish:wght@400;500;600;700&family=Oswald:wght@300;400;500;600;700&display=swap"
          rel="stylesheet"
        />

        <link rel="preconnect" href="https://fonts.googleapis.com"/>
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
        <link href="https://fonts.googleapis.com/css2?family=Sigmar&display=swap" rel="stylesheet"/>
        
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,700;1,900&family=Sigmar&display=swap" rel="stylesheet"/>
        
        {/*====== Flaticon ======*/}
        <link rel="stylesheet" href="/assets/css/flaticon.min.css" />
        {/*====== Font Awesome ======*/}
        <link rel="stylesheet" href="/assets/css/font-awesome-5.9.0.min.css" />
        {/*====== Bootstrap ======*/}
        <link rel="stylesheet" href="/assets/css/bootstrap-4.5.3.min.css" />
        {/*====== Magnific Popup ======*/}
        <link rel="stylesheet" href="/assets/css/magnific-popup.min.css" />
        {/*====== Nice Select ======*/}
        <link rel="stylesheet" href="/assets/css/nice-select.min.css" />
        {/*====== jQuery UI ======*/}
        <link rel="stylesheet" href="/assets/css/jquery-ui.min.css" />
        {/*====== Animate ======*/}
        <link rel="stylesheet" href="/assets/css/animate.min.css" />
        {/*====== Slick ======*/}
        <link rel="stylesheet" href="/assets/css/slick.min.css" />
        {/*====== Main Style ======*/}
        <link rel="stylesheet" href="/assets/css/style.css" />
      </Head>
      {loading && <div className="preloader" />}
      
      <ThemeProvider theme={theme}>
      <CssBaseline/>
      <Component {...pageProps} colorMode={colorMode}/>
      </ThemeProvider>
    </Fragment>
    </LocalizationProvider>
  );
}

export default MyApp;
