<!-- Cat Update Form -->
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
    <a href="/cats">Home</a>
    <a href="/cats/createForm">Add New Cat</a>
  </nav>
  <main>
    <form id="new-cat" action="/cats/updateForm/${cat.catId}" method="post" enctype="multipart/form-data">
      <label for="catId">Cat ID</label>
      <input type="text" id="catId" name="catId" value="${cat.catId}" readonly />

     <label for="name">Cat Name</label>
      <input type="text" id="name" name="name" value="${cat.name}" placeholder="Name" />

      <label for="breed">Breed</label>
      <input type="text" id="breed" name="breed" value="${cat.breed}" placeholder="Breed" />

      <label for="age">Age(years)</label>
      <input type="number" id="age" name="age" value="${cat.age}" min="0" placeholder="0" />

      <label for="description">Description</label>
      <textarea id="description" name="description" value="${cat.description}" rows="4" placeholder="Summary"></textarea>

      <label for="catPicturePath">Current Image</label>
      <input type="file" id="catPicturePath" name="catPicturePath" value="${cat.catPicturePath}" readonly/>
      <input type="file" id="picture" name="picture"/>
 

      <button type="submit">Add Cat</button>
      <a href="/cats/${cat.catId}">Cancel</a>

      <div id="message" role="alert"></div>
    </form>
  </main>
</body>
</html>