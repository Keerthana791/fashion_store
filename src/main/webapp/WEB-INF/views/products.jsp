<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Products | FashionStore</title>
<link
	href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;1,300&family=Jost:wght@300;400;500&display=swap"
	rel="stylesheet">
<style>
*, *::before, *::after {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

:root {
	--cream: #FAF8F5;
	--charcoal: #111111;
	--mid: #4A4642;
	--accent: #B68A5A;
	--border: #D8D1C9;
}

body {
	background: var(--cream);
	font-family: 'Jost', sans-serif;
	font-weight: 400;
	font-size: 17px;
	color: var(--charcoal);
}

/* NAV */
nav {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 1rem 2.5rem;
	border-bottom: 1px solid var(--border);
	position: sticky;
	top: 0;
	background: var(--cream);
	z-index: 100;
}

.nav-logo {
	font-family: 'Cormorant Garamond', serif;
	font-size: 1.8rem;
	font-weight: 500;
	letter-spacing: 0.2em;
	text-transform: uppercase;
	text-decoration: none;
	color: var(--charcoal);
}

.nav-search {
	display: flex;
	flex: 1;
	max-width: 480px;
	margin: 0 2rem;
}

.nav-search input {
	flex: 1;
	padding: 0.65rem 1rem;
	border: 1px solid var(--border);
	border-right: none;
	font-family: 'Jost', sans-serif;
	font-size: 0.98rem;
	font-weight: 400;
	background: transparent;
	color: var(--charcoal);
	outline: none;
}

.nav-search button {
	padding: 0.65rem 1rem;
	background: var(--charcoal);
	color: #fff;
	border: none;
	cursor: pointer;
	font-size: 1rem;
}

.nav-actions {
	display: flex;
	gap: 1.5rem;
	align-items: center;
}

.nav-actions a {
	font-size: 0.95rem;
	font-weight: 500;
	text-decoration: none;
	color: var(--charcoal);
}

.nav-actions a:hover {
	color: var(--accent);
}

/* LAYOUT */
.layout {
	display: grid;
	grid-template-columns: 220px 1fr;
	min-height: calc(100vh - 58px);
}

/* SIDEBAR */
.sidebar {
	padding: 1.7rem;
	border-right: 1px solid var(--border);
	position: sticky;
	top: 58px;
	height: calc(100vh - 58px);
	overflow-y: auto;
}

.sidebar-section {
	margin-bottom: 2rem;
}

.sidebar-heading {
	font-size: 0.8rem;
	letter-spacing: 0.2em;
	text-transform: uppercase;
	color: var(--charcoal);
	font-weight: 600;
	margin-bottom: 1rem;
	padding-bottom: 0.5rem;
	border-bottom: 1px solid var(--border);
}

.cat-list {
	list-style: none;
}

.cat-list li {
	margin-bottom: 0.45rem;
}

.cat-list a {
	font-size: 0.98rem;
	font-weight: 400;
	text-decoration: none;
	color: var(--mid);
	display: block;
	padding: 0.25rem 0;
	transition: color 0.2s;
}

.cat-list a:hover {
	color: var(--charcoal);
}

.cat-list a.active {
	color: var(--charcoal);
	font-weight: 600;
}

.cat-list a.active::before {
	content: '— ';
	color: var(--accent);
}

.filter-label {
	font-size: 0.8rem;
	font-weight: 500;
	letter-spacing: 0.1em;
	text-transform: uppercase;
	color: var(--mid);
	margin-bottom: 0.45rem;
	display: block;
}

select.filter-select {
	width: 100%;
	padding: 0.65rem 0.75rem;
	margin-bottom: 1rem;
	border: 1px solid var(--border);
	background: var(--cream);
	font-family: 'Jost', sans-serif;
	font-size: 0.95rem;
	font-weight: 400;
	color: var(--charcoal);
	outline: none;
	cursor: pointer;
	appearance: none;
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='10' height='6'%3E%3Cpath d='M0 0l5 6 5-6z' fill='%234A4642'/%3E%3C/svg%3E");
	background-repeat: no-repeat;
	background-position: right 0.75rem center;
}

.btn-filter {
	width: 100%;
	padding: 0.75rem;
	background: var(--charcoal);
	color: #fff;
	border: none;
	font-family: 'Jost', sans-serif;
	font-size: 0.82rem;
	font-weight: 500;
	letter-spacing: 0.15em;
	text-transform: uppercase;
	cursor: pointer;
}

.btn-filter:hover {
	background: #333;
}

.btn-reset {
	display: block;
	width: 100%;
	padding: 0.65rem;
	margin-top: 0.6rem;
	background: transparent;
	border: 1px solid var(--border);
	font-family: 'Jost', sans-serif;
	font-size: 0.82rem;
	font-weight: 500;
	letter-spacing: 0.1em;
	text-transform: uppercase;
	color: var(--mid);
	text-align: center;
	text-decoration: none;
}

.btn-reset:hover {
	border-color: var(--charcoal);
	color: var(--charcoal);
}

/* PRODUCTS AREA */
.products-area {
	padding: 2rem 2.5rem;
}

.products-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 1.75rem;
	padding-bottom: 1rem;
	border-bottom: 1px solid var(--border);
}

.products-title {
	font-family: 'Cormorant Garamond', serif;
	font-size: 2rem;
	font-weight: 400;
	color: var(--charcoal);
}

.products-count {
	font-size: 0.95rem;
	font-weight: 500;
	color: var(--mid);
}

.products-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(210px, 1fr));
	gap: 1.7rem;
}

.product-card {
	background: #fff;
	border: 1px solid var(--border);
	overflow: hidden;
	transition: box-shadow 0.2s;
}

.product-card:hover {
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
}

.card-img-wrap {
	aspect-ratio: 3/4;
	overflow: hidden;
	background: #EDE8E1;
	display: block;
}

.card-img-wrap img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.5s;
}

.product-card:hover .card-img-wrap img {
	transform: scale(1.04);
}

.card-img-placeholder {
	width: 100%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #AAA;
	font-size: 0.9rem;
}

.card-body {
	padding: 1rem 1rem 1.1rem;
}

.card-name {
	font-family: 'Cormorant Garamond', serif;
	font-size: 1.2rem;
	font-weight: 500;
	margin-bottom: 0.35rem;
}

.card-name a {
	text-decoration: none;
	color: var(--charcoal);
}

.card-name a:hover {
	color: var(--accent);
}

.card-price {
	font-size: 1rem;
	font-weight: 600;
	margin-bottom: 0.95rem;
	color: var(--charcoal);
}

.btn-view {
	display: block;
	width: 100%;
	padding: 0.7rem;
	background: var(--charcoal);
	color: #fff;
	border: none;
	font-family: 'Jost', sans-serif;
	font-size: 0.82rem;
	font-weight: 500;
	letter-spacing: 0.15em;
	text-transform: uppercase;
	cursor: pointer;
	text-decoration: none;
	text-align: center;
	transition: background 0.2s;
}

.btn-view:hover {
	background: #333;
}

.empty {
	padding: 5rem 2rem;
	text-align: center;
	color: var(--mid);
}

.empty h3 {
	font-family: 'Cormorant Garamond', serif;
	font-size: 2rem;
	font-weight: 400;
	margin-bottom: 0.7rem;
	color: var(--charcoal);
}

.empty p {
	font-size: 1rem;
}

@media ( max-width : 768px) {
	.layout {
		grid-template-columns: 1fr;
	}

	.sidebar {
		position: static;
		height: auto;
		border-right: none;
		border-bottom: 1px solid var(--border);
	}

	.products-area {
		padding: 1.5rem;
	}

	.products-title {
		font-size: 1.7rem;
	}

	.nav-actions a {
		font-size: 0.88rem;
	}
}
</style>
</head>
<body>

	<!-- NAV -->
	<nav>
		<a href="${pageContext.request.contextPath}/home" class="nav-logo">FashionStore</a>
		<form action="${pageContext.request.contextPath}/products"
			method="get" class="nav-search">
			<input type="text" name="q" placeholder="Search for products..."
				value="${keyword}">
			<button type="submit">&#x2315;</button>
		</form>
		<div class="nav-actions">
			<c:choose>
				<c:when test="${not empty sessionScope.user}">
					<a href="#">Hi, ${sessionScope.userName}</a>
					<a href="${pageContext.request.contextPath}/cart">&#x1F6D2;
						Cart</a>
					<a href="${pageContext.request.contextPath}/logout">Logout</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/login">Sign In</a>
					<a href="${pageContext.request.contextPath}/cart">Cart</a>
				</c:otherwise>
			</c:choose>
		</div>
	</nav>

	<div class="layout">

		<!-- ═══ SIDEBAR ═══ -->
		<aside class="sidebar">

			<!-- Category quick-links (no form submit needed) -->
			<div class="sidebar-section">
				<p class="sidebar-heading">Categories</p>
				<ul class="cat-list">
					<li><a href="${pageContext.request.contextPath}/products"
						class="${empty selectedCategoryId && empty keyword ? 'active' : ''}">All
							Products</a></li>
					<c:forEach var="cat" items="${categories}">
						<li><a
							href="${pageContext.request.contextPath}/products?category=${cat.categoryId}"
							class="${selectedCategoryId == cat.categoryId ? 'active' : ''}">${cat.name}</a>
						</li>
					</c:forEach>
				</ul>
			</div>

			<!-- Price + Sort filter form -->
			<form action="${pageContext.request.contextPath}/products"
				method="get">

				<%-- Preserve category and keyword when applying price/sort --%>
				<c:if test="${not empty selectedCategoryId}">
					<input type="hidden" name="category" value="${selectedCategoryId}">
				</c:if>
				<c:if test="${not empty keyword}">
					<input type="hidden" name="q" value="${keyword}">
				</c:if>

				<div class="sidebar-section">
					<p class="sidebar-heading">Price</p>
					<span class="filter-label">Max Price</span> <select name="maxPrice"
						class="filter-select">
						<option value="" ${empty maxPrice        ? 'selected' : ''}>All
							Prices</option>
						<option value="500" ${maxPrice == '500'     ? 'selected' : ''}>Under
							&#8377;500</option>
						<option value="1000" ${maxPrice == '1000'    ? 'selected' : ''}>Under
							&#8377;1,000</option>
						<option value="2000" ${maxPrice == '2000'    ? 'selected' : ''}>Under
							&#8377;2,000</option>
						<option value="5000" ${maxPrice == '5000'    ? 'selected' : ''}>Under
							&#8377;5,000</option>
					</select>
				</div>

				<div class="sidebar-section">
					<p class="sidebar-heading">Sort By</p>
					<select name="sort" class="filter-select">
						<option value="" ${empty sort             ? 'selected' : ''}>Default</option>
						<option value="price_asc"
							${sort == 'price_asc'   ? 'selected' : ''}>Price: Low to
							High</option>
						<option value="price_desc"
							${sort == 'price_desc'  ? 'selected' : ''}>Price: High
							to Low</option>
						<option value="name_asc"
							${sort == 'name_asc'    ? 'selected' : ''}>Name: A
							&#8211; Z</option>
					</select>
				</div>

				<button type="submit" class="btn-filter">Apply Filters</button>
				<a href="${pageContext.request.contextPath}/products"
					class="btn-reset">Reset All</a>
			</form>

		</aside>

		<!-- ═══ PRODUCTS ═══ -->
		<main class="products-area">

			<div class="products-header">
				<h1 class="products-title">
					<c:choose>
						<c:when test="${not empty keyword}">Results for &ldquo;${keyword}&rdquo;</c:when>
						<c:when test="${not empty selectedCategoryName}">${selectedCategoryName}</c:when>
						<c:otherwise>All Products</c:otherwise>
					</c:choose>
				</h1>
				<span class="products-count">${fn:length(products)} items</span>
			</div>

			<c:choose>
				<c:when test="${empty products}">
					<div class="empty">
						<h3>No products found</h3>
						<p>Try a different category, price range, or search term.</p>
					</div>
				</c:when>
				<c:otherwise>
					<div class="products-grid">
						<c:forEach var="product" items="${products}">
							<div class="product-card">
								<a
									href="${pageContext.request.contextPath}/product-details?id=${product.productId}"
									class="card-img-wrap"> <c:choose>
										<c:when test="${not empty product.imageUrl}">
											<img
												src="${pageContext.request.contextPath}/assets/images/${product.imageUrl}"
												alt="${product.name}" loading="lazy">
										</c:when>
										<c:otherwise>
											<div class="card-img-placeholder">No Image</div>
										</c:otherwise>
									</c:choose>
								</a>
								<div class="card-body">
									<div class="card-name">
										<a
											href="${pageContext.request.contextPath}/product-details?id=${product.productId}">${product.name}</a>
									</div>
									<div class="card-price">
										&#8377;
										<fmt:formatNumber value="${product.price}" pattern="#,##0.00" />
									</div>
									<a
										href="${pageContext.request.contextPath}/product-details?id=${product.productId}"
										class="btn-view">Add to Cart</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>

		</main>
	</div>

</body>
</html>