
import React from "react";
import { Card, CardContent, Grid, Box, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper, Typography } from '@mui/material';
import { styled } from "@mui/material/styles";
import HorizontalHeader from "../../src/components/Membresia/HeaderM";
import MenuMultiSuite from "../../src/MenuMultiSuite";
import { Pie } from 'react-chartjs-2';
import { Chart, ArcElement } from 'chart.js';
import Link from "next/link";

Chart.register(ArcElement);

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
    paddingTop: "100px",

    [theme.breakpoints.up("md")]: {
        minHeight: "100vh",
        paddingTop: "150px",
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

const MainPage = () => {
    const pieChartData1 = {
        labels: ['Red', 'Blue', 'Yellow'],
        datasets: [
            {
                data: [300, 50, 100],
                backgroundColor: ['#0A4D68', '#088395', '#05BFDB'],
            },
        ],
    };

    const pieChartData2 = {
        labels: ['A', 'B', 'C'],
        datasets: [
            {
                data: [200, 100, 150],
                backgroundColor: ['#3A1078', '#4E31AA', '#2F58CD'],
            },
        ],
    };

    // Sample data for the tables
    const tableDataSecond = [
        { name: 'John Doe', date: '2023-05-17', contacted: 'No' },
        { name: 'Jane Smith', date: '2023-05-16', contacted: 'Si' },
        // Add more data entries
    ];

    const tableDataThird = [
        { name: 'Alice Johnson', age: 30 },
        { name: 'Bob Williams', age: 25 },
        // Add more data entries
    ];
    return (
        <div
            style={{
                backgroundColor: "#E1F1FE",
                minHeight: "100vh",
            }}
        >
            <MenuMultiSuite header={1} />

            <Grid container spacing={2} pt='7rem' pl='1rem' pr='1rem'
            >
                {/* Card Principal */}
                <Grid item xs={8}>
                    <Box
                        sx={{
                            display: 'flex',
                            flexDirection: 'column',
                        }}
                    >
                        <Card sx={{ minWidth: 275, minHeight: 350 }}>

                            <CardContent>
                                <Typography variant="h5" component="div">

                                </Typography>
                                <Typography sx={{ mb: 1.5 }} color="text.secondary">
                                </Typography>
                                <Typography variant="body2">

                                </Typography>
                            </CardContent>
                        </Card>
                        <Box
                            sx={{
                                display: 'flex',
                                flexDirection: 'row',
                                paddingTop: '1rem',
                                justifyContent: 'space-around',
                            }}
                        >
                            <Box sx={{ width: '49%', height: '50%' }}>
                                <Card sx={{ minWidth: 275, minHeight: 175 }}>
                                    <CardContent>
                                        <Typography variant="h5" component="div">
                                        </Typography>
                                        <Typography sx={{ mb: 1.5 }} color="text.secondary">
                                        </Typography>
                                    </CardContent>
                                </Card>

                            </Box>
                            <Box sx={{ width: '49%', height: '50%' }}>

                                <Card sx={{ minWidth: 275, minHeight: 175 }}>
                                    <CardContent>
                                        <Typography variant="h5" component="div">
                                        </Typography>
                                        <Typography sx={{ mb: 1.5 }} color="text.secondary">
                                        </Typography>
                                    </CardContent>
                                </Card>
                            </Box>
                        </Box>
                    </Box>

                </Grid>

                {/* Card Second */}
                <Grid item xs={4}>
                    <Card sx={{ minWidth: 275, minHeight: 175 }}>
                        <CardContent>
                            <Typography variant="h5" component="div">
                            </Typography>
                            <Typography sx={{ mb: 1.5 }} color="text.secondary">
                            </Typography>

                        </CardContent>
                    </Card>

                </Grid>

            </Grid>
        </div >
    );
}

export default MainPage;