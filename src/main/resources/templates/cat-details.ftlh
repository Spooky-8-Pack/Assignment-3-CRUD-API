<!-- Cat Details -->
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width", initial-scale="1" />
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
      max-width: 700px;
      margin: 2em auto;
      background: white;
      padding: 1.5em;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }
    h2 {
      margin-top: 0;
    }
    .animal-image {
      width: 100%;
      max-height: 350px;
      object-fit: cover;
      border-radius: 8px;
      margin-bottom: 1em;
    }
    .animal-details {
      line-height: 1.5;
      color: #333;
    }
    </style>
    </head>
    
    <body>
        <header>
          <h1>Cat Details</h1>
        </header>
        <nav>
          <a href="/cats">Home</a>
          <a href="/cats/createForm">Add New Cat</a>
          </nav>
        <main id="content">
         <h2>${animal.name}</h2>
              <img src="${animal.image}" alt="Image of ${animal.name}" class="animal-image" />
              <div class="animal-details">
                <p><strong>Breed:</strong> ${animal.breed}</p>
                <p><strong>Age:</strong> ${animal.age} years</p>
                <p><strong>Summary:</strong> ${animal.summary}</p>
              </div>     
        </main>
    </body>
</html>