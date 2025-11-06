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
        <a href="index.html">Home</a>
        <a href="about.html">About</a>
        <a href="new-animal-form.html">Add New Cat</a>
      </nav>
      <main>
        <div class="search-bar">
          <input type="text" id="searchInput" placeholder="Search animals..." />
        </div>
        <div class="gallery" id="gallery">
          <!-- added by JS-->
        </div>
      </main>

      <script>
        //old JS
        /*
        const animals = [
          {
            name: 'Orion',
            breed: 'Short-hair Tabby',
            age: 7,
            summary: 'Orion is a sweet boy who loves naps and cuddling',
            image: 'https://raw.githubusercontent.com/Spooky-8-Pack/Assignment-2-Static-Web-App/refs/heads/main/Cat%20Images/Cat%20Orion.jpg',
          },
          {
            name: 'Tiger Tail (TT)',
            breed: 'Long-hair Diluted Tortie',
            age: 19,
            summary: 'TT is queen of the house and loves cheese',
            image: 'https://raw.githubusercontent.com/Spooky-8-Pack/Assignment-2-Static-Web-App/refs/heads/main/Cat%20Images/Cat%20TT.jpg',
          },
          {
            name: 'Babycat',
            breed: 'Long-hair Half-tux',
            age: 18,
            summary: 'Babycat is TTs younger brother and a huge sweetheart',
            image: 'https://raw.githubusercontent.com/Spooky-8-Pack/Assignment-2-Static-Web-App/refs/heads/main/Cat%20Images/Cat%20Babycat.jpg',
          },
          {
            name: 'Diesel',
            breed: 'Long-hair Tuxedo',
            age: 9,
            summary: 'Diesel can be fiesty but shes full of love',
            image: 'https://raw.githubusercontent.com/Spooky-8-Pack/Assignment-2-Static-Web-App/refs/heads/main/Cat%20Images/Cat%20Diesel.jpg',
            
          },
          {
            name: 'Benny',
            breed: 'Long-hair Tabby',
            age: 4,
            summary: 'Benny is playful, loving, and shaped roughly like a basketball',
            image: 'https://raw.githubusercontent.com/Spooky-8-Pack/Assignment-2-Static-Web-App/refs/heads/main/Cat%20Images/Cat%20Benny.jpg',
          }
        ];
        */
      const gallery = document.getElementById('gallery');
      const searchInput = document.getElementById('searchInput');

      function createAnimalCard(animal) {
      const card = document.createElement('div');
      card.className = 'animal-card';
      card.tabIndex = 0;
      card.setAttribute('role', 'button');
      card.setAttribute('aria-label', `More details about ${animal.name}`);
      card.innerHTML = `
        <img src="${animal.image}" alt="Image of ${animal.name}" />
        <div class="animal-info">
          <div class="animal-name">${animal.name}</div>
          <div class="animal-summary">${animal.summary}</div>
        </div>
      `;
      card.addEventListener('click', () => {
        // Store selected animal in sessionStorage and navigate to details page
        sessionStorage.setItem('selectedAnimal', JSON.stringify(animal));
        window.location.href = 'details.html';
      });
      card.addEventListener('keypress', (e) => {
        if (e.key === 'Enter' || e.key === ' ') {
          e.preventDefault();
          card.click();
        }
      });
      return card;
    }

    function renderGallery(filterText = '') {
      gallery.innerHTML = '';
      const filteredAnimals = animals.filter(a =>
        a.name.toLowerCase().includes(filterText.toLowerCase()) ||
        a.species.toLowerCase().includes(filterText.toLowerCase())
      );
      if (filteredAnimals.length === 0) {
        gallery.innerHTML = '<p>No animals found matching your search.</p>';
        return;
      }
      filteredAnimals.forEach(animal => {
        gallery.appendChild(createAnimalCard(animal));
      });
    }

    searchInput.addEventListener('input', (e) => {
      renderGallery(e.target.value);
    });

    // Initial render
    renderGallery();

      </script>
  </body>
</html>