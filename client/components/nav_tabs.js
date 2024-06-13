import * as React from "react";
import Box from "@mui/material/Box";
import Tabs from "@mui/material/Tabs";
import Tab from "@mui/material/Tab";
import Styles from "../styles/Home.module.css"



function LinkTab(props) {
   

  return (
    <Tab
        
        
       
      onClick={props.handleClick}
      
      sx={{
        marginX: "10px",
        borderRadius: "10px",
       stopColor: "white",
        backgroundColor: props.flag?"white":"#F3A712",
       
      }}
      {...props}
    />
  );
}

export default function NavTabs(props) {
  const {flag1,flag2,flag3,setFlag1,setFlag2,setFlag3} = props;





  



  

  return (
    <Box
      position="absolute"
      sx={{
        zIndex: "modal",
        width: "100%",
        marginTop: "25vh",
      }}
    >
      <Tabs  centered>
        <LinkTab
          flag= {flag1}
          handleClick ={()=>{
            
              setFlag1(true);
              setFlag2(false);
              setFlag3(false);
          
          }}
          id = '1'
          label="Book Flight"
         
         
        />
        <LinkTab
        flag = {flag2}
        handleClick ={()=>{
            
          setFlag2(true);
          setFlag1(false);
          setFlag3(false);
      
      }}
          id = '2'
          label="Check Your Trip"
         
          
        />
        <LinkTab
        flag = {flag3}
        handleClick ={()=>{
            
          setFlag3(true);
          setFlag2(false);
          setFlag1(false);
      
      }}
          id = '3'
          label="Flight Status"
         
          
        />
      </Tabs>
    </Box>
  );
}
