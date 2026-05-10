<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In | FashionStore</title>
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
        body {
            background: var(--cream);
            font-family: 'Jost', sans-serif;
            font-weight: 300;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container {
            width: 100%;
            max-width: 420px;
            padding: 2rem;
        }
        .logo {
            text-align: center;
            margin-bottom: 2.5rem;
        }
        .logo a {
            font-family: 'Cormorant Garamond', serif;
            font-size: 2rem;
            font-weight: 300;
            letter-spacing: 0.2em;
            color: var(--charcoal);
            text-decoration: none;
            text-transform: uppercase;
        }
        h1 {
            font-family: 'Cormorant Garamond', serif;
            font-weight: 300;
            font-size: 1.6rem;
            letter-spacing: 0.1em;
            color: var(--charcoal);
            text-align: center;
            margin-bottom: 0.5rem;
        }
        .subtitle {
            text-align: center;
            color: var(--mid);
            font-size: 0.82rem;
            letter-spacing: 0.05em;
            margin-bottom: 2rem;
        }
        .alert {
            padding: 0.8rem 1rem;
            border-radius: 2px;
            font-size: 0.82rem;
            margin-bottom: 1.5rem;
            letter-spacing: 0.03em;
        }
        .alert-error { background: #FDF2F2; border-left: 3px solid var(--error); color: var(--error); }
        .alert-success { background: #F2F9F2; border-left: 3px solid #4A7C59; color: #4A7C59; }
        .form-group {
            margin-bottom: 1.25rem;
        }
        label {
            display: block;
            font-size: 0.72rem;
            letter-spacing: 0.12em;
            text-transform: uppercase;
            color: var(--mid);
            margin-bottom: 0.5rem;
        }
        input {
            width: 100%;
            padding: 0.75rem 0;
            background: transparent;
            border: none;
            border-bottom: 1px solid var(--border);
            font-family: 'Jost', sans-serif;
            font-size: 0.95rem;
            font-weight: 300;
            color: var(--charcoal);
            outline: none;
            transition: border-color 0.2s;
        }
        input:focus { border-bottom-color: var(--charcoal); }
        input::placeholder { color: #C0BBB5; }
        .btn {
            display: block;
            width: 100%;
            padding: 0.9rem;
            margin-top: 2rem;
            background: var(--charcoal);
            color: #fff;
            border: none;
            font-family: 'Jost', sans-serif;
            font-size: 0.78rem;
            font-weight: 400;
            letter-spacing: 0.18em;
            text-transform: uppercase;
            cursor: pointer;
            transition: background 0.2s;
        }
        .btn:hover { background: #2E2E2E; }
        .links {
            display: flex;
            justify-content: space-between;
            margin-top: 1.5rem;
            font-size: 0.8rem;
            color: var(--mid);
        }
        .links a {
            color: var(--charcoal);
            text-decoration: none;
            border-bottom: 1px solid var(--border);
            padding-bottom: 1px;
            transition: border-color 0.2s;
        }
        .links a:hover { border-color: var(--charcoal); }
        .divider { text-align: center; color: var(--border); margin: 2rem 0; font-size: 0.8rem; }
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
