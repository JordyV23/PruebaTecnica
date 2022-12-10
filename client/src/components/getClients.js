import React,{useEffect,useState} from "react";

const Clients = () => {
    const [backendData, setBackednData] = useState([{}])
  
    useEffect (() => {
      fetch("/listClients").then(
        response => response.json()
      ).then(
        data=> {
          setBackednData(data)
        }
      )
    }, [])
  
    return (
      <div>
        {(typeof backendData.services === 'undefined') ? (
          <p>Cargando...</p>
        ) : (
          backendData.map((service,i) => (
            <p key={i}> {service}</p>
          ))
        )}
        
      </div>
    )
  }

export default Clients;