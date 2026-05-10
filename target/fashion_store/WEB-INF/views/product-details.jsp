<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${product.name}| FashionStore</title>
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
	--error: #B94040;
}

body {
	background: var(--cream);
	font-family: 'Jost', sans-serif;
	font-weight: 300;
	color: var(--charcoal);
}

nav {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 1.2rem 3rem;
	border-bottom: 1px solid var(--border);
}

.nav-logo {
	font-family: 'Cormorant Garamond', serif;
	font-size: 1.5rem;
	letter-spacing: 0.25em;
	text-transform: uppercase;
	text-decoration: none;
	color: var(--charcoal);
}

.nav-actions {
	display: flex;
	gap: 1.5rem;
}

.nav-actions a {
	font-size: 0.78rem;
	text-decoration: none;
	color: var(--charcoal);
}

.breadcrumb {
	padding: 1rem 3rem;
	font-size: 0.75rem;
	color: var(--mid);
}

.breadcrumb a {
	color: var(--mid);
	text-decoration: none;
}

.breadcrumb a:hover {
	color: var(--charcoal);
}

.breadcrumb span {
	margin: 0 0.5rem;
}

.product-layout {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 0;
	max-width: 1200px;
	margin: 0 auto;
	padding: 0 3rem 4rem;
}

/* Image side */
.product-gallery {
	padding-right: 3rem;
}

.main-image {
	aspect-ratio: 3/4;
	background: #EDE8E1;
	overflow: hidden;
}

.main-image img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.main-image-placeholder {
	width: 100%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #CCC;
	font-size: 0.8rem;
}

/* Info side */
.product-info {
	padding-top: 1rem;
	padding-left: 2rem;
}

.product-category {
	font-size: 0.7rem;
	letter-spacing: 0.2em;
	text-transform: uppercase;
	color: var(--accent);
	margin-bottom: 0.75rem;
}

.product-title {
	font-family: 'Cormorant Garamond', serif;
	font-size: 2.2rem;
	font-weight: 300;
	line-height: 1.15;
	margin-bottom: 1rem;
}

.product-price-display {
	font-size: 1.3rem;
	letter-spacing: 0.05em;
	margin-bottom: 2rem;
	color: var(--charcoal);
}

.divider {
	border: none;
	border-top: 1px solid var(--border);
	margin: 1.5rem 0;
}

.variant-section {
	margin-bottom: 1.5rem;
}

.variant-label {
	font-size: 0.7rem;
	letter-spacing: 0.15em;
	text-transform: uppercase;
	color: var(--mid);
	margin-bottom: 0.75rem;
	display: flex;
	justify-content: space-between;
}

.variant-label strong {
	color: var(--charcoal);
	font-weight: 400;
}

.size-options, .color-options {
	display: flex;
	gap: 0.5rem;
	flex-wrap: wrap;
	margin-bottom: 0.5rem;
}

.size-btn, .color-btn {
	padding: 0.45rem 0.9rem;
	border: 1px solid var(--border);
	font-family: 'Jost', sans-serif;
	font-size: 0.82rem;
	cursor: pointer;
	background: transparent;
	color: var(--charcoal);
	transition: all 0.15s;
}

.size-btn:hover, .color-btn:hover {
	border-color: var(--charcoal);
}

.size-btn.selected, .color-btn.selected {
	background: var(--charcoal);
	color: #fff;
	border-color: var(--charcoal);
}

.size-btn:disabled {
	opacity: 0.35;
	cursor: not-allowed;
}

.qty-row {
	display: flex;
	align-items: center;
	gap: 1rem;
	margin-bottom: 1.5rem;
}

.qty-label {
	font-size: 0.7rem;
	letter-spacing: 0.15em;
	text-transform: uppercase;
	color: var(--mid);
}

.qty-control {
	display: flex;
	align-items: center;
	border: 1px solid var(--border);
}

.qty-btn {
	width: 36px;
	height: 36px;
	background: transparent;
	border: none;
	cursor: pointer;
	font-size: 1rem;
	color: var(--charcoal);
}

.qty-input {
	width: 40px;
	height: 36px;
	text-align: center;
	border: none;
	border-left: 1px solid var(--border);
	border-right: 1px solid var(--border);
	font-family: 'Jost', sans-serif;
	font-size: 0.9rem;
	background: transparent;
}

.btn-add {
	display: block;
	width: 100%;
	padding: 1rem;
	background: var(--charcoal);
	color: #fff;
	border: none;
	font-family: 'Jost', sans-serif;
	font-size: 0.8rem;
	font-weight: 400;
	letter-spacing: 0.18em;
	text-transform: uppercase;
	cursor: pointer;
	transition: background 0.2s;
	margin-bottom: 1rem;
}

.btn-add:hover {
	background: #2E2E2E;
}

.btn-add:disabled {
	background: #999;
	cursor: not-allowed;
}

.stock-note {
	font-size: 0.78rem;
	color: var(--mid);
	margin-bottom: 1.5rem;
}

.stock-note.low {
	color: #B94040;
}

.product-desc {
	font-size: 0.88rem;
	line-height: 1.8;
	color: var(--mid);
}

.desc-title {
	font-size: 0.7rem;
	letter-spacing: 0.15em;
	text-transform: uppercase;
	color: var(--charcoal);
	margin-bottom: 0.75rem;
}

.alert {
	padding: 0.75rem 1rem;
	border-radius: 2px;
	font-size: 0.82rem;
	margin-bottom: 1rem;
}

.alert-success {
	background: #F2F9F2;
	border-left: 3px solid #4A7C59;
	color: #4A7C59;
}

.alert-error {
	background: #FDF2F2;
	border-left: 3px solid var(--error);
	color: var(--error);
}

@media ( max-width : 768px) {
	nav, .breadcrumb {
		padding-left: 1.5rem;
		padding-right: 1.5rem;
	}
	.product-layout {
		grid-template-columns: 1fr;
		padding: 0 1.5rem 3rem;
	}
	.product-gallery {
		padding-right: 0;
		margin-bottom: 2rem;
	}
	.product-info {
		padding-left: 0;
	}
}
</style>
</head>
<body>

	<nav>
		<a href="${pageContext.request.contextPath}/home" class="nav-logo">FashionStore</a>
		<div class="nav-actions">
			<c:choose>
				<c:when test="${not empty sessionScope.user}">
					<a href="#">${sessionScope.userName}</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/login">Sign In</a>
				</c:otherwise>
			</c:choose>
			<a href="${pageContext.request.contextPath}/cart">Bag</a>
		</div>
	</nav>

	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/home">Home</a> <span>›</span>
		<a href="${pageContext.request.contextPath}/products">Products</a> <span>›</span>
		${product.name}
	</div>

	<div class="product-layout">
		<!-- Image -->
		<div class="product-gallery">
			<div class="main-image">
				<c:choose>
					<c:when test="${not empty product.imageUrl}">
						<img
							src="${pageContext.request.contextPath}/assets/images/${product.imageUrl}"
							alt="${product.name}" loading="lazy">
					</c:when>
					<c:otherwise>
						<div class="main-image-placeholder">No Image Available</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<!-- Info -->
		<div class="product-info">
			<div class="product-category">Fashion Collection</div>
			<h1 class="product-title">${product.name}</h1>
			<div class="product-price-display">
				&#8377;
				<fmt:formatNumber value="${product.price}" pattern="#,##0.00" />
			</div>

			<hr class="divider">

			<c:if test="${not empty param.added}">
				<div class="alert alert-success">Added to your bag!</div>
			</c:if>
			<c:if test="${not empty param.error}">
				<div class="alert alert-error">Please select a size and colour
					before adding.</div>
			</c:if>

			<form action="${pageContext.request.contextPath}/cart" method="post"
				id="addToCartForm">
				<input type="hidden" name="action" value="add"> <input
					type="hidden" name="productId" value="${product.productId}">
				<input type="hidden" name="size" id="selectedSize" value="">
				<input type="hidden" name="color" id="selectedColor" value="">

				<!-- SIZE -->
				<div class="variant-section">
					<div class="variant-label">
						Size <strong id="sizeDisplay">—</strong>
					</div>
					<div class="size-options">
						<c:set var="sizesSet" value="" />
						<c:forEach var="v" items="${variants}">
							<c:if test="${not fn:contains(sizesSet, v.size)}">
								<c:set var="sizesSet" value="${sizesSet},${v.size}" />
								<button type="button" class="size-btn" data-size="${v.size}"
									onclick="selectSize(this)">${v.size}</button>
							</c:if>
						</c:forEach>
					</div>
				</div>

				<!-- COLOUR -->
				<div class="variant-section">
					<div class="variant-label">
						Colour <strong id="colorDisplay">—</strong>
					</div>
					<div class="color-options">
						<c:set var="colorsSet" value="" />
						<c:forEach var="v" items="${variants}">
							<c:if test="${not fn:contains(colorsSet, v.color)}">
								<c:set var="colorsSet" value="${colorsSet},${v.color}" />
								<button type="button" class="color-btn" data-color="${v.color}"
									onclick="selectColor(this)">${v.color}</button>
							</c:if>
						</c:forEach>
					</div>
				</div>

				<!-- QUANTITY -->
				<div class="qty-row">
					<span class="qty-label">Qty</span>
					<div class="qty-control">
						<button type="button" class="qty-btn" onclick="changeQty(-1)">−</button>
						<input type="number" name="quantity" id="qtyInput"
							class="qty-input" value="1" min="1" max="10" readonly>
						<button type="button" class="qty-btn" onclick="changeQty(1)">+</button>
					</div>
				</div>

				<button type="submit" class="btn-add" id="addBtn">Add to
					Bag</button>
			</form>

			<hr class="divider">

			<c:if test="${not empty product.description}">
				<div>
					<p class="desc-title">Product Details</p>
					<p class="product-desc">${product.description}</p>
				</div>
			</c:if>
		</div>
	</div>

	<script>
    // Variant data from server
    const variants = [
        <c:forEach var="v" items="${variants}" varStatus="s">
        { variantId: ${v.variantId}, size: '${v.size}', color: '${v.color}', stock: ${v.stockQuantity} }<c:if test="${!s.last}">,</c:if>
        </c:forEach>
    ];

    let selectedSize  = null;
    let selectedColor = null;

    function selectSize(btn) {
        document.querySelectorAll('.size-btn').forEach(b => b.classList.remove('selected'));
        btn.classList.add('selected');
        selectedSize = btn.dataset.size;
        document.getElementById('selectedSize').value = selectedSize;
        document.getElementById('sizeDisplay').textContent = selectedSize;
        updateStock();
    }

    function selectColor(btn) {
        document.querySelectorAll('.color-btn').forEach(b => b.classList.remove('selected'));
        btn.classList.add('selected');
        selectedColor = btn.dataset.color;
        document.getElementById('selectedColor').value = selectedColor;
        document.getElementById('colorDisplay').textContent = selectedColor;
        updateStock();
    }

    function updateStock() {
        if (!selectedSize || !selectedColor) return;
        const v = variants.find(x => x.size === selectedSize && x.color === selectedColor);
        const note = document.querySelector('.stock-note');
        if (v) {
            if (v.stock === 0) {
                document.getElementById('addBtn').disabled = true;
                if (note) { note.textContent = 'Out of stock'; note.className = 'stock-note low'; }
            } else {
                document.getElementById('addBtn').disabled = false;
                if (note) { note.textContent = v.stock < 5 ? `Only ${v.stock} left!` : 'In stock'; note.className = v.stock < 5 ? 'stock-note low' : 'stock-note'; }
            }
        }
    }

    function changeQty(delta) {
        const input = document.getElementById('qtyInput');
        let val = parseInt(input.value) + delta;
        if (val < 1) val = 1;
        if (val > 10) val = 10;
        input.value = val;
    }
</script>

</body>
</html>
