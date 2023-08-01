import { Alert } from "@mui/material";
import React, { useState, useEffect } from "react";
import AlertTitle from '@mui/material/AlertTitle';


const AlertComponent = ({ severity, title, message, timeout 
 }) => {
    const [showAlert, setShowAlert] = useState(true);

    useEffect(() => {
        const timer = setTimeout(() => {
            setShowAlert(false);
        }, timeout);
        return () => clearTimeout(timer);
    }, [timeout]);

    if (!showAlert) {
        return null;
    }

    return (
        <Alert severity={severity} onClose={() => setShowAlert(false)}>
        <AlertTitle>{title}</AlertTitle>
        {message}
        </Alert>
    );
    }

export default AlertComponent;