#!/bin/bash

categories=(
    "showroom:Showroom-uri:Showroom-uri:Containerele modulare pentru showroom-uri oferă spații moderne și atractive pentru prezentarea produselor dumneavoastră. Perfecte pentru expoziții auto, prezentări de produse, galerii temporare și evenimente comerciale."
    "cantine:Cantine:Cantine:Containerele modulare pentru cantine oferă soluții complete pentru servirea meselor în cadrul companiilor, șantierelor sau evenimentelor. Echipate cu bucătărie, zonă de servire și spațiu pentru mese."
    "cabine-paza:Cabine de paza:Cabine de paza:Containerele modulare pentru cabine de pază asigură protecție și supraveghere eficientă pentru diverse obiective. Dotate cu sisteme de monitorizare, încălzire și toate facilitățile necesare personalului de pază."
    "depozite:Depozite:Depozite:Containerele modulare pentru depozitare oferă spații sigure și rezistente pentru stocarea bunurilor. Ideale pentru depozitare echipamente, materiale de construcție, inventar sau arhive."
    "vestiare:Vestiare:Vestiare:Containerele modulare pentru vestiare asigură spații functionale pentru schimbarea hainelor și păstrarea echipamentului personal. Perfecte pentru șantiere, fabrici, baze sportive și evenimente."
    "grupuri-sanitare:Unitati de grupuri sanitare:Unități de grupuri sanitare:Containerele modulare pentru grupuri sanitare oferă soluții complete de igienizare pentru diverse locații. Echipate cu toalete, lavoare, dușuri și sisteme de ventilație."
    "organizari-santier:Organizari de santier:Organizări de șantier:Containerele modulare pentru organizări de șantier oferă soluții complete pentru amenajarea zonelor de lucru. Include birouri, vestiare, depozite și facilitați sanitare într-un ansamblu coerent."
    "chioscuri:Chioscuri:Chioscuri:Containerele modulare pentru chioscuri reprezintă soluția ideală pentru afaceri mici și puncte de vânzare. Perfecte pentru zone comerciale aglomerate, piețe, zone turistice și evenimente."
    "pieti-agro:Pieti agro-alimentare:Piețe agro-alimentare:Containerele modulare pentru piețe agro-alimentare oferă spații moderne pentru comercializarea produselor agricole. Dotate cu sisteme de refrigerare, zone de expunere și facilitați pentru vânzători."
    "scoli:Scoli:Școli:Containerele modulare pentru școli oferă săli de clasă suplimentare, laboratoare sau spații administrative. Soluție rapidă pentru extinderea capacității instituțiilor de învățământ."
    "spitale:Spitale modulare:Spitale modulare:Containerele modulare pentru spitale oferă spații medicale complete pentru tratament și îngrijire. Ideale pentru extinderi temporare, clinici mobile sau situații de urgență medicală."
)

for category in "${categories[@]}"; do
    IFS=':' read -r filename title heading description <<< "$category"
    
    cat > "${filename}.html" << HTMLEOF
<!DOCTYPE html>
<html lang="ro">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title} - Containere Modulare</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header class="main-header">
        <div class="header-top">
            <div class="container">
                <div class="header-info">
                    <span>📞 Telefon: +40 723.56.99.29</span>
                    <span>✉️ Email: info@containere-modulare.ro</span>
                </div>
            </div>
        </div>
        <nav class="main-nav">
            <div class="container">
                <div class="logo">
                    <a href="index.html" style="color: white; text-decoration: none;"><h1>CONTAINERE MODULARE</h1></a>
                </div>
                <ul class="nav-menu">
                    <li><a href="index.html#containere">Containere</a></li>
                    <li><a href="index.html#despre">Despre</a></li>
                    <li><a href="index.html#galerie">Galerie</a></li>
                    <li><a href="index.html#contact">Contact</a></li>
                </ul>
                <a href="#oferta" class="btn-oferta">CERE OFERTA</a>
            </div>
        </nav>
    </header>

    <section class="category-detail">
        <div class="container">
            <div class="category-header">
                <h1>${heading}</h1>
            </div>

            <div class="category-content">
                <div class="category-main-image">
                    <img src="images/${filename}.jpg" alt="${title}" onerror="this.src='data:image/svg+xml,%3Csvg xmlns=%22http://www.w3.org/2000/svg%22 width=%22600%22 height=%22400%22%3E%3Crect fill=%22%232C5AA0%22 width=%22600%22 height=%22400%22/%3E%3Ctext fill=%22white%22 x=%2250%25%22 y=%2250%25%22 text-anchor=%22middle%22 dy=%22.3em%22 font-size=%2232%22%3E${title}%3C/text%3E%3C/svg%3E'">
                </div>
                <div class="category-info">
                    <h2>Descriere</h2>
                    <p>${description}</p>
                    <p>Containerele noastre sunt construite din materiale de calitate superioară, asigurând:</p>
                    <ul>
                        <li>Durabilitate și rezistență în timp</li>
                        <li>Izolație termică și fonică excelentă</li>
                        <li>Instalații electrice complete și conforme</li>
                        <li>Finisaje interioare moderne și funcționale</li>
                        <li>Posibilități de personalizare conform cerințelor</li>
                        <li>Timp rapid de livrare și montaj</li>
                    </ul>
                    <p>Fiecare container poate fi adaptat și configurat în funcție de necesitățile specifice ale proiectului dumneavoastră.</p>
                </div>
            </div>

            <div class="dimensions-section">
                <h2>Dimensiuni Disponibile</h2>
                <p>Oferim containere modulare pe următoarele dimensiuni standard:</p>
                <div class="dimensions-list">
                    <div class="dimension-item">2,40 x 3,00 M</div>
                    <div class="dimension-item">2,40 x 4,00 M</div>
                    <div class="dimension-item">2,40 x 5,00 M</div>
                    <div class="dimension-item">2,40 x 6,00 M</div>
                    <div class="dimension-item">3,00 x 6,00 M</div>
                    <div class="dimension-item">3,00 x 7,00 M</div>
                    <div class="dimension-item">2,40 x 8,00 M</div>
                    <div class="dimension-item">2,40 x 10,00 M</div>
                    <div class="dimension-item">2,40 x 12,00 M</div>
                    <div class="dimension-item">4,80 x 6,00 M</div>
                    <div class="dimension-item">4,80 x 8,00 M</div>
                </div>
                <div class="custom-dimensions">
                    Si orice dimensiune ceruta de client se poate realiza
                </div>
            </div>

            <div class="offer-form-section" id="oferta">
                <h2>Cere Oferta</h2>
                <form class="offer-form">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="nume">Nume *</label>
                            <input type="text" id="nume" name="nume" required>
                        </div>
                        <div class="form-group">
                            <label for="prenume">Prenume *</label>
                            <input type="text" id="prenume" name="prenume" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="telefon">Telefon *</label>
                            <input type="tel" id="telefon" name="telefon" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email *</label>
                            <input type="email" id="email" name="email" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="companie">Companie</label>
                        <input type="text" id="companie" name="companie">
                    </div>
                    <div class="form-group">
                        <label for="dimensiune">Dimensiune dorită</label>
                        <select id="dimensiune" name="dimensiune">
                            <option value="">Selectați o dimensiune</option>
                            <option value="2.4x3">2,40 x 3,00 M</option>
                            <option value="2.4x4">2,40 x 4,00 M</option>
                            <option value="2.4x5">2,40 x 5,00 M</option>
                            <option value="2.4x6">2,40 x 6,00 M</option>
                            <option value="3x6">3,00 x 6,00 M</option>
                            <option value="3x7">3,00 x 7,00 M</option>
                            <option value="2.4x8">2,40 x 8,00 M</option>
                            <option value="2.4x10">2,40 x 10,00 M</option>
                            <option value="2.4x12">2,40 x 12,00 M</option>
                            <option value="4.8x6">4,80 x 6,00 M</option>
                            <option value="4.8x8">4,80 x 8,00 M</option>
                            <option value="custom">Dimensiune personalizată</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="mesaj">Mesaj / Detalii suplimentare</label>
                        <textarea id="mesaj" name="mesaj" placeholder="Descrieți cerințele dumneavoastră..."></textarea>
                    </div>
                    <button type="submit" class="btn-submit">Trimite Cererea</button>
                </form>
            </div>

            <a href="index.html" class="back-link">← Înapoi la categorii</a>
        </div>
    </section>

    <footer class="main-footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-info">
                    <h3>Contact</h3>
                    <p>📞 Telefon: +40 723.56.99.29</p>
                    <p>✉️ Email: info@containere-modulare.ro</p>
                    <p>📍 Adresa: Romania</p>
                </div>
                <div class="footer-links">
                    <h3>Link-uri Utile</h3>
                    <ul>
                        <li><a href="index.html#containere">Containere</a></li>
                        <li><a href="index.html#despre">Despre</a></li>
                        <li><a href="index.html#contact">Contact</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2025 Containere Modulare. Toate drepturile rezervate.</p>
            </div>
        </div>
    </footer>

    <script src="js/main.js"></script>
</body>
</html>
HTMLEOF
done

echo "All category pages generated successfully!"
