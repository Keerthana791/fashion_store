<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In | FashionStore</title>
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
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 1.5rem;
    color: var(--charcoal);
}

.container {
    width: 100%;
    max-width: 460px;
    padding: 3rem;
    background: rgba(255,255,255,0.68);
    backdrop-filter: blur(10px);
    border-radius: 18px;
    border: 1px solid rgba(0,0,0,0.06);
    box-shadow: 0 10px 35px rgba(0,0,0,0.08);
}

.logo {
    text-align: center;
    margin-bottom: 2.8rem;
}

.logo a {
    font-family: 'Cormorant Garamond', serif;
    font-size: 2.3rem;
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
    letter-spacing: 0.05em;
    margin-bottom: 2.4rem;
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

.alert-success {
    background: #F2F9F2;
    border-left: 4px solid #4A7C59;
    color: #4A7C59;
}

.form-group {
    margin-bottom: 1.5rem;
}

label {
    display: block;
    font-size: 0.82rem;
    letter-spacing: 0.14em;
    text-transform: uppercase;
    color: var(--mid);
    margin-bottom: 0.6rem;
    font-weight: 500;
}

input {
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
    transition: border-color 0.25s ease;
}

input:focus {
    border-bottom-color: var(--charcoal);
}

input::placeholder {
    color: #9E978F;
    font-size: 0.95rem;
}

.btn {
    display: block;
    width: 100%;
    padding: 1rem;
    margin-top: 2.2rem;
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
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 1.8rem;
    font-size: 0.9rem;
    color: var(--mid);
    gap: 1rem;
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

.divider {
    text-align: center;
    color: #B8B1AA;
    margin: 2rem 0;
    font-size: 0.85rem;
}

@media (max-width: 768px) {
    .container {
        padding: 2rem 1.5rem;
        border-radius: 14px;
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

    .links {
        flex-direction: column;
        text-align: center;
    }
}
</style>
</head>
<body>
<div class="container">
    <div class="logo"><a href="${pageContext.request.contextPath}/home">FashionStore</a></div>
    <h1>Welcome Back</h1>
    <p class="subtitle">Sign in to your account</p>

    <% if (request.getParameter("registered") != null) { %>
        <div class="alert alert-success">Account created successfully. Please sign in.</div>
    <% } %>

    <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-error">${error}</div>
    <% } %>

    <form action="${pageContext.request.contextPath}/login" method="post" novalidate>
        <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email"
                   value="${emailValue}" placeholder="you@example.com" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password"
                   placeholder="••••••••" required>
        </div>
        <button type="submit" class="btn">Sign In</button>
    </form>

    <div class="links">
        <span>New here?</span>
        <a href="${pageContext.request.contextPath}/register">Create an account</a>
    </div>
</div>
</body>
</html>
