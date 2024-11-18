"use client"; // Add this at the top

import { useEffect, useState } from "react";
import axios from "axios";
import styles from "./page.module.css"; // Keep existing styles

export default function Home() {
  const [menuItems, setMenuItems] = useState([]);
  const [newItem, setNewItem] = useState({ name: "", price: "" });
  const [isEditing, setIsEditing] = useState(false);
  const [editItem, setEditItem] = useState(null);

  // Fetch menu items from the backend
  useEffect(() => {
    axios
      .get("http://4.188.111.191:8000/api/menu-items/") // Adjust the URL to match your backend
      .then((response) => {
        setMenuItems(response.data);
      })
      .catch((error) => {
        console.error("Error fetching menu items:", error);
      });
  }, []);

  // Handle create new menu item
  const handleCreate = () => {
    axios
      .post("http://4.188.111.191:8000/api/menu-items/", newItem) // Sending new item to backend
      .then((response) => {
        setMenuItems([...menuItems, response.data]); // Add the new item to the list
        setNewItem({ name: "", price: "" }); // Reset form
      })
      .catch((error) => {
        console.error("Error creating menu item:", error);
      });
  };

  // Handle update existing menu item
  const handleUpdate = () => {
    axios
      .put(`http://4.188.111.191:8000/api/menu-items/${editItem.id}/`, editItem) // Sending updated item
      .then((response) => {
        const updatedItems = menuItems.map((item) =>
          item.id === editItem.id ? response.data : item
        );
        setMenuItems(updatedItems); // Update the list with the modified item
        setIsEditing(false); // Reset editing mode
        setEditItem(null); // Reset the item being edited
      })
      .catch((error) => {
        console.error("Error updating menu item:", error);
      });
  };

  // Handle delete menu item
  const handleDelete = (id) => {
    axios
      .delete(`http://4.188.111.191:8000/api/menu-items/${id}/`) // Deleting item
      .then(() => {
        setMenuItems(menuItems.filter((item) => item.id !== id)); // Remove deleted item from the list
      })
      .catch((error) => {
        console.error("Error deleting menu item:", error);
      });
  };

  return (
    <div className={styles.page}>
      <main className={styles.main}>
        <h1>Restaurant Menu</h1>

        {/* Menu Items Display */}
        {menuItems.length === 0 ? (
          <p>Loading menu...</p>
        ) : (
          <ul>
            {menuItems.map((item) => (
              <li key={item.id}>
                {item.name} - ${item.price}
                <button onClick={() => handleDelete(item.id)}>Delete</button>
                <button onClick={() => {
                  setIsEditing(true);
                  setEditItem(item);
                }}>
                  Edit
                </button>
              </li>
            ))}
          </ul>
        )}

        {/* Add New Menu Item */}
        <h2>Add New Item</h2>
        <input
          type="text"
          placeholder="Name"
          value={newItem.name}
          onChange={(e) => setNewItem({ ...newItem, name: e.target.value })}
        />
        <input
          type="text"
          placeholder="Price"
          value={newItem.price}
          onChange={(e) => setNewItem({ ...newItem, price: e.target.value })}
        />
        <button onClick={handleCreate}>Add Item</button>

        {/* Edit Menu Item */}
        {isEditing && (
          <div>
            <h2>Edit Item</h2>
            <input
              type="text"
              value={editItem.name}
              onChange={(e) => setEditItem({ ...editItem, name: e.target.value })}
            />
            <input
              type="text"
              value={editItem.price}
              onChange={(e) => setEditItem({ ...editItem, price: e.target.value })}
            />
            <button onClick={handleUpdate}>Update Item</button>
            <button onClick={() => setIsEditing(false)}>Cancel</button>
          </div>
        )}
      </main>
    </div>
  );
}
