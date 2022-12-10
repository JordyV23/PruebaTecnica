import React from 'react'
import { BrowserRouter as Router,Routes,Route } from 'react-router-dom';

import Services from './components/getServices';
import Clients from './components/getClients'

const App = () => {
  return (
    <Router>
      <Routes>
        <Route path='/servicios' actual element = { <Services/>}/>
        <Route path='/clientes' actual element = { <Clients/>}/>
      </Routes>
    </Router>
  )
}

export default App