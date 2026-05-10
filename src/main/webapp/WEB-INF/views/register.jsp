<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account | FashionStore</title>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;1,300&family=Jost:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
*, *::before, *::after {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

:root {
    --cream: #F5F2EE;
    --charcoal: #111111;
    --mid: #4B4B4B;
    --accent: #B89168;
    --border: #D2CCC4;
    --error: #B94040;
}

body {
    background: linear-gradient(to bottom, #F5F2EE, #ECE6DE);
    font-family: 'Jost', sans-serif;
    font-weight: 300;
    min-height: 100vh;
    padding: 3rem 1rem;
    color: var(--charcoal);
}

.container {
    width: 100%;
    max-width: 580px;
    margin: 0 auto;
    background: rgba(255,255,255,0.65);
    backdrop-filter: blur(10px);
    border: 1px solid rgba(0,0,0,0.06);
    padding: 3rem;
    border-radius: 18px;
    box-shadow: 0 10px 35px rgba(0,0,0,0.08);
}

.logo {
    text-align: center;
    margin-bottom: 2.2rem;
}

.logo a {
    font-family: 'Cormorant Garamond', serif;
    font-size: 2.4rem;
    font-weight: 400;
    letter-spacing: 0.24em;
    color: var(--charcoal);
    text-decoration: none;
    text-transform: uppercase;
}

h1 {
    font-family: 'Cormorant Garamond', serif;
    font-weight: 400;
    font-size: 2rem;
    letter-spacing: 0.08em;
    color: var(--charcoal);
    text-align: center;
    margin-bottom: 0.5rem;
}

.subtitle {
    text-align: center;
    color: var(--mid);
    font-size: 0.95rem;
    letter-spacing: 0.04em;
    margin-bottom: 2.4rem;
    line-height: 1.6;
}

.section-label {
    font-size: 0.82rem;
    letter-spacing: 0.22em;
    text-transform: uppercase;
    color: var(--accent);
    border-bottom: 1px solid var(--border);
    padding-bottom: 0.7rem;
    margin: 2rem 0 1.5rem;
    font-weight: 500;
}

.alert {
    padding: 1rem 1.1rem;
    border-radius: 8px;
    font-size: 0.92rem;
    margin-bottom: 1.6rem;
    letter-spacing: 0.03em;
}

.alert-error {
    background: #FDF2F2;
    border-left: 4px solid var(--error);
    color: var(--error);
}

.grid-2 {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1.2rem;
}

.form-group {
    margin-bottom: 1.3rem;
}

label {
    display: block;
    font-size: 0.82rem;
    letter-spacing: 0.14em;
    text-transform: uppercase;
    color: var(--mid);
    margin-bottom: 0.55rem;
    font-weight: 500;
}

input, select {
    width: 100%;
    padding: 0.95rem 0.2rem;
    background: transparent;
    border: none;
    border-bottom: 1px solid var(--border);
    font-family: 'Jost', sans-serif;
    font-size: 1rem;
    font-weight: 400;
    color: var(--charcoal);
    outline: none;
    transition: all 0.25s ease;
}

input:focus, select:focus {
    border-bottom-color: var(--charcoal);
}

input::placeholder {
    color: #9E978F;
    font-size: 0.95rem;
}

select {
    appearance: none;
    cursor: pointer;
}

.btn {
    display: block;
    width: 100%;
    padding: 1rem;
    margin-top: 2.3rem;
    background: var(--charcoal);
    color: #fff;
    border: none;
    border-radius: 10px;
    font-family: 'Jost', sans-serif;
    font-size: 0.9rem;
    font-weight: 500;
    letter-spacing: 0.2em;
    text-transform: uppercase;
    cursor: pointer;
    transition: all 0.25s ease;
}

.btn:hover {
    background: #2A2A2A;
    transform: translateY(-1px);
    box-shadow: 0 8px 18px rgba(0,0,0,0.15);
}

.links {
    text-align: center;
    margin-top: 1.8rem;
    font-size: 0.92rem;
    color: var(--mid);
}

.links a {
    color: var(--charcoal);
    text-decoration: none;
    border-bottom: 1px solid var(--border);
    padding-bottom: 2px;
    transition: all 0.2s;
    font-weight: 500;
}

.links a:hover {
    border-color: var(--charcoal);
}

.required-note {
    font-size: 0.8rem;
    color: var(--mid);
    text-align: right;
    margin-bottom: 0.5rem;
}

@media (max-width: 768px) {
    body {
        padding: 1.5rem 1rem;
    }

    .container {
        padding: 2rem 1.5rem;
        border-radius: 14px;
    }

    .grid-2 {
        grid-template-columns: 1fr;
        gap: 0;
    }

    .logo a {
        font-size: 2rem;
    }

    h1 {
        font-size: 1.7rem;
    }

    .subtitle {
        font-size: 0.9rem;
    }

    input, select {
        font-size: 0.96rem;
    }
}
</style>
</head>
<body>
<div class="container">
    <div class="logo"><a href="${pageContext.request.contextPath}/home">FashionStore</a></div>
    <h1>Create Account</h1>
    <p class="subtitle">Join us for an elevated shopping experience</p>

    <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-error">${error}</div>
    <% } %>

    <form action="${pageContext.request.contextPath}/register" method="post" novalidate>

        <div class="section-label">Personal Information</div>

        <div class="form-group">
            <label for="name">Full Name *</label>
            <input type="text" id="name" name="name" placeholder="Your full name" required>
        </div>

        <div class="grid-2">
            <div class="form-group">
                <label for="email">Email *</label>
                <input type="email" id="email" name="email" placeholder="you@example.com" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="tel" id="phone" name="phone" placeholder="+91 98765 43210">
            </div>
        </div>

        <div class="grid-2">
            <div class="form-group">
                <label for="password">Password *</label>
                <input type="password" id="password" name="password" placeholder="Min. 6 characters" required>
            </div>
            <div class="form-group">
                <label for="confirmPassword">Confirm Password *</label>
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Repeat password" required>
            </div>
        </div>

        <div class="section-label">Delivery Address <span style="font-size:0.65rem;color:var(--mid)">(optional — can add at checkout)</span></div>

        <div class="form-group">
            <label for="addressLine">Address Line</label>
            <input type="text" id="addressLine" name="addressLine" placeholder="Street, building, apartment">
        </div>

        <div class="grid-2">
            <div class="form-group">
                <label for="city">City</label>
                <input type="text" id="city" name="city" placeholder="Bengaluru">
            </div>
            <div class="form-group">
                <label for="state">State</label>
                <input type="text" id="state" name="state" placeholder="Karnataka">
            </div>
        </div>

        <div class="grid-2">
            <div class="form-group">
                <label for="country">Country</label>
                <input type="text" id="country" name="country" placeholder="India">
            </div>
            <div class="form-group">
                <label for="pincode">Pincode</label>
                <input type="text" id="pincode" name="pincode" placeholder="560001">
            </div>
        </div>

        <button type="submit" class="btn">Create Account</button>
    </form>

    <div class="links">
        Already have an account? <a href="${pageContext.request.contextPath}/login">Sign in</a>
    </div>
</div>
</body>
</html>
