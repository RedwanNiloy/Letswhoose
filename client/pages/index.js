import * as React from "react";
import CssBaseline from "@mui/material/CssBaseline";
import Box from "@mui/material/Box";
import Container from "@mui/material/Container";
import TextField from "@mui/material/TextField";
import MenuItem from "@mui/material/MenuItem";
import InputAdornment from "@mui/material/InputAdornment";
import BasicDatePicker from "../components/date_picker";
import FlightIcon from "@mui/icons-material/Flight";
import FlightLandIcon from "@mui/icons-material/FlightLand";
import FlightTakeoffIcon from "@mui/icons-material/FlightTakeoff";
import Button from "@mui/material/Button";
import NavTabs from "../components/nav_tabs";
import AirplaneTicketIcon from "@mui/icons-material/AirplaneTicket";
import PersonIcon from "@mui/icons-material/Person";
import PeopleIcon from "@mui/icons-material/People";
import Axios from "axios"

const classTypes = [
  {
    value: "eco",
    label: "Economy",
  },
  {
    value: "bus",
    label: "Business",
  },
  {
    value: "fst",
    label: "First Class",
  },
];

function Home() {
  const [flag1, setFlag1] = React.useState(true);
  const [flag2, setFlag2] = React.useState(false);
  const [flag3, setFlag3] = React.useState(false);

  // const InitialFValues = {};
  // const validate = () => {
  //   let temp = {};
  //   temp.departure = values.departure ? "" : "This field is required";
  //   temp.destination = values.destination ? "" : "This field is required";
  //   temp.passenger = values.passenger > 0 ? "" : "This field is required";
  //   setErrors({
  //     ...temp,
  //   });
  //   return Object.values(temp).every((x) => x == "");
  // };

  // const { values, setValues, errors, setErrors, handleInputChange } =
  //   useForm(InitialFValues);

  // const handleSubmit = (event) => {
  //   event.preventDefault();
  //   if (validate()) window.alert("...testing");
  // };

  return (
    <div>
      <React.Fragment>
        <CssBaseline />
        <Container
          sx={{
            display: "flex",
            justifyContent: "center",
          }}
        >
          <NavTabs
            flag1={flag1}
            flag2={flag2}
            flag3={flag3}
            setFlag1={setFlag1}
            setFlag2={setFlag2}
            setFlag3={setFlag3}
          />
          {/* <Form onSubmitted={handleSubmit}> */}
          <Box
            position={"absolute"}
            sx={{
              zIndex: "modal",

              borderRadius: "16px",
              zIndex: "modal",
              bgcolor: "white",

              marginTop: "30vh",
            }}
          >
            <PlaceOption flag1={flag1} flag2={flag2} flag3={flag3} />

            
          </Box>
          {/* </Form> */}
        </Container>
      </React.Fragment>
    </div>
  );
}

export default Home;

function PlaceOption(props) {
  const [departure, setDeparture] = React.useState("");
  const [destination, setDestination] = React.useState("");
  const [depTime, setDepTime] = React.useState(null);
  const [passenger, setPassenger] = React.useState("");
  const [classType, setClassType] = React.useState("Economy");
  const [ticketID, setTicketID] = React.useState("");
  const [lastName, setLastName] = React.useState("");
  const [flightID, setFlightID] = React.useState("");
  const fetchData = async(e)=>{
    e.preventDefault();
    const res =  await Axios.get("http://localhost:3000/get/flight_details",{
      depTime: depTime,
      departure: departure,
      destination: destination,
      
    }).then((response)=>{
      console.log(response);
    });
    
  }
  const { flag1, flag2, flag3 } = props;
  if (flag2 == true) {
    return (
      <>
      
      <Container>
        <TextField
          required
          id="outlined-search"
          label="Ticket ID"
          type="search"
          value={ticketID}
          helperText="Insert Ticket ID"
          InputProps={{
            startAdornment: (
              <InputAdornment position="start">
                <AirplaneTicketIcon />
              </InputAdornment>
            ),
          }}
          sx={{
            width: "50vh",
            marginTop: "5vh",
            marginRight: "5vh",
          }}
        />
        <TextField
          required
          id="outlined-search"
          label="Last Name"
          type="search"
          helperText="Insert Your Last Name"
          value={lastName}
          InputProps={{
            startAdornment: (
              <InputAdornment position="start">
                <PersonIcon />
              </InputAdornment>
            ),
          }}
          sx={{
            bgcolor: "white",
            width: "50vh",
            marginTop: "5vh",
            marginLeft: "5vh",
          }}
        />
      </Container>
      <Container
              sx={{
                marginTop: "5vh",
                display: "flex",
                justifyContent: "flex-end",
              }}
            >
              <Button
              onClick={fetchData}
                variant="contained"
                endIcon={<FlightIcon />}
                sx={{
                  backgroundColor: "#F3A712",
                  marginBottom: "20px",
                }}
              >
                Search
              </Button>
            </Container>
</>            
    );
  } else {
    return (
      <>
        <Container
          sx={{
            display: "flex",

            justifyContent: "space-between",
          }}
        >
          <TextField
            required
            id="outlined-search"
            label="Departure"
            type="search"
            helperText="Select Departure City or Airport"
            value={departure}
            onChange={(e) => {
              e.preventDefault();
              setDeparture(e.target.value);
            }}
            InputProps={{
              startAdornment: (
                <InputAdornment position="start">
                  <FlightTakeoffIcon />
                </InputAdornment>
              ),
            }}
            sx={{
              width: "50vh",
              marginTop: "5vh",
              marginRight: "5vh",
            }}
          />

          <TextField
            required
            id="outlined-search"
            label="Arrival"
            type="search"
            helperText="Select Arrival City or Airport"
            value={destination}
            onChange={(e) => {
              e.preventDefault();
              setDestination(e.target.value);
            }}
            InputProps={{
              startAdornment: (
                <InputAdornment position="start">
                  <FlightLandIcon />
                </InputAdornment>
              ),
            }}
            sx={{
              bgcolor: "white",
              width: "50vh",
              marginTop: "5vh",
              marginLeft: "5vh",
            }}
          />
        </Container>
        <SerachOption
          flag1={flag1}
          flag3={flag3}
          passenger={passenger}
          setPassenger={setPassenger}
          classType={classType}
          setClassType={setClassType}
          depTime = {depTime}
          setDepTime = {setDepTime}
        />
        <Container
              sx={{
                marginTop: "5vh",
                display: "flex",
                justifyContent: "flex-end",
              }}
            >
              <Button
              onClick={fetchData}
                variant="contained"
                endIcon={<FlightIcon />}
                sx={{
                  backgroundColor: "#F3A712",
                  marginBottom: "20px",
                }}
              >
                Search
              </Button>
            </Container>
      </>
    );
  }
}
function SerachOption(props) {
  const {passenger,setPassenger,classType,setClassType,depTime,setDepTime} = props;
  const handleChange = (event) => {
    setClassType(event.target.value);
  };
  if (props.flag1 == true) {
    return (
      <Container
        sx={{
          display: "flex",
          alignItems: "center",
          justifyContent: "space-between",
          marginTop: "5vh",
        }}
      >
        <BasicDatePicker  value= {depTime} setValue = {setDepTime}/>
        <TextField
          required
          id="outlined-search"
          label="Passenger"
          type="number"
          helperText="Select Number of Passengers"
          value = {passenger}
          onChange = {(e)=>{
            e.preventDefault();
            setPassenger(e.target.value);
          }}
          InputProps={{
            startAdornment: (
              <InputAdornment position="start">
                <PeopleIcon />
              </InputAdornment>
            ),
            min: 0,
            max: 4,
            inputMode: "numeric",
            pattern: "[0-9]*",
          }}
          sx={{
            width: "30vh",
          }}
        />

        <TextField
          required
          id="outlined-search"
          label="Class"
          select
          value={classType}
          onChange = {(e)=>{
            e.preventDefault();
            setClassType(e.target.value);
          }}
          helperText="Select Class"
          sx={{
            width: "30vh",
          }}
        >
          {classTypes.map((option) => (
            <MenuItem key={option.value} value={option.value}>
              {option.label}
            </MenuItem>
          ))}
        </TextField>
      </Container>
    );
  } else if (props.flag3 == true) {
    return (
      <Container
        sx={{
          display: "flex",
          alignItems: "center",
          justifyContent: "space-between",
          marginTop: "5vh",
        }}
      >
        <BasicDatePicker />
        <TextField
          id="outlined-search"
          label="Flight-ID"
          type="search"
          helperText="Insert Flight ID"
          sx={{
            width: "50vh",
          }}
        />
      </Container>
    );
  }
}
