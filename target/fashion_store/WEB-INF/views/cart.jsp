<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Your Bag | FashionStore</title>
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
	min-height: 100vh;
}

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

.nav-actions {
	display: flex;
	gap: 1.5rem;
}

.nav-actions a {
	font-size: 0.82rem;
	letter-spacing: 0.05em;
	text-decoration: none;
	color: var(--charcoal);
}

.nav-actions a:hover {
	color: var(--accent);
}

.page-wrap {
	max-width: 1100px;
	margin: 0 auto;
	padding: 3rem;
}

h1 {
	font-family: 'Cormorant Garamond', serif;
	font-size: 2rem;
	font-weight: 300;
	letter-spacing: 0.05em;
	margin-bottom: 2.5rem;
}

.cart-layout {
	display: grid;
	grid-template-columns: 1fr 320px;
	gap: 3rem;
	align-items: start;
}

/* Cart Items */
.cart-item {
	display: grid;
	grid-template-columns: 100px 1fr auto;
	gap: 1.5rem;
	padding: 1.5rem 0;
	border-bottom: 1px solid var(--border);
	align-items: start;
}

.item-thumb {
	aspect-ratio: 3/4;
	background: #EDE8E1;
	overflow: hidden;
}

.item-thumb img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.item-thumb-placeholder {
	width: 100%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #CCC;
	font-size: 0.7rem;
}

.item-name {
	font-family: 'Cormorant Garamond', serif;
	font-size: 1.1rem;
	margin-bottom: 0.3rem;
}

.item-name a {
	text-decoration: none;
	color: var(--charcoal);
}

.item-meta {
	font-size: 0.78rem;
	color: var(--mid);
	margin-bottom: 0.2rem;
}

.item-unit-price {
	font-size: 0.85rem;
	color: var(--mid);
	margin-top: 0.4rem;
}

/* Quantity control */
.qty-wrap {
	display: flex;
	align-items: center;
	gap: 1rem;
	margin-top: 0.9rem;
}

.qty-control {
	display: flex;
	align-items: center;
	border: 1px solid var(--border);
}

.qty-btn {
	width: 34px;
	height: 34px;
	background: transparent;
	border: none;
	cursor: pointer;
	font-size: 1rem;
	color: var(--charcoal);
	transition: background 0.15s;
}

.qty-btn:hover {
	background: #f0ebe4;
}

.qty-display {
	width: 38px;
	text-align: center;
	font-size: 0.9rem;
	line-height: 34px;
	border-left: 1px solid var(--border);
	border-right: 1px solid var(--border);
}

.remove-btn {
	background: none;
	border: none;
	cursor: pointer;
	font-size: 0.72rem;
	letter-spacing: 0.1em;
	text-transform: uppercase;
	color: var(--mid);
	padding: 0;
}

.remove-btn:hover {
	color: #B94040;
}

/* Line total */
.item-line-total {
	font-size: 1rem;
	font-weight: 500;
	white-space: nowrap;
	padding-top: 0.2rem;
}

/* Order Summary */
.order-summary {
	background: #F3EFE8;
	padding: 2rem;
	position: sticky;
	top: 80px;
}

.summary-title {
	font-family: 'Cormorant Garamond', serif;
	font-size: 1.2rem;
	font-weight: 300;
	margin-bottom: 1.5rem;
}

.summary-row {
	display: flex;
	justify-content: space-between;
	font-size: 0.85rem;
	color: var(--mid);
	margin-bottom: 0.6rem;
}

.summary-row.total {
	border-top: 1px solid var(--border);
	padding-top: 0.75rem;
	margin-top: 0.5rem;
	color: var(--charcoal);
	font-size: 1rem;
	font-weight: 500;
}

.btn-checkout {
	display: block;
	width: 100%;
	padding: 1rem;
	background: var(--charcoal);
	color: #fff;
	border: none;
	font-family: 'Jost', sans-serif;
	font-size: 0.78rem;
	letter-spacing: 0.18em;
	text-transform: uppercase;
	cursor: pointer;
	text-decoration: none;
	text-align: center;
	margin-top: 1.5rem;
}

.btn-checkout:hover {
	background: #2E2E2E;
}

.continue-link {
	display: block;
	text-align: center;
	margin-top: 1rem;
	font-size: 0.78rem;
	color: var(--mid);
	text-decoration: none;
}

.continue-link:hover {
	color: var(--charcoal);
}

/* Empty */
.empty-cart {
	text-align: center;
	padding: 5rem 0;
}

.empty-cart h3 {
	font-family: 'Cormorant Garamond', serif;
	font-size: 1.8rem;
	font-weight: 300;
	margin-bottom: 0.75rem;
}

.empty-cart p {
	color: var(--mid);
	font-size: 0.88rem;
	margin-bottom: 2rem;
}

.btn-shop {
	display: inline-block;
	padding: 0.85rem 2.5rem;
	background: var(--charcoal);
	color: #fff;
	text-decoration: none;
	font-size: 0.78rem;
	letter-spacing: 0.18em;
	text-transform: uppercase;
}

@media ( max-width : 768px) {
	nav, .page-wrap {
		padding-left: 1.5rem;
		padding-right: 1.5rem;
	}
	.cart-layout {
		grid-template-columns: 1fr;
	}
	.cart-item {
		grid-template-columns: 80px 1fr;
	}
	.item-line-total {
		grid-column: 1/-1;
	}
}
</style>
</head>
<body>

	<nav>
		<a href="${pageContext.request.contextPath}/home" class="nav-logo">FashionStore</a>
		<div class="nav-actions">
			<a href="${pageContext.request.contextPath}/products">Shop</a>
			<c:choose>
				<c:when test="${not empty sessionScope.user}">
					<a href="#">Hi, ${sessionScope.userName}</a>
					<a href="${pageContext.request.contextPath}/logout">Logout</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/login">Sign In</a>
				</c:otherwise>
			</c:choose>
		</div>
	</nav>

	<div class="page-wrap">
		<h1>Your Bag</h1>

		<c:choose>
			<c:when test="${empty cartItems}">
				<div class="empty-cart">
					<h3>Your bag is empty</h3>
					<p>Looks like you haven't added anything yet.</p>
					<a href="${pageContext.request.contextPath}/products"
						class="btn-shop">Continue Shopping</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="cart-layout">

					<!-- ── Items ── -->
					<div id="cartItemsContainer">
						<c:forEach var="entry" items="${cartItems}" varStatus="vs">
							<c:set var="item" value="${entry.cartItem}" />
							<c:set var="product" value="${entry.product}" />

							<div class="cart-item" data-item-id="${item.cartItemId}"
								data-unit-price="${product.price}" data-qty="${item.quantity}">

								<!-- Thumbnail -->
								<div class="item-thumb">
									<c:choose>
										<c:when test="${not empty product.imageUrl}">
											<img
												src="${pageContext.request.contextPath}/assets/images/${product.imageUrl}"
												alt="${product.name}">
										</c:when>
										<c:otherwise>
											<div class="item-thumb-placeholder">—</div>
										</c:otherwise>
									</c:choose>
								</div>

								<!-- Details -->
								<div>
									<div class="item-name">
										<a
											href="${pageContext.request.contextPath}/product-details?id=${product.productId}">${product.name}</a>
									</div>
									<div class="item-meta">Size: ${item.size}</div>
									<div class="item-meta">Colour: ${item.color}</div>
									<div class="item-unit-price">
										&#8377;
										<fmt:formatNumber value="${product.price}" pattern="#,##0.00" />
										each
									</div>

									<div class="qty-wrap">
										<!-- Decrease -->
										<div class="qty-control">
											<button type="button" class="qty-btn"
												onclick="changeQty(this, -1)">−</button>
											<span class="qty-display">${item.quantity}</span>
											<button type="button" class="qty-btn"
												onclick="changeQty(this, 1)">+</button>
										</div>

										<!-- Remove -->
										<form action="${pageContext.request.contextPath}/cart"
											method="post" style="display: inline">
											<input type="hidden" name="action" value="remove"> <input
												type="hidden" name="cartItemId" value="${item.cartItemId}">
											<button type="submit" class="remove-btn">Remove</button>
										</form>
									</div>
								</div>

								<!-- Line total -->
								<div class="item-line-total">
									&#8377;<span class="line-total-value"> <fmt:formatNumber
											value="${entry.lineTotal}" pattern="#,##0.00" />
									</span>
								</div>
							</div>
						</c:forEach>
					</div>

					<!-- ── Order Summary ── -->
					<div class="order-summary">
						<p class="summary-title">Order Summary</p>
						<div class="summary-row">
							<span>Subtotal</span> <span id="summarySubtotal">&#8377;<fmt:formatNumber
									value="${cartTotal}" pattern="#,##0.00" /></span>
						</div>
						<div class="summary-row">
							<span>Shipping</span><span>Free</span>
						</div>
						<div class="summary-row total">
							<span>Total</span> <span id="summaryTotal">&#8377;<fmt:formatNumber
									value="${cartTotal}" pattern="#,##0.00" /></span>
						</div>
						<a href="${pageContext.request.contextPath}/checkout"
							class="btn-checkout">Proceed to Checkout</a> <a
							href="${pageContext.request.contextPath}/products"
							class="continue-link">Continue Shopping</a>
					</div>

				</div>
			</c:otherwise>
		</c:choose>
	</div>

	<!-- Hidden update form — submitted programmatically -->
	<form id="updateForm" action="${pageContext.request.contextPath}/cart"
		method="post" style="display: none">
		<input type="hidden" name="action" value="update"> <input
			type="hidden" name="cartItemId" id="updateItemId"> <input
			type="hidden" name="quantity" id="updateQty">
	</form>

	<script>
    // ── Quantity change with live price update ────────────────────────────────
    function changeQty(btn, delta) {
        const card      = btn.closest('.cart-item');
        const display   = card.querySelector('.qty-display');
        const unitPrice = parseFloat(card.dataset.unitPrice);
        const itemId    = card.dataset.itemId;

        let qty = parseInt(display.textContent) + delta;
        if (qty < 1) qty = 1;
        if (qty > 10) qty = 10;

        // Update display immediately
        display.textContent = qty;
        card.dataset.qty = qty;

        // Update line total immediately
        const lineTotal = unitPrice * qty;
        card.querySelector('.line-total-value').textContent = formatINR(lineTotal);

        // Recalculate grand total
        recalcTotal();

        // Debounce the server update (500ms after last click)
        clearTimeout(card._updateTimer);
        card._updateTimer = setTimeout(() => {
            document.getElementById('updateItemId').value = itemId;
            document.getElementById('updateQty').value    = qty;
            document.getElementById('updateForm').submit();
        }, 600);
    }

    function recalcTotal() {
        let total = 0;
        document.querySelectorAll('.cart-item').forEach(card => {
            const unitPrice = parseFloat(card.dataset.unitPrice);
            const qty       = parseInt(card.dataset.qty);
            total += unitPrice * qty;
        });
        const formatted = '₹' + formatINR(total);
        document.getElementById('summarySubtotal').textContent = formatted;
        document.getElementById('summaryTotal').textContent    = formatted;
    }

    function formatINR(value) {
        return value.toLocaleString('en-IN', {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });
    }
</script>

</body>
</html>
