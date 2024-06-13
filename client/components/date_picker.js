import * as React from 'react';
import TextField from '@mui/material/TextField';
import { AdapterDateFns } from '@mui/x-date-pickers/AdapterDateFns';
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider';
import { DatePicker } from '@mui/x-date-pickers/DatePicker';
import { Container } from '@mui/system';

export default function BasicDatePicker(props) {
  const {value,setValue} = props;
  
  
  return (
    

    
    <LocalizationProvider dateAdapter={AdapterDateFns}>
      <DatePicker
        label="Departure Date"
        value={value}
        sx={{
           
            width: "30vh",
        }
        }
        onChange={(newValue) => {
          setValue(newValue);
        }}
        renderInput={(params) => <TextField {...params}  helperText = "Date of Departure"/>}
        
      />
    </LocalizationProvider>
    
  );
}
