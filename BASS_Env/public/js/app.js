document.getElementById('createUserForm')?.addEventListener('submit', function(e) {
    e.preventDefault();

    const userData = {
        username: document.getElementById('username')?.value,
        name: document.getElementById('name')?.value,
        email: document.getElementById('email')?.value,
        password: document.getElementById('password')?.value,
    };

    fetch('http://192.168.1.38:8000/bass/api1/user', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        },
        body: JSON.stringify(userData)
    })
    .then(response => response.json())
    .then(data => {
        alert('User created successfully');
        console.log(data);
    })
    .catch((error) => {
        console.error('Error:', error);
    });
});

document.getElementById('retrieveUserForm')?.addEventListener('submit', function(e) {
    e.preventDefault();

    const userId = document.getElementById('userId')?.value;
    const authToken = document.getElementById('authToken')?.value;

    fetch(`http://192.168.1.38:8000/bass/api1/user/${userId}`, {
        method: 'GET',
        headers: {
            'Authorization-Token': authToken,
            'Content-Type': 'application/json'
        }
    })
    .then(response => response.json())
    .then(data => {
        document.getElementById('responseData').textContent = JSON.stringify(data, null, 2);
        console.log(data);
    })
    .catch((error) => {
        console.error('Error:', error);
        document.getElementById('responseData').textContent = 'Failed to retrieve data.';
    });
});
