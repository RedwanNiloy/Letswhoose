import NavBar from "./navbar"
import Image from "next/image"


 
const Layout = ({children})=>{
    return (
        <>
        
        <NavBar />
        <Image src={'/bg.jpg'} layout={"fill"}  />
        {children}
        
        </>
    )
}

export default Layout