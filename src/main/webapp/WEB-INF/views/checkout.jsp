<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout | FashionStore</title>
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
    --mid: #4B4B4B;
    --accent: #B8925E;
    --border: #D8D1C8;
    --error: #B94040;
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

nav {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 1.3rem 3rem;
    border-bottom: 1px solid var(--border);
    background: var(--cream);
}

.nav-logo {
    font-family: 'Cormorant Garamond', serif;
    font-size: 1.7rem;
    letter-spacing: 0.25em;
    text-transform: uppercase;
    text-decoration: none;
    color: var(--charcoal);
    font-weight: 500;
}

.nav-actions a {
    font-size: 0.95rem;
    text-decoration: none;
    color: var(--charcoal);
    font-weight: 500;
}

.nav-actions a:hover {
    color: var(--accent);
}

.page-wrap {
    max-width: 1150px;
    margin: 0 auto;
    padding: 3rem;
}

h1 {
    font-family: 'Cormorant Garamond', serif;
    font-size: 2.6rem;
    font-weight: 500;
    margin-bottom: 2.5rem;
    color: var(--charcoal);
}

/* Success State */
.order-success {
    text-align: center;
    padding: 5rem 2rem;
}

.order-success .check {
    font-size: 4rem;
    margin-bottom: 1.5rem;
    color: #2E7D32;
}

.order-success h2 {
    font-family: 'Cormorant Garamond', serif;
    font-size: 2.5rem;
    font-weight: 500;
    margin-bottom: 1rem;
}

.order-success p {
    color: var(--mid);
    font-size: 1rem;
    margin-bottom: 2rem;
    line-height: 1.8;
}

.btn-continue {
    display: inline-block;
    padding: 1rem 2.8rem;
    background: var(--charcoal);
    color: #fff;
    text-decoration: none;
    font-size: 0.85rem;
    letter-spacing: 0.18em;
    text-transform: uppercase;
    font-weight: 500;
    transition: background 0.2s ease;
}

.btn-continue:hover {
    background: #2E2E2E;
}

/* Layout */
.checkout-layout {
    display: grid;
    grid-template-columns: 1fr 380px;
    gap: 3rem;
    align-items: start;
}

.section-title {
    font-size: 0.82rem;
    letter-spacing: 0.18em;
    text-transform: uppercase;
    color: var(--accent);
    border-bottom: 1px solid var(--border);
    padding-bottom: 0.7rem;
    margin-bottom: 1.7rem;
    font-weight: 600;
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
    letter-spacing: 0.08em;
    text-transform: uppercase;
    color: var(--charcoal);
    margin-bottom: 0.55rem;
    font-weight: 500;
}

input,
select {
    width: 100%;
    padding: 0.95rem 0;
    background: transparent;
    border: none;
    border-bottom: 1.5px solid var(--border);
    font-family: 'Jost', sans-serif;
    font-size: 1rem;
    font-weight: 400;
    color: var(--charcoal);
    outline: none;
    transition: border-color 0.2s;
}

input:focus,
select:focus {
    border-bottom-color: var(--charcoal);
}

input::placeholder {
    color: #9B948B;
}

select {
    appearance: none;
    cursor: pointer;
}

/* Payment */
.payment-options {
    display: flex;
    flex-direction: column;
    gap: 0.9rem;
    margin-bottom: 1.5rem;
}

.payment-option {
    display: flex;
    align-items: center;
    gap: 0.85rem;
    padding: 1rem 1.1rem;
    border: 1px solid var(--border);
    cursor: pointer;
    transition: all 0.2s ease;
    background: #fff;
}

.payment-option:hover {
    border-color: var(--charcoal);
    background: #f8f6f2;
}

.payment-option input[type="radio"] {
    accent-color: var(--charcoal);
    transform: scale(1.1);
}

.payment-option-label {
    font-size: 1rem;
    color: var(--charcoal);
    font-weight: 500;
}

/* Button */
.btn-place {
    display: block;
    width: 100%;
    padding: 1rem;
    background: var(--charcoal);
    color: #fff;
    border: none;
    font-family: 'Jost', sans-serif;
    font-size: 0.9rem;
    font-weight: 600;
    letter-spacing: 0.15em;
    text-transform: uppercase;
    cursor: pointer;
    margin-top: 1.8rem;
    transition: background 0.2s ease;
}

.btn-place:hover {
    background: #2E2E2E;
}

/* Sidebar */
.order-sidebar {
    background: #F3EFE8;
    padding: 2rem;
    border: 1px solid var(--border);
    position: sticky;
    top: 20px;
}

.sidebar-title {
    font-family: 'Cormorant Garamond', serif;
    font-size: 1.5rem;
    font-weight: 500;
    margin-bottom: 1.8rem;
}

.order-item {
    display: flex;
    gap: 1rem;
    margin-bottom: 1.5rem;
    align-items: flex-start;
}

.order-thumb {
    width: 72px;
    aspect-ratio: 3/4;
    background: #EDE8E1;
    overflow: hidden;
    flex-shrink: 0;
}

.order-thumb img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.order-thumb-placeholder {
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #AAA;
    font-size: 0.75rem;
}

.order-item-name {
    font-family: 'Cormorant Garamond', serif;
    font-size: 1.1rem;
    font-weight: 500;
    color: var(--charcoal);
}

.order-item-meta {
    font-size: 0.9rem;
    color: var(--mid);
    margin-top: 0.3rem;
}

.order-item-price {
    font-size: 0.95rem;
    margin-top: 0.4rem;
    font-weight: 600;
    color: var(--charcoal);
}

.divider {
    border: none;
    border-top: 1px solid var(--border);
    margin: 1.2rem 0;
}

.summary-row {
    display: flex;
    justify-content: space-between;
    font-size: 0.98rem;
    color: var(--mid);
    margin-bottom: 0.8rem;
}

.summary-row.total {
    color: var(--charcoal);
    font-size: 1.15rem;
    font-weight: 600;
    padding-top: 0.8rem;
    border-top: 1px solid var(--border);
    margin-top: 0.8rem;
}

/* Alert */
.alert {
    padding: 1rem 1.2rem;
    font-size: 0.92rem;
    margin-bottom: 1.2rem;
    font-weight: 500;
}

.alert-error {
    background: #FDF2F2;
    border-left: 4px solid var(--error);
    color: var(--error);
}

/* Mobile */
@media (max-width: 768px) {
    nav {
        padding: 1rem 1.5rem;
    }

    .page-wrap {
        padding: 2rem 1.5rem;
    }

    .checkout-layout {
        grid-template-columns: 1fr;
    }

    .grid-2 {
        grid-template-columns: 1fr;
    }

    h1 {
        font-size: 2.1rem;
    }

    .order-sidebar {
        position: static;
    }
}
</style>
</head>
<body>

	<nav>
		<a href="${pageContext.request.contextPath}/home" class="nav-logo">FashionStore</a>
		<div class="nav-actions">
			<a href="${pageContext.request.contextPath}/cart">← Back to Bag</a>
		</div>
	</nav>

	<div class="page-wrap">

		<%-- Success State --%>
		<c:if test="${not empty param.success}">
			<div class="order-success">
				<div class="check">✓</div>
				<h2>Order Placed!</h2>
				<p>
					Thank you for your order.<br>
					<c:if test="${not empty param.orderId}">Your order ID is <strong>#${param.orderId}</strong>.<br>
					</c:if>
					We'll send you a confirmation shortly.
				</p>
				<a href="${pageContext.request.contextPath}/products"
					class="btn-continue">Continue Shopping</a>
			</div>
		</c:if>

		<%-- Checkout Form --%>
		<c:if test="${empty param.success}">
			<h1>Checkout</h1>

			<c:if test="${not empty error}">
				<div class="alert alert-error">${error}</div>
			</c:if>

			<div class="checkout-layout">
				<form action="${pageContext.request.contextPath}/checkout"
					method="post">

					<p class="section-title">Delivery Address</p>

					<div class="grid-2">
						<div class="form-group">
							<label>Recipient Name *</label> <input type="text"
								name="receiverName" required
								value="${not empty user ? user.name : ''}"
								placeholder="Full name">
						</div>
						<div class="form-group">
							<label>Phone *</label> <input type="tel" name="receiverPhone"
								required value="${not empty user ? user.phone : ''}"
								placeholder="+91 98765 43210">
						</div>
					</div>

					<div class="form-group">
						<label>Address Line *</label> <input type="text"
							name="addressLine" required
							value="${not empty user ? user.addressLine : ''}"
							placeholder="Street, building, apartment">
					</div>

					<div class="grid-2">
						<div class="form-group">
							<label>City *</label> <input type="text" name="city" required
								value="${not empty user ? user.city : ''}"
								placeholder="Bengaluru">
						</div>
						<div class="form-group">
							<label>State *</label> <input type="text" name="state" required
								value="${not empty user ? user.state : ''}"
								placeholder="Karnataka">
						</div>
					</div>

					<div class="grid-2">
						<div class="form-group">
							<label>Country *</label> <input type="text" name="country"
								required value="${not empty user ? user.country : 'India'}"
								placeholder="India">
						</div>
						<div class="form-group">
							<label>Pincode *</label> <input type="text" name="pincode"
								required value="${not empty user ? user.pincode : ''}"
								placeholder="560001">
						</div>
					</div>

					<p class="section-title" style="margin-top: 2rem;">Payment
						Method</p>

					<div class="payment-options">
						<label class="payment-option"> <input type="radio"
							name="paymentMethod" value="COD" checked> <span
							class="payment-option-label">Cash on Delivery</span>
						</label> <label class="payment-option"> <input type="radio"
							name="paymentMethod" value="UPI"> <span
							class="payment-option-label">UPI / Net Banking</span>
						</label> <label class="payment-option"> <input type="radio"
							name="paymentMethod" value="CARD"> <span
							class="payment-option-label">Credit / Debit Card</span>
						</label>
					</div>

					<button type="submit" class="btn-place">Place Order</button>
				</form>

				<!-- Order Summary Sidebar -->
				<div class="order-sidebar">
					<p class="sidebar-title">Your Order</p>
					<c:forEach var="entry" items="${cartItems}">
						<div class="order-item">
							<div class="order-thumb">
								<c:choose>
									<c:when test="${not empty entry.product.imageUrl}">
										<img
											src="${pageContext.request.contextPath}/assets/images/${entry.product.imageUrl}"
											alt="${entry.product.name}">
									</c:when>
									<c:otherwise>
										<div class="order-thumb-placeholder">—</div>
									</c:otherwise>
								</c:choose>
							</div>
							<div>
								<div class="order-item-name">${entry.product.name}</div>
								<div class="order-item-meta">${entry.cartItem.size}·
									${entry.cartItem.color} · Qty ${entry.cartItem.quantity}</div>
								<div class="order-item-price">
									&#8377;
									<fmt:formatNumber value="${entry.lineTotal}" pattern="#,##0.00" />
								</div>
							</div>
						</div>
					</c:forEach>

					<hr class="divider">
					<div class="summary-row">
						<span>Subtotal</span><span>&#8377;<fmt:formatNumber
								value="${cartTotal}" pattern="#,##0.00" /></span>
					</div>
					<div class="summary-row">
						<span>Shipping</span><span>Free</span>
					</div>
					<div class="summary-row total">
						<span>Total</span><span>&#8377;<fmt:formatNumber
								value="${cartTotal}" pattern="#,##0.00" /></span>
					</div>
				</div>
			</div>
		</c:if>

	</div>

</body>
</html>
