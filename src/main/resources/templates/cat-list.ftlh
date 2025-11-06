<!-- Cat List -->
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Adrians Cats Gallery</title>
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
      max-width: 900px;
      margin: 2em auto;
      padding: 0 1em;
     }

     .search-bar {
      margin-bottom: 1em;
      text-align:center;
     }

     .search-bar input {
      padding: 0.5em;
      width: 50%;
      font-size: 1em;
     }

     .gallery{
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
      gap: 1.5em;
     }

     .animal-card{
      background: white;
      border-radius: 8px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      overflow: hidden;
      display: flex;
      flex-direction: column;
      cursor: pointer;
      transition: transform 0.2s;
     }

     .animal-card:hover{
      transform: scale(1.05);
     }

     .animal-card img{
      width: 100%;
      height: 150px;
      object-fit: cover;
     }

     .animal-info{
      padding: 1em;
      flex-grow: 1;
     }

     .animal-name{
      font-weight: bold;
      font-size: 1.2em;
      margin-bottom: 0.3em;
     }

     .animal-summary{
      font-size: 0.9em;
      color: #555;
     }
    </style>
  </head>

  <body>
    <header>
      <h1>Adrians Cat Gallery</h1>
    </header>
      <nav>
        <a href="/cats">Home</a>
        <a href="/cats/createForm">Add New Cat</a>
      </nav>
      <main>
        <div class="search-bar">
          <input type="text" id="searchInput" placeholder="Search animals..." />
        </div>
        <div class="gallery" id="gallery">
        <#list catList as cat>
        <div class="animal-card">
            <div class="animal-info">
                <div class="animal-name">${cat.name}</div>
                <div class="animal-summary">${cat.description}</div>
            </div>
        </div>
        </#list>
        </div>
      </main>
      </script>
  </body>
</html>