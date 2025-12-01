import React, { useState } from "react";

export default function RohitFancyPasal() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [formData, setFormData] = useState({ phone: "", email: "" });

  const handleLogin = (e) => {
    e.preventDefault();
    if (formData.phone.length < 10 || !formData.email.includes("@")) {
      alert("Please enter a valid phone number and email.");
      return;
    }
    setIsLoggedIn(true);
  };

  const products = [
    { id: 1, name: "Ladies Handbag", price: "1200", displayPrice: "Rs. 1,200", img: "https://via.placeholder.com/300", desc: "Premium ladies handbag." },
    { id: 2, name: "Cosmetics Set", price: "850", displayPrice: "Rs. 850", img: "https://via.placeholder.com/300", desc: "Daily cosmetic combo pack." },
    { id: 3, name: "Gift Item", price: "650", displayPrice: "Rs. 650", img: "https://via.placeholder.com/300", desc: "Stylish gift item for any occasion." },
    { id: 4, name: "Hair Clips Set", price: "150", displayPrice: "Rs. 150", img: "https://via.placeholder.com/300", desc: "Trendy hair clips for women." },
    { id: 5, name: "Ladies Wallet", price: "450", displayPrice: "Rs. 450", img: "https://via.placeholder.com/300", desc: "High‑quality ladies purse wallet." },
    { id: 6, name: "Cosmetic Pouch", price: "300", displayPrice: "Rs. 300", img: "https://via.placeholder.com/300", desc: "Portable makeup pouch." },
    { id: 7, name: "Mens Wallet", price: "500", displayPrice: "Rs. 500", img: "https://via.placeholder.com/300", desc: "Classic leather men’s wallet." },
    { id: 8, name: "Kids Fancy Hairband", price: "120", displayPrice: "Rs. 120", img: "https://via.placeholder.com/300", desc: "Cute designs for kids." },
    { id: 9, name: "Perfume Set", price: "900", displayPrice: "Rs. 900", img: "https://via.placeholder.com/300", desc: "Long lasting fragrance perfumes." },
    { id: 10, name: "Ladies Shawl", price: "650", displayPrice: "Rs. 650", img: "https://via.placeholder.com/300", desc: "Soft fabric ladies shawl." }
  ];

  const openWhatsApp = (product) => {
    const message = `Hello! I want to buy: ${product.name} (Price: ${product.displayPrice})`;
    window.open(`https://wa.me/9779800000000?text=${encodeURIComponent(message)}`);
  };

  const payWithEsewa = (product) => {
    alert(`Use eSewa ID: 98XXXXXXXX and pay Rs. ${product.price}. After payment send screenshot on WhatsApp.`);
    window.open("https://esewa.com.np/#/home", "_blank");
  };

  const bankPayment = (product) => {
    alert(
      `Bank Payment Details:\n\nBank: Nepal Bank Limited\nAccount Name: Rohit Fancy Pasal\nAccount Number: 1234567890\nAmount: Rs. ${product.price}\n\nAfter payment send voucher on WhatsApp.`
    );
  };

  return (
    <div className="min-h-screen bg-gray-100 p-6">
      {!isLoggedIn ? (
        <div className="max-w-md mx-auto bg-white shadow-lg rounded-2xl p-6 mt-20">
          <h2 className="text-2xl font-bold text-center mb-4">Login to Continue</h2>
          <form onSubmit={handleLogin}>
            <label className="block mb-3">
              <span className="text-gray-700">Phone Number</span>
              <input
                type="number"
                className="w-full mt-1 p-2 border rounded-xl"
                placeholder="98XXXXXXXX"
                value={formData.phone}
                onChange={(e) => setFormData({ ...formData, phone: e.target.value })}
              />
            </label>

            <label className="block mb-3">
              <span className="text-gray-700">Email</span>
              <input
                type="email"
                className="w-full mt-1 p-2 border rounded-xl"
                placeholder="example@gmail.com"
                value={formData.email}
                onChange={(e) => setFormData({ ...formData, email: e.target.value })}
              />
            </label>

            <button className="w-full bg-blue-600 text-white py-2 rounded-xl shadow hover:bg-blue-700 mt-3">
              Login
            </button>
          </form>
        </div>
      ) : (
        <>
          <header className="text-center mb-10">
            <h1 className="text-4xl font-bold text-gray-800">Rohit Fancy Pasal</h1>
            <p className="text-gray-600 mt-2">All Fancy Products Available</p>
          </header>

          <section className="grid md:grid-cols-3 gap-6">
            {products.map((product) => (
              <div key={product.id} className="bg-white rounded-2xl shadow p-4">
                <img src={product.img} alt={product.name} className="rounded-xl w-full" />
                <h2 className="text-xl font-semibold mt-4">{product.name}</h2>
                <p className="text-gray-600">{product.desc}</p>
                <p className="text-gray-800 font-bold mt-2">{product.displayPrice}</p>

                <button
                  onClick={() => openWhatsApp(product)}
                  className="mt-4 w-full bg-green-500 text-white py-2 rounded-xl shadow hover:bg-green-600"
                >
                  Buy via WhatsApp
                </button>

                <button
                  onClick={() => payWithEsewa(product)}
                  className="mt-2 w-full bg-green-600 text-white py-2 rounded-xl shadow hover:bg-green-700"
                >
                  Pay with eSewa
                </button>

                <button
                  onClick={() => bankPayment(product)}
                  className="mt-2 w-full bg-blue-600 text-white py-2 rounded-xl shadow hover:bg-blue-700"
                >
                  Bank Deposit
                </button>
              </div>
            ))}
          </section>

          <footer className="text-center mt-10 text-gray-700">
            © {new Date().getFullYear()} Rohit Fancy Pasal. All Rights Reserved.
          </footer>
        </>
      )}
    </div>
  );
}
