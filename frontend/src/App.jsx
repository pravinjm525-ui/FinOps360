import { useEffect, useState } from "react";

function App() {

  const [customers, setCustomers] = useState([]);

  useEffect(() => {

    fetch("/customers")
      .then(response => response.json())
      .then(data => setCustomers(data));

  }, []);

  return (

    <div style={{ padding: "30px" }}>

      <h1>FinOps360</h1>

      <h2>Customers</h2>

      <table border="1" cellPadding="10">

        <thead>

          <tr>

            <th>ID</th>
            <th>Customer Number</th>
            <th>Name</th>
            <th>Email</th>

          </tr>

        </thead>

        <tbody>

          {

            customers.map(customer => (

              <tr key={customer.customerId}>

                <td>{customer.customerId}</td>

                <td>{customer.customerNumber}</td>

                <td>{customer.firstName} {customer.lastName}</td>

                <td>{customer.email}</td>

              </tr>

            ))

          }

        </tbody>

      </table>

    </div>

  );

}

export default App;
