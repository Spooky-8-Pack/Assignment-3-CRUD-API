<!-- New Cat Form -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Add New Cat</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0; padding: 0;
      background: #f9f9f9;
    }
    header {
      background: #880000;
      padding: 1em;
      color: white;
      text-align: center;
    }
    nav {
      background: #333;
      display: flex;
      justify-content: center;
    }
    nav a {
      color: white;
      padding: 1em;
      text-decoration: none;
      display: block;
    }
    nav a:hover {
      background-color: #575757;
    }
    main {
      max-width: 600px;
      margin: 2em auto;
      background: white;
      padding: 2em;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }
    form {
      display: flex;
      flex-direction: column;
    }
    label {
      margin-top: 1em;
      font-weight: bold;
      color: #333;
    }
    input[type="text"],
    input[type="number"],
    textarea {
      padding: 0.5em;
      font-size: 1em;
      margin-top: 0.3em;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    textarea {
      resize: vertical;
    }
    button {
      margin-top: 2em;
      padding: 0.75em;
      font-size: 1em;
      background-color: #4CAF50;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }
    button:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>
  <header>
    <h1>Add a New Cat</h1>
  </header>
  <nav>
    <a href="index.html">Home</a>
    <a href="about.html">About</a>
    <a href="new-animal-form.html">Add New Cat</a>
  </nav>
  <main>
    <form id="animalForm" novalidate>
      <label for="name">Cat Name *</label>
      <input type="text" id="name" name="name" required />

      <label for="breed">Breed *</label>
      <input type="text" id="species" name="species" required />

      <label for="age">Age (years) *</label>
      <input type="number" id="age" name="age" min="0" required />

      <label for="summary">Summary *</label>
      <textarea id="summary" name="summary" rows="4" required></textarea>

      <label for="image">Image URL *</label>
      <input type="text" id="image" name="image" required />

      <button type="submit">Add Cat</button>
      <div id="message" role="alert"></div>
    </form>
  </main>
<!--Form is fillable but doesn't actually do anything-->
</body>
</html>