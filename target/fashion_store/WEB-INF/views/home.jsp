
<%@ page import="java.util.List"%>
<%@ page import="com.fashion_store.model.Product"%>
<%@ page import="com.fashion_store.model.Category"%>
<%@ page import="com.fashion_store.model.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FashionStore | New Season</title>
<link
	href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300&family=Jost:wght@300;400;500&display=swap"
	rel="stylesheet">
<style>
*, *::before, *::after {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

:root {
	--cream: #FAF8F5;
	--charcoal: #1A1A1A;
	--mid: #6B6560;
	--accent: #C5A882;
	--border: #E0DBD4;
}

body {
	background: var(--cream);
	font-family: 'Jost', sans-serif;
	font-weight: 300;
	color: var(--charcoal);
}

/* NAV */
nav {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 1.2rem 3rem;
	border-bottom: 1px solid var(--border);
	position: sticky;
	top: 0;
	background: var(--cream);
	z-index: 100;
}

.nav-logo {
	font-family: 'Cormorant Garamond', serif;
	font-size: 1.5rem;
	letter-spacing: 0.25em;
	text-transform: uppercase;
	text-decoration: none;
	color: var(--charcoal);
}

.nav-links {
	display: flex;
	gap: 2rem;
	list-style: none;
}

.nav-links a {
	font-size: 0.78rem;
	letter-spacing: 0.1em;
	text-transform: uppercase;
	text-decoration: none;
	color: var(--mid);
	transition: color 0.2s;
}

.nav-links a:hover {
	color: var(--charcoal);
}

.nav-actions {
	display: flex;
	gap: 1.5rem;
	align-items: center;
}

.nav-actions a {
	font-size: 0.78rem;
	letter-spacing: 0.08em;
	text-decoration: none;
	color: var(--charcoal);
}

.cart-badge {
	position: relative;
}

.badge {
	position: absolute;
	top: -6px;
	right: -10px;
	background: var(--accent);
	color: #fff;
	border-radius: 50%;
	width: 16px;
	height: 16px;
	font-size: 0.6rem;
	display: flex;
	align-items: center;
	justify-content: center;
}

/* HERO */
.hero {
	height: 88vh;
	display: flex;
	align-items: flex-end;
	background: linear-gradient(160deg, #E8E0D5 0%, #D4C8B8 50%, #BFB09E 100%);
	padding: 4rem 3rem;
	position: relative;
	overflow: hidden;
}

.hero::before {
	content: 'SS26';
	position: absolute;
	right: -0.05em;
	top: -0.15em;
	font-family: 'Cormorant Garamond', serif;
	font-size: 30vw;
	font-weight: 600;
	color: rgba(255, 255, 255, 0.18);
	line-height: 1;
	pointer-events: none;
	user-select: none;
}

.hero-content {
	position: relative;
	z-index: 1;
	max-width: 560px;
}

.hero-eyebrow {
	font-size: 0.72rem;
	letter-spacing: 0.2em;
	text-transform: uppercase;
	color: var(--mid);
	margin-bottom: 1rem;
}

.hero-title {
	font-family: 'Cormorant Garamond', serif;
	font-size: clamp(3rem, 6vw, 5rem);
	font-weight: 300;
	line-height: 1.05;
	color: var(--charcoal);
	margin-bottom: 1.5rem;
}

.hero-title em {
	font-style: italic;
}

.hero-cta {
	display: inline-block;
	padding: 0.85rem 2.5rem;
	background: var(--charcoal);
	color: #fff;
	text-decoration: none;
	font-size: 0.78rem;
	letter-spacing: 0.18em;
	text-transform: uppercase;
	transition: background 0.2s;
}

.hero-cta:hover {
	background: #2E2E2E;
}

/* CATEGORIES STRIP */
.categories-strip {
	padding: 2.5rem 3rem;
	border-bottom: 1px solid var(--border);
}

.strip-label {
	font-size: 0.68rem;
	letter-spacing: 0.18em;
	text-transform: uppercase;
	color: var(--mid);
	margin-bottom: 1.25rem;
}

.cat-list {
	display: flex;
	gap: 0.75rem;
	flex-wrap: wrap;
}

.cat-pill {
	padding: 0.45rem 1.2rem;
	border: 1px solid var(--border);
	font-size: 0.78rem;
	letter-spacing: 0.08em;
	text-decoration: none;
	color: var(--charcoal);
	transition: all 0.2s;
}

.cat-pill:hover {
	background: var(--charcoal);
	color: #fff;
	border-color: var(--charcoal);
}

/* FEATURED */
.section {
	padding: 4rem 3rem;
}

.section-header {
	display: flex;
	align-items: baseline;
	justify-content: space-between;
	margin-bottom: 2.5rem;
}

.section-title {
	font-family: 'Cormorant Garamond', serif;
	font-size: 2rem;
	font-weight: 300;
	letter-spacing: 0.05em;
}

.see-all {
	font-size: 0.78rem;
	letter-spacing: 0.1em;
	text-decoration: none;
	color: var(--mid);
	border-bottom: 1px solid var(--border);
	padding-bottom: 1px;
}

.see-all:hover {
	color: var(--charcoal);
	border-color: var(--charcoal);
}

.products-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
	gap: 2rem;
}

.product-card {
	text-decoration: none;
	color: inherit;
	display: block;
}

.product-img-wrap {
	aspect-ratio: 3/4;
	overflow: hidden;
	background: #EDE8E1;
	margin-bottom: 1rem;
	position: relative;
}

.product-img-wrap img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.5s ease;
}

.product-card:hover .product-img-wrap img {
	transform: scale(1.04);
}

.product-img-placeholder {
	width: 100%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	color: var(--border);
	font-size: 0.75rem;
	letter-spacing: 0.1em;
}

.product-name {
	font-family: 'Cormorant Garamond', serif;
	font-size: 1.05rem;
	margin-bottom: 0.3rem;
}

.product-price {
	font-size: 0.85rem;
	color: var(--mid);
	letter-spacing: 0.05em;
}

/* FOOTER */
footer {
	border-top: 1px solid var(--border);
	padding: 2.5rem 3rem;
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-size: 0.78rem;
	color: var(--mid);
}

footer a {
	color: var(--mid);
	text-decoration: none;
}

footer a:hover {
	color: var(--charcoal);
}

@media ( max-width : 768px) {
	nav {
		padding: 1rem 1.5rem;
	}
	.nav-links {
		display: none;
	}
	.hero {
		padding: 2rem 1.5rem;
		height: 70vh;
	}
	.section, .categories-strip {
		padding: 2.5rem 1.5rem;
	}
}
</style>
</head>
<body>

	<!-- NAV -->
	<nav>
		<a href="${pageContext.request.contextPath}/home" class="nav-logo">FashionStore</a>
		<ul class="nav-links">
			<c:forEach var="cat" items="${categories}" varStatus="s">
				<c:if test="${s.index < 4}">
					<li><a
						href="${pageContext.request.contextPath}/products?category=${cat.categoryId}">${cat.name}</a></li>
				</c:if>
			</c:forEach>
		</ul>
		<div class="nav-actions">
			<a href="${pageContext.request.contextPath}/products?q="
				style="font-size: 1.1rem;">&#x2315;</a>
			<c:choose>
				<c:when test="${not empty sessionScope.user}">
					<a href="${pageContext.request.contextPath}/login?logout=true">Hi,
						${sessionScope.userName}</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/login">Sign In</a>
				</c:otherwise>
			</c:choose>
			<a href="${pageContext.request.contextPath}/cart" class="cart-badge">
				Bag </a>
		</div>
	</nav>

	<!-- HERO -->
	<section class="hero">
		<div class="hero-content">
			<p class="hero-eyebrow">Spring / Summer 2026</p>
			<h1 class="hero-title">
				Dress for the<br>
				<em>life you want</em>
			</h1>
			<a href="${pageContext.request.contextPath}/products"
				class="hero-cta">Explore Collection</a>
		</div>
	</section>

	<!-- CATEGORIES STRIP -->
	<div class="categories-strip">
		<p class="strip-label">Shop by Category</p>
		<div class="cat-list">
			<a href="${pageContext.request.contextPath}/products"
				class="cat-pill">All</a>
			<c:forEach var="cat" items="${categories}">
				<a
					href="${pageContext.request.contextPath}/products?category=${cat.categoryId}"
					class="cat-pill">${cat.name}</a>
			</c:forEach>
		</div>
	</div>

	<!-- FEATURED PRODUCTS -->
	<section class="section">
		<div class="section-header">
			<h2 class="section-title">Featured Pieces</h2>
			<a href="${pageContext.request.contextPath}/products" class="see-all">View
				All</a>
		</div>
		<div class="products-grid">
			<c:forEach var="product" items="${products}" varStatus="s">
				<c:if test="${s.index < 8}">
					<a
						href="${pageContext.request.contextPath}/product-details?id=${product.productId}"
						class="product-card">
						<div class="product-img-wrap">
							<c:choose>
								<c:when test="${not empty product.imageUrl}">
									<img
										src="${pageContext.request.contextPath}/assets/images/${product.imageUrl}"
										alt="${product.name}" loading="lazy">
								</c:when>
								<c:otherwise>
									<div class="product-img-placeholder">No Image</div>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="product-name">${product.name}</div>
						<div class="product-price">
							&#8377;
							<fmt:formatNumber value="${product.price}" pattern="#,##0.00" />
						</div>
					</a>
				</c:if>
			</c:forEach>
		</div>
	</section>

	<footer>
		<span>&copy; 2026 FashionStore. All rights reserved.</span>
		<div style="display: flex; gap: 2rem;">
			<a href="#">About</a> <a href="#">Shipping</a> <a href="#">Returns</a>
			<a href="#">Contact</a>
		</div>
	</footer>

</body>
</html>
