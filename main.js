let currentSlideIndex = 1;

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

document.addEventListener('DOMContentLoaded', function() {
    const forms = document.querySelectorAll('.offer-form');

    // Show success message if redirected back after successful submission
    if (window.location.search.includes('success=1')) {
        forms.forEach(form => {
            const successMessage = document.createElement('div');
            successMessage.className = 'success-message show';
            successMessage.textContent = 'Mulțumim! Cererea dumneavoastră a fost trimisă cu succes. Vă vom contacta în cel mai scurt timp.';
            form.insertBefore(successMessage, form.firstChild);
            setTimeout(() => {
                successMessage.classList.remove('show');
                setTimeout(() => {
                    successMessage.remove();
                }, 300);
            }, 5000);
        });
        // Clean the URL
        window.history.replaceState({}, document.title, window.location.pathname);
    }

    forms.forEach(form => {
        form.addEventListener('submit', function(e) {
            e.preventDefault();

            const submitBtn = form.querySelector('.btn-submit');
            const originalText = submitBtn.textContent;
            submitBtn.textContent = 'Se trimite...';
            submitBtn.disabled = true;

            const formData = new FormData(form);

            fetch(form.action, {
                method: 'POST',
                body: formData,
                headers: {
                    'Accept': 'application/json'
                }
            })
            .then(response => {
                if (response.ok) {
                    const successMessage = document.createElement('div');
                    successMessage.className = 'success-message show';
                    successMessage.textContent = 'Mulțumim! Cererea dumneavoastră a fost trimisă cu succes. Vă vom contacta în cel mai scurt timp.';
                    form.insertBefore(successMessage, form.firstChild);
                    form.reset();
                    setTimeout(() => {
                        successMessage.classList.remove('show');
                        setTimeout(() => {
                            successMessage.remove();
                        }, 300);
                    }, 5000);
                } else {
                    throw new Error('Eroare la trimitere');
                }
            })
            .catch(error => {
                const errorMessage = document.createElement('div');
                errorMessage.className = 'success-message show';
                errorMessage.style.backgroundColor = '#f44336';
                errorMessage.textContent = 'A apărut o eroare. Vă rugăm încercați din nou sau contactați-ne direct la telefon.';
                form.insertBefore(errorMessage, form.firstChild);
                setTimeout(() => {
                    errorMessage.classList.remove('show');
                    setTimeout(() => {
                        errorMessage.remove();
                    }, 300);
                }, 5000);
            })
            .finally(() => {
                submitBtn.textContent = originalText;
                submitBtn.disabled = false;
            });
        });
    });
    
    const smoothScrollLinks = document.querySelectorAll('a[href^="#"]');
    smoothScrollLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            const href = this.getAttribute('href');
            if (href !== '#' && href !== '#oferta') {
                e.preventDefault();
                const target = document.querySelector(href);
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            }
        });
    });
    
    setInterval(() => {
        if (document.querySelector('.carousel')) {
            moveSlide(1);
        }
    }, 5000);
});
