let currentSlideIndex = 1;

// Fallback header/footer templates (used when fetch() cannot load includes, e.g. file://)
const HEADER_HTML = `
<header class="main-header">
    <div class="header-top">
        <div class="container">
            <div class="header-info">
                <span>📞 Telefon: <a href="tel:0752878096">0752.878.096</a></span>
                <span>✉️ Email: <a href="mailto:andreipop1996@icloud.com">andreipop1996@icloud.com</a></span>
            </div>
        </div>
    </div>
    <nav class="main-nav">
        <div class="container">
            <div class="logo">
                <a href="index.html" style="color: white; text-decoration: none;"><h1>PRODUCĂTOR CONTAINERE</h1></a>
            </div>
            <ul class="nav-menu">
                <li><a href="index.html#containere">Containere</a></li>
                <li><a href="index.html#galerie">Galerie</a></li>
                <li><a href="index.html#despre">Despre</a></li>
                <li><a href="index.html#contact">Contact</a></li>
            </ul>
            <a href="oferta.html" class="btn-oferta">CERE OFERTA</a>
        </div>
    </nav>
</header>`;

const FOOTER_HTML = `
<footer class="main-footer">
    <div class="container">
        <div class="footer-content">
            <div class="footer-info">
                <h3>Contact</h3>
                <p><strong>Andrei Pop</strong></p>
                <p>📞 Telefon: <a href="tel:0752878096">0752.878.096</a></p>
                <p>✉️ Email: <a href="mailto:andreipop1996@icloud.com">andreipop1996@icloud.com</a></p>
                <p>📍 Adresa: Romania</p>
            </div>
            <div class="footer-links">
                <h3>Link-uri Utile</h3>
                <ul>
                    <li><a href="#containere">Containere</a></li>
                    <li><a href="#galerie">Galerie</a></li>
                    <li><a href="oferta.html">Cere Oferta</a></li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2025 Producător containere. Toate drepturile rezervate.</p>
        </div>
    </div>
</footer>`;

function showSlide(n) {
    const slides = document.querySelectorAll('.carousel-slide');
    const dots = document.querySelectorAll('.dot');
    
    if (slides.length === 0) return;
    
    if (n > slides.length) {
        currentSlideIndex = 1;
    }
    if (n < 1) {
        currentSlideIndex = slides.length;
    }
    
    slides.forEach(slide => {
        slide.classList.remove('active');
    });
    
    dots.forEach(dot => {
        dot.classList.remove('active');
    });
    
    slides[currentSlideIndex - 1].classList.add('active');
    dots[currentSlideIndex - 1].classList.add('active');
}

function moveSlide(n) {
    showSlide(currentSlideIndex += n);
}

function currentSlide(n) {
    showSlide(currentSlideIndex = n);
}

// Inject common header/footer into pages that include placeholders
function injectIncludes() {
    const includeHeader = document.querySelectorAll('[data-include="header"]');
    const includeFooter = document.querySelectorAll('[data-include="footer"]');

    const tasks = [];

    includeHeader.forEach(el => {
        const p = (async () => {
            try {
                const res = await fetch('includes/header.html');
                if (res.ok) {
                    el.innerHTML = await res.text();
                } else {
                    el.innerHTML = HEADER_HTML;
                }
            } catch (e) {
                console.warn('Could not load header include, using fallback', e);
                el.innerHTML = HEADER_HTML;
            }
        })();
        tasks.push(p);
    });

    includeFooter.forEach(el => {
        const p = (async () => {
            try {
                const res = await fetch('includes/footer.html');
                if (res.ok) {
                    el.innerHTML = await res.text();
                } else {
                    el.innerHTML = FOOTER_HTML;
                }
            } catch (e) {
                console.warn('Could not load footer include, using fallback', e);
                el.innerHTML = FOOTER_HTML;
            }
        })();
        tasks.push(p);
    });

    return Promise.all(tasks);
}

// Simple email validation
function isValidEmail(email) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

async function handleFormSubmit(event) {
    const form = event.target;
    const submitBtn = form.querySelector('button[type="submit"]');
    const emailInput = form.querySelector('input[type="email"]');

    if (emailInput && !isValidEmail(emailInput.value)) {
        event.preventDefault();
        alert('Vă rugăm introduceți o adresă de email validă.');
        emailInput.focus();
        return;
    }

    // If form uses FormSubmit action, let it submit normally. Otherwise, try AJAX to the action.
    // Keep existing behavior that shows success message instantly if JS intercepts.
}

async function init() {
    // wait until header/footer includes are injected so we can bind link handlers
    await injectIncludes();

    // enable smooth behavior globally so native anchor jumps are smooth as well
    try {
        document.documentElement.style.scrollBehavior = 'smooth';
    } catch (e) {
        // ignore if not supported
    }

    const forms = document.querySelectorAll('.offer-form');

    forms.forEach(form => {
        form.addEventListener('submit', function(e) {
            const emailInput = form.querySelector('input[type="email"]');
            if (emailInput && !isValidEmail(emailInput.value)) {
                e.preventDefault();
                alert('Vă rugăm introduceți o adresă de email validă.');
                emailInput.focus();
                return;
            }

            // If this form posts to FormSubmit (action contains formsubmit.co), let the browser submit normally
            const action = form.getAttribute('action') || '';
            if (action.includes('formsubmit.co')) {
                // ensure _replyto hidden field is set so FormSubmit receives the sender
                const replyField = form.querySelector('input[name="_replyto"]');
                if (replyField && emailInput) replyField.value = emailInput.value;
                return; // allow normal submit
            }

            // For other forms, prevent default and send via fetch but keep UX responsive
            e.preventDefault();

            const formData = new FormData(form);

            // Show success message to user
            const successMessage = document.createElement('div');
            successMessage.className = 'success-message show';
            successMessage.textContent = 'Multumim! Cererea dumneavoastra a fost trimisa cu succes. Vă vom contacta în cel mai scurt timp.';
            form.insertBefore(successMessage, form.firstChild);
            form.reset();

            const method = (form.getAttribute('method') || 'POST').toUpperCase();

            try {
                fetch(action, {
                    method,
                    body: formData,
                    headers: {
                        'Accept': 'application/json'
                    }
                }).catch(err => console.warn('Form submit failed, fallback might be needed', err));
            } catch (err) {
                console.warn('Error posting form', err);
            }

            setTimeout(() => {
                successMessage.classList.remove('show');
                setTimeout(() => {
                    successMessage.remove();
                }, 300);
            }, 5000);
        });

    // If page loaded with a hash (e.g. navigated from another page to index.html#contact), smooth scroll to it
    if (location.hash) {
        const target = document.querySelector(location.hash);
        if (target) {
            // small delay to ensure layout/injection complete
            setTimeout(() => {
                try {
                    target.scrollIntoView({ behavior: 'smooth', block: 'start' });
                } catch (e) {
                    // fallback jump
                    target.scrollIntoView();
                }
            }, 80);
        }
    }
    });

    const smoothScrollLinks = document.querySelectorAll('a[href*="#"]');
    smoothScrollLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            const href = this.getAttribute('href');
            if (!href || href === '#' || href === '#oferta') return;
            try {
                const url = new URL(href, location.href);
                // normalize pathnames: treat '/' and '/index.html' as equal
                const normalize = p => p.replace(/(^\/|index\.html$)/g, '');
                if (normalize(url.pathname) === normalize(location.pathname)) {
                    const hash = url.hash;
                    if (hash) {
                        const target = document.querySelector(hash);
                        if (target) {
                            e.preventDefault();
                            target.scrollIntoView({ behavior: 'smooth', block: 'start' });
                            // update URL without reloading
                            history.replaceState(null, '', hash);
                        }
                    }
                }
            } catch (err) {
                // fallback for invalid URLs: handle same-page anchors
                if (href.startsWith('#')) {
                    const target = document.querySelector(href);
                    if (target) {
                        e.preventDefault();
                        target.scrollIntoView({ behavior: 'smooth', block: 'start' });
                    }
                }
            }
        });
    });

    setInterval(() => {
        if (document.querySelector('.carousel')) {
            moveSlide(1);
        }
    }, 5000);
}

if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
} else {
    init();
}
