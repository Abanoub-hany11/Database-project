const apiBase = "https://crudcrud.com/api/YOUR_UNIQUE_ID_HERE/sales";

window.onload = function () {
    fetchSales();
};

document.getElementById("addSaleForm").addEventListener("submit", function (e) {
    e.preventDefault();

    const sale = {
        customer_name: document.getElementById("customerName").value,
        product_name: document.getElementById("productName").value,
        quantity: parseInt(document.getElementById("quantity").value),
        price: parseFloat(document.getElementById("price").value),
        sale_date: document.getElementById("saleDate").value
    };

    fetch(apiBase, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(sale)
    })
    .then(response => response.json())
    .then(() => {
        document.getElementById("addSaleForm").reset();
        fetchSales();
    })
    .catch(error => console.error("Error adding sale:", error));
});

function fetchSales() {
    fetch(apiBase)
        .then(response => response.json())
        .then(data => {
            const tableBody = document.getElementById("salesBody");
            tableBody.innerHTML = "";

            data.forEach(sale => {
                tableBody.innerHTML += `
                    <tr>
                        <td>${sale.customer_name}</td>
                        <td>${sale.product_name}</td>
                        <td>${sale.quantity}</td>
                        <td>${sale.price}</td>
                        <td>${sale.sale_date}</td>
                    </tr>
                `;
            });
        })
        .catch(error => console.error("Error fetching sales:", error));
}