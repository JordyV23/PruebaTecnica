import React,{useEffect,useState} from 'react'

const App = () => {
  const [backendData, setBackednData] = useState([{}])

  useEffect (() => {
    fetch("/services").then(
      response => response.json()
    ) .then(
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
        backendData.services.map((service,i) => (
          <p key={i}> {service.servicio}</p>
        ))
      )}
      
    </div>
  )
}

export default App