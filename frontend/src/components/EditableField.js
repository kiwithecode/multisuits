import React, { useState } from 'react';
import { IconButton, CircularProgress, Box } from '@mui/material';
import { Edit as EditIcon, Done as DoneIcon } from '@mui/icons-material';

function EditableField({ label, initialValue, onUpdate,isDisabled}) {
  const [isEditing, setIsEditing] = useState(false);
  const [fieldValue, setFieldValue] = useState(initialValue);
  const [isLoading, setIsLoading] = useState(false);
  const [disabled, setDisabled] = useState(isDisabled);

  const handleEditClick = () => {
    setIsEditing(true);
  };

  const handleUpdateClick = async () => {
    setIsLoading(true);
    await onUpdate(fieldValue);
    setIsLoading(false);
    setIsEditing(false);
  };

  const handleChange = (e) => {
    setFieldValue(e.target.value);
  };

  return (
    <Box
      sx={{
        width: '100%',
        maxWidth: '400px',
      }}

    >
      <strong>{label}</strong>
      {isEditing ? (
        <div style={{
          display: 'flex',
          alignItems: 'center',
        }}>
        <div
        >          <input
            type="text"
            value={fieldValue}
            onChange={handleChange}
            autoFocus
            disabled={isLoading}
            style={{
              width: '20em', // Set fixed width if needed
              padding: '0 0', // Add some padding if needed
              border: 'none', // Remove default input border
              borderBottom: '1px solid black', // Add bottom border
            }}
          /></div>

          <IconButton onClick={handleUpdateClick} disabled={isLoading}>
            {isLoading ? (
              <CircularProgress size={20} /> // Display the loading indicator
            ) : (
              <DoneIcon />
            )}
          </IconButton>
        </div>
      ) : (
        <div style={{ display: 'flex', alignItems: 'center' }}>
          <span
            style={{
              borderBottom: '1px solid black',
              marginBottom: '10px',
              marginRight: '10px',
              width: '20em',
            }}
          >{fieldValue}</span>
          <IconButton onClick={handleEditClick}>
            <EditIcon />
          </IconButton>
        </div>
      )}
    </Box>
  );
}

export default EditableField;