import React from "react";
import Link from "next/link";
import {
  Button,
  IconButton,
  Card,
  CardMedia,
  CardContent,
  Typography,
  Box,
  Grid,
} from "@mui/material";
import ArrowBackIcon from "@mui/icons-material/ArrowBack";
import { styled } from "@mui/material/styles";
import ReactPlayer from "react-player";

const StyledCard = styled(Card)(({ theme }) => ({
  display: "flex",
  flexDirection: "column",
  [theme.breakpoints.up("md")]: {
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "stretch",
  },
}));

const StyledCardContent = styled(CardContent)(({ theme }) => ({
  flexGrow: 1,
  [theme.breakpoints.up("md")]: {
    maxWidth:"500px",
    wordBreak:"break-word"
  }
}));

const VideoWrapper = styled("div")(({ theme }) => ({
  position: "relative",
  paddingTop: "56.25%",
  flex:1,
  [theme.breakpoints.up("md")]: {
    paddingTop: "28.125%",
  },
}));

const VideoPlayer = styled(ReactPlayer)(({ theme }) => ({
  position: "absolute",
  top: 0,
  left: 0,
  width: "100%",
  height:"100%",

}));

const Video = () => {
  return (
    <div style={{margin:"0 2rem"}}>
      <Link href="/Aprende" passHref>
        <Button>
          <IconButton>
            <ArrowBackIcon />
          </IconButton>
          Regresar a mis cursos
        </Button>
      </Link>


      <StyledCard>
      <VideoWrapper>
        <VideoPlayer
          url="https://www.youtube.com/watch?v=dQw4w9WgXcQ" // Coloca aquí la URL del video
          width="100%"
          height="100%"
        />
      </VideoWrapper>
      <StyledCardContent>
        <Typography variant="h5" component="h2" sx={{marginBottom:"10px"}}>
          Título del card
        </Typography>
        <Typography variant="body1" color="text.secondary">
          Descripción del card.Tempor ea enim est aliqua deserunt laboris occaecat Lorem laborum duis eiusmod reprehenderit duis deserunt. Fugiat eu aliquip proident ut eiusmod duis occaecat ullamco sunt. Tempor et ipsum tempor mollit cupidatat. Voluptate elit voluptate commodo ullamco dolor ex mollit labore dolore minim reprehenderit anim est et. Aute magna ipsum enim in sint sunt do aliquip minim minim. Cillum nisi nisi do culpa do dolore aliquip qui.
        </Typography>
      </StyledCardContent>
    </StyledCard>

      <Box sx={{marginTop: 4 }}>
        <Typography variant="h4" component="h1" sx={{ marginBottom: 2 }}>
          BIENVENIDOS AL CURSO
        </Typography>
        <Grid container spacing={2}>
          <Grid item xs={12} sm={6} md={4}>
            <Card sx={{ height: "100%" }}>
              <CardContent>
                <Typography gutterBottom variant="h5" component="h2">
                  Acerca del curso.
                </Typography>
                <Typography variant="body2" color="text.secondary">
                  Aquí va la descripción del curso.Quis minim eiusmod nostrud nostrud elit veniam reprehenderit consequat deserunt culpa. Laborum enim amet sint tempor. Incididunt tempor exercitation excepteur fugiat excepteur enim sint non consequat eu culpa proident ea sint. Id fugiat anim dolor proident elit pariatur consectetur.
                </Typography>
              </CardContent>
            </Card>
          </Grid>
          <Grid item xs={12} sm={6} md={4}>
            <Card sx={{ height: "100%" }}>
              <CardContent>
                <Typography gutterBottom variant="h5" component="h2">
                  Acerca del profesor
                </Typography>
                <Typography variant="body2" color="text.secondary">
                  Aquí va la descripción del profesor.Laborum velit reprehenderit elit adipisicing deserunt. Pariatur exercitation aliquip velit reprehenderit eu esse velit irure adipisicing nulla elit aute. Excepteur qui aliqua commodo dolor minim irure nulla. In cupidatat cillum nostrud magna sint dolore. Esse veniam dolor ipsum eu adipisicing culpa enim. Irure incididunt eiusmod dolor sunt elit occaecat eiusmod nostrud.
                </Typography>
              </CardContent>
            </Card>
          </Grid>
          <Grid item xs={12} md={4}>
            <Card sx={{ height: "100%" }}>
              <CardContent>
                <Typography gutterBottom variant="h5" component="h2">
                  Valoración del curso
                </Typography>
                <Typography variant="body2" color="text.secondary">
                  Aquí va la valoración del curso.Cillum nostrud ex eiusmod cupidatat proident laboris velit irure dolore dolore. Cupidatat occaecat culpa adipisicing occaecat anim commodo sit id est irure nulla ex ex velit. Eu proident elit voluptate duis sit excepteur cillum excepteur mollit excepteur. Voluptate dolor consectetur laborum cillum enim voluptate Lorem deserunt non magna consequat in. Dolore labore duis Lorem eiusmod dolore aliquip exercitation nisi.
                </Typography>
              </CardContent>
            </Card>
          </Grid>
        </Grid>
      </Box>
    </div>
  );
};

export default Video;
