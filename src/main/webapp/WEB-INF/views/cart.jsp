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
	--charcoal: #111111;
	--mid: #444444;
	--accent: #9C7B52;
	--border: #D8D2CA;
	--soft: #F3EFE8;
}

body {
	background: var(--cream);
	font-family: 'Jost', sans-serif;
	font-weight: 400;
	color: var(--charcoal);
	min-height: 100vh;
	font-size: 16px;
	line-height: 1.6;
}

/* Navbar */
nav {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 1.2rem 3rem;
	border-bottom: 1px solid var(--border);
	position: sticky;
	top: 0;
	background: rgba(250, 248, 245, 0.96);
	backdrop-filter: blur(8px);
	z-index: 100;
}

.nav-logo {
	font-family: 'Cormorant Garamond', serif;
	font-size: 1.7rem;
	font-weight: 500;
	letter-spacing: 0.22em;
	text-transform: uppercase;
	text-decoration: none;
	color: var(--charcoal);
}

.nav-actions {
	display: flex;
	gap: 1.5rem;
}

.nav-actions a {
	font-size: 0.95rem;
	font-weight: 500;
	letter-spacing: 0.03em;
	text-decoration: none;
	color: var(--charcoal);
	transition: 0.2s ease;
}

.nav-actions a:hover {
	color: var(--accent);
}

/* Page */
.page-wrap {
	max-width: 1150px;
	margin: 0 auto;
	padding: 3rem;
}

h1 {
	font-family: 'Cormorant Garamond', serif;
	font-size: 2.6rem;
	font-weight: 500;
	letter-spacing: 0.03em;
	margin-bottom: 2.5rem;
	color: var(--charcoal);
}

.cart-layout {
	display: grid;
	grid-template-columns: 1fr 340px;
	gap: 3rem;
	align-items: start;
}

/* Cart Items */
.cart-item {
	display: grid;
	grid-template-columns: 110px 1fr auto;
	gap: 1.6rem;
	padding: 1.7rem 0;
	border-bottom: 1px solid var(--border);
	align-items: start;
}

.item-thumb {
	aspect-ratio: 3/4;
	background: #ECE7E0;
	overflow: hidden;
	border-radius: 12px;
}

.item-thumb img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.4s ease;
}

.item-thumb img:hover {
	transform: scale(1.03);
}

.item-thumb-placeholder {
	width: 100%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #999;
	font-size: 0.8rem;
}

.item-name {
	font-family: 'Cormorant Garamond', serif;
	font-size: 1.35rem;
	font-weight: 500;
	margin-bottom: 0.45rem;
}

.item-name a {
	text-decoration: none;
	color: var(--charcoal);
}

.item-meta {
	font-size: 0.95rem;
	color: var(--mid);
	margin-bottom: 0.35rem;
}

.item-unit-price {
	font-size: 1rem;
	font-weight: 500;
	color: var(--charcoal);
	margin-top: 0.6rem;
}

/* Quantity */
.qty-wrap {
	display: flex;
	align-items: center;
	gap: 1rem;
	margin-top: 1rem;
}

.qty-control {
	display: flex;
	align-items: center;
	border: 1px solid var(--border);
	border-radius: 10px;
	overflow: hidden;
	background: white;
}

.qty-btn {
	width: 38px;
	height: 38px;
	background: transparent;
	border: none;
	cursor: pointer;
	font-size: 1.1rem;
	color: var(--charcoal);
	transition: 0.2s ease;
}

.qty-btn:hover {
	background: #EFE9E2;
}

.qty-display {
	width: 42px;
	text-align: center;
	font-size: 1rem;
	font-weight: 500;
	line-height: 38px;
	border-left: 1px solid var(--border);
	border-right: 1px solid var(--border);
}

.remove-btn {
	background: none;
	border: none;
	cursor: pointer;
	font-size: 0.82rem;
	font-weight: 500;
	letter-spacing: 0.08em;
	text-transform: uppercase;
	color: var(--mid);
	transition: 0.2s ease;
}

.remove-btn:hover {
	color: #B94040;
}

/* Totals */
.item-line-total {
	font-size: 1.15rem;
	font-weight: 600;
	white-space: nowrap;
	padding-top: 0.2rem;
	color: var(--charcoal);
}

/* Summary */
.order-summary {
	background: var(--soft);
	padding: 2.2rem;
	border-radius: 18px;
	position: sticky;
	top: 90px;
}

.summary-title {
	font-family: 'Cormorant Garamond', serif;
	font-size: 1.5rem;
	font-weight: 500;
	margin-bottom: 1.8rem;
}

.summary-row {
	display: flex;
	justify-content: space-between;
	font-size: 1rem;
	color: var(--mid);
	margin-bottom: 0.9rem;
}

.summary-row.total {
	border-top: 1px solid var(--border);
	padding-top: 1rem;
	margin-top: 0.8rem;
	color: var(--charcoal);
	font-size: 1.15rem;
	font-weight: 600;
}

/* Buttons */
.btn-checkout {
	display: block;
	width: 100%;
	padding: 1rem;
	background: var(--charcoal);
	color: #fff;
	border: none;
	border-radius: 12px;
	font-family: 'Jost', sans-serif;
	font-size: 0.92rem;
	font-weight: 500;
	letter-spacing: 0.14em;
	text-transform: uppercase;
	cursor: pointer;
	text-decoration: none;
	text-align: center;
	margin-top: 1.7rem;
	transition: 0.25s ease;
}

.btn-checkout:hover {
	background: #2B2B2B;
	transform: translateY(-1px);
}

.continue-link {
	display: block;
	text-align: center;
	margin-top: 1.2rem;
	font-size: 0.9rem;
	font-weight: 500;
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
	font-size: 2rem;
	font-weight: 500;
	margin-bottom: 0.8rem;
}

.empty-cart p {
	color: var(--mid);
	font-size: 1rem;
	margin-bottom: 2rem;
}

.btn-shop {
	display: inline-block;
	padding: 1rem 2.8rem;
	background: var(--charcoal);
	color: #fff;
	border-radius: 12px;
	text-decoration: none;
	font-size: 0.9rem;
	font-weight: 500;
	letter-spacing: 0.14em;
	text-transform: uppercase;
	transition: 0.25s ease;
}

.btn-shop:hover {
	background: #2B2B2B;
}

/* Responsive */
@media ( max-width : 768px) {
	nav, .page-wrap {
		padding-left: 1.5rem;
		padding-right: 1.5rem;
	}
	.cart-layout {
		grid-template-columns: 1fr;
	}
	.cart-item {
		grid-template-columns: 90px 1fr;
	}
	.item-line-total {
		grid-column: 1/-1;
		padding-left: 106px;
	}
	h1 {
		font-size: 2.1rem;
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
