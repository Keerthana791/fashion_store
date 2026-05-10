<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account | FashionStore</title>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;1,300&family=Jost:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
        :root {
            --cream: #FAF8F5;
            --charcoal: #1A1A1A;
            --mid: #6B6560;
            --accent: #C5A882;
            --border: #E0DBD4;
            --error: #B94040;
        }
        body { background: var(--cream); font-family: 'Jost', sans-serif; font-weight: 300; min-height: 100vh; padding: 3rem 1rem; }
        .container { width: 100%; max-width: 540px; margin: 0 auto; }
        .logo { text-align: center; margin-bottom: 2rem; }
        .logo a { font-family: 'Cormorant Garamond', serif; font-size: 2rem; font-weight: 300; letter-spacing: 0.2em; color: var(--charcoal); text-decoration: none; text-transform: uppercase; }
        h1 { font-family: 'Cormorant Garamond', serif; font-weight: 300; font-size: 1.6rem; letter-spacing: 0.1em; color: var(--charcoal); text-align: center; margin-bottom: 0.4rem; }
        .subtitle { text-align: center; color: var(--mid); font-size: 0.82rem; letter-spacing: 0.05em; margin-bottom: 2rem; }
        .section-label {
            font-size: 0.68rem; letter-spacing: 0.18em; text-transform: uppercase;
            color: var(--accent); border-bottom: 1px solid var(--border);
            padding-bottom: 0.5rem; margin: 1.75rem 0 1.25rem;
        }
        .alert { padding: 0.8rem 1rem; border-radius: 2px; font-size: 0.82rem; margin-bottom: 1.5rem; letter-spacing: 0.03em; }
        .alert-error { background: #FDF2F2; border-left: 3px solid var(--error); color: var(--error); }
        .grid-2 { display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; }
        .form-group { margin-bottom: 1.1rem; }
        label { display: block; font-size: 0.72rem; letter-spacing: 0.12em; text-transform: uppercase; color: var(--mid); margin-bottom: 0.4rem; }
        input, select {
            width: 100%; padding: 0.7rem 0; background: transparent;
            border: none; border-bottom: 1px solid var(--border);
            font-family: 'Jost', sans-serif; font-size: 0.92rem; font-weight: 300;
            color: var(--charcoal); outline: none; transition: border-color 0.2s;
        }
        input:focus, select:focus { border-bottom-color: var(--charcoal); }
        input::placeholder { color: #C0BBB5; }
        select { appearance: none; cursor: pointer; }
        .btn { display: block; width: 100%; padding: 0.9rem; margin-top: 2rem; background: var(--charcoal); color: #fff; border: none; font-family: 'Jost', sans-serif; font-size: 0.78rem; font-weight: 400; letter-spacing: 0.18em; text-transform: uppercase; cursor: pointer; transition: background 0.2s; }
        .btn:hover { background: #2E2E2E; }
        .links { text-align: center; margin-top: 1.5rem; font-size: 0.8rem; color: var(--mid); }
        .links a { color: var(--charcoal); text-decoration: none; border-bottom: 1px solid var(--border); padding-bottom: 1px; }
        .links a:hover { border-color: var(--charcoal); }
        .required-note { font-size: 0.75rem; color: var(--mid); text-align: right; margin-bottom: 0.5rem; }
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
