// Placeholder for future JavaScript functionality
document.addEventListener('DOMContentLoaded', function() {
    console.log('Kyba Marketing LLC website loaded');

    const form = document.getElementById('contactForm');
    form.addEventListener('submit', function(event) {
        event.preventDefault();
        
        const formData = {
            name: form.name.value,
            email: form.email.value,
            businessName: form.businessName.value,
            message: form.message.value
        };

        fetch('http://localhost:3000/submit-form', { // Ensure the correct port is used
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(formData)
        })
        .then(response => {
            if (!response.ok) {
                return response.json().then(err => { throw err; });
            }
            return response.json();
        })
        .then(data => {
            console.log('Form submission response:', data); // Log the response
            alert('Form submitted successfully!');
            form.reset();
        })
        .catch(error => {
            console.error('Error:', error);
            alert(`There was an error submitting the form: ${error.details || error.message}`);
        });
    });
});
