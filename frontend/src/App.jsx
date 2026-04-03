import { useState } from 'react'

import './App.css'

function App() {
  const [message, setMessage] = useState('')

  const load = async () => {
    const res = await fetch('http://localhost:8080/api/hello')
    const text = await res.text()
    setMessage(text)
  }

  return (
    <div>
      <button onClick={load}>Load Message</button>
      <p>{message}</p>
    </div>
  )
}

export default App
