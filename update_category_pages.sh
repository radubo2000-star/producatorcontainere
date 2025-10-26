#!/bin/bash

TECH_SPECS='<div class="tech-specs-section">
                <h2>Cum sunt construite containerele</h2>
                
                <div class="tech-spec-item">
                    <h3>STRUCTURA METALICA</h3>
                    <ul>
                        <li>Structura zincata profilata la rece cu grosime de 2 mm</li>
                        <li>Protectie anti rugina</li>
                        <li>Vopsita in doua straturi: GRUND, Vopsea Poliuretanica</li>
                        <li>Stalpii sunt profilati la rece din table ZINCATA cu o grosime a materialului de 2 mm</li>
                    </ul>
                </div>

                <div class="tech-spec-item">
                    <h3>ACOPERISUL</h3>
                    <ul>
                        <li>Structura zincata profilata la rece prevazuta cu canal de drenare a apei</li>
                        <li>Tabla zincata dublu faltuita (0,5 mm)</li>
                        <li>Traverse din teava rectangulara cu grosime de 2mm</li>
                        <li>Folie anticondens</li>
                        <li>Vata mineral 100mm</li>
                        <li>Lambriu finisat de culoare alba</li>
                    </ul>
                </div>

                <div class="tech-spec-item">
                    <h3>PERETII</h3>
                    <ul>
                        <li>Panou sandwich 40 mm grosime cu spuma poliuretanica</li>
                        <li>Usa PVC</li>
                        <li>Ferestra din PVC</li>
                    </ul>
                </div>

                <div class="tech-spec-item">
                    <h3>PODEAUA</h3>
                    <ul>
                        <li>Tabla zincata cutata H12 (0,5 mm)</li>
                        <li>GRINDA 10x10mm si 10x5mm</li>
                        <li>Vata mineral de 100 mm</li>
                        <li>Pardoseala interioara din osb hidrofugat 18 mm</li>
                    </ul>
                </div>

                <div class="tech-spec-item">
                    <h3>INSTALATIA ELECTRICA</h3>
                    <ul>
                        <li>Priza exterioara 230V</li>
                        <li>Tensiune lucru 230 V</li>
                        <li>Tablou sigurante automate</li>
                        <li>Prize</li>
                        <li>Intrerupator</li>
                        <li>Lampi neon</li>
                    </ul>
                </div>
            </div>

            <div class="cta-section">
                <h2>Solicită o Ofertă Personalizată</h2>
                <p>Suntem gata să vă oferim cea mai bună soluție pentru nevoile dumneavoastră</p>
                <a href="oferta.html" class="btn-cta">Cere Oferta Acum</a>
            </div>'

for file in birouri.html comerciale.html showroom.html cantine.html cabine-paza.html depozite.html vestiare.html grupuri-sanitare.html organizari-santier.html chioscuri.html pieti-agro.html scoli.html spitale.html; do
    echo "Processing $file..."
done

echo "Category pages template prepared!"
