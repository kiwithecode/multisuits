import React from 'react';
import { List, ListItemButton, ListItemIcon, ListItemText, Divider, Popover } from '@mui/material';
import DashboardIcon from '@mui/icons-material/Dashboard';
import HomeIcon from '@mui/icons-material/Home';
import GroupIcon from '@mui/icons-material/Group';
import PriceCheckIcon from '@mui/icons-material/PriceCheck';
import JoinFullIcon from '@mui/icons-material/JoinFull';
import ReportIcon from '@mui/icons-material/Report';
import Link from 'next/link';
import Image from "next/image";
import { Box } from '@mui/material';
import { IconButton, useMediaQuery, useTheme } from '@mui/material';
import MenuIcon from '@mui/icons-material/Menu';
import { useRouter } from 'next/router';

const HorizontalHeader = () => {
  const router = useRouter();
  const theme = useTheme();
  const isMobile = useMediaQuery(theme.breakpoints.down('sm'));
  const [anchorEl, setAnchorEl] = React.useState(null);

  const handleMenuOpen = (event) => {
    setAnchorEl(event.currentTarget);
  };

  const handleMenuClose = () => {
    setAnchorEl(null);
  };

  const drawerContent = (
    <List sx={{ display: 'flex', flexDirection: 'row' }}>
      <Link href='/Membresia' passHref>
        <ListItemButton selected={router.pathname === '/Membresia'}>
          <ListItemIcon sx={{ color: router.pathname === '/Membresia' ? '#1DA1F2' : 'white' }}>
            <HomeIcon />
          </ListItemIcon>
          <ListItemText primary="Inicio" sx={{ color: router.pathname === '/Membresia' ? '#1DA1F2' : 'white' }}/>
        </ListItemButton>
      </Link>

      <Link href='/Membresia/Personas' passHref>
        <ListItemButton selected={router.pathname === '/Membresia/Personas'}>
          <ListItemIcon sx={{ color: router.pathname === '/Membresia/Personas' ? '#1DA1F2' : 'white' }}>
            <GroupIcon />
          </ListItemIcon>
          <ListItemText primary="Membresía" sx={{ color: router.pathname === '/Membresia/lista' ? '#1DA1F2' : 'white' }}/>
        </ListItemButton>
      </Link>
      <Link href='/Membresia/consolidacion' passHref>
        <ListItemButton selected={router.pathname === '/Membresia/consolidacion'}>
          <ListItemIcon sx={{ color: router.pathname === '/Membresia/consolidacion' ? '#1DA1F2' : 'white' }}>
            <JoinFullIcon />
          </ListItemIcon>
          <ListItemText primary="Consolidación" sx={{ color: router.pathname === '/Membresia/consolidacion' ? '#1DA1F2' : 'white' }}/>
        </ListItemButton>
      </Link>
      <Link href='/Membresia/check-in' passHref>
        <ListItemButton selected={router.pathname === '/Membresia/check-in'}>
          <ListItemIcon sx={{ color: router.pathname === '/Membresia/check-in' ? '#1DA1F2' : 'white' }}>
            <PriceCheckIcon />
          </ListItemIcon>
          <ListItemText primary="Check In" sx={{ color: router.pathname === '/Membresia/check-in' ? '#1DA1F2' : 'white' }}/>
        </ListItemButton>
      </Link>
      <Link href='/Membresia/dashboard' passHref>
        <ListItemButton selected={router.pathname === '/Membresia/dashboard'}>
          <ListItemIcon sx={{ color: router.pathname === '/Membresia/dashboard' ? '#1DA1F2' : 'white' }}>
            <DashboardIcon />
          </ListItemIcon>
          <ListItemText primary="Dashboard" sx={{ color: router.pathname === '/Membresia/dashboard' ? '#1DA1F2' : 'white' }}/>
        </ListItemButton>
      </Link>
      <Link href='/Membresia/reportes' passHref>
        <ListItemButton selected={router.pathname === '/Membresia/reportes'}>
          <ListItemIcon sx={{ color: router.pathname === '/Membresia/reportes' ? '#1DA1F2' : 'white' }}>
            <ReportIcon />
          </ListItemIcon>
          <ListItemText primary="Reportes" sx={{ color: router.pathname === '/Membresia/reportes' ? '#1DA1F2' : 'white' }}/>
        </ListItemButton>
      </Link>
    </List>
  );

  return (
    <Box
      sx={{
        backgroundColor: 'black',
        color: '#fff',
        position: 'sticky',
        top: 0,
        zIndex: 1000,
        borderRadius: '10px',
      }}
    >
      <Box
        sx={{
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'space-between',
          flexDirection: { xs: 'row', md: 'row' },
        }}
      >
        <Box className="navbar-header" sx={{ display: 'flex', alignItems: 'center' }}>
          <Box className="mobile-logo bg-green br-10 p-15" style={{ backgroundColor: "#1DA1F2", margin: "10px" }}>
            <Link href="/">
              <a>
                <Image
                  src="/assets/images/logos/logoCCGBlack.png"
                  alt="Logo"
                  title="Logo"
                  width={200}
                  style={{ maxHeight: "50px" }}
                />
              </a>
            </Link>
          </Box>
          {isMobile && (
            <IconButton
              edge="start"
              color="inherit"
              aria-label="menu"
              onClick={handleMenuOpen}
            >
              <MenuIcon sx={{ color: '#fff' }} />
            </IconButton>
          )}
        </Box>
        <Popover
          open={Boolean(anchorEl)}
          anchorEl={anchorEl}
          onClose={handleMenuClose}
          anchorOrigin={{
            vertical: 'bottom',
            horizontal: 'right',
          }}
          transformOrigin={{
            vertical: 'top',
            horizontal: 'right',
          }}
        >
          {drawerContent}
        </Popover>
        {!isMobile && (
          <Box sx={{ display: 'flex', flexDirection: 'row', width: '100%', justifyContent: 'center' }}>
            {drawerContent}
          </Box>
        )}
      </Box>
      <Divider />
    </Box>
  );
};

export default HorizontalHeader;
